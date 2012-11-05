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
  <style type='text/css'>
      h3 {
        margin-left: 1em;
      }
      .form-horizontal .control-label {
        font-weight: bold;
        width: 90px;
      }

      </style>
  <title><g:message code="question.detail.head.title" /></title>
</head>

<body>

<g:render template="/breadcrumps" plugin="lms-common"
          model="[liens: liens]"/>

<g:if test="${sujet == null}">
  <div class="navbar">
   <div class="navbar-inner">
     <ul class="nav">
  <g:if test="${artefactHelper.utilisateurPeutModifierArtefact(utilisateur, question)}">
    <li><g:link action="edite"
            id="${question.id}"><i class="icon-pencil"></i>Modifier l'item</g:link></li>
  </g:if>
  <g:else>
    <li class="disabled"><a href="#"><i class="icon-ban-circle"></i>Modifier l'item</a></li>
  </g:else>
  <li>
  <li class="dropdown" id="${question.id}">
             <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                           <i class="icon-cog"></i>
                           <b class="caret"></b>
                         </a>
    <ul id="menu_actions_${question.id}"
        class="dropdown-menu">
      <g:if test="${sujet}">
        <li><g:link action="insert"
                    controller="question${question.type.code}"
                    id="${question.id}"
                    params="[sujetId: sujet?.id]">
          Insérer&nbsp;dans&nbsp;le&nbsp;sujet
        </g:link>
        </li>
      </g:if>
      <g:if test="${artefactHelper.utilisateurPeutDupliquerArtefact(utilisateur, question)}">
        <li><g:link action="duplique"
                    controller="question${question.type.code}"
                    id="${question.id}">Dupliquer</g:link></li>
      </g:if>
      <g:else>
        <li class="disabled"><a href="#">Dupliquer</a></li>
      </g:else>
      <li class="divider"></li>
      <g:if test="${artefactHelper.utilisateurPeutPartageArtefact(utilisateur, question)}">
        <li><g:link action="partage"
                    controller="question${question.type.code}"
                    id="${question.id}">Partager</g:link></li>
      </g:if>
      <g:else>
        <li class="disabled"><a href="#">Partager</a></li>
      </g:else>
      <g:if test="${artefactHelper.utilisateurPeutExporterArtefact(utilisateur, question)}">
        <li><g:link action="exporter" controller="question"
                    id="${question.id}">Exporter</g:link></li>
      </g:if>
      <g:else>
        <li class="disabled"><a href="#">Exporter</a></li>
      </g:else>
      <li class="divider"></li>
      <g:if test="${artefactHelper.utilisateurPeutSupprimerArtefact(utilisateur, question)}">
        <li><g:link action="supprime"
                    controller="question${question.type.code}"
                    id="${question.id}">Supprimer</g:link></li>
      </g:if>
      <g:else>
        <li class="disabled"><a href="#">Supprimer</a></li>
      </g:else>
    </ul>
    </li>
  </ul>
  </div>
  </div>
</g:if>

<g:if test="${flash.messageCode}">
  <div class="alert alert-success">
    <g:message code="${flash.messageCode}"
                                   args="${flash.messageArgs}"/>
  </div>
</g:if>

<g:if test="${sujet}">
  <g:render template="/sujet/listeElements" model="[sujet: sujet]"/>
</g:if>


<div class="portal-form_container edite apercu">
  <g:render template="/question/detail_commun"
            model="[question: question]"/>

</div>

<g:if test="${sujet && !flash.messageCode}">
<div class="form-actions" style="width: 69%">

    <g:link action="insert"
            title="Insérer dans le sujet" id="${question.id}"
            params="[sujetId: sujet?.id]" class="btn">
      Insérer dans le sujet
    </g:link>
</div>
</g:if>

</body>
</html>