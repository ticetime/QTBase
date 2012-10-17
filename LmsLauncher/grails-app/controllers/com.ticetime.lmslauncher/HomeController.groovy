package com.ticetime.lmslauncher

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class HomeController {

  def springSecurityService

  /**
   * The default action
   */
  def index() {

    def config = SpringSecurityUtils.securityConfig

    if (springSecurityService.isLoggedIn()) {
      redirect controller: 'accueil'
      return
    }

    render(view: "/home/index")

  }
}
