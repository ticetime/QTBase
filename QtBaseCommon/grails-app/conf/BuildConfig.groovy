grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
//grails.project.war.file = "target/${appName}-${appVersion}.war"

grails.plugin.location.'lms-common' = "../LmsCommon"

grails.project.dependency.resolution = {
  // inherit Grails' default dependencies
  inherits("global") {
    // uncomment to disable ehcache
    // excludes 'ehcache'
    excludes "xml-apis"
  }
  log "warn" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
  repositories {
    grailsCentral()
  }
  dependencies {
    // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.
    compile('org.codehaus.groovy.modules.http-builder:http-builder:0.5.2') {
      excludes "commons-logging", "xml-apis", "groovy"
    }

    runtime "postgresql:postgresql:9.1-901.jdbc4"
  }

  plugins {
    build(":tomcat:$grailsVersion",
          ":rest-client-builder:1.0.2",
          ":release:2.0.3",
          ":hibernate:$grailsVersion") {
      export = false
    }

    compile(":codenarc:0.15") {
      export = false
    }


    compile(":gmetrics:0.3.1") {
      excludes "groovy-all"
      export = false
    }
  }
}
