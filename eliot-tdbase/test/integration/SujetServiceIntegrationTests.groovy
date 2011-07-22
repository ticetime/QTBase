import org.lilie.services.eliot.tice.annuaire.UtilisateurService
import org.lilie.services.eliot.tice.annuaire.data.Utilisateur
import org.lilie.services.eliot.tice.annuaire.Personne
import org.lilie.services.eliot.tdbase.Sujet
import org.lilie.services.eliot.tdbase.SujetService
import org.lilie.services.eliot.tice.CopyrightsType
/*
 * Copyright © FYLAB and the Conseil Régional d'Île-de-France, 2009
 * This file is part of L'Interface Libre et Interactive de l'Enseignement (Lilie).
 *
 * Lilie is free software. You can redistribute it and/or modify since
 * you respect the terms of either (at least one of the both license) :
 * - under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 * - the CeCILL-C as published by CeCILL-C; either version 1 of the
 * License, or any later version
 *
 * There are special exceptions to the terms and conditions of the
 * licenses as they are applied to this software. View the full text of
 * the exception in file LICENSE.txt in the directory of this software
 * distribution.
 *
 * Lilie is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * Licenses for more details.
 *
 * You should have received a copy of the GNU General Public License
 * and the CeCILL-C along with Lilie. If not, see :
 *  <http://www.gnu.org/licenses/> and
 *  <http://www.cecill.info/licences.fr.html>.
 */

/**
 * 
 * @author franck Silvestre
 */
class SujetServiceIntegrationTests extends GroovyTestCase {

  private static final String UTILISATEUR_1_LOGIN = "mary.dupond"
  private static final String UTILISATEUR_1_PASSWORD = "password"
  private static final String UTILISATEUR_1_NOM = "dupond"
  private static final String UTILISATEUR_1_PRENOM = "mary"
  private static final String SUJET_1_TITRE = "Sujet test 1"

  Utilisateur utilisateur

  UtilisateurService defaultUtilisateurService
  SujetService sujetService

  protected void setUp() {
    super.setUp()
    utilisateur = defaultUtilisateurService.createUtilisateur(
            UTILISATEUR_1_LOGIN,
            UTILISATEUR_1_PASSWORD,
            UTILISATEUR_1_NOM,
            UTILISATEUR_1_PRENOM
    )
  }

  protected void tearDown() {
    super.tearDown()
  }

  void testCreateSujet() {
    Personne personne = Personne.get(utilisateur.personneId)
    Sujet sujet = sujetService.createSujet(personne,SUJET_1_TITRE)
    assertNotNull(sujet)
    assertFalse(sujet.hasErrors())
    assertEquals(personne, sujet.proprietaire)
    assertFalse(sujet.accesPublic)
    assertFalse(sujet.accesSequentiel)
    assertFalse(sujet.ordreQuestionsAleatoire)
    assertEquals(CopyrightsType.default, sujet.copyrightsType)
  }

}