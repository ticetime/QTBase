%{--
  - Copyright © FYLAB and the Conseil Régional d'Île-de-France, 2009
  - This file is part of L'Interface Libre et Interactive de l'Enseignement (Lilie).
  -
  - Lilie is free software. You can redistribute it and/or modify since
  - you respect the terms of either (at least one of the both license) :
  -  under the terms of the GNU Affero General Public License as
  - published by the Free Software Foundation, either version 3 of the
  - License, or (at your option) any later version.
  -  the CeCILL-C as published by CeCILL-C; either version 1 of the
  - License, or any later version
  -
  - There are special exceptions to the terms and conditions of the
  - licenses as they are applied to this software. View the full text of
  - the exception in file LICENSE.txt in the directory of this software
  - distribution.
  -
  - Lilie is distributed in the hope that it will be useful,
  - but WITHOUT ANY WARRANTY; without even the implied warranty of
  - MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  - Licenses for more details.
  -
  - You should have received a copy of the GNU General Public License
  - and the CeCILL-C along with Lilie. If not, see :
  -  <http://www.gnu.org/licenses/> and
  -  <http://www.cecill.info/licences.fr.html>.
  --}%

<%--
  Created by IntelliJ IDEA.
  User: bert
  Date: 13/12/11
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>

<g:set var="specifobject" value="${question.specificationObject}"/>
<tr>
    <td class="control-label">
      <g:message code="question.propriete.libelle"/><span class="obligatoire">*</span>
    </td>
    <td>
        <g:textArea
                name="specifobject.libelle"
                rows="3" cols="55" class="input-xxlarge"
                value="${specifobject.libelle}"/>
    </td>
</tr>
<tr>
    <td class="control-label">
        R&eacute;ponses<span class="obligatoire">*</span>
    </td>
    <td>
      <table>
        <tr>
            <td id="order_reponses">
                <g:render template="/question/Order/OrderEditionReponses"
                          model="[specifobject: specifobject]"/>
            </td>
            <td style="vertical-align: bottom;">
                <g:submitToRemote title="Ajouter un nouveau element" value="Ajouter"
                                  action="ajouteItem"
                                  controller="questionOrder"
                                  update="order_reponses"
                                  class="btn"/>
            </td>
        </tr>
      </table>
    </td>
</tr>
<tr>
    <td class="control-label">
        Correction
    </td>
    <td>
        <g:textArea
                name="specifobject.correction"
                rows="3" cols="55" class="input-xxlarge"
                value="${specifobject.correction}"/>
    </td>
</tr>