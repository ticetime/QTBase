<%@ page import="org.lilie.services.eliot.tdbase.SujetType" %>
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
    $(document).ready(function () {
      $('input[name="titre"]').focus();
    });
  </r:script>
  <title><g:message code="sujet.editeProprietes.head.title"/></title>
</head>

<body>
<g:render template="/breadcrumps" plugin="lms-common"
          model="[liens: liens]"/>

<g:if test="${flash.messageCode}">
  <div class="alert alert-success">
    <g:message code="${flash.messageCode}"/>
  </div>
</g:if>
<g:hasErrors bean="${sujet}">
    <g:eachError>
      <div class="alert alert-error"><g:message error="${it}"/></div>
    </g:eachError>
</g:hasErrors>


<form method="post" action="#" class="form-horizontal" enctype="multipart/form-data">

    <p style="font-style: italic; margin-bottom: 2em"><span class="obligatoire">*</span> indique une information obligatoire</p>

    <div class="control-group">
      <label class="control-label" for="titre">Titre<span
              class="obligatoire">*</span></label>

      <div class="controls">
        <input type="text" value="${sujet.titre}" name="titre" tabindex="1"
               class="input-xxlarge" id="titre"/>
      </div>
    </div>

    <div class="control-group">
      <label class="control-label">Type<span class="obligatoire">*</span>
      </label>

      <div class="controls">
        <g:select name="sujetType.id" value="${sujet.sujetType?.id}"
                  from="${typesSujet}"
                  optionKey="id"
                  optionValue="nom" tabindex="2"/>
      </div>
    </div>

    <div class="control-group">
      <label class="control-label">Matière</label>

      <div class="controls">
        <g:select name="matiere.id" value="${sujet.matiere?.id}"
                  noSelection="${['null': g.message(code: "default.select.null")]}"
                  from="${matieres}"
                  optionKey="id"
                  optionValue="libelleLong" tabindex="3"/>
      </div>
    </div>

    <div class="control-group">
      <label class="control-label">Niveau</label>

      <div class="controls">
        <g:select name="niveau.id" value="${sujet.niveau?.id}"
                  noSelection="${['null': g.message(code: "default.select.null")]}"
                  from="${niveaux}"
                  optionKey="id"
                  optionValue="libelleLong" tabindex="4"/>
      </div>
    </div>

    <div class="control-group">
      <label class="control-label">Durée</label>

      <div class="controls">
        <input type="text" name="dureeMinutes" value="${sujet.dureeMinutes}"
               class="input-mini" tabindex="5"/>
        (en minutes)
      </div>
    </div>

    <div class="control-group">

      <div class="controls">
        <label class="checkbox">
        <g:checkBox name="ordreQuestionsAleatoire"
                    checked="${sujet.ordreQuestionsAleatoire}" tabindex="5"/>
        Ordre des questions aléatoire
        </label>
      </div>
    </div>

    <div class="control-group">
      <label class="control-label">Description</label>

      <div class="controls">
        <g:textArea cols="80" rows="10" name="presentation"  class="input-xxlarge"
                    value="${sujet.presentation}" tabindex="6"/>
      </div>
    </div>

    <div class="control-group">
      <label class="control-label">Partage</label>

      <div class="controls">
        <g:if test="${sujet.estPartage()}">
          <a href="${sujet.copyrightsType.lien}"
             target="_blank">${sujet.copyrightsType.presentation}</a>
        </g:if>
        <g:else>
          ce sujet n'est pas partagé
        </g:else>
      </div>
    </div>


      <g:if test="${sujet.paternite}">
        <g:render template="/artefact/paternite"
                  model="[paternite: sujet.paternite]"/>
      </g:if>

  <g:hiddenField name="id" value="${sujet.id}"/>
  <div class="form-actions">
    <g:actionSubmit value="Enregistrer" action="enregistrePropriete"
                    class="btn btn-primary"
                    title="Enregistrer" tabindex="7"/>
  </div>
</form>

</body>
</html>