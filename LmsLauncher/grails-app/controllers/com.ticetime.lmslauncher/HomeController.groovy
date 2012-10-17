package com.ticetime.lmslauncher

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class HomeController {

  def springSecurityService

  /**
   * The default action
   */
  def index() {

    if (springSecurityService.isLoggedIn()) {
      redirect controller: 'accueil'
      return
    }

    render(view: "/home/index")

  }
}
