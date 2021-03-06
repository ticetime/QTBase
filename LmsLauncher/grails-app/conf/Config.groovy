/*
 * Copyright (C) 2012  Franck Silvestre
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>
 */

import grails.plugins.springsecurity.SecurityConfigType
import org.lilie.services.eliot.tice.scolarite.FonctionEnum
import org.lilie.services.eliot.tice.utils.EliotApplicationEnum
import org.lilie.services.eliot.tice.utils.UrlServeurResolutionEnum

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [
    all:           '*/*',
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    xml:           ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
           'org.codehaus.groovy.grails.web.pages',          // GSP
           'org.codehaus.groovy.grails.web.sitemesh',       // layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping',        // URL mapping
           'org.codehaus.groovy.grails.commons',            // core / classloading
           'org.codehaus.groovy.grails.plugins',            // plugins
           'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'
}

// ----------------------------------------------------------------------------
// Custom parameters for the LMS
//-----------------------------------------------------------------------------

//
// Technical config
//
grails.controllers.defaultScope = "session"

grails.serverURL = "http://localhost:8080/${appName}"
eliot.tdbase.nomApplication = "QTBase"
eliot.urlResolution.mode = UrlServeurResolutionEnum.CONFIGURATION.name()
eliot.tdbase.urlServeur = "http//localhost:8080"

grails.plugins.springsecurity.dao.reflectionSaltSourceProperty = 'username'
grails.plugins.springsecurity.securityConfigType = SecurityConfigType.InterceptUrlMap
grails.plugins.springsecurity.errors.login.fail = "errors.login.fail"


 //
 //  Eliot application / Header "porteur"
 //
 eliot.eliotApplicationEnum = EliotApplicationEnum.TDBASE
 eliot.requestHeaderPorteur = "ENT_PORTEUR"
 eliot.defaultCodePorteur = "WWW"

//
//  External configs
//

 // File loaded if it is in the  classpath
 grails.config.locations = ["classpath:${appName}-config.groovy"]

 // Common config for all applications
 def eliotcommonsConfigLocation = System.properties["eliot-commons.config.location"]
 if (eliotcommonsConfigLocation) {
   grails.config.locations << ("file:" + eliotcommonsConfigLocation)
 }

// Application config file
 def appConfigLocation = System.properties["${appName}.config.location"]
 if (appConfigLocation) {
   grails.config.locations << "file:" + appConfigLocation
 }

//
// Misc
//

 // max of items displayed in a list
 eliot.listes.maxrecherche = 5
 eliot.listes.max = 7

 // To force the display in a dimensioned div
 eliot.pages.container.forceDimensions = false
 // hauteur en pixel : ne s'applique que si forceDimensions est à true
 eliot.pages.container.height = 629
 // largeur en pixel : ne s'applique que si forceDimensions est à true
 eliot.pages.container.width = 931

 // l'url des fichiers de documentation par fonction
 eliot.manuels.documents.urlMap = ["${FonctionEnum.ENS.name()}": "http://ticetime.github.com/eliot-tdbase/aide/webhelp/Manuel_Utilisateur_TDBase_Enseignant/content/index.html",
         "${FonctionEnum.ELEVE.name()}": "http://ticetime.github.com/eliot-tdbase/aide/webhelp/Manuel_Utilisateur_TDBase_Eleve/content/index.html",
         "${FonctionEnum.PERS_REL_ELEVE.name()}": "http://ticetime.github.com/eliot-tdbase/aide/webhelp/Manuel_Utilisateur_TDBase_Parent/content/index.html"]


// set security rbac
//
grails.plugins.springsecurity.interceptUrlMap = [
        '/p/**': ['IS_AUTHENTICATED_FULLY'],
        '/dashboard/**': ["${FonctionEnum.ENS.toRole()}",
                'IS_AUTHENTICATED_FULLY'],
        '/sujet/**': ["${FonctionEnum.ENS.toRole()}",
                'IS_AUTHENTICATED_FULLY'],
        '/question/**': ["${FonctionEnum.ENS.toRole()}",
                'IS_AUTHENTICATED_FULLY'],
        '/seance/**': ["${FonctionEnum.ENS.toRole()}",
                'IS_AUTHENTICATED_FULLY'],
        '/activite/**': ["${FonctionEnum.ELEVE.toRole()}",
                'IS_AUTHENTICATED_FULLY'],
        '/resultats/**': ["${FonctionEnum.PERS_REL_ELEVE.toRole()}",
                'IS_AUTHENTICATED_FULLY'],
        '/maintenance/**': ["${FonctionEnum.CD.toRole()}",
                'IS_AUTHENTICATED_FULLY']]

//
// Per environment config

environments {
  test {
    eliot.fichiers.racine = '/tmp'
    eliot.tdbase.nomApplication = "QTBase"
    eliot.urlResolution.mode = UrlServeurResolutionEnum.ANNUAIRE_PORTEUR.name()

  }
  development {
    eliot.tdbase.nomApplication = "QTBase"
    eliot.urlResolution.mode = UrlServeurResolutionEnum.ANNUAIRE_PORTEUR.name()

    // autorise l'identification via url get
    grails.plugins.springsecurity.apf.postOnly = false
    // application de la migration  définie dans eliot-tice-dbmigration
    eliot.bootstrap.migration = true
    // creation d'un jeu de test
    eliot.bootstrap.jeudetest = true
    // configuration de la racine de l'espace de fichier
    eliot.fichiers.storedInDatabase = true
    //eliot.fichiers.racine = '/Users/Shared/eliot-root'
    eliot.fichiers.maxsize.mega = 10
    // configuration des liens du menu portail et des annonces portail
    eliot.portail.menu.affichage = true
    eliot.portail.menu.liens = [[url: "http://www.ticetime.com",
            libelle: "ticetime"],
            [url: "https://github.com/ticetime/QTBase/wiki",
                    libelle: "QTBase sur Github"]]
    eliot.portail.news = ["QTBase version ${appVersion} - environnement DEV.",
            "Le projet est disponible sur <a href=\"https://github.com/ticetime/QTBase/wiki\" target=\"_blank\">Github</a> !",
            "Login / mot de passe enseignant : ens1 / ens1",
            "Login / mot de passe élève 1 : elv1 / elv1",
            "Login / mot de passe élève 2 : elv2 / elv2",
            "Login / mot de passe parent 1 : resp1 / resp1"]

  }
  cf {
    grails.serverURL = "http://QtBaseApp.cloudfoundry.com"
    eliot.tdbase.urlServeur = "http://QtBaseApp.cloudfoundry.com"
    eliot.tdbase.nomApplication = "QtBaseApp"
    eliot.urlResolution.mode = UrlServeurResolutionEnum.CONFIGURATION.name()
    eliot.tdbase.urlServeur = "http//QtBaseApp.cloudfoundry.com"


    // autorise l'identification via url get
    grails.plugins.springsecurity.apf.postOnly = false
    // application de la migration  définie dans eliot-tice-dbmigration
    eliot.bootstrap.migration = true
    // creation d'un jeu de test
    eliot.bootstrap.jeudetest = true
    // configuration de la racine de l'espace de fichier
    eliot.fichiers.storedInDatabase = true
    eliot.fichiers.racine = '/Users/Shared/eliot-root'
    eliot.fichiers.maxsize.mega = 10
    // configuration des liens du menu portail et des annonces portail
    eliot.portail.menu.affichage = true
    eliot.portail.menu.liens = [[url: "http://www.ticetime.com",
            libelle: "ticetime"],
            [url: "https://github.com/ticetime/QTBase/wiki",
                    libelle: "QTBase sur Github"]]

    eliot.portail.news = ["QTBase v12.01-SNAPSHOT on Cloudfoundry.",
            "Le projet est disponible sur <a href=\"https://github.com/ticetime/QTBase/wiki\" target=\"_blank\">Github</a> !",
            "Login / mot de passe enseignant : ens1 / ens1",
            "Login / mot de passe élève 1 : elv1 / elv1",
            "Login / mot de passe élève 2 : elv2 / elv2",
            "Login / mot de passe parent 1 : resp1 / resp1"]


  }


}