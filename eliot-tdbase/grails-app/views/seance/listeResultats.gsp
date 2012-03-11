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




<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta name="layout" content="eliot-tdbase"/>
  <r:require modules="jquery"/>
  <r:script>
    $(document).ready(function() {
      $('#menu-item-seances').addClass('actif');
    });
  </r:script>
  <title>TDBase - Liste des résultats</title>
</head>

<body>
  <g:render template="/breadcrumps" plugin="eliot-tice-plugin" model="[liens: liens]"/>

  <div class="portal-messages">
  <li class="notice">
  Groupe : ${seance.groupeLibelle}<br/>
  Sujet : ${seance.sujet.titre} <br/>
  Séance du ${seance.dateDebut.format('dd/MM/yy HH:mm')} au  ${seance.dateFin.format('dd/MM/yy HH:mm')}<br/>
  </li>
  </div>
  <br/>
<p><strong> Nombres de copies rendues : ${copies.size()} sur ${copies.size() + elevesSansCopies.size()}</strong></p>
  <g:if test="${copies}">
    <div class="portal-default_table">
      <table>
        <thead>
        <tr>
          <th>Élève</th>
          <th>Note finale</th>
          <th>Note auto.</th>
          <th>Note prof.</th>
          <th>Dernière remise</th>
          <th>Copie</th>
        </tr>
        </thead>

        <tbody>
        <g:each in="${copies}" status="i" var="copie">
          <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td>
              ${copie.eleve.nomAffichage}
            </td>
            <td>
               <g:formatNumber number="${copie.correctionNoteFinale}" format="##0.00" />
        / <g:formatNumber number="${copie.maxPoints}" format="##0.00" />
            </td>
            <td>
              <g:formatNumber number="${copie.correctionNoteAutomatique}" format="##0.00" />
              / <g:formatNumber number="${copie.maxPointsAutomatique}" format="##0.00" />
            </td>
            <td>
              <g:formatNumber number="${copie.correctionNoteCorrecteur}" format="##0.00" />
                            / <g:formatNumber number="${copie.maxPointsCorrecteur}" format="##0.00" />

            </td>
            <td>
              ${copie.dateRemise?.format('dd/MM/yy  à HH:mm')}
            </td>
             <td>
              <g:link action="visualiseCopie" controller="seance"
                      id="${seance.id}" title="Corriger la copie"
                      params="[max:1,offset:i]">
                Corriger
              </g:link>
            </td>
          </tr>
        </g:each>
        </tbody>
      </table>
    </div>
  </g:if>
  <g:else>
     <div class="portal_pagination">
      <p class="nb_result">Aucun résultat</p>
    </div>
  </g:else>
  <g:if test="${elevesSansCopies}">
    <br/>
    <p><strong>Élèves n'ayant pas rendu leur copie...</strong></p>
    <ul>
    <g:each in="${elevesSansCopies}" var="eleve">
      <li>
        ${eleve.nomAffichage}
      </li>
    </g:each>
    </ul>
  </g:if>
</body>
</html>