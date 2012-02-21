<%@ page import="org.lilie.services.eliot.tice.utils.NumberUtils" %>
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



<g:set var="sujet" value="${copie.sujet}"/>
<form method="post" class="edite">
    <div class="top portal-tabs">
        <div class="form_actions">
            <g:link action="${lienRetour.action}"
                    controller="${lienRetour.controller}"
                    params="${lienRetour.params}">Annuler</g:link>&nbsp;
            |&nbsp;
            <g:actionSubmit value="Rendre la copie" action="rendLaCopie" class="button"
                            title="Rendre la copie"/>
        </div>
    </div>

    <g:hiddenField name="copie.id" value="${copie.id}"/>

    <h1 class="tdbase-sujet-titre">${sujet.titre}</h1>
    <g:set var="indexReponseNonVide" value="0"/>
    <g:each in="${copie.reponses}" var="reponse">
        <g:set var="sujetQuestion" value="${reponse.sujetQuestion}"/>
        <div class="tdbase-sujet-edition-question">
            <g:if test="${sujetQuestion.question.type.interaction}">
                <div class="tdbase-sujet-edition-question-points">
                    <div id="SujetSequenceQuestions-${sujetQuestion.id}">
                        <em><g:formatNumber number="${reponse.correctionNoteAutomatique}" format="##0.00"/></em>
                        &nbsp;/&nbsp;<strong><g:formatNumber number="${sujetQuestion.points}"
                                                             format="##0.00"/>&nbsp;point(s)</strong>
                    </div>
                </div>
            </g:if>
            <g:set var="question" value="${sujetQuestion.question}"/>

            <g:if test="${question.type.interaction}">
                <div class="tdbase-sujet-edition-question-interaction">

                    <g:hiddenField
                            name="reponsesCopie.listeReponses[${indexReponseNonVide}].reponse.id"
                            value="${reponse.id}"/>

                    <g:render
                            template="/question/${question.type.code}/${question.type.code}Interaction"
                            model="[question: question, reponse: reponse, indexReponse: indexReponseNonVide]"/>

                    <g:set var="indexReponseNonVide" value="${indexReponseNonVide.toInteger() + 1}"/>
                    <g:if test="${afficheCorrection}">
                        <g:render template="/question/${question.type.code}/${question.type.code}Correction"
                                  model="[question: question]"/>
                    </g:if>

                </div>
            </g:if>
            <g:else>
                <div class="tdbase-sujet-edition-question-interaction">
                    <g:set var="question" value="${sujetQuestion.question}"/>
                    <g:render
                            template="/question/${question.type.code}/${question.type.code}Preview"
                            model="[question: question]"/>
                </div>
            </g:else>

        </div>

    </g:each>
    <g:hiddenField name="nombreReponsesNonVides" value="${indexReponseNonVide}"/>
    <div class="bottom">
        <div class="form_actions">
            <g:link action="${lienRetour.action}"
                    controller="${lienRetour.controller}"
                    params="${lienRetour.params}">Annuler</g:link>&nbsp;
            |&nbsp;<g:actionSubmit value="Rendre la copie" action="rendLaCopie" class="button"
                                   title="Rendre la copie"/>
        </div>
    </div>
</form>