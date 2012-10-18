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
  <r:require modules="eliot-tdbase-ui"/>
  <r:script>
    $(document).ready(function () {
      var $confirmDialog = $("<div></div>")
            			    .html('Êtes vous sur de vouloir supprimer la séance avec toutes les copies associées ?')
            			    .dialog({
            					autoOpen: false,
            				    title: "Suppression de la séance",
            					modal: true,
            					buttons : {
            					    "Annuler": function() {$(this).dialog("close");return false},
            						'OK': function() {
                                        $(this).dialog("close");
                                        document.location = "${createLink(action: 'supprime', controller: 'seance', id: seance.id)}";
                                        }
            					}
            			    });
      $('.delete').click(function () {
              $confirmDialog.dialog('open');
              return false;
      });
    });
  </r:script>
  <title><g:message code="seance.listeResultats.head.title"/></title>
</head>

<body>
<g:render template="/breadcrumps" plugin="lms-common"
          model="[liens: liens]"/>

<div class="navbar">
  <div class="navbar-inner">
    <ul class="nav">
    <li><g:link action="edite" controller="seance"
            id="${seance.id}"><i class="icon-pencil"></i> Modifier la séance</g:link></li>
    <g:if test="${grailsApplication.config.eliot.interfacage.notes}">
      <g:if test="${afficheLienMiseAjourNote}">
        <li><g:link action="updateNotesDevoir" controller="seance"
                title="Mise à jour des notes du devoir lié à la séance"
                id="${seance.id}"><i class="icon-upload"></i> Mettre à jour les notes</g:link></li>
      </g:if>
    </g:if>
    <li><g:link action="supprime" controller="seance"
            id="${seance.id}"><i class="icon-trash"></i> Supprimer la séance</g:link></li>
    </ul>
  </div>
</div>

<div class="portal-messages">
  <g:if test="${flash.messageCode}">
    <li class="success">
      <g:message code="${flash.messageCode}" args="${flash.messageArgs}"/>
    </li>
  </g:if>
  <g:if test="${flash.messageErreurNotesCode}">
    <li class="error">
      <g:message code="${flash.messageErreurNotesCode}"/>
    </li>
  </g:if>
</div>
  <div class="well well-small">
    Groupe : ${seance.groupeLibelle}<br/>
    Sujet : ${seance.sujet.titre} <br/>
    Séance du ${seance.dateDebut.format('dd/MM/yy HH:mm')} au  ${seance.dateFin.format('dd/MM/yy HH:mm')}<br/><br/>
    <g:if test="${copies}">
      <strong>Nombres de copies rendues : ${copies.size()} sur ${copies.size() + elevesSansCopies.size()}</strong>
    </g:if>
    <g:else>
      <strong>Aucun élève n'a rendu sa copie</strong>
    </g:else>
  </div>

<g:if test="${copies}">

    <table class="table table-striped table-bordered">
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
        <tr>
          <td>
            ${copie.eleve.nomAffichage}
          </td>
          <td>
            <g:formatNumber number="${copie.correctionNoteFinale}"
                            format="##0.00"/>
            / <g:formatNumber number="${copie.maxPoints}" format="##0.00"/>
          </td>
          <td>
            <g:formatNumber number="${copie.correctionNoteAutomatique}"
                            format="##0.00"/>
            / <g:formatNumber number="${copie.maxPointsAutomatique}"
                              format="##0.00"/>
          </td>
          <td>
            <g:formatNumber number="${copie.correctionNoteCorrecteur}"
                            format="##0.00"/>
            / <g:formatNumber number="${copie.maxPointsCorrecteur}"
                              format="##0.00"/>

          </td>
          <td>
            ${copie.dateRemise?.format('dd/MM/yy  à HH:mm')}
          </td>
          <td>
            <g:link class="btn btn-primary" action="visualiseCopie"
                    controller="seance"
                    id="${seance.id}" title="Corriger la copie"
                    params="[max: 1, offset: i]">
              Corriger
            </g:link>
          </td>
        </tr>
      </g:each>

      <g:if test="${elevesSansCopies}">
        <g:each in="${elevesSansCopies}" var="eleve">
          <tr style="font-style: italic;background-color: #dcdcdc;">
            <td>${eleve.nomAffichage}</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>

        </g:each>

      </g:if>

      </tbody>
    </table>
</g:if>

</body>
</html>