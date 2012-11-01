import org.lilie.services.eliot.tice.securite.rbac.EliotTiceUserDetailsService
import org.lilie.services.eliot.tice.utils.EliotEditeurRegistrar
import org.lilie.services.eliot.tdbase.xml.transformation.MoodleQuizTransformationHelper
import org.lilie.services.eliot.tdbase.xml.transformation.MoodleQuizTransformer

// Place your Spring DSL code here
beans = {

  // todo place this in the configuration plugin file of qtbase plugin

  userDetailsService(EliotTiceUserDetailsService) {
      utilisateurService = ref("utilisateurService")
      roleUtilisateurService = ref("roleUtilisateurService")
    }

  //bean orientés gestion des formulaires
   customPropertyEditorRegistrar(EliotEditeurRegistrar)

  // bean pour l'import moodle xml
    xmlTransformationHelper(MoodleQuizTransformationHelper) {
      dataStore = ref("dataStore")
    }

    moodleQuizTransformer(MoodleQuizTransformer) {
      xmlTransformationHelper = ref("xmlTransformationHelper")
    }


}
