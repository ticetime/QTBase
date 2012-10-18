import org.lilie.services.eliot.tice.securite.rbac.EliotTiceUserDetailsService
import org.lilie.services.eliot.tice.utils.EliotEditeurRegistrar

// Place your Spring DSL code here
beans = {

  // todo place this in the configuration plugin file of qtbase plugin

  userDetailsService(EliotTiceUserDetailsService) {
      utilisateurService = ref("utilisateurService")
      roleUtilisateurService = ref("roleUtilisateurService")
    }

  //bean orientés gestion des formulaires
   customPropertyEditorRegistrar(EliotEditeurRegistrar)


}
