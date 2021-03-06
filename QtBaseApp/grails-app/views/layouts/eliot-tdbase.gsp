<%@ page import="org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils; org.lilie.services.eliot.tice.scolarite.FonctionEnum; org.lilie.services.eliot.tdbase.QuestionTypeEnum" %>
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
<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title><g:layoutTitle default="TDbase"/></title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <r:require module="eliot-tdbase"/>
  <r:layoutResources/>
  <g:layoutHead/>
</head>

<body>
<g:render template="/menuPortail" plugin="lms-common" model="[homeController: 'home', homeAction:'index', moduleName:'QTBase']"/>

<et:container class="container">
  <g:if test="${SpringSecurityUtils.ifAllGranted(FonctionEnum.ENS.toRole())}">
    <et:manuelLink fonctionEnum="${FonctionEnum.ENS}"
                   class="portal-manuel"><g:message
            code="manuels.libellelien"/></et:manuelLink>
  </g:if>


  <g:layoutBody/>
  <r:script>
    $('form[method="post"]').attr('enctype','multipart/form-data');
  </r:script>
</et:container>
<r:layoutResources/>
</body>
</html>