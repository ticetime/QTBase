%{--
  - Copyright (C) 2012  Franck Silvestre
  -
  - This program is free software: you can redistribute it and/or modify
  - it under the terms of the GNU Affero General Public License as
  - published by the Free Software Foundation, either version 3 of the
  - License, or (at your option) any later version.
  -
  - This program is distributed in the hope that it will be useful,
  - but WITHOUT ANY WARRANTY; without even the implied warranty of
  - MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  - GNU Affero General Public License for more details.
  -
  - You should have received a copy of the GNU Affero General Public License
  - along with this program.  If not, see <http://www.gnu.org/licenses/>
  --}%


<%@ page import="org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils" contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta name="layout" content="lms"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style type="text/css">
        body {
          padding-top: 60px;
          padding-bottom: 40px;
        }
      </style>
  <title>QTBase</title>
</head>

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="#">QTBase</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="active"><a href="#">Accueil</a></li>
              <li><a href="#about">A propos</a></li>
              <li><a href="#contact">Contact</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">... <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li class="divider"></li>
                  <li class="nav-header">Nav header</li>
                  <li><a href="#">Separated link</a></li>
                  <li><a href="#">One more separated link</a></li>
                </ul>
              </li>
            </ul>
            <form class="navbar-form pull-right" action='${request.contextPath}${SpringSecurityUtils.securityConfig.apf.filterProcessesUrl}' method='POST' id='loginForm'>
              <input class="span2" type="text" placeholder="Login" name='j_username' id='username'>
              <input class="span2" type="password" placeholder="Password" name='j_password' id='password'>
              <button type="submit" class="btn">Se connecter</button>
            </form>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

    <div class="container">

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="hero-unit">
        <h1>Bienvenue sur QTBase</h1>
        <p>QTBase est un outil pour les enseignants qui veulent que leurs élèves travaillent de manière interactive en ligne.</p>
      </div>

      <!-- Example row of columns -->
      <div class="row">
        <div class="span4">
          <h2>Créez</h2>
          <p>En tant qu'enseignant, créer des sujets en ligne, créer des séances pour que vos élèves puissent travailler sur vos sujets. Récupérer les copies corrigées automatiquement et annotez les avant de les remettre aux élèves.</p>
        </div>
        <div class="span4">
          <h2>Partagez</h2>
          <p>Vous pouvez mettre à disposition vos ressources pédagogiques à l'ensemble de la communauté des enseignants QTBase. Ainsi faites bénéficier et bénéficiez de la création collectives des sujets et des questions.</p>
       </div>
        <div class="span4">
          <h2>Inscrivez vous</h2>
          <p>Pour créer un compte enseignant, complétez le formulaire...</p>
          <form action="/subscription/subscribe" class="signup" method="post">
                    <div class="placeholding-input">
                      <label for="signup-user-name" class="placeholder">Nom complet</label>
                      <input type="text" id="signup-user-name" class="text-input" autocomplete="off" name="user[name]" maxlength="20">
                    </div>
                    <div class="placeholding-input">
                      <label for="signup-user-email" class="placeholder">Adresse email</label>
                      <input type="text" id="signup-user-email" class="text-input email-input" autocomplete="off" name="user[email]">
                    </div>
                    <div class="placeholding-input">
                      <label for="signup-user-password" class="placeholder">Mot de passe</label>
                      <input type="password" id="signup-user-password" class="text-input" name="user[user_password]">
                    </div>
                    <button type="submit" class="btn btn-warning">
                      S'inscrire sur QTBase
                    </button>
                  </form>
        </div>
      </div>

      <hr>

      <footer>
        <p>&copy; Ticetime 2012</p>
      </footer>

    </div> <!-- /container -->

  </body>
</html>
</html>