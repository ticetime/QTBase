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

class LmsSubscriptionAppGrailsPlugin {
  // the plugin version
  def version = "13.01-SNAPSHOT"
  // the version or versions of Grails the plugin is designed for
  def grailsVersion = "2.1 > *"
  // the other plugins this plugin depends on
  def dependsOn = [:]
  // resources that are excluded from plugin packaging
  def pluginExcludes = ["grails-app/views/error.gsp"]

  def title = "Lms Subscription App Plugin" // Headline display name of the plugin
  def author = "Franck Silvestre"
  def authorEmail = "franck.silvestre@ticetime.com"
  def description = '''\
Lms Subscription
'''

  // URL to the plugin's documentation
  def documentation = "http://grails.org/plugin/lms-subscription-app"

  // Extra (optional) plugin metadata

  // License: one of 'APACHE', 'GPL2', 'GPL3'
  def license = "AGPL3"

  // Details of company behind the plugin (if there is one)
  def organization = [ name: "Ticetime", url: "http://www.ticetime.com/" ]

  // Any additional developers beyond the author specified above.
  //def developers = [ [ name: "Joe Bloggs", email: "joe@bloggs.net" ]]

  // Location of the plugin's issue tracker.
  def issueManagement = [ system: "Github", url: "https://github.com/ticetime/QTBase/issues" ]

  // Online location of the plugin's browseable source code.
  def scm = [ url: "https://github.com/ticetime/QTBase" ]

  def doWithWebDescriptor = { xml ->
    // TODO Implement additions to web.xml (optional), this event occurs before
  }

  def doWithSpring = {
    // TODO Implement runtime spring config (optional)
  }

  def doWithDynamicMethods = { ctx ->
    // TODO Implement registering dynamic methods to classes (optional)
  }

  def doWithApplicationContext = { applicationContext ->
    // TODO Implement post initialization spring config (optional)
  }

  def onChange = { event ->
    // TODO Implement code that is executed when any artefact that this plugin is
    // watching is modified and reloaded. The event contains: event.source,
    // event.application, event.manager, event.ctx, and event.plugin.
  }

  def onConfigChange = { event ->
    // TODO Implement code that is executed when the project configuration changes.
    // The event is the same as for 'onChange'.
  }

  def onShutdown = { event ->
    // TODO Implement code that is executed when the application shuts down (optional)
  }
}
