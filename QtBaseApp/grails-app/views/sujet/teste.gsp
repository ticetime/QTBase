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

<%@ page import="org.lilie.services.eliot.tice.utils.NumberUtils" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta name="layout" content="eliot-tdbase"/>
  <g:if test="${copie.estModifiable()}">
    <r:require module="copieEdite_CopieModifiableEnTest"/>
  </g:if>
  <g:else>
    <r:require module="copieEdite_CopieNonModifiableEnTest"/>
  </g:else>

  <title><g:message code="sujet.teste.head.title"/></title>
</head>

<body>

<g:render template="/breadcrumps" plugin="lms-common"
          model="[liens: liens]"/>
<div class="navbar">
  <div class="navbar-inner">
    <ul class="nav">
    <g:if test="${artefactHelper.utilisateurPeutModifierArtefact(utilisateur, sujet)}">
      <li><g:link action="edite" controller="sujet"
              id="${sujet.id}"><i class="icon-pencil"></i> Modifier le sujet</g:link></li>
      <li><g:link action="editeProprietes" controller="sujet"
              id="${sujet.id}"><i class="icon-wrench"></i> Modifier les propriétés du sujet</g:link></li>
    </g:if>
    <g:else>
      <li><a href="#"><i class="icon-ban-circle"></i> Modifier le sujet</a></li>
      <li><a href="#"><i class="icon-ban-circle"></i> Modifier les propriétés du sujet</a></li>
    </g:else>
      <li class="dropdown" id="toolbar_${sujet.id}">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="icon-cog"></i>
              <b class="caret"></b>
            </a>
          <ul id="menu_actions_toolbar_${sujet.id}"
              class="dropdown-menu">
            <li><g:link action="reinitialiseCopieTest" id="${copie.id}">
              Réinitialiser la copie
            </g:link>
            </li>
            <li><g:link action="ajouteSeance" id="${sujet.id}">
              Nouvelle&nbsp;séance
            </g:link>
            </li>
            <li class="divider"></li>
            <g:if test="${artefactHelper.utilisateurPeutDupliquerArtefact(utilisateur, sujet)}">
              <li><g:link action="duplique"
                          id="${sujet.id}">Dupliquer</g:link></li>
            </g:if>
            <g:else>
              <li class="disabled"><a href="#">Dupliquer</a></li>
            </g:else>
            <li class="divider"></li>
            <g:if test="${artefactHelper.utilisateurPeutPartageArtefact(utilisateur, sujet)}">
              <li><g:link action="partage"
                          id="${sujet.id}">Partager</g:link></li>
            </g:if>
            <g:else>
              <li class="disabled"><a href="#">Partager</a></li>
            </g:else>
            <g:if test="${artefactHelper.utilisateurPeutExporterArtefact(utilisateur, sujet)}">
              <li><g:link action="exporter" id="${sujet.id}">Exporter</g:link></li>
            </g:if>
            <g:else>
              <li class="disabled"><a href="#">Exporter</a></li>
            </g:else>
            <li class="divider"></li>
            <g:if test="${artefactHelper.utilisateurPeutSupprimerArtefact(utilisateur, sujet)}">
              <li><g:link action="supprime"
                          id="${sujet.id}">Supprimer</g:link></li>
            </g:if>
            <g:else>
              <li class="disabled"><a href="#">Supprimer</a></li>
            </g:else>
          </ul>
        </li>
    </ul>
  </div>

</div>
<g:hasErrors bean="${copie}">
    <g:eachError>
      <div class="alert alert-error">
        <g:message error="${it}"/>
      </div>
    </g:eachError>
</g:hasErrors>
<g:if test="${request.messageCode}">
  <div class="alert alert-success">
   <g:message code="${request.messageCode}"/>
  </div>
</g:if>

<g:if test="${flash.messageCode}">
  <div class="alert alert-info">
    <g:message code="${flash.messageCode}"/>
  </div>
</g:if>

<div class="alert alert-info">
    Date dernier enregistrement : <span
          id="date_enregistrement">${copie.dateEnregistrement?.format(message(code: 'default.date.format'))}</span>
    <g:if test="${copie.dateRemise}">
      &nbsp;&nbsp;   &nbsp;&nbsp;
   Note (correction automatique) :
      <g:formatNumber number="${copie.correctionNoteAutomatique}"
                      format="##0.00"/>
      / <g:formatNumber number="${copie.maxPoints}" format="##0.00"/>
      &nbsp;&nbsp;(copie remise le ${copie.dateRemise.format('dd/MM/yy  à HH:mm')})
    </g:if>
</div>


<g:render template="/copie/edite"
          model="[copie: copie, afficheCorrection: afficheCorrection]"/>
</body>
</html>