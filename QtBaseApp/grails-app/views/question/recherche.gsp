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
  <title>
  <g:if test="${afficheFormulaire}">
   <g:message code="question.recherche.head.title" />
   </g:if>
   <g:else>
     <g:message code="question.recherche.mesItems.head.title" />
   </g:else>
   </title>
  </title>
</head>

<body>

<g:render template="/breadcrumps" plugin="lms-common"
          model="[liens: liens]"/>

<g:if test="${sujet}">
  <g:render template="/sujet/listeElements" model="[sujet: sujet]"/>
</g:if>
<g:if test="${afficheFormulaire}">
  <form>
    <div class="portal-form_container recherche">
      <table>
        <tr>
          <td class="control-label">
            Titre
          </td>
          <td>
            <g:textField name="patternTitre" title="titre"
                         value="${rechercheCommand.patternTitre}"/>
          </td>

          <td class="control-label">Type
          </td>
          <td>
            <g:select name="typeId" value="${rechercheCommand.typeId}"
                      noSelection="${['null': 'Tous']}"
                      from="${typesQuestion}"
                      optionKey="id"
                      optionValue="nom"/>
          </td>
        </tr>
        <tr>
          <td class="control-label">
            Contenu
          </td>
          <td>
            <g:textField name="patternSpecification" title="contenu"
                         value="${rechercheCommand.patternSpecification}"/>
          </td>
          <td class="control-label">Matière
          </td>
          <td>
            <g:select name="matiereId" value="${rechercheCommand.matiereId}"
                      noSelection="${['null': 'Toutes']}"
                      from="${matieres}"
                      optionKey="id"
                      optionValue="libelleLong"/>
          </td>
        </tr>
        <tr>
          <td class="control-label">Auteur
          </td>
          <td>
            <g:textField name="patternAuteur" title="auteur"
                                    value="${rechercheCommand.patternAuteur}"/>
          </td>

          <td class="control-label">Niveau
          </td>
          <td>
            <g:select name="niveauId" value="${rechercheCommand.niveauId}"
                      noSelection="${['null': 'Tous']}"
                      from="${niveaux}"
                      optionKey="id"
                      optionValue="libelleLong"/>
          </td>
        </tr>

      </table>
    </div>
    <div class="form_actions recherche">
      <g:if test="${questions}">
                    ${questions.totalCount} résultat(s)
                </g:if>
                <g:else>
                  Aucun résultat
                </g:else>
      <g:hiddenField name="sujetId" value="${sujet?.id}"/>

      <g:actionSubmit value="Rechercher" action="recherche"
                      title="Lancer la recherche" class="btn"/>
    </div>
  </form>
</g:if>
<g:if test="${questions}">
  <div class="${afficheFormulaire ? 'partiel' : ''} ">
    <g:if test="${afficherPager}">
        <g:paginate
                total="${questions.totalCount}"
                params="${rechercheCommand?.toParams()}"></g:paginate>
      </g:if>
  </div>

  <div class="portal-default_results-list question  ${sujet ? 'partiel' : ''}">
    <g:each in="${questions}" status="i" var="questionInstance">
      <div>
        <h1>${fieldValue(bean: questionInstance, field: "titre")}</h1>

        <div class="btn-group" id="${questionInstance.id}" style="display: inline-block;">
          <button class="btn dropdown-toggle btn-small" data-toggle="dropdown">
              <i class="icon-cog"></i>
              <span class="caret"></span>
          </button>
          <ul id="menu_actions_${questionInstance.id}" class="dropdown-menu">
          <li><g:link action="detail"
                      controller="question${questionInstance.type.code}"
                      id="${questionInstance.id}"
                      params="[sujetId: sujet?.id]">
            Aperçu
          </g:link>
          </li>
          <g:if test="${sujet}">
            <li><g:link action="insert"
                        controller="question${questionInstance.type.code}"
                        id="${questionInstance.id}"
                        params="[sujetId: sujet?.id]">
              Insérer&nbsp;dans&nbsp;le&nbsp;sujet
            </g:link>
            </li>
          </g:if>
          <g:if test="${artefactHelper.utilisateurPeutModifierArtefact(utilisateur, questionInstance) && afficheLiensModifier}">
            <li><g:link action="edite"
                        controller="question${questionInstance.type.code}"
                        id="${questionInstance.id}">Modifier</g:link></li>
          </g:if>
          <g:else>
            <li class="disabled"><a href="#">Modifier</a></li>
          </g:else>
          <g:if test="${artefactHelper.utilisateurPeutDupliquerArtefact(utilisateur, questionInstance) && afficheLiensModifier}">
            <li><g:link action="duplique"
                        controller="question${questionInstance.type.code}"
                        id="${questionInstance.id}">Dupliquer</g:link></li>
          </g:if>
          <g:else>
            <li class="disabled"><a href="#">Dupliquer</a></li>
          </g:else>
          <li class="divider"></li>
          <g:if test="${artefactHelper.utilisateurPeutPartageArtefact(utilisateur, questionInstance) && afficheLiensModifier}">
            <li><g:link action="partage"
                        controller="question${questionInstance.type.code}"
                        id="${questionInstance.id}">Partager</g:link></li>
          </g:if>
          <g:else>
            <li class="disabled"><a href="#">Partager</a></li>
          </g:else>
          <g:if test="${artefactHelper.utilisateurPeutExporterArtefact(utilisateur, questionInstance)}">
            <li><g:link action="exporter" controller="question"
                        id="${questionInstance.id}">Exporter</g:link></li>
          </g:if>
          <g:else>
            <li class="disabled"><a href="#">Exporter</a></li>
          </g:else>
          <li class="divider"></li>
          <g:if test="${artefactHelper.utilisateurPeutSupprimerArtefact(utilisateur, questionInstance) && afficheLiensModifier}">
            <li><g:link action="supprime"
                        controller="question${questionInstance.type.code}"
                        id="${questionInstance.id}">Supprimer</g:link></li>
          </g:if>
          <g:else>
            <li class="disabled"><a href="#">Supprimer</a></li>
          </g:else>
        </ul>
        </div>
        <p class="date">Mise à jour le ${questionInstance.lastUpdated?.format('dd/MM/yy HH:mm')}</p>

        <p>
          <g:if test="${questionInstance.niveau?.libelleLong}"><strong>» Niveau :</strong> ${questionInstance.niveau?.libelleLong}</g:if>
          <g:if test="${questionInstance.matiere?.libelleLong}"><strong>» Matière :</strong> ${questionInstance.matiere?.libelleLong}</g:if>
          <strong>» Type :</strong>  ${questionInstance.type.nom}
          <strong>» Partagé :</strong>  ${questionInstance.estPartage() ? 'oui' : 'non'}
        </p>

      </div>
    </g:each>
  </div>

</g:if>


</body>
</html>