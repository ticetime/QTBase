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
 * The RelActiviteActeur entity.
 *
 * @author msan
 */
class RelActiviteActeur implements Serializable {
  static mapping = {
    table 'entcdt.rel_activite_acteur'
    activite column: 'id_activite'
    acteur column: 'id_acteur'
    id composite: ['activite', 'acteur']
    version false
  }

  String annotation
  Boolean estLu = Boolean.FALSE
  Boolean estTermine = Boolean.FALSE
  Boolean estNouvelle = Boolean.TRUE

  static belongsTo = [activite: Activite, acteur: DomainAutorite]

  static constraints = {
    version(max: 9999999999L)
    annotation(nullable: true)
    estLu()
    estTermine()
    estNouvelle()
    activite()
    acteur()
  }

  String toString() {
    return "${activite} ${acteur} ${estLu}"
  }

  public int hashCode() {
    if (activite?.id && acteur?.id) {
      return (((activite.id % HashConstantes.MAX_16BITS) *
              HashConstantes.MAX_16BITS) + (acteur.id % HashConstantes.MAX_16BITS))
    } else {
      return super.hashCode()
    }
  }

  def boolean equals(Object o) {
    return (this.activite.id == o.activite.id &&
            this.acteur.id == o.acteur.id
    )
  }
}
