import org.lilie.services.eliot.tice.securite.rbac.EliotTiceUserDetailsService

// Place your Spring DSL code here
beans = {

  userDetailsService(EliotTiceUserDetailsService) {
      utilisateurService = ref("utilisateurService")
      roleUtilisateurService = ref("roleUtilisateurService")
    }

}
