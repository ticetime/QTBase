/*
 * Copyright © FYLAB and the Conseil Régional d'Île-de-France, 2009
 * This file is part of L'Interface Libre et Interactive de l'Enseignement (Lilie).
 *
 * Lilie is free software. You can redistribute it and/or modify since
 * you respect the terms of either (at least one of the both license) :
 * - under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 * - the CeCILL-C as published by CeCILL-C; either version 1 of the
 * License, or any later version
 *
 * There are special exceptions to the terms and conditions of the
 * licenses as they are applied to this software. View the full text of
 * the exception in file LICENSE.txt in the directory of this software
 * distribution.
 *
 * Lilie is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * Licenses for more details.
 *
 * You should have received a copy of the GNU General Public License
 * and the CeCILL-C along with Lilie. If not, see :
 *  <http://www.gnu.org/licenses/> and
 *  <http://www.cecill.info/licences.fr.html>.
 */



package org.lilie.services.eliot.tice.textes

import org.lilie.services.eliot.tice.securite.DomainAutorite
import org.lilie.services.eliot.tice.HashConstantes

/**
 * The RelCahierActeur entity.
 *
 * @author
 *
 *
 */
class RelCahierActeur implements Serializable {
  static mapping = {
    table 'entcdt.rel_cahier_acteur'
    cahierDeTextes column: 'id_cahier_de_textes'
    acteur column: 'id_acteur'
    id composite: ['cahierDeTextes', 'acteur']
    version false
  }

  Boolean seraNotifie
  String aliasNom
  CahierDeTextes cahierDeTextes

  static belongsTo = [
          cahierDeTextes: CahierDeTextes,
          acteur: DomainAutorite
  ]

  static constraints = {
    version(max: 9999999999L)
    seraNotifie()
    aliasNom(size: 0..255)
  }

  String toString() {
    return "${cahierDeTextes} ${aliasNom}"
  }

  public int hashCode() {
    if (cahierDeTextes?.id && acteur?.id) {
      return (((cahierDeTextes.id % HashConstantes.MAX_16BITS) *
              HashConstantes.MAX_16BITS) + (acteur.id % HashConstantes.MAX_16BITS))
    } else {
      return super.hashCode()
    }
  }

  boolean equals(Object obj) {
    RelCahierActeur relCahierActeur = (obj as RelCahierActeur)
    return ((this.cahierDeTextes.id == relCahierActeur.cahierDeTextes.id) &&
            (this.acteur.id == relCahierActeur.acteur.id))
  }
}
