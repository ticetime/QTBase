<%@ page import="org.lilie.services.eliot.tdbase.ContexteActivite" %>
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
  <r:require module="eliot-tdbase-ui"/>
  <r:script>
    $(document).ready(function () {
      $('select[name="proprietesScolariteSelectionId"]').focus();
      $(".datepicker").datetimepicker();
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
                                            document.location = "${createLink(action: 'supprime', controller: 'seance', id: modaliteActivite.id)}";
                                            }
      								}
      							});
      $('.delete-actif').click(function () {
        $confirmDialog.dialog('open');
        return false;
      });
    $('#gestionEvaluation').click(function() {
               $('#edition_devoir').toggle();
               })
    $('#gestionActivite').click(function() {
                   $('#edition_activite').toggle();
                   })
    $('#cahierId').change(function() {
        $.get("${createLink(action: 'updateChapitres', controller: 'seance')}",
                { cahierId: $(this).val()},
                function(data) {
                    $('#selectChapitres').html(data)
                })
    })
    });
  </r:script>
  <style type='text/css' media='screen'>
  .inform {
    display: block;
    width: 53%;
    margin: 2px;
    text-transform: none;
  }

  #chapitreId option {
    white-space: pre;
  }
  </style>
  <title><g:message code="seance.edite.head.title"/></title>
</head>

<body>
<g:render template="/breadcrumps" plugin="lms-common"
          model="[liens: liens]"/>

<div class="navbar">
  <div class="navbar-inner">
  <ul class="nav">
    <g:if test="${modaliteActivite.id}">
      <li><g:link action="listeResultats" controller="seance" class="modify"
              id="${modaliteActivite.id}"><i class="icon-pencil"></i> Corriger les copies</g:link> </li>
      <li><g:link action="supprime" controller="seance" class="delete delete-actif"
              id="${modaliteActivite.id}"><i class="icon-trash"></i> Supprimer la séance</g:link>  </li>
    </g:if>
    <g:else>
      <li class="disabled"><a href="#"><i class="icon-ban-circle"></i> Corriger les copies</a></li>
      <li class="disabled"><a href="#"><i class="icon-ban-circle"></i> Supprimer la séance</a></li>
    </g:else>
  </ul>
  </div>
</div>

<g:hasErrors bean="${modaliteActivite}">
  <g:eachError>
  <div class="alert alert-error">
    <g:message error="${it}"/>
   </div>
</g:eachError>
</g:hasErrors>
<g:if test="${flash.messageCode}">
  <div class="alert alert-success">
    <g:message code="${flash.messageCode}"
                                   class="portal-messages success"/>
  </div>
</g:if>
<g:if test="${flash.messageTextesCode}">
  <div class="alert alert-info">
    <g:message code="${flash.messageTextesCode}"/>
  </div>
</g:if>


<g:form method="post" controller="seance" action="edite" class="form-horizontal">
  <div class="control-group">
          <label class="control-label" for="sujet">Sujet</label>
          <div class="controls">
            <input disabled="true" type="text" value="${modaliteActivite.sujet.titre}" id="sujet" class="input-xxlarge">
          </div>
    </div>
  <div class="control-group">
        <label class="control-label" for="proprietesScolariteSelectionId">Classe/groupe<span class="obligatoire">*</span></label>
        <div class="controls">
          <g:if test="${modaliteActivite.structureEnseignement}">
            <input type="text" value="${modaliteActivite.structureEnseignement.nomAffichage}" disabled="true" id="proprietesScolariteSelectionId">
          </g:if>
          <g:else>
            <g:select name="proprietesScolariteSelectionId"
                      noSelection="${['null': g.message(code: "default.select.null")]}"
                      from="${proprietesScolarite}"
                      optionKey="id"
                      optionValue="structureEnseignementNomAffichage"/>
          </g:else>
        </div>
    </div>

  <div class="control-group">
    <label class="control-label" for="dateDebut">Début</label>
        <div class="controls">
          <g:textField name="dateDebut"
                       value="${modaliteActivite.dateDebut.format('dd/MM/yyyy HH:mm')}"
                       class="datepicker short"/>
        </div>
        <label class="control-label" for="dateFin">Fin</label>
          <div class="controls">
          <g:textField name="dateFin"
                       value="${modaliteActivite.dateFin.format('dd/MM/yyyy HH:mm')}"
                       class="datepicker short"/>
          </div>
  </div>
  <div class="control-group">
        <div class="controls">
        <label class="checkbox">
          <g:checkBox name="copieAmeliorable" title="améliorable"
                      checked="${modaliteActivite.copieAmeliorable}"/> Copie&nbsp;améliorable
        </label>
        </div>
  </div>
  <div class="control-group">

      <g:if test="${lienBookmarkable}">

          <label class="control-label" for="permalien">Permalien</label>
          <div class="controls">
            <input disabled="true" id="permalien" type="text" value="${lienBookmarkable}" class="input-xxlarge">
          </div>
      </g:if>
  </div>
  <g:hiddenField name="id" value="${modaliteActivite.id}"/>
  <g:hiddenField id="sujetId" name="sujet.id"
                 value="${modaliteActivite.sujet?.id}"/>
  <div class="form-actions">
    <g:actionSubmit value="Enregistrer" class="btn btn-primary"
                    action="enregistre"
                    title="Enregistrer"/>
  </div>
</g:form>

</body>
</html>