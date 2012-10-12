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

grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"

grails.plugin.location.'lms-common' = "../LmsCommon"

grails.project.war.file = "target/${appName}.war"

grails.project.dependency.resolution = {
  // inherit Grails' default dependencies
  inherits("global") {
    // uncomment to disable ehcache
    // excludes 'ehcache'
  }
  log "warn" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
  repositories {
    grailsCentral()
  }
  dependencies {
    // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.

    runtime "postgresql:postgresql:9.1-901.jdbc4"
  }

  plugins {

    compile ":hibernate:$grailsVersion"
    compile ":jquery:1.7.1"
    compile ":jquery-ui:1.8.15"
    compile ":resources:1.1.6"
    compile ":spring-security-core:1.2.7.2"
    compile ":twitter-bootstrap:2.1.1"


    build(":tomcat:$grailsVersion",
          ":release:2.0.3",
          ":rest-client-builder:1.0.2",
          ":hibernate:$grailsVersion") {
      export = false
    }
  }
}
