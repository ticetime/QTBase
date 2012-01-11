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

package org.lilie.services.eliot.tdbase.impl

import org.lilie.services.eliot.tdbase.QuestionController
import org.lilie.services.eliot.tdbase.impl.graphicmatch.GraphicMatchSpecification
import org.lilie.services.eliot.tdbase.impl.graphicmatch.Hotspot
import org.lilie.services.eliot.tdbase.impl.graphicmatch.MatchIcon

/**
 * Controlleur pour la saisie des questions de type graphique à compléter
 */
class QuestionGraphicMatchController extends QuestionController {

  @Override
  def getSpecificationObjectFromParams(Map params) {

    def specifobject = new GraphicMatchSpecification()
    def size = params.specifobject.hotspots?.size
    if (size) {
      size = size as Integer
      size.times {
        specifobject.hotspots << new Hotspot()
      }
    }

    size = params.specifobject.icons?.size
    if (size) {
      size = size as Integer
      size.times {
        specifobject.icons << new MatchIcon()
      }
    }

    bindData(specifobject, params, "specifobject")
  }

  /**
   *
   * Action "ajouteHotspot"
   */
  def ajouteHotspot() {
    GraphicMatchSpecification specifobject = getSpecificationObjectFromParams(params) ?: new GraphicMatchSpecification()
    specifobject.hotspots << new Hotspot([id: createId(specifobject.hotspots)])
    render(
            template: "/question/GraphicMatch/GraphicMatchEditionReponses",
            model: [specifobject: specifobject]
    )
  }

  private int createId(List<Hotspot> hotspots) {
    def idList = hotspots*.id
    if (idList) {
      return idList.max().toInteger() + 1
    }
    1
  }

  /**
   *
   * Action "ajouteIcon"
   */
  def ajouteIcon() {
    GraphicMatchSpecification specifobject = getSpecificationObjectFromParams(params) ?: new GraphicMatchSpecification()
    specifobject.icons << new MatchIcon()
    render(
            template: "/question/GraphicMatch/GraphicMatchEditionReponses",
            model: [specifobject: specifobject]
    )
  }

  /**
   *
   * Action "supprimerHotSpot"
   */
  def supprimeHotspot() {
    GraphicMatchSpecification specifobject = getSpecificationObjectFromParams(params)
    specifobject.hotspots.remove(params.id as Integer)

    render(
            template: "/question/GraphicMatch/GraphicMatchEditionReponses",
            model: [specifobject: specifobject]
    )
  }

  /**
   *
   * Action "supprimerIcon"
   */
  def supprimeIcon() {
    GraphicMatchSpecification specifobject = getSpecificationObjectFromParams(params)
    specifobject.icons.remove(params.id as Integer)
    render(
            template: "/question/GraphicMatch/GraphicMatchEditionReponses",
            model: [specifobject: specifobject]
    )
  }

}