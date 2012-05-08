class UrlMappings {

  static mappings = {

    // Nécessaire pour contourner bug de Jmol qui génère une requête
    // pour rien qui provoque une exception si elle n'est pas interceptée
    "/**JmolApplet" (controller: "accueil",action: "ignore")


    "/$controller/$action?/$id?" {
      constraints {
        // apply constraints here
      }
    }

    "/"(controller: "accueil")



    "500"(view: '/error')
  }
}
