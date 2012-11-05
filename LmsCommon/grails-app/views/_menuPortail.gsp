<%@ page import="org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils" %>
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

<div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                    </a>
          <g:link controller="$homeController" action="$homeAction" class="brand" href="#">${moduleName}</g:link>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <g:each in="${grailsApplication.config.eliot.portail.menu.liens}" var="lien">
                    <g:if test="${lien.url}">
                      <li><a href="${lien.url}" target="_blank">${lien.libelle}</a></li>
                    </g:if>
                    <g:else>
                      <li>
                      <g:link action="${lien.action}" controller="${lien.controller}"
                              params="${lien.params}">
                        ${lien.libelle}</li>
                      </g:link>
                    </g:else>
                  </g:each>
            </ul>
          <sec:ifLoggedIn>
            <ul class="nav pull-right">
                <li><a href="#"><i class="icon-user icon-white"></i> <sec:loggedInUserInfo field="nomAffichage"/></a></li>
                <li><g:link controller="logout"><i class="icon-off icon-white"></i> Déconnexion</g:link></li>
            </ul>
          </sec:ifLoggedIn>
          <sec:ifNotLoggedIn>
          <form class="navbar-form pull-right" action='${request.contextPath}${SpringSecurityUtils.securityConfig.apf.filterProcessesUrl}' method='POST' id='loginForm'>
                                  <input class="span2" type="text" placeholder="Login" name='j_username' id='username'>
                                  <input class="span2" type="password" placeholder="Password" name='j_password' id='password'>
                                  <button type="submit" class="btn">Se connecter</button>
                                </form>
          </sec:ifNotLoggedIn>
          </div><!--/.nav-collapse -->



        </div>
      </div>
    </div>
