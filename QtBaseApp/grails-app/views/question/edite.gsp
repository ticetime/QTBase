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
  <r:require modules="question_editeJS"/>
  <g:external dir="js/eliot/tiny_mce/tiny_mce.js" plugin="lms-common"/>
  <script type="text/javascript">
    tinyMCE.init({
                   // General options
                   language:'fr',
                   mode:"none",
                   theme:"advanced",
                   plugins:"pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",

                   // Theme options
                   theme_advanced_buttons1:"bold,italic,underline,strikethrough,|,forecolor,backcolor,|,justifyleft,justifycenter,justifyright,justifyfull,|,formatselect,fontselect,fontsizeselect,|,preview",
                   theme_advanced_buttons2:"cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,link,unlink,image,cleanup,help,code",
                   theme_advanced_buttons3:"tablecontrols,|,hr,removeformat,|,sub,sup,|,charmap,iespell,media,advhr",

                   theme_advanced_toolbar_location:"top",
                   theme_advanced_toolbar_align:"left",
                   theme_advanced_statusbar_location:"bottom",
                   theme_advanced_resizing:true,

                   entity_encoding : "raw"
                 });
  </script>
  <r:script>
    $(document).ready(function () {
      $('#question\\.titre').focus();
      $("form").attr('enctype', 'multipart/form-data');
    });
  </r:script>
  <style type='text/css'>
    td {
      padding-right: 1em;
      margin-bottom: 1em;
    }
    </style>
  <title><g:message code="question.edite.head.title"/></title>
</head>

<body>

<g:render template="/breadcrumps" plugin="lms-common"
          model="[liens: liens]"/>

<g:if test="${questionEnEdition}">
  <div class="navbar">
  <div class="navbar-inner">
    <ul class="nav">
  <g:if test="${artefactHelper.utilisateurPeutPartageArtefact(utilisateur, question)}">
    <li><g:link action="partage"
            id="${question.id}"><i class="icon-share"></i> Partager l'item</g:link></li>
  </g:if>
  <g:else>
    <li class="disabled"><a href="#"><i class="icon-ban-circle"></i> Partager l'item</a></li>
  </g:else>
    <li class="dropdown" id="${question.id}">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="icon-cog"></i>
                    <b class="caret"></b>
                  </a>
    <ul id="menu_actions_${question.id}"
        class="dropdown-menu">
      <li><g:link action="detail" controller="question${question.type.code}"
                  id="${question.id}">Aperçu</g:link></li>
      <li class="divider"></li>
      <g:if test="${artefactHelper.utilisateurPeutDupliquerArtefact(utilisateur, question)}">
        <li><g:link action="duplique"
                    controller="question${question.type.code}"
                    id="${question.id}">Dupliquer</g:link></li>
      </g:if>
      <g:else>
        <li class="disabled"><a href="#">Dupliquer</a></li>
      </g:else>
      <li class="divider"></li>
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
<g:else>
  <div class="navbar">
    <div class="navbar-inner">
      <ul class="nav">
      <li class="disabled"><a href="#"><i class="icon-ban-circle"></i> Partager l'item</a></li>
      <li class="dropdown" id="${question.id}">
      <ul id="menu_actions_${question.id}"
          class="dropdown-menu">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <i class="icon-cog"></i>
                      <b class="caret"></b>
                    </a>
        <li><li class="disabled"><a href="#">Aperçu</a></li>
        <li class="divider"></li>
          <li class="disabled"><a href="#">Dupliquer</a></li>
        <li class="divider"></li>
          <li class="disabled"><a href="#">Exporter</a></li>
        <li class="divider"></li>
          <li class="disabled"><a href="#">Supprimer</a></li>
      </ul>
      </li>
      </ul>
    </div>
    </div>
</g:else>
<g:hasErrors bean="${question}">
    <g:eachError>
      <div class="alert alert-error"><g:message error="${it}"/></div>
    </g:eachError>
</g:hasErrors>
<g:if test="${flash.messageCode}">
    <div class="alert alert-success"><g:message code="${flash.messageCode}"
                                   args="${flash.messageArgs}"
                                   class="portal-messages success"/></div>
</g:if>

<g:if test="${sujet}">
  <g:render template="/sujet/listeElements" model="[sujet: sujet]"/>
</g:if>

<g:form method="post" controller="question${question.type.code}"
        class="form-horizontal">

    <p style="font-style: italic; margin-bottom: 2em"><span class="obligatoire">*</span> indique une information obligatoire</p>

    <div class="control-group">
    <table>
      <tr>
        <td class="control-label title">Titre<span class="obligatoire">*</span></td>
        <td>
          <input type="text" value="${question.titre}" class="input-xxlarge"
                 name="titre" id="question.titre"/>
        </td>
      </tr>
      <tr>
        <td class="control-label">Type</td>
        <td>
          <input type="text" value="${question.type.nom}"
                           disabled="true"/>
        </td>
      </tr>
      <g:if test="${!question.id && sujet}">
        <tr>
          <td class="control-label">Mati&egrave;re</td>
          <td>
            <g:select name="matiere.id" value="${sujet.matiereId}"
                      noSelection="${['null': g.message(code:"default.select.null")]}"
                      from="${matieres}"
                      optionKey="id"
                      optionValue="libelleLong"/>
          </td>
        </tr>
        <tr>
          <td class="control-label">Niveau</td>
          <td>
            <g:select name="niveau.id" value="${sujet.niveauId}"
                      noSelection="${['null': g.message(code:"default.select.null")]}"
                      from="${niveaux}"
                      optionKey="id"
                      optionValue="libelleLong"/>
          </td>
        </tr>
      </g:if>
      <g:else>
        <tr>
          <td class="control-label">Mati&egrave;re</td>
          <td>
            <g:select name="matiere.id" value="${question.matiereId}"
                      noSelection="${['null': g.message(code:"default.select.null")]}"
                      from="${matieres}"
                      optionKey="id"
                      optionValue="libelleLong"/>
          </td>
        </tr>
        <tr>
          <td class="control-label">Niveau</td>
          <td>
            <g:select name="niveau.id" value="${question.niveauId}"
                      noSelection="${['null': g.message(code:"default.select.null")]}"
                      from="${niveaux}"
                      optionKey="id"
                      optionValue="libelleLong"/>
          </td>
        </tr>
      </g:else>
      <tr>
        <td class="control-label"><g:message code="question.propriete.principalAttachement"/></td>
        <td id="question_fichier">
          <g:render template="/question/QuestionEditionFichier"
                    model="[question: question, attachementsSujet: attachementsSujets]"/>

        </td>
      </tr>
      <tr><td colspan="2"><hr/></td> </tr>
      <g:render
              template="/question/${question.type.code}/${question.type.code}Edition"
              model="[question: question]"/>
      <tr><td colspan="2"><hr/></td> </tr>
      <tr>
        <td class="control-label"></td>
        <td>
          <div class="alert alert-info">
          <g:if test="${question.estPartage()}">
            <a href="${question.copyrightsType.lien}"
               target="_blank">${question.copyrightsType.presentation}</a>
          </g:if>
          <g:else>
            Cet item n'est pas partagé
          </g:else>
          </div>
        </td>
      </tr>
      <g:if test="${question.paternite}">
        <tr>
          <td class="control-label"></td>
          <td>
        <g:render template="/artefact/paternite"
                  model="[paternite: question.paternite]"/>
          </td>
        </tr>
      </g:if>
    </table>
    </div>
  <g:hiddenField name="id" value="${question.id}"/>
  <g:hiddenField name="type.id" value="${question.typeId}"/>

  <div class="form-actions">
    <g:hiddenField name="sujetId" value="${sujet?.id}"/>
    <g:if test="${sujet && !question.id}">

      <g:actionSubmit value="Enregistrer et insérer dans le sujet"
                      action="enregistreInsertNouvelItem"
                      title="Enregistrer et insérer dans le sujet"
                      class="btn btn-primary"/>
    </g:if>
    <g:else>
      <g:actionSubmit value="Enregistrer"
                      action="enregistre"
                      title="Enregistrer"
                      class="btn btn-primary"/>

    </g:else>
  </div>
</g:form>

</body>
</html>