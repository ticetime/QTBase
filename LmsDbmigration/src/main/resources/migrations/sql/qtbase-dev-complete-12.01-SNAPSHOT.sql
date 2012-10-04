--
-- PostgreSQL database dump
--

-- REMOVE all lines refrencing liquibase tables (databasec*) for liquibase to work

SET statement_timeout = 0;
-- CF workaround
-- SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: ent; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA ent;


--
-- Name: td; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA td;


--
-- Name: tice; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA tice;


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--
-- CF workaround
--CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--
-- CF workaround
--COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = ent, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: annee_scolaire; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE annee_scolaire (
    code character varying(30) NOT NULL,
    version integer NOT NULL,
    annee_en_cours boolean,
    id bigint NOT NULL
);


--
-- Name: annee_scolaire_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE annee_scolaire_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: annee_scolaire_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('annee_scolaire_id_seq', 1, true);


--
-- Name: appartenance_groupe_groupe; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE appartenance_groupe_groupe (
    id bigint NOT NULL,
    groupe_personnes_parent_id bigint NOT NULL,
    groupe_personnes_enfant_id bigint NOT NULL
);


--
-- Name: appartenance_groupe_groupe_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE appartenance_groupe_groupe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: appartenance_groupe_groupe_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('appartenance_groupe_groupe_id_seq', 1, false);


--
-- Name: appartenance_personne_groupe; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE appartenance_personne_groupe (
    id bigint NOT NULL,
    personne_id bigint NOT NULL,
    groupe_personnes_id bigint NOT NULL
);


--
-- Name: appartenance_personne_groupe_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE appartenance_personne_groupe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: appartenance_personne_groupe_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('appartenance_personne_groupe_id_seq', 1, false);


--
-- Name: calendier_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE calendier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: calendier_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('calendier_id_seq', 1, false);


--
-- Name: calendrier; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE calendrier (
    id bigint NOT NULL,
    jour_semaine_ferie smallint NOT NULL,
    version integer NOT NULL,
    annee_scolaire_id bigint NOT NULL,
    premier_jour date NOT NULL,
    dernier_jour date NOT NULL,
    etablissement_id bigint NOT NULL
);


--
-- Name: civilite; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE civilite (
    id bigint NOT NULL,
    libelle character varying(5) NOT NULL
);


--
-- Name: civilite_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE civilite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: civilite_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('civilite_id_seq', 1, false);


--
-- Name: enseignement; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE enseignement (
    enseignant_id bigint NOT NULL,
    version integer NOT NULL,
    service_id integer NOT NULL,
    nb_heures double precision,
    version_import_sts integer DEFAULT (-1),
    actif boolean DEFAULT true,
    id bigint NOT NULL,
    origine character varying(10) DEFAULT 'AUTO'::character varying NOT NULL
);


--
-- Name: enseignement_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE enseignement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: enseignement_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('enseignement_id_seq', 1, false);


--
-- Name: etablissement; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE etablissement (
    id bigint NOT NULL,
    id_externe character varying(128) NOT NULL,
    nom_affichage character varying(1024),
    version integer NOT NULL,
    uai character varying(10),
    version_import_sts integer DEFAULT 0,
    date_import_sts timestamp without time zone,
    code_porteur_ent character varying(10) DEFAULT 'CRIF'::character varying NOT NULL,
    porteur_ent_id bigint,
    etablissement_rattachement_id bigint,
    type_etablissement character varying(128),
    ministere_tutelle character varying(128),
    academie character varying(128),
    "precision" numeric DEFAULT 0.01 NOT NULL
);


--
-- Name: etablissement_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE etablissement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: etablissement_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('etablissement_id_seq', 1, false);


--
-- Name: fiche_eleve_commentaire; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE fiche_eleve_commentaire (
    id bigint NOT NULL,
    personne_id bigint NOT NULL,
    commentaire text
);


--
-- Name: fiche_eleve_commentaire_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE fiche_eleve_commentaire_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fiche_eleve_commentaire_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('fiche_eleve_commentaire_id_seq', 1, false);


--
-- Name: filiere; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE filiere (
    id bigint NOT NULL,
    id_externe character varying(30),
    libelle character varying(50),
    version integer DEFAULT 0 NOT NULL
);


--
-- Name: filiere_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE filiere_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: filiere_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('filiere_id_seq', 1, false);


--
-- Name: fonction; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE fonction (
    id bigint NOT NULL,
    code character varying(32) NOT NULL,
    libelle character varying(255)
);


--
-- Name: fonction_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE fonction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fonction_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('fonction_id_seq', 19, true);


--
-- Name: groupe_personnes; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE groupe_personnes (
    id bigint NOT NULL,
    nom character varying(512) NOT NULL,
    virtuel boolean DEFAULT false,
    item_id bigint NOT NULL,
    propriete_scolarite_id bigint
);


--
-- Name: groupe_personnes_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE groupe_personnes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: groupe_personnes_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('groupe_personnes_id_seq', 1, false);


--
-- Name: inscription_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE inscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: inscription_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('inscription_id_seq', 1, false);


--
-- Name: matiere; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE matiere (
    version integer NOT NULL,
    id bigint NOT NULL,
    libelle_long character varying(255) NOT NULL,
    code_sts character varying(128),
    libelle_court character varying(255) NOT NULL,
    code_gestion character varying(255) NOT NULL,
    libelle_edition character varying(255) NOT NULL,
    etablissement_id bigint NOT NULL,
    origine character varying(10),
    specialite boolean DEFAULT false NOT NULL,
    annee_scolaire_id bigint NOT NULL
);


--
-- Name: matiere_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE matiere_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: matiere_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('matiere_id_seq', 1, false);


--
-- Name: mef; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE mef (
    id bigint NOT NULL,
    code character varying(32) NOT NULL,
    formation character varying(255),
    specialite character varying(255),
    libelle_long character varying(255),
    libelle_edition character varying(255),
    mefstat11 character(11),
    mefstat4 character(4)
);


--
-- Name: mef_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE mef_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mef_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('mef_id_seq', 1, false);


--
-- Name: modalite_cours; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE modalite_cours (
    code_sts character varying(30) NOT NULL,
    version integer NOT NULL,
    libelle_court character varying(255),
    libelle_long character varying(1024),
    co_ens boolean,
    id bigint NOT NULL,
    no_ordre integer
);


--
-- Name: modalite_cours_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE modalite_cours_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: modalite_cours_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('modalite_cours_id_seq', 1, false);


--
-- Name: modalite_matiere; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE modalite_matiere (
    id bigint NOT NULL,
    libelle character varying(1024) NOT NULL,
    code character varying(6) NOT NULL,
    etablissement_id bigint NOT NULL,
    version integer NOT NULL,
    annee_scolaire_id bigint NOT NULL
);


--
-- Name: modalite_matiere_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE modalite_matiere_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: modalite_matiere_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('modalite_matiere_id_seq', 1, false);


--
-- Name: niveau; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE niveau (
    id bigint NOT NULL,
    libelle_court character varying(128),
    libelle_long character varying(255),
    libelle_edition character varying(255)
);


--
-- Name: niveau_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE niveau_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: niveau_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('niveau_id_seq', 1, true);


--
-- Name: periode; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE periode (
    id bigint NOT NULL,
    type_periode_id integer NOT NULL,
    date_debut date,
    date_fin date,
    date_fin_saisie date,
    date_publication_bulletins date,
    structure_enseignement_id bigint NOT NULL,
    date_publication_releves date
);


--
-- Name: periode_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE periode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: periode_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('periode_id_seq', 6, true);


--
-- Name: personne; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE personne (
    id bigint NOT NULL,
    nom character varying(40) NOT NULL,
    prenom character varying(40) NOT NULL,
    civilite_id integer,
    telephone_pro character varying(17),
    telephone_perso character varying(17),
    telephone_portable character varying(17),
    fax character varying(17),
    adresse character varying(150),
    code_postal character varying(10),
    ville character varying(50),
    pays character varying(30),
    date_naissance date,
    sexe character(1),
    photo character varying(50),
    etablissement_rattachement_id bigint,
    email character varying(256),
    nom_normalise character varying(40),
    prenom_normalise character varying(40),
    regime_id bigint,
    login character varying(128),
    numero_bureau character varying(16),
    id_sconet character varying(50)
);


--
-- Name: personne_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE personne_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: personne_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('personne_id_seq', 1, false);


--
-- Name: personne_propriete_scolarite; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE personne_propriete_scolarite (
    id bigint NOT NULL,
    personne_id bigint NOT NULL,
    propriete_scolarite_id bigint NOT NULL,
    est_active boolean DEFAULT false NOT NULL,
    aaf_import_id bigint,
    date_desactivation timestamp without time zone,
    date_debut timestamp without time zone,
    date_fin timestamp without time zone,
    compteur_references integer,
    udt_import_id bigint,
    actif_avant_suppression boolean,
    origine character varying(10) DEFAULT 'AUTO'::character varying NOT NULL
);


--
-- Name: personne_propriete_scolarite_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE personne_propriete_scolarite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: personne_propriete_scolarite_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('personne_propriete_scolarite_id_seq', 1, false);


--
-- Name: porteur_ent; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE porteur_ent (
    id bigint NOT NULL,
    code character varying(32) NOT NULL,
    nom character varying(256),
    nom_court character varying(128),
    email_projet character varying(256),
    url_retour_logout character varying(1024),
    url_acces_ent character varying(1024)
);


--
-- Name: porteur_ent_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE porteur_ent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: porteur_ent_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('porteur_ent_id_seq', 1, false);


--
-- Name: preference_etablissement; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE preference_etablissement (
    id bigint NOT NULL,
    etablissement_id bigint NOT NULL,
    nb_annees_conservation_archives_bulletins integer DEFAULT 5,
    nb_annees_conservation_archives_cdt integer DEFAULT 3,
    version integer DEFAULT 0 NOT NULL,
    nom_etablissement character varying(60),
    adresse_1_etablissement character varying(60),
    adresse_2_etablissement character varying(60),
    code_postal_etablissement character varying(10),
    ville_etablissement character varying(60),
    logo_etablissement bytea,
    cachet_etablissement bytea,
    lvs_active boolean DEFAULT false,
    lvs_url character varying(255),
    annee_scolaire_id bigint NOT NULL,
    magister_url character varying(255),
    magister_active boolean NOT NULL
);


--
-- Name: preference_etablissement_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE preference_etablissement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: preference_etablissement_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('preference_etablissement_id_seq', 1, false);


--
-- Name: preference_utilisateur_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE preference_utilisateur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: preference_utilisateur_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('preference_utilisateur_id_seq', 1, false);


--
-- Name: propriete_scolarite; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE propriete_scolarite (
    id bigint NOT NULL,
    etablissement_id bigint,
    structure_enseignement_id bigint,
    annee_scolaire_id bigint,
    niveau_id bigint,
    matiere_id bigint,
    mef_id bigint,
    fonction_id bigint,
    responsable_structure_enseignement boolean DEFAULT false,
    porteur_ent_id bigint
);


--
-- Name: propriete_scolarite_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE propriete_scolarite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: propriete_scolarite_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('propriete_scolarite_id_seq', 1, false);


--
-- Name: regime; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE regime (
    id bigint NOT NULL,
    code character varying(32) NOT NULL
);


--
-- Name: regime_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE regime_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: regime_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('regime_id_seq', 3, true);


--
-- Name: rel_classe_filiere; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE rel_classe_filiere (
    classe_id bigint NOT NULL,
    filiere_id bigint NOT NULL
);


--
-- Name: rel_classe_groupe; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE rel_classe_groupe (
    classe_id bigint NOT NULL,
    groupe_id bigint NOT NULL
);


--
-- Name: rel_periode_service; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE rel_periode_service (
    id bigint NOT NULL,
    service_id bigint NOT NULL,
    periode_id bigint NOT NULL,
    coeff numeric,
    version integer NOT NULL,
    option boolean DEFAULT false NOT NULL,
    ordre integer,
    evaluable boolean DEFAULT false NOT NULL
);


--
-- Name: rel_periode_service_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE rel_periode_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rel_periode_service_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('rel_periode_service_id_seq', 1, false);


--
-- Name: responsable_eleve; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE responsable_eleve (
    id bigint NOT NULL,
    responsable_legal integer,
    parent boolean DEFAULT true,
    personne_id bigint NOT NULL,
    eleve_id bigint NOT NULL,
    est_active boolean DEFAULT true,
    import_id bigint,
    date_desactivation timestamp without time zone,
    est_validee boolean DEFAULT false,
    actif_avant_suppression boolean
);


--
-- Name: responsable_eleve_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE responsable_eleve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: responsable_eleve_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('responsable_eleve_id_seq', 1, false);


--
-- Name: responsable_propriete_scolarite; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE responsable_propriete_scolarite (
    id bigint NOT NULL,
    responsable_eleve_id bigint NOT NULL,
    propriete_scolarite_id bigint NOT NULL,
    est_active boolean DEFAULT true,
    import_id bigint,
    date_desactivation timestamp without time zone,
    actif_avant_suppression boolean
);


--
-- Name: responsable_propriete_scolarite_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE responsable_propriete_scolarite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: responsable_propriete_scolarite_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('responsable_propriete_scolarite_id_seq', 1, false);


--
-- Name: service; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE service (
    id integer NOT NULL,
    version integer NOT NULL,
    nb_heures double precision,
    co_ens boolean,
    modalite_cours_id bigint,
    matiere_id bigint NOT NULL,
    structure_enseignement_id bigint,
    version_import_sts integer DEFAULT (-1),
    actif boolean DEFAULT true,
    origine character varying(10) DEFAULT 'AUTO'::character varying NOT NULL,
    service_principal boolean DEFAULT false NOT NULL
);


--
-- Name: services_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: ent; Owner: -
--

ALTER SEQUENCE services_id_seq OWNED BY service.id;


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('services_id_seq', 1, false);


--
-- Name: signature; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE signature (
    id bigint NOT NULL,
    proprietaire_id bigint NOT NULL,
    version integer NOT NULL,
    titre character varying(150),
    image_signature bytea
);


--
-- Name: signature_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE signature_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: signature_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('signature_id_seq', 1, false);


--
-- Name: source_import; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE source_import (
    id bigint NOT NULL,
    code character varying(30) NOT NULL,
    libelle character varying(30) NOT NULL
);


--
-- Name: sous_service; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE sous_service (
    id bigint NOT NULL,
    coeff numeric NOT NULL,
    service_id bigint NOT NULL,
    modalite_matiere_id bigint NOT NULL,
    version integer NOT NULL,
    ordre integer,
    evaluable boolean DEFAULT false NOT NULL,
    type_periode_id bigint NOT NULL
);


--
-- Name: sous_service_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE sous_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sous_service_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('sous_service_id_seq', 1, false);


--
-- Name: structure_enseignement; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE structure_enseignement (
    id bigint NOT NULL,
    id_externe character varying(128) NOT NULL,
    type character varying(128) NOT NULL,
    version integer NOT NULL,
    etablissement_id bigint NOT NULL,
    annee_scolaire_id bigint NOT NULL,
    type_intervalle character varying(30),
    code character varying(50) NOT NULL,
    version_import_sts integer DEFAULT (-1) NOT NULL,
    actif boolean DEFAULT true,
    niveau_id bigint,
    brevet_serie_id bigint,
    date_publication_brevet timestamp with time zone,
    CONSTRAINT chk_structure_enseignement_validite_niveau CHECK ((((niveau_id IS NULL) AND ((type)::text = 'GROUPE'::text)) OR ((niveau_id IS NOT NULL) AND ((type)::text = 'CLASSE'::text))))
);


--
-- Name: structure_enseignement_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE structure_enseignement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: structure_enseignement_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('structure_enseignement_id_seq', 1, false);


--
-- Name: type_periode; Type: TABLE; Schema: ent; Owner: -; Tablespace: 
--

CREATE TABLE type_periode (
    id integer NOT NULL,
    libelle character varying(50),
    version integer NOT NULL,
    intervalle character varying(5),
    nature character varying(20) NOT NULL,
    etablissement_id bigint
);


--
-- Name: type_periode_id_seq; Type: SEQUENCE; Schema: ent; Owner: -
--

CREATE SEQUENCE type_periode_id_seq
    START WITH 1
    INCREMENT BY 7
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: type_periode_id_seq; Type: SEQUENCE SET; Schema: ent; Owner: -
--

SELECT pg_catalog.setval('type_periode_id_seq', 5, true);


SET search_path = public, pg_catalog;




--
-- Name: eliot_version_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE eliot_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eliot_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('eliot_version_id_seq', 14, true);


SET search_path = td, pg_catalog;

--
-- Name: copie; Type: TABLE; Schema: td; Owner: -; Tablespace: 
--

CREATE TABLE copie (
    id bigint NOT NULL,
    date_remise timestamp with time zone,
    sujet_id bigint NOT NULL,
    eleve_id bigint,
    correcteur_id bigint,
    correction_date timestamp with time zone,
    correction_annotation text,
    correction_note_automatique double precision,
    correction_note_finale double precision,
    modalite_activite_id bigint,
    correction_note_correcteur double precision,
    correction_note_non_numerique character varying(255),
    max_points double precision,
    max_points_automatique double precision,
    max_points_correcteur double precision,
    points_modulation double precision DEFAULT (0)::double precision,
    est_jetable boolean DEFAULT false NOT NULL,
    date_enregistrement timestamp with time zone
);


--
-- Name: copie_id_seq; Type: SEQUENCE; Schema: td; Owner: -
--

CREATE SEQUENCE copie_id_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: copie_id_seq; Type: SEQUENCE SET; Schema: td; Owner: -
--

SELECT pg_catalog.setval('copie_id_seq', 100, false);


--
-- Name: modalite_activite; Type: TABLE; Schema: td; Owner: -; Tablespace: 
--

CREATE TABLE modalite_activite (
    id bigint NOT NULL,
    date_remise_reponses timestamp with time zone NOT NULL,
    date_debut timestamp with time zone NOT NULL,
    date_fin timestamp with time zone NOT NULL,
    etablissement_id bigint,
    responsable_id bigint,
    groupe_id bigint,
    enseignant_id bigint NOT NULL,
    activite_id bigint,
    evaluation_id bigint,
    sujet_id bigint NOT NULL,
    copie_ameliorable boolean DEFAULT true NOT NULL,
    structure_enseignement_id bigint,
    matiere_id bigint
);


--
-- Name: modalite_activite_id_seq; Type: SEQUENCE; Schema: td; Owner: -
--

CREATE SEQUENCE modalite_activite_id_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: modalite_activite_id_seq; Type: SEQUENCE SET; Schema: td; Owner: -
--

SELECT pg_catalog.setval('modalite_activite_id_seq', 100, false);


--
-- Name: question; Type: TABLE; Schema: td; Owner: -; Tablespace: 
--

CREATE TABLE question (
    id bigint NOT NULL,
    titre text NOT NULL,
    est_autonome boolean DEFAULT true NOT NULL,
    specification text NOT NULL,
    version_question integer DEFAULT 1 NOT NULL,
    type_id bigint NOT NULL,
    proprietaire_id bigint NOT NULL,
    matiere_id bigint,
    etablissement_id bigint,
    niveau_id bigint,
    publication_id bigint,
    titre_normalise text,
    publie boolean DEFAULT false NOT NULL,
    date_created timestamp with time zone,
    last_updated timestamp with time zone,
    copyrights_type_id bigint NOT NULL,
    specification_normalise text,
    paternite text,
    exercice_id bigint,
    attachement_id bigint,
    principal_attachement_est_insere_dans_la_question boolean
);


--
-- Name: question_attachement; Type: TABLE; Schema: td; Owner: -; Tablespace: 
--

CREATE TABLE question_attachement (
    id bigint NOT NULL,
    question_id bigint NOT NULL,
    attachement_id bigint NOT NULL,
    rang integer DEFAULT 1,
    est_insere_dans_la_question boolean DEFAULT true NOT NULL
);


--
-- Name: question_attachement_id_seq; Type: SEQUENCE; Schema: td; Owner: -
--

CREATE SEQUENCE question_attachement_id_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: question_attachement_id_seq; Type: SEQUENCE SET; Schema: td; Owner: -
--

SELECT pg_catalog.setval('question_attachement_id_seq', 100, false);


--
-- Name: question_export; Type: TABLE; Schema: td; Owner: -; Tablespace: 
--

CREATE TABLE question_export (
    id bigint NOT NULL,
    format_id bigint NOT NULL,
    export text NOT NULL,
    question_id bigint NOT NULL
);


--
-- Name: question_export_id_seq; Type: SEQUENCE; Schema: td; Owner: -
--

CREATE SEQUENCE question_export_id_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: question_export_id_seq; Type: SEQUENCE SET; Schema: td; Owner: -
--

SELECT pg_catalog.setval('question_export_id_seq', 100, false);


--
-- Name: question_id_seq; Type: SEQUENCE; Schema: td; Owner: -
--

CREATE SEQUENCE question_id_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: question_id_seq; Type: SEQUENCE SET; Schema: td; Owner: -
--

SELECT pg_catalog.setval('question_id_seq', 100, false);


--
-- Name: question_type; Type: TABLE; Schema: td; Owner: -; Tablespace: 
--

CREATE TABLE question_type (
    id bigint NOT NULL,
    nom character varying(255) NOT NULL,
    nom_anglais character varying(255),
    code character varying(255) DEFAULT 'Undefined'::character varying NOT NULL,
    interaction boolean DEFAULT true NOT NULL
);


--
-- Name: question_type_id_seq; Type: SEQUENCE; Schema: td; Owner: -
--

CREATE SEQUENCE question_type_id_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: question_type_id_seq; Type: SEQUENCE SET; Schema: td; Owner: -
--

SELECT pg_catalog.setval('question_type_id_seq', 100, false);


--
-- Name: reponse; Type: TABLE; Schema: td; Owner: -; Tablespace: 
--

CREATE TABLE reponse (
    id bigint NOT NULL,
    specification text,
    copie_id bigint NOT NULL,
    correcteur_id bigint,
    correction_date timestamp with time zone,
    correction_annotation text,
    correction_note_automatique double precision,
    correction_note_finale double precision,
    correction_note_correcteur double precision,
    correction_note_non_numerique character varying(255),
    eleve_id bigint,
    sujet_question_id bigint NOT NULL,
    rang integer
);


--
-- Name: reponse_attachement; Type: TABLE; Schema: td; Owner: -; Tablespace: 
--

CREATE TABLE reponse_attachement (
    id bigint NOT NULL,
    reponse_id bigint NOT NULL,
    attachement_id bigint NOT NULL,
    rang integer DEFAULT 1
);


--
-- Name: reponse_attachement_id_seq; Type: SEQUENCE; Schema: td; Owner: -
--

CREATE SEQUENCE reponse_attachement_id_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reponse_attachement_id_seq; Type: SEQUENCE SET; Schema: td; Owner: -
--

SELECT pg_catalog.setval('reponse_attachement_id_seq', 100, false);


--
-- Name: reponse_id_seq; Type: SEQUENCE; Schema: td; Owner: -
--

CREATE SEQUENCE reponse_id_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reponse_id_seq; Type: SEQUENCE SET; Schema: td; Owner: -
--

SELECT pg_catalog.setval('reponse_id_seq', 100, false);


--
-- Name: sujet; Type: TABLE; Schema: td; Owner: -; Tablespace: 
--

CREATE TABLE sujet (
    id bigint NOT NULL,
    titre text NOT NULL,
    version_sujet integer DEFAULT 1 NOT NULL,
    proprietaire_id bigint NOT NULL,
    matiere_id bigint,
    etablissement_id bigint,
    niveau_id bigint,
    duree_minutes integer,
    presentation text,
    note_max double precision,
    note_auto_max double precision,
    note_enseignant_max double precision,
    nb_questions integer,
    publication_id bigint,
    annotation_privee text,
    copyrights_type_id bigint NOT NULL,
    acces_public boolean NOT NULL,
    acces_sequentiel boolean NOT NULL,
    ordre_questions_aleatoire boolean NOT NULL,
    titre_normalise text,
    presentation_normalise text,
    publie boolean DEFAULT false NOT NULL,
    date_created timestamp with time zone,
    last_updated timestamp with time zone,
    sujet_type_id bigint,
    paternite text
);


--
-- Name: sujet_id_seq; Type: SEQUENCE; Schema: td; Owner: -
--

CREATE SEQUENCE sujet_id_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sujet_id_seq; Type: SEQUENCE SET; Schema: td; Owner: -
--

SELECT pg_catalog.setval('sujet_id_seq', 100, false);


--
-- Name: sujet_sequence_questions; Type: TABLE; Schema: td; Owner: -; Tablespace: 
--

CREATE TABLE sujet_sequence_questions (
    id bigint NOT NULL,
    sujet_id bigint NOT NULL,
    question_id bigint NOT NULL,
    questions_sequences_idx integer NOT NULL,
    note_seuil_poursuite double precision,
    points double precision DEFAULT (1)::double precision NOT NULL
);


--
-- Name: sujet_sequence_questions_id_seq; Type: SEQUENCE; Schema: td; Owner: -
--

CREATE SEQUENCE sujet_sequence_questions_id_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sujet_sequence_questions_id_seq; Type: SEQUENCE SET; Schema: td; Owner: -
--

SELECT pg_catalog.setval('sujet_sequence_questions_id_seq', 100, false);


--
-- Name: sujet_type; Type: TABLE; Schema: td; Owner: -; Tablespace: 
--

CREATE TABLE sujet_type (
    id bigint NOT NULL,
    nom character varying(255) NOT NULL,
    nom_anglais character varying(255) NOT NULL
);


--
-- Name: sujet_type_id_seq; Type: SEQUENCE; Schema: td; Owner: -
--

CREATE SEQUENCE sujet_type_id_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sujet_type_id_seq; Type: SEQUENCE SET; Schema: td; Owner: -
--

SELECT pg_catalog.setval('sujet_type_id_seq', 100, false);


SET search_path = tice, pg_catalog;

--
-- Name: attachement; Type: TABLE; Schema: tice; Owner: -; Tablespace: 
--

CREATE TABLE attachement (
    id bigint NOT NULL,
    chemin text NOT NULL,
    nom character varying(255) NOT NULL,
    taille bigint,
    type_mime character varying(255),
    nom_fichier_original character varying(255),
    a_supprimer boolean DEFAULT false,
    dimension_hauteur bigint,
    dimension_largeur bigint
);


--
-- Name: attachement_id_seq; Type: SEQUENCE; Schema: tice; Owner: -
--

CREATE SEQUENCE attachement_id_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attachement_id_seq; Type: SEQUENCE SET; Schema: tice; Owner: -
--

SELECT pg_catalog.setval('attachement_id_seq', 100, false);


--
-- Name: compte_utilisateur; Type: TABLE; Schema: tice; Owner: -; Tablespace: 
--

CREATE TABLE compte_utilisateur (
    id bigint NOT NULL,
    personne_id bigint NOT NULL,
    version bigint NOT NULL,
    login character varying(255) NOT NULL,
    login_alias character varying(255),
    password character varying(255) NOT NULL,
    compte_expire boolean NOT NULL,
    compte_verrouille boolean NOT NULL,
    compte_active boolean NOT NULL,
    password_expire boolean NOT NULL,
    date_derniere_connexion timestamp with time zone
);


--
-- Name: compte_utilisateur_id_seq; Type: SEQUENCE; Schema: tice; Owner: -
--

CREATE SEQUENCE compte_utilisateur_id_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: compte_utilisateur_id_seq; Type: SEQUENCE SET; Schema: tice; Owner: -
--

SELECT pg_catalog.setval('compte_utilisateur_id_seq', 100, false);


--
-- Name: copyrights_type; Type: TABLE; Schema: tice; Owner: -; Tablespace: 
--

CREATE TABLE copyrights_type (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    presentation text,
    lien text,
    logo text,
    option_cc_paternite boolean DEFAULT true,
    option_cc_pas_utilisation_commerciale boolean DEFAULT true,
    option_cc_pas_modification boolean DEFAULT true,
    option_cc_partage_viral boolean DEFAULT true,
    option_tous_droits_reserves boolean DEFAULT true
);


--
-- Name: copyrights_type_id_seq; Type: SEQUENCE; Schema: tice; Owner: -
--

CREATE SEQUENCE copyrights_type_id_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: copyrights_type_id_seq; Type: SEQUENCE SET; Schema: tice; Owner: -
--

SELECT pg_catalog.setval('copyrights_type_id_seq', 100, false);


--
-- Name: db_data_record; Type: TABLE; Schema: tice; Owner: -; Tablespace: 
--

CREATE TABLE db_data_record (
    id bigint NOT NULL,
    identifier character varying(128) NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    file_content bytea NOT NULL
);


--
-- Name: db_data_record_id_seq; Type: SEQUENCE; Schema: tice; Owner: -
--

CREATE SEQUENCE db_data_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: db_data_record_id_seq; Type: SEQUENCE SET; Schema: tice; Owner: -
--

SELECT pg_catalog.setval('db_data_record_id_seq', 1, false);


--
-- Name: export_format; Type: TABLE; Schema: tice; Owner: -; Tablespace: 
--

CREATE TABLE export_format (
    id bigint NOT NULL,
    nom character varying(255) NOT NULL,
    code character varying(255) NOT NULL
);


--
-- Name: export_format_id_seq; Type: SEQUENCE; Schema: tice; Owner: -
--

CREATE SEQUENCE export_format_id_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: export_format_id_seq; Type: SEQUENCE SET; Schema: tice; Owner: -
--

SELECT pg_catalog.setval('export_format_id_seq', 100, false);


--
-- Name: publication; Type: TABLE; Schema: tice; Owner: -; Tablespace: 
--

CREATE TABLE publication (
    id bigint NOT NULL,
    copyrights_type_id bigint NOT NULL,
    date_debut timestamp with time zone NOT NULL,
    date_fin timestamp with time zone
);


--
-- Name: publication_id_seq; Type: SEQUENCE; Schema: tice; Owner: -
--

CREATE SEQUENCE publication_id_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: publication_id_seq; Type: SEQUENCE SET; Schema: tice; Owner: -
--

SELECT pg_catalog.setval('publication_id_seq', 100, false);


SET search_path = ent, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: ent; Owner: -
--

ALTER TABLE ONLY service ALTER COLUMN id SET DEFAULT nextval('services_id_seq'::regclass);


--
-- Data for Name: annee_scolaire; Type: TABLE DATA; Schema: ent; Owner: -
--

INSERT INTO annee_scolaire (code, version, annee_en_cours, id) VALUES ('2011-2012', 0, true, 1);


--
-- Data for Name: appartenance_groupe_groupe; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: appartenance_personne_groupe; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: calendrier; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: civilite; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: enseignement; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: etablissement; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: fiche_eleve_commentaire; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: filiere; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: fonction; Type: TABLE DATA; Schema: ent; Owner: -
--

INSERT INTO fonction (id, code, libelle) VALUES (1, 'AC', 'ADMINISTRATEUR_CENTRAL');
INSERT INTO fonction (id, code, libelle) VALUES (2, 'AL', 'ADMINISTRATEUR_LOCAL');
INSERT INTO fonction (id, code, libelle) VALUES (3, 'CD', 'CORRESPONDANT_DEPLOIEMENT');
INSERT INTO fonction (id, code, libelle) VALUES (4, 'UI', 'INVITE');
INSERT INTO fonction (id, code, libelle) VALUES (5, 'ELEVE', 'ELEVE');
INSERT INTO fonction (id, code, libelle) VALUES (6, 'PERS_REL_ELEVE', 'PERSONNES EN RELATION ELEVE');
INSERT INTO fonction (id, code, libelle) VALUES (7, 'ENS', 'ENSEIGNEMENT');
INSERT INTO fonction (id, code, libelle) VALUES (8, 'DIR', 'DIRECTION');
INSERT INTO fonction (id, code, libelle) VALUES (9, 'EDU', 'EDUCATION');
INSERT INTO fonction (id, code, libelle) VALUES (10, 'DOC', 'DOCUMENTATION');
INSERT INTO fonction (id, code, libelle) VALUES (11, 'CFC', 'CONSEILLER EN
      FORMATION CONTINUE');
INSERT INTO fonction (id, code, libelle) VALUES (12, 'CTR', 'CHEF DE
      TRAVAUX');
INSERT INTO fonction (id, code, libelle) VALUES (13, 'ADF', 'PERSONNELS
      ADMINISTRATIFS');
INSERT INTO fonction (id, code, libelle) VALUES (14, 'ALB', 'LABORATOIRE');
INSERT INTO fonction (id, code, libelle) VALUES (15, 'ASE', 'ASSISTANT
      ETRANGER');
INSERT INTO fonction (id, code, libelle) VALUES (16, 'LAB', 'PERSONNELS DE
      LABORATOIRE');
INSERT INTO fonction (id, code, libelle) VALUES (17, 'MDS', 'PERSONNELS
      MEDICO-SOCIAUX');
INSERT INTO fonction (id, code, libelle) VALUES (18, 'OUV', 'PERSONNELS
      OUVRIERS ET DE SERVICES');
INSERT INTO fonction (id, code, libelle) VALUES (19, 'SUR', 'SURVEILLANCE');


--
-- Data for Name: groupe_personnes; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: matiere; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: mef; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: modalite_cours; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: modalite_matiere; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: niveau; Type: TABLE DATA; Schema: ent; Owner: -
--

INSERT INTO niveau (id, libelle_court, libelle_long, libelle_edition) VALUES (1, 'INDÉTERMINÉ', 'INDÉTERMINÉ', 'INDÉTERMINÉ');


--
-- Data for Name: periode; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: personne; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: personne_propriete_scolarite; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: porteur_ent; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: preference_etablissement; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: propriete_scolarite; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: regime; Type: TABLE DATA; Schema: ent; Owner: -
--

INSERT INTO regime (id, code) VALUES (1, 'EXTERNAT');
INSERT INTO regime (id, code) VALUES (2, 'DEMI-PENSION');
INSERT INTO regime (id, code) VALUES (3, 'INTERNAT');


--
-- Data for Name: rel_classe_filiere; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: rel_classe_groupe; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: rel_periode_service; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: responsable_eleve; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: responsable_propriete_scolarite; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: service; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: signature; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: source_import; Type: TABLE DATA; Schema: ent; Owner: -
--

INSERT INTO source_import (id, code, libelle) VALUES (1, 'STS', 'STSweb');
INSERT INTO source_import (id, code, libelle) VALUES (2, 'AAF', 'Annuaire Académique Fédérateur');
INSERT INTO source_import (id, code, libelle) VALUES (3, 'UDT', 'UnDeuxTEMPS');


--
-- Data for Name: sous_service; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: structure_enseignement; Type: TABLE DATA; Schema: ent; Owner: -
--



--
-- Data for Name: type_periode; Type: TABLE DATA; Schema: ent; Owner: -
--

INSERT INTO type_periode (id, libelle, version, intervalle, nature, etablissement_id) VALUES (1, NULL, 0, 'S1', 'NOTATION', NULL);
INSERT INTO type_periode (id, libelle, version, intervalle, nature, etablissement_id) VALUES (2, NULL, 0, 'S2', 'NOTATION', NULL);
INSERT INTO type_periode (id, libelle, version, intervalle, nature, etablissement_id) VALUES (3, NULL, 0, 'T1', 'NOTATION', NULL);
INSERT INTO type_periode (id, libelle, version, intervalle, nature, etablissement_id) VALUES (4, NULL, 0, 'T2', 'NOTATION', NULL);
INSERT INTO type_periode (id, libelle, version, intervalle, nature, etablissement_id) VALUES (5, NULL, 0, 'T3', 'NOTATION', NULL);
INSERT INTO type_periode (id, libelle, version, intervalle, nature, etablissement_id) VALUES (6, NULL, 0, 'ANNEE', 'NOTATION', NULL);


SET search_path = public, pg_catalog;



SET search_path = td, pg_catalog;

--
-- Data for Name: copie; Type: TABLE DATA; Schema: td; Owner: -
--



--
-- Data for Name: modalite_activite; Type: TABLE DATA; Schema: td; Owner: -
--



--
-- Data for Name: question; Type: TABLE DATA; Schema: td; Owner: -
--



--
-- Data for Name: question_attachement; Type: TABLE DATA; Schema: td; Owner: -
--



--
-- Data for Name: question_export; Type: TABLE DATA; Schema: td; Owner: -
--



--
-- Data for Name: question_type; Type: TABLE DATA; Schema: td; Owner: -
--

INSERT INTO question_type (id, nom, nom_anglais, code, interaction) VALUES (1, 'Choix multiple', 'Multiple Choice', 'MultipleChoice', true);
INSERT INTO question_type (id, nom, nom_anglais, code, interaction) VALUES (2, 'Ouverte', 'Open', 'Open', true);
INSERT INTO question_type (id, nom, nom_anglais, code, interaction) VALUES (3, 'Décimale', 'Decimal', 'Decimal', true);
INSERT INTO question_type (id, nom, nom_anglais, code, interaction) VALUES (4, 'Entière', 'Integer', 'Integer', true);
INSERT INTO question_type (id, nom, nom_anglais, code, interaction) VALUES (6, 'Texte à trous', 'Fill Gap', 'FillGap', true);
INSERT INTO question_type (id, nom, nom_anglais, code, interaction) VALUES (7, 'Evaluation booléenne', 'Boolean Match', 'BooleanMatch', true);
INSERT INTO question_type (id, nom, nom_anglais, code, interaction) VALUES (8, 'Choix exclusif', 'Exclusive Choice', 'ExclusiveChoice', true);
INSERT INTO question_type (id, nom, nom_anglais, code, interaction) VALUES (9, 'Graphique à compléter', 'Fill Graphics', 'FillGraphics', true);
INSERT INTO question_type (id, nom, nom_anglais, code, interaction) VALUES (11, 'Ordre à rétablir', 'Order', 'Order', true);
INSERT INTO question_type (id, nom, nom_anglais, code, interaction) VALUES (12, 'Association', 'Associate', 'Associate', true);
INSERT INTO question_type (id, nom, nom_anglais, code, interaction) VALUES (13, 'Curseur à déplacer', 'Slider', 'Slider', true);
INSERT INTO question_type (id, nom, nom_anglais, code, interaction) VALUES (15, 'Correspondance', 'Match', 'Match', true);
INSERT INTO question_type (id, nom, nom_anglais, code, interaction) VALUES (51, 'Document', 'Document', 'Document', false);
INSERT INTO question_type (id, nom, nom_anglais, code, interaction) VALUES (52, 'Énoncé', 'Statement', 'Statement', false);
INSERT INTO question_type (id, nom, nom_anglais, code, interaction) VALUES (5, 'Exercice', 'Composite', 'Composite', true);
INSERT INTO question_type (id, nom, nom_anglais, code, interaction) VALUES (10, 'Fichier à déposer', 'File Upload', 'FileUpload', true);
INSERT INTO question_type (id, nom, nom_anglais, code, interaction) VALUES (14, 'Association graphique', 'Graphic Match', 'GraphicMatch', true);


--
-- Data for Name: reponse; Type: TABLE DATA; Schema: td; Owner: -
--



--
-- Data for Name: reponse_attachement; Type: TABLE DATA; Schema: td; Owner: -
--



--
-- Data for Name: sujet; Type: TABLE DATA; Schema: td; Owner: -
--



--
-- Data for Name: sujet_sequence_questions; Type: TABLE DATA; Schema: td; Owner: -
--



--
-- Data for Name: sujet_type; Type: TABLE DATA; Schema: td; Owner: -
--

INSERT INTO sujet_type (id, nom, nom_anglais) VALUES (1, 'Sujet', 'Exercise set');
INSERT INTO sujet_type (id, nom, nom_anglais) VALUES (2, 'Exercice', 'Exercise');


SET search_path = tice, pg_catalog;

--
-- Data for Name: attachement; Type: TABLE DATA; Schema: tice; Owner: -
--



--
-- Data for Name: compte_utilisateur; Type: TABLE DATA; Schema: tice; Owner: -
--



--
-- Data for Name: copyrights_type; Type: TABLE DATA; Schema: tice; Owner: -
--

INSERT INTO copyrights_type (id, code, presentation, lien, logo, option_cc_paternite, option_cc_pas_utilisation_commerciale, option_cc_pas_modification, option_cc_partage_viral, option_tous_droits_reserves) VALUES (1, 'Tous droits réservés', 'Cette oeuvre est mise à disposition selon les termes du droit d''auteur émanant du code de la propriété intellectuelle.', 'http://www.legifrance.gouv.fr/affichCode.do?cidTexte=LEGITEXT000006069414', NULL, true, true, true, NULL, true);
INSERT INTO copyrights_type (id, code, presentation, lien, logo, option_cc_paternite, option_cc_pas_utilisation_commerciale, option_cc_pas_modification, option_cc_partage_viral, option_tous_droits_reserves) VALUES (2, '(CC) BY-NC-SA', 'Cette oeuvre est mise à disposition selon les termes de la Licence Creative Commons Paternité - Pas d''Utilisation Commerciale - Partage à l''Identique 2.0 France', 'http://creativecommons.org/licenses/by-nc-sa/2.0/fr/', 'CC-BY-NC-SA.png', true, true, false, true, false);
INSERT INTO copyrights_type (id, code, presentation, lien, logo, option_cc_paternite, option_cc_pas_utilisation_commerciale, option_cc_pas_modification, option_cc_partage_viral, option_tous_droits_reserves) VALUES (3, '(CC) BY-NC', 'Cette oeuvre est mise à disposition selon les termes de la Licence Creative Commons Paternité - Pas d''Utilisation Commerciale - France', 'http://creativecommons.org/licenses/by-nc/2.0/fr/', 'CC-BY-NC.png', true, true, false, false, false);


--
-- Data for Name: db_data_record; Type: TABLE DATA; Schema: tice; Owner: -
--



--
-- Data for Name: export_format; Type: TABLE DATA; Schema: tice; Owner: -
--

INSERT INTO export_format (id, nom, code) VALUES (1, 'IMS Question & Test Interoperability', 'QTI');


--
-- Data for Name: publication; Type: TABLE DATA; Schema: tice; Owner: -
--



SET search_path = ent, pg_catalog;

--
-- Name: pk_annee_scolaire; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY annee_scolaire
    ADD CONSTRAINT pk_annee_scolaire PRIMARY KEY (id);


--
-- Name: pk_appartenance_groupe_groupe; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY appartenance_groupe_groupe
    ADD CONSTRAINT pk_appartenance_groupe_groupe PRIMARY KEY (id);


--
-- Name: pk_appartenance_personne_groupe; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY appartenance_personne_groupe
    ADD CONSTRAINT pk_appartenance_personne_groupe PRIMARY KEY (id);


--
-- Name: pk_calendrier; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY calendrier
    ADD CONSTRAINT pk_calendrier PRIMARY KEY (id);


--
-- Name: pk_civilite; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY civilite
    ADD CONSTRAINT pk_civilite PRIMARY KEY (id);


--
-- Name: pk_enseignement; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY enseignement
    ADD CONSTRAINT pk_enseignement PRIMARY KEY (id);


--
-- Name: pk_ent_service; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY service
    ADD CONSTRAINT pk_ent_service PRIMARY KEY (id);


--
-- Name: pk_etablissement; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY etablissement
    ADD CONSTRAINT pk_etablissement PRIMARY KEY (id);


--
-- Name: pk_fiche_eleve_commentaire; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY fiche_eleve_commentaire
    ADD CONSTRAINT pk_fiche_eleve_commentaire PRIMARY KEY (id);


--
-- Name: pk_filiere; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY filiere
    ADD CONSTRAINT pk_filiere PRIMARY KEY (id);


--
-- Name: pk_fonction; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY fonction
    ADD CONSTRAINT pk_fonction PRIMARY KEY (id);


--
-- Name: pk_groupe_personnes; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY groupe_personnes
    ADD CONSTRAINT pk_groupe_personnes PRIMARY KEY (id);


--
-- Name: pk_matiere; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY matiere
    ADD CONSTRAINT pk_matiere PRIMARY KEY (id);


--
-- Name: pk_mef; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mef
    ADD CONSTRAINT pk_mef PRIMARY KEY (id);


--
-- Name: pk_modalite_cours; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY modalite_cours
    ADD CONSTRAINT pk_modalite_cours PRIMARY KEY (id);


--
-- Name: pk_modalite_matiere; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY modalite_matiere
    ADD CONSTRAINT pk_modalite_matiere PRIMARY KEY (id);


--
-- Name: pk_niveau; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY niveau
    ADD CONSTRAINT pk_niveau PRIMARY KEY (id);


--
-- Name: pk_periode; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY periode
    ADD CONSTRAINT pk_periode PRIMARY KEY (id);


--
-- Name: pk_personne; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY personne
    ADD CONSTRAINT pk_personne PRIMARY KEY (id);


--
-- Name: pk_personne_propriete_scolarite; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY personne_propriete_scolarite
    ADD CONSTRAINT pk_personne_propriete_scolarite PRIMARY KEY (id);


--
-- Name: pk_porteur_ent; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY porteur_ent
    ADD CONSTRAINT pk_porteur_ent PRIMARY KEY (id);


--
-- Name: pk_preference_etablissement; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY preference_etablissement
    ADD CONSTRAINT pk_preference_etablissement PRIMARY KEY (id);


--
-- Name: pk_propriete_scolarite; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY propriete_scolarite
    ADD CONSTRAINT pk_propriete_scolarite PRIMARY KEY (id);


--
-- Name: pk_regime; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY regime
    ADD CONSTRAINT pk_regime PRIMARY KEY (id);


--
-- Name: pk_rel_classe_filiere; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rel_classe_filiere
    ADD CONSTRAINT pk_rel_classe_filiere PRIMARY KEY (classe_id, filiere_id);


--
-- Name: pk_rel_classe_groupe; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rel_classe_groupe
    ADD CONSTRAINT pk_rel_classe_groupe PRIMARY KEY (classe_id, groupe_id);


--
-- Name: pk_rel_periode_service; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rel_periode_service
    ADD CONSTRAINT pk_rel_periode_service PRIMARY KEY (id);


--
-- Name: pk_responsable_eleve; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY responsable_eleve
    ADD CONSTRAINT pk_responsable_eleve PRIMARY KEY (id);


--
-- Name: pk_responsable_propriete_scolarite; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY responsable_propriete_scolarite
    ADD CONSTRAINT pk_responsable_propriete_scolarite PRIMARY KEY (id);


--
-- Name: pk_signature; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY signature
    ADD CONSTRAINT pk_signature PRIMARY KEY (id);


--
-- Name: pk_source_import; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY source_import
    ADD CONSTRAINT pk_source_import PRIMARY KEY (id);


--
-- Name: pk_sous_service; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sous_service
    ADD CONSTRAINT pk_sous_service PRIMARY KEY (id);


--
-- Name: pk_structure_enseignement; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY structure_enseignement
    ADD CONSTRAINT pk_structure_enseignement PRIMARY KEY (id);


--
-- Name: pk_type_periode; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY type_periode
    ADD CONSTRAINT pk_type_periode PRIMARY KEY (id);


--
-- Name: uk_annee_scolaire_code; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY annee_scolaire
    ADD CONSTRAINT uk_annee_scolaire_code UNIQUE (code);


--
-- Name: uk_appartenance_groupe_groupe_groupe_personnes_parent_id_groupe; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY appartenance_groupe_groupe
    ADD CONSTRAINT uk_appartenance_groupe_groupe_groupe_personnes_parent_id_groupe UNIQUE (groupe_personnes_parent_id, groupe_personnes_enfant_id);


--
-- Name: uk_appartenance_personne_groupe_personne_id_groupe_personnes_id; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY appartenance_personne_groupe
    ADD CONSTRAINT uk_appartenance_personne_groupe_personne_id_groupe_personnes_id UNIQUE (personne_id, groupe_personnes_id);


--
-- Name: uk_calendrier_etablissement_id_annee_scolaire_id; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY calendrier
    ADD CONSTRAINT uk_calendrier_etablissement_id_annee_scolaire_id UNIQUE (etablissement_id, annee_scolaire_id);


--
-- Name: uk_civilite_libelle; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY civilite
    ADD CONSTRAINT uk_civilite_libelle UNIQUE (libelle);


--
-- Name: uk_enseignement_enseignant_id_service_id; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY enseignement
    ADD CONSTRAINT uk_enseignement_enseignant_id_service_id UNIQUE (enseignant_id, service_id);


--
-- Name: uk_etablissement_id_externe; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY etablissement
    ADD CONSTRAINT uk_etablissement_id_externe UNIQUE (id_externe);


--
-- Name: uk_etablissement_uai; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY etablissement
    ADD CONSTRAINT uk_etablissement_uai UNIQUE (uai);


--
-- Name: uk_fiche_eleve_commentaire_personne_id; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY fiche_eleve_commentaire
    ADD CONSTRAINT uk_fiche_eleve_commentaire_personne_id UNIQUE (personne_id);


--
-- Name: uk_fonction_code; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY fonction
    ADD CONSTRAINT uk_fonction_code UNIQUE (code);




--
-- Name: uk_groupe_personnes_item_id; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY groupe_personnes
    ADD CONSTRAINT uk_groupe_personnes_item_id UNIQUE (item_id);


--
-- Name: uk_matiere_etablissement_id_code_gestion_annee_scolaire_id; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY matiere
    ADD CONSTRAINT uk_matiere_etablissement_id_code_gestion_annee_scolaire_id UNIQUE (etablissement_id, code_gestion, annee_scolaire_id);


--
-- Name: uk_matiere_etablissement_id_code_sts_annee_scolaire_id; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY matiere
    ADD CONSTRAINT uk_matiere_etablissement_id_code_sts_annee_scolaire_id UNIQUE (etablissement_id, code_sts, annee_scolaire_id);


--
-- Name: uk_mef_code; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mef
    ADD CONSTRAINT uk_mef_code UNIQUE (code);


--
-- Name: uk_modalite_cours_code_sts; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY modalite_cours
    ADD CONSTRAINT uk_modalite_cours_code_sts UNIQUE (code_sts);


--
-- Name: uk_modalite_matiere_etablissement_id_code; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY modalite_matiere
    ADD CONSTRAINT uk_modalite_matiere_etablissement_id_code UNIQUE (etablissement_id, code);


--
-- Name: uk_niveau_libelle_court; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY niveau
    ADD CONSTRAINT uk_niveau_libelle_court UNIQUE (libelle_court);


--
-- Name: uk_periode_structure_enseignement_id_type_periode_id; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY periode
    ADD CONSTRAINT uk_periode_structure_enseignement_id_type_periode_id UNIQUE (structure_enseignement_id, type_periode_id);




--
-- Name: uk_porteur_ent_code; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY porteur_ent
    ADD CONSTRAINT uk_porteur_ent_code UNIQUE (code);




--
-- Name: uk_preference_etablissement_etablissement_id; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY preference_etablissement
    ADD CONSTRAINT uk_preference_etablissement_etablissement_id UNIQUE (etablissement_id);


--
-- Name: uk_regime_code; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY regime
    ADD CONSTRAINT uk_regime_code UNIQUE (code);


--
-- Name: uk_rel_periode_service_periode_id_service_id; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rel_periode_service
    ADD CONSTRAINT uk_rel_periode_service_periode_id_service_id UNIQUE (periode_id, service_id);


--
-- Name: uk_responsable_eleve_personne_id_eleve_id; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY responsable_eleve
    ADD CONSTRAINT uk_responsable_eleve_personne_id_eleve_id UNIQUE (personne_id, eleve_id);


--
-- Name: uk_source_import_code; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY source_import
    ADD CONSTRAINT uk_source_import_code UNIQUE (code);


--
-- Name: uk_sous_service_service_id_type_periode_id_modalite_matiere_id; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sous_service
    ADD CONSTRAINT uk_sous_service_service_id_type_periode_id_modalite_matiere_id UNIQUE (service_id, type_periode_id, modalite_matiere_id);


--
-- Name: uk_structure_enseignement_etablissement_id_annee_scolaire_id_ty; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY structure_enseignement
    ADD CONSTRAINT uk_structure_enseignement_etablissement_id_annee_scolaire_id_ty UNIQUE (etablissement_id, annee_scolaire_id, type, code);


--
-- Name: uk_type_periode_etablissement_id_libelle; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY type_periode
    ADD CONSTRAINT uk_type_periode_etablissement_id_libelle UNIQUE (etablissement_id, libelle);


--
-- Name: uk_type_periode_intervalle; Type: CONSTRAINT; Schema: ent; Owner: -; Tablespace: 
--

ALTER TABLE ONLY type_periode
    ADD CONSTRAINT uk_type_periode_intervalle UNIQUE (intervalle);


SET search_path = public, pg_catalog;





SET search_path = td, pg_catalog;

--
-- Name: pk_copie; Type: CONSTRAINT; Schema: td; Owner: -; Tablespace: 
--

ALTER TABLE ONLY copie
    ADD CONSTRAINT pk_copie PRIMARY KEY (id);


--
-- Name: pk_modalite_activite; Type: CONSTRAINT; Schema: td; Owner: -; Tablespace: 
--

ALTER TABLE ONLY modalite_activite
    ADD CONSTRAINT pk_modalite_activite PRIMARY KEY (id);


--
-- Name: pk_question; Type: CONSTRAINT; Schema: td; Owner: -; Tablespace: 
--

ALTER TABLE ONLY question
    ADD CONSTRAINT pk_question PRIMARY KEY (id);


--
-- Name: pk_question_attachement; Type: CONSTRAINT; Schema: td; Owner: -; Tablespace: 
--

ALTER TABLE ONLY question_attachement
    ADD CONSTRAINT pk_question_attachement PRIMARY KEY (id);


--
-- Name: pk_question_export; Type: CONSTRAINT; Schema: td; Owner: -; Tablespace: 
--

ALTER TABLE ONLY question_export
    ADD CONSTRAINT pk_question_export PRIMARY KEY (id);


--
-- Name: pk_question_type; Type: CONSTRAINT; Schema: td; Owner: -; Tablespace: 
--

ALTER TABLE ONLY question_type
    ADD CONSTRAINT pk_question_type PRIMARY KEY (id);


--
-- Name: pk_reponse; Type: CONSTRAINT; Schema: td; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reponse
    ADD CONSTRAINT pk_reponse PRIMARY KEY (id);


--
-- Name: pk_reponse_attachement; Type: CONSTRAINT; Schema: td; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reponse_attachement
    ADD CONSTRAINT pk_reponse_attachement PRIMARY KEY (id);


--
-- Name: pk_sujet; Type: CONSTRAINT; Schema: td; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sujet
    ADD CONSTRAINT pk_sujet PRIMARY KEY (id);


--
-- Name: pk_sujet_sequence_questions; Type: CONSTRAINT; Schema: td; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sujet_sequence_questions
    ADD CONSTRAINT pk_sujet_sequence_questions PRIMARY KEY (id);


--
-- Name: pk_sujet_type; Type: CONSTRAINT; Schema: td; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sujet_type
    ADD CONSTRAINT pk_sujet_type PRIMARY KEY (id);


--
-- Name: uk_copie_seance_eleve; Type: CONSTRAINT; Schema: td; Owner: -; Tablespace: 
--

ALTER TABLE ONLY copie
    ADD CONSTRAINT uk_copie_seance_eleve UNIQUE (modalite_activite_id, eleve_id);


--
-- Name: uk_reponse_copie_question; Type: CONSTRAINT; Schema: td; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reponse
    ADD CONSTRAINT uk_reponse_copie_question UNIQUE (sujet_question_id, copie_id);


SET search_path = tice, pg_catalog;

--
-- Name: db_data_record_identifier_key; Type: CONSTRAINT; Schema: tice; Owner: -; Tablespace: 
--

ALTER TABLE ONLY db_data_record
    ADD CONSTRAINT db_data_record_identifier_key UNIQUE (identifier);


--
-- Name: pk_attachement; Type: CONSTRAINT; Schema: tice; Owner: -; Tablespace: 
--

ALTER TABLE ONLY attachement
    ADD CONSTRAINT pk_attachement PRIMARY KEY (id);


--
-- Name: pk_compte_utilisateur; Type: CONSTRAINT; Schema: tice; Owner: -; Tablespace: 
--

ALTER TABLE ONLY compte_utilisateur
    ADD CONSTRAINT pk_compte_utilisateur PRIMARY KEY (id);


--
-- Name: pk_copyrigths_type; Type: CONSTRAINT; Schema: tice; Owner: -; Tablespace: 
--

ALTER TABLE ONLY copyrights_type
    ADD CONSTRAINT pk_copyrigths_type PRIMARY KEY (id);


--
-- Name: pk_db_data_record; Type: CONSTRAINT; Schema: tice; Owner: -; Tablespace: 
--

ALTER TABLE ONLY db_data_record
    ADD CONSTRAINT pk_db_data_record PRIMARY KEY (id);


--
-- Name: pk_export_format; Type: CONSTRAINT; Schema: tice; Owner: -; Tablespace: 
--

ALTER TABLE ONLY export_format
    ADD CONSTRAINT pk_export_format PRIMARY KEY (id);


--
-- Name: pk_publication; Type: CONSTRAINT; Schema: tice; Owner: -; Tablespace: 
--

ALTER TABLE ONLY publication
    ADD CONSTRAINT pk_publication PRIMARY KEY (id);


--
-- Name: uk_compte_utilisateur_login; Type: CONSTRAINT; Schema: tice; Owner: -; Tablespace: 
--

ALTER TABLE ONLY compte_utilisateur
    ADD CONSTRAINT uk_compte_utilisateur_login UNIQUE (login);


--
-- Name: uk_compte_utilisateur_login_alias; Type: CONSTRAINT; Schema: tice; Owner: -; Tablespace: 
--

ALTER TABLE ONLY compte_utilisateur
    ADD CONSTRAINT uk_compte_utilisateur_login_alias UNIQUE (login_alias);


SET search_path = ent, pg_catalog;

--
-- Name: idx_appartenance_groupe_groupe_enfant_id; Type: INDEX; Schema: ent; Owner: -; Tablespace: 
--

CREATE INDEX idx_appartenance_groupe_groupe_enfant_id ON appartenance_groupe_groupe USING btree (groupe_personnes_enfant_id);


--
-- Name: idx_appartenance_personne_groupe_groupe_personnes_id; Type: INDEX; Schema: ent; Owner: -; Tablespace: 
--

CREATE INDEX idx_appartenance_personne_groupe_groupe_personnes_id ON appartenance_personne_groupe USING btree (groupe_personnes_id);


--
-- Name: idx_enseignement_service_id; Type: INDEX; Schema: ent; Owner: -; Tablespace: 
--

CREATE INDEX idx_enseignement_service_id ON enseignement USING btree (service_id);


--
-- Name: idx_etablissement_etab_ratt_id; Type: INDEX; Schema: ent; Owner: -; Tablespace: 
--

CREATE INDEX idx_etablissement_etab_ratt_id ON etablissement USING btree (etablissement_rattachement_id);




--
-- Name: idx_groupe_personnes_propriete_scolarite_id; Type: INDEX; Schema: ent; Owner: -; Tablespace: 
--

CREATE INDEX idx_groupe_personnes_propriete_scolarite_id ON groupe_personnes USING btree (propriete_scolarite_id);


--
-- Name: idx_personne_nom_prenom_normalise_date_naissance_etablissement_; Type: INDEX; Schema: ent; Owner: -; Tablespace: 
--

CREATE INDEX idx_personne_nom_prenom_normalise_date_naissance_etablissement_ ON personne USING btree (nom_normalise, prenom_normalise, date_naissance, etablissement_rattachement_id);


--
-- Name: idx_personne_propriete_scolarite_compteur_references; Type: INDEX; Schema: ent; Owner: -; Tablespace: 
--

CREATE INDEX idx_personne_propriete_scolarite_compteur_references ON personne_propriete_scolarite USING btree (compteur_references);


--
-- Name: idx_personne_propriete_scolarite_personne_id; Type: INDEX; Schema: ent; Owner: -; Tablespace: 
--

CREATE INDEX idx_personne_propriete_scolarite_personne_id ON personne_propriete_scolarite USING btree (personne_id);


--
-- Name: idx_personne_propriete_scolarite_personne_id_propriete_scolarit; Type: INDEX; Schema: ent; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX idx_personne_propriete_scolarite_personne_id_propriete_scolarit ON personne_propriete_scolarite USING btree (personne_id, propriete_scolarite_id, est_active) WHERE (est_active = true);


--
-- Name: idx_personne_propriete_scolarite_propriete_scolarite_id; Type: INDEX; Schema: ent; Owner: -; Tablespace: 
--

CREATE INDEX idx_personne_propriete_scolarite_propriete_scolarite_id ON personne_propriete_scolarite USING btree (propriete_scolarite_id);


--
-- Name: idx_preference_etablissement_etablissement_id; Type: INDEX; Schema: ent; Owner: -; Tablespace: 
--

CREATE INDEX idx_preference_etablissement_etablissement_id ON preference_etablissement USING btree (etablissement_id);


--
-- Name: idx_propriete_scolarite_etablissement_id_fonction_id; Type: INDEX; Schema: ent; Owner: -; Tablespace: 
--

CREATE INDEX idx_propriete_scolarite_etablissement_id_fonction_id ON propriete_scolarite USING btree (etablissement_id, fonction_id);


--
-- Name: idx_propriete_scolarite_structure_enseignement_id_fonction_id_m; Type: INDEX; Schema: ent; Owner: -; Tablespace: 
--

CREATE INDEX idx_propriete_scolarite_structure_enseignement_id_fonction_id_m ON propriete_scolarite USING btree (structure_enseignement_id, fonction_id, matiere_id);


--
-- Name: idx_rel_classe_filiere_id_filiere; Type: INDEX; Schema: ent; Owner: -; Tablespace: 
--

CREATE INDEX idx_rel_classe_filiere_id_filiere ON rel_classe_filiere USING btree (filiere_id);


--
-- Name: idx_rel_classe_groupe_id_groupe; Type: INDEX; Schema: ent; Owner: -; Tablespace: 
--

CREATE INDEX idx_rel_classe_groupe_id_groupe ON rel_classe_groupe USING btree (groupe_id);


--
-- Name: idx_rel_periode_service_service_id; Type: INDEX; Schema: ent; Owner: -; Tablespace: 
--

CREATE INDEX idx_rel_periode_service_service_id ON rel_periode_service USING btree (service_id);


--
-- Name: idx_responsable_eleve_eleve_id; Type: INDEX; Schema: ent; Owner: -; Tablespace: 
--

CREATE INDEX idx_responsable_eleve_eleve_id ON responsable_eleve USING btree (eleve_id);


--
-- Name: idx_responsable_propriete_scolarite_propriete_scolarite_id; Type: INDEX; Schema: ent; Owner: -; Tablespace: 
--

CREATE INDEX idx_responsable_propriete_scolarite_propriete_scolarite_id ON responsable_propriete_scolarite USING btree (propriete_scolarite_id);


--
-- Name: idx_responsable_propriete_scolarite_responsable_eleve_id; Type: INDEX; Schema: ent; Owner: -; Tablespace: 
--

CREATE INDEX idx_responsable_propriete_scolarite_responsable_eleve_id ON responsable_propriete_scolarite USING btree (responsable_eleve_id);


--
-- Name: idx_service_id_matiere; Type: INDEX; Schema: ent; Owner: -; Tablespace: 
--

CREATE INDEX idx_service_id_matiere ON service USING btree (matiere_id);


--
-- Name: idx_service_structure_enseignement; Type: INDEX; Schema: ent; Owner: -; Tablespace: 
--

CREATE INDEX idx_service_structure_enseignement ON service USING btree (structure_enseignement_id);


--
-- Name: idx_sous_service_modalite_matiere_id; Type: INDEX; Schema: ent; Owner: -; Tablespace: 
--

CREATE INDEX idx_sous_service_modalite_matiere_id ON sous_service USING btree (modalite_matiere_id);


--
-- Name: ux_annee_en_cours; Type: INDEX; Schema: ent; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX ux_annee_en_cours ON annee_scolaire USING btree (annee_en_cours) WHERE (annee_en_cours = true);


SET search_path = td, pg_catalog;

--
-- Name: idx_copie_correcteur_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_copie_correcteur_id ON copie USING btree (correcteur_id);


--
-- Name: idx_copie_eleve_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_copie_eleve_id ON copie USING btree (eleve_id);


--
-- Name: idx_copie_modalite_activite_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_copie_modalite_activite_id ON copie USING btree (modalite_activite_id);


--
-- Name: idx_copie_sujet_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_copie_sujet_id ON copie USING btree (sujet_id);


--
-- Name: idx_modalite_activite_activite_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_modalite_activite_activite_id ON modalite_activite USING btree (activite_id);


--
-- Name: idx_modalite_activite_enseignant_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_modalite_activite_enseignant_id ON modalite_activite USING btree (enseignant_id);


--
-- Name: idx_modalite_activite_etablissement_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_modalite_activite_etablissement_id ON modalite_activite USING btree (etablissement_id);


--
-- Name: idx_modalite_activite_evaluation_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_modalite_activite_evaluation_id ON modalite_activite USING btree (evaluation_id);


--
-- Name: idx_modalite_activite_groupe_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_modalite_activite_groupe_id ON modalite_activite USING btree (groupe_id);


--
-- Name: idx_modalite_activite_matiere_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_modalite_activite_matiere_id ON modalite_activite USING btree (matiere_id);


--
-- Name: idx_modalite_activite_responsable_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_modalite_activite_responsable_id ON modalite_activite USING btree (responsable_id);


--
-- Name: idx_modalite_activite_structure_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_modalite_activite_structure_id ON modalite_activite USING btree (structure_enseignement_id);


--
-- Name: idx_modalite_activite_sujet_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_modalite_activite_sujet_id ON modalite_activite USING btree (sujet_id);


--
-- Name: idx_question_attachement_attachement_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_question_attachement_attachement_id ON question_attachement USING btree (attachement_id);


--
-- Name: idx_question_attachement_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_question_attachement_id ON question USING btree (attachement_id);


--
-- Name: idx_question_attachement_question_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_question_attachement_question_id ON question_attachement USING btree (question_id);


--
-- Name: idx_question_copyrights_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_question_copyrights_id ON question USING btree (copyrights_type_id);


--
-- Name: idx_question_etablissement_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_question_etablissement_id ON question USING btree (etablissement_id);


--
-- Name: idx_question_exercice_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_question_exercice_id ON question USING btree (exercice_id);


--
-- Name: idx_question_export_format_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_question_export_format_id ON question_export USING btree (format_id);


--
-- Name: idx_question_export_question_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_question_export_question_id ON question_export USING btree (question_id);


--
-- Name: idx_question_matiere_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_question_matiere_id ON question USING btree (matiere_id);


--
-- Name: idx_question_niveau_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_question_niveau_id ON question USING btree (niveau_id);


--
-- Name: idx_question_proprietaire_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_question_proprietaire_id ON question USING btree (proprietaire_id);


--
-- Name: idx_question_publication_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_question_publication_id ON question USING btree (publication_id);


--
-- Name: idx_question_type_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_question_type_id ON question USING btree (type_id);


--
-- Name: idx_reponse_attachement_attachement_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_reponse_attachement_attachement_id ON reponse_attachement USING btree (attachement_id);


--
-- Name: idx_reponse_attachement_reponse_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_reponse_attachement_reponse_id ON reponse_attachement USING btree (reponse_id);


--
-- Name: idx_reponse_copie_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_reponse_copie_id ON reponse USING btree (copie_id);


--
-- Name: idx_reponse_correcteur_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_reponse_correcteur_id ON reponse USING btree (correcteur_id);


--
-- Name: idx_reponse_eleve_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_reponse_eleve_id ON reponse USING btree (eleve_id);


--
-- Name: idx_reponse_sujet_question_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_reponse_sujet_question_id ON reponse USING btree (sujet_question_id);


--
-- Name: idx_sujet_copyrights_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_sujet_copyrights_id ON sujet USING btree (copyrights_type_id);


--
-- Name: idx_sujet_etablissement_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_sujet_etablissement_id ON sujet USING btree (etablissement_id);


--
-- Name: idx_sujet_matiere_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_sujet_matiere_id ON sujet USING btree (matiere_id);


--
-- Name: idx_sujet_niveau_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_sujet_niveau_id ON sujet USING btree (niveau_id);


--
-- Name: idx_sujet_proprietaire_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_sujet_proprietaire_id ON sujet USING btree (proprietaire_id);


--
-- Name: idx_sujet_publication_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_sujet_publication_id ON sujet USING btree (publication_id);


--
-- Name: idx_sujet_sequence_questions_question_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_sujet_sequence_questions_question_id ON sujet_sequence_questions USING btree (question_id);


--
-- Name: idx_sujet_sequence_questions_sujet_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_sujet_sequence_questions_sujet_id ON sujet_sequence_questions USING btree (sujet_id);


--
-- Name: idx_sujet_sujet_type_id; Type: INDEX; Schema: td; Owner: -; Tablespace: 
--

CREATE INDEX idx_sujet_sujet_type_id ON sujet USING btree (sujet_type_id);


SET search_path = tice, pg_catalog;

--
-- Name: idx_attachement_chemin; Type: INDEX; Schema: tice; Owner: -; Tablespace: 
--

CREATE INDEX idx_attachement_chemin ON attachement USING btree (chemin);


--
-- Name: idx_compte_utilisateur_login; Type: INDEX; Schema: tice; Owner: -; Tablespace: 
--

CREATE INDEX idx_compte_utilisateur_login ON compte_utilisateur USING btree (login);


--
-- Name: idx_compte_utilisateur_login_alias; Type: INDEX; Schema: tice; Owner: -; Tablespace: 
--

CREATE INDEX idx_compte_utilisateur_login_alias ON compte_utilisateur USING btree (login_alias);


--
-- Name: idx_compte_utilisateur_personne_id; Type: INDEX; Schema: tice; Owner: -; Tablespace: 
--

CREATE INDEX idx_compte_utilisateur_personne_id ON compte_utilisateur USING btree (personne_id);


--
-- Name: idx_publication_copyrights_type_id; Type: INDEX; Schema: tice; Owner: -; Tablespace: 
--

CREATE INDEX idx_publication_copyrights_type_id ON publication USING btree (copyrights_type_id);


SET search_path = ent, pg_catalog;

--
-- Name: fk_appartenance_groupe_groupe_groupe_personnes_enfant; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY appartenance_groupe_groupe
    ADD CONSTRAINT fk_appartenance_groupe_groupe_groupe_personnes_enfant FOREIGN KEY (groupe_personnes_enfant_id) REFERENCES groupe_personnes(id);


--
-- Name: fk_appartenance_groupe_groupe_groupe_personnes_parent; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY appartenance_groupe_groupe
    ADD CONSTRAINT fk_appartenance_groupe_groupe_groupe_personnes_parent FOREIGN KEY (groupe_personnes_parent_id) REFERENCES groupe_personnes(id);


--
-- Name: fk_appartenance_personne_groupe_groupe_personnes; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY appartenance_personne_groupe
    ADD CONSTRAINT fk_appartenance_personne_groupe_groupe_personnes FOREIGN KEY (groupe_personnes_id) REFERENCES groupe_personnes(id);


--
-- Name: fk_appartenance_personne_groupe_personne; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY appartenance_personne_groupe
    ADD CONSTRAINT fk_appartenance_personne_groupe_personne FOREIGN KEY (personne_id) REFERENCES personne(id);


--
-- Name: fk_calendrier_annee_scolaire; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY calendrier
    ADD CONSTRAINT fk_calendrier_annee_scolaire FOREIGN KEY (annee_scolaire_id) REFERENCES annee_scolaire(id) ON DELETE CASCADE;


--
-- Name: fk_calendrier_etablissement; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY calendrier
    ADD CONSTRAINT fk_calendrier_etablissement FOREIGN KEY (etablissement_id) REFERENCES etablissement(id);


--
-- Name: fk_enseignement_service; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY enseignement
    ADD CONSTRAINT fk_enseignement_service FOREIGN KEY (service_id) REFERENCES service(id) ON DELETE CASCADE;


--
-- Name: fk_etablissement_etablissement; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY etablissement
    ADD CONSTRAINT fk_etablissement_etablissement FOREIGN KEY (etablissement_rattachement_id) REFERENCES etablissement(id);


--
-- Name: fk_etablissement_porteur_ent; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY etablissement
    ADD CONSTRAINT fk_etablissement_porteur_ent FOREIGN KEY (porteur_ent_id) REFERENCES porteur_ent(id);


--
-- Name: fk_fiche_eleve_commentaire_personne; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY fiche_eleve_commentaire
    ADD CONSTRAINT fk_fiche_eleve_commentaire_personne FOREIGN KEY (personne_id) REFERENCES personne(id);


--
-- Name: fk_groupe_personnes_propriete_scolarite; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY groupe_personnes
    ADD CONSTRAINT fk_groupe_personnes_propriete_scolarite FOREIGN KEY (propriete_scolarite_id) REFERENCES propriete_scolarite(id);


--
-- Name: fk_matiere_annee_scolaire; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY matiere
    ADD CONSTRAINT fk_matiere_annee_scolaire FOREIGN KEY (annee_scolaire_id) REFERENCES annee_scolaire(id);


--
-- Name: fk_matiere_etablissement; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY matiere
    ADD CONSTRAINT fk_matiere_etablissement FOREIGN KEY (etablissement_id) REFERENCES etablissement(id);


--
-- Name: fk_modalite_matiere_annee_scolaire; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY modalite_matiere
    ADD CONSTRAINT fk_modalite_matiere_annee_scolaire FOREIGN KEY (annee_scolaire_id) REFERENCES annee_scolaire(id);


--
-- Name: fk_modalite_matiere_etablissement; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY modalite_matiere
    ADD CONSTRAINT fk_modalite_matiere_etablissement FOREIGN KEY (etablissement_id) REFERENCES etablissement(id);


--
-- Name: fk_periode_structure_enseignement; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY periode
    ADD CONSTRAINT fk_periode_structure_enseignement FOREIGN KEY (structure_enseignement_id) REFERENCES structure_enseignement(id);


--
-- Name: fk_periode_type_periode; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY periode
    ADD CONSTRAINT fk_periode_type_periode FOREIGN KEY (type_periode_id) REFERENCES type_periode(id);


--
-- Name: fk_personne_civilite; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY personne
    ADD CONSTRAINT fk_personne_civilite FOREIGN KEY (civilite_id) REFERENCES civilite(id);


--
-- Name: fk_personne_etablissement; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY personne
    ADD CONSTRAINT fk_personne_etablissement FOREIGN KEY (etablissement_rattachement_id) REFERENCES etablissement(id);


--
-- Name: fk_personne_propriete_scolarite_personne; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY personne_propriete_scolarite
    ADD CONSTRAINT fk_personne_propriete_scolarite_personne FOREIGN KEY (personne_id) REFERENCES personne(id);


--
-- Name: fk_personne_propriete_scolarite_propriete_scolarite; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY personne_propriete_scolarite
    ADD CONSTRAINT fk_personne_propriete_scolarite_propriete_scolarite FOREIGN KEY (propriete_scolarite_id) REFERENCES propriete_scolarite(id);


--
-- Name: fk_personne_regime; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY personne
    ADD CONSTRAINT fk_personne_regime FOREIGN KEY (regime_id) REFERENCES regime(id);


--
-- Name: fk_preference_etablissement_annee_scolaire; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY preference_etablissement
    ADD CONSTRAINT fk_preference_etablissement_annee_scolaire FOREIGN KEY (annee_scolaire_id) REFERENCES annee_scolaire(id);


--
-- Name: fk_preference_etablissement_etablissement; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY preference_etablissement
    ADD CONSTRAINT fk_preference_etablissement_etablissement FOREIGN KEY (etablissement_id) REFERENCES etablissement(id);


--
-- Name: fk_propriete_scolarite_annee_scolaire; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY propriete_scolarite
    ADD CONSTRAINT fk_propriete_scolarite_annee_scolaire FOREIGN KEY (annee_scolaire_id) REFERENCES annee_scolaire(id);


--
-- Name: fk_propriete_scolarite_etablissement; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY propriete_scolarite
    ADD CONSTRAINT fk_propriete_scolarite_etablissement FOREIGN KEY (etablissement_id) REFERENCES etablissement(id);


--
-- Name: fk_propriete_scolarite_fonction; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY propriete_scolarite
    ADD CONSTRAINT fk_propriete_scolarite_fonction FOREIGN KEY (fonction_id) REFERENCES fonction(id);


--
-- Name: fk_propriete_scolarite_matiere; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY propriete_scolarite
    ADD CONSTRAINT fk_propriete_scolarite_matiere FOREIGN KEY (matiere_id) REFERENCES matiere(id);


--
-- Name: fk_propriete_scolarite_mef; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY propriete_scolarite
    ADD CONSTRAINT fk_propriete_scolarite_mef FOREIGN KEY (mef_id) REFERENCES mef(id);


--
-- Name: fk_propriete_scolarite_niveau; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY propriete_scolarite
    ADD CONSTRAINT fk_propriete_scolarite_niveau FOREIGN KEY (niveau_id) REFERENCES niveau(id);


--
-- Name: fk_propriete_scolarite_porteur_ent; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY propriete_scolarite
    ADD CONSTRAINT fk_propriete_scolarite_porteur_ent FOREIGN KEY (porteur_ent_id) REFERENCES porteur_ent(id);


--
-- Name: fk_propriete_scolarite_structure_enseignement; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY propriete_scolarite
    ADD CONSTRAINT fk_propriete_scolarite_structure_enseignement FOREIGN KEY (structure_enseignement_id) REFERENCES structure_enseignement(id);


--
-- Name: fk_rel_classe_filiere_filiere; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY rel_classe_filiere
    ADD CONSTRAINT fk_rel_classe_filiere_filiere FOREIGN KEY (filiere_id) REFERENCES filiere(id);


--
-- Name: fk_rel_classe_filiere_structure_enseignement; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY rel_classe_filiere
    ADD CONSTRAINT fk_rel_classe_filiere_structure_enseignement FOREIGN KEY (classe_id) REFERENCES structure_enseignement(id);


--
-- Name: fk_rel_classe_groupe_structure_enseignement_classe; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY rel_classe_groupe
    ADD CONSTRAINT fk_rel_classe_groupe_structure_enseignement_classe FOREIGN KEY (classe_id) REFERENCES structure_enseignement(id);


--
-- Name: fk_rel_classe_groupe_structure_enseignement_groupe; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY rel_classe_groupe
    ADD CONSTRAINT fk_rel_classe_groupe_structure_enseignement_groupe FOREIGN KEY (groupe_id) REFERENCES structure_enseignement(id);


--
-- Name: fk_rel_periode_service_periode; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY rel_periode_service
    ADD CONSTRAINT fk_rel_periode_service_periode FOREIGN KEY (periode_id) REFERENCES periode(id);


--
-- Name: fk_rel_periode_service_service; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY rel_periode_service
    ADD CONSTRAINT fk_rel_periode_service_service FOREIGN KEY (service_id) REFERENCES service(id);


--
-- Name: fk_responsable_eleve_personne_eleve; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY responsable_eleve
    ADD CONSTRAINT fk_responsable_eleve_personne_eleve FOREIGN KEY (eleve_id) REFERENCES personne(id);


--
-- Name: fk_responsable_eleve_personne_personne; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY responsable_eleve
    ADD CONSTRAINT fk_responsable_eleve_personne_personne FOREIGN KEY (personne_id) REFERENCES personne(id);


--
-- Name: fk_responsable_propriete_scolarite_propriete_scolarite; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY responsable_propriete_scolarite
    ADD CONSTRAINT fk_responsable_propriete_scolarite_propriete_scolarite FOREIGN KEY (propriete_scolarite_id) REFERENCES propriete_scolarite(id);


--
-- Name: fk_responsable_propriete_scolarite_responsable_eleve; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY responsable_propriete_scolarite
    ADD CONSTRAINT fk_responsable_propriete_scolarite_responsable_eleve FOREIGN KEY (responsable_eleve_id) REFERENCES responsable_eleve(id);


--
-- Name: fk_service_matiere; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY service
    ADD CONSTRAINT fk_service_matiere FOREIGN KEY (matiere_id) REFERENCES matiere(id);


--
-- Name: fk_service_modalite_cours; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY service
    ADD CONSTRAINT fk_service_modalite_cours FOREIGN KEY (modalite_cours_id) REFERENCES modalite_cours(id);


--
-- Name: fk_service_structure_enseignement; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY service
    ADD CONSTRAINT fk_service_structure_enseignement FOREIGN KEY (structure_enseignement_id) REFERENCES structure_enseignement(id) ON DELETE CASCADE;


--
-- Name: fk_sous_service_modalite_matiere; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY sous_service
    ADD CONSTRAINT fk_sous_service_modalite_matiere FOREIGN KEY (modalite_matiere_id) REFERENCES modalite_matiere(id);


--
-- Name: fk_sous_service_service; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY sous_service
    ADD CONSTRAINT fk_sous_service_service FOREIGN KEY (service_id) REFERENCES service(id);


--
-- Name: fk_sous_service_type_periode; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY sous_service
    ADD CONSTRAINT fk_sous_service_type_periode FOREIGN KEY (type_periode_id) REFERENCES type_periode(id);


--
-- Name: fk_structure_enseignement_annee_scolaire; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY structure_enseignement
    ADD CONSTRAINT fk_structure_enseignement_annee_scolaire FOREIGN KEY (annee_scolaire_id) REFERENCES annee_scolaire(id);


--
-- Name: fk_structure_enseignement_etablissement; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY structure_enseignement
    ADD CONSTRAINT fk_structure_enseignement_etablissement FOREIGN KEY (etablissement_id) REFERENCES etablissement(id);


--
-- Name: fk_structure_enseignement_niveau; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY structure_enseignement
    ADD CONSTRAINT fk_structure_enseignement_niveau FOREIGN KEY (niveau_id) REFERENCES niveau(id);


--
-- Name: fk_type_periode_etablissement; Type: FK CONSTRAINT; Schema: ent; Owner: -
--

ALTER TABLE ONLY type_periode
    ADD CONSTRAINT fk_type_periode_etablissement FOREIGN KEY (etablissement_id) REFERENCES etablissement(id);


SET search_path = td, pg_catalog;

--
-- Name: fk_copie_correcteur_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY copie
    ADD CONSTRAINT fk_copie_correcteur_id FOREIGN KEY (correcteur_id) REFERENCES ent.personne(id);


--
-- Name: fk_copie_eleve_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY copie
    ADD CONSTRAINT fk_copie_eleve_id FOREIGN KEY (eleve_id) REFERENCES ent.personne(id);


--
-- Name: fk_copie_modalite_activite_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY copie
    ADD CONSTRAINT fk_copie_modalite_activite_id FOREIGN KEY (modalite_activite_id) REFERENCES modalite_activite(id);


--
-- Name: fk_copie_sujet_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY copie
    ADD CONSTRAINT fk_copie_sujet_id FOREIGN KEY (sujet_id) REFERENCES sujet(id);


--
-- Name: fk_modalite_activite_enseignant_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY modalite_activite
    ADD CONSTRAINT fk_modalite_activite_enseignant_id FOREIGN KEY (enseignant_id) REFERENCES ent.personne(id);


--
-- Name: fk_modalite_activite_etablissement_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY modalite_activite
    ADD CONSTRAINT fk_modalite_activite_etablissement_id FOREIGN KEY (etablissement_id) REFERENCES ent.etablissement(id);


--
-- Name: fk_modalite_activite_groupe_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY modalite_activite
    ADD CONSTRAINT fk_modalite_activite_groupe_id FOREIGN KEY (groupe_id) REFERENCES ent.groupe_personnes(id);


--
-- Name: fk_modalite_activite_matiere_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY modalite_activite
    ADD CONSTRAINT fk_modalite_activite_matiere_id FOREIGN KEY (matiere_id) REFERENCES ent.matiere(id);


--
-- Name: fk_modalite_activite_responsable_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY modalite_activite
    ADD CONSTRAINT fk_modalite_activite_responsable_id FOREIGN KEY (responsable_id) REFERENCES ent.personne(id);


--
-- Name: fk_modalite_activite_structure_enseignement_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY modalite_activite
    ADD CONSTRAINT fk_modalite_activite_structure_enseignement_id FOREIGN KEY (structure_enseignement_id) REFERENCES ent.structure_enseignement(id);


--
-- Name: fk_modalite_activite_sujet_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY modalite_activite
    ADD CONSTRAINT fk_modalite_activite_sujet_id FOREIGN KEY (sujet_id) REFERENCES sujet(id);


--
-- Name: fk_question_attachement_attachement_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY question_attachement
    ADD CONSTRAINT fk_question_attachement_attachement_id FOREIGN KEY (attachement_id) REFERENCES tice.attachement(id);


--
-- Name: fk_question_attachement_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY question
    ADD CONSTRAINT fk_question_attachement_id FOREIGN KEY (attachement_id) REFERENCES tice.attachement(id);


--
-- Name: fk_question_attachement_question_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY question_attachement
    ADD CONSTRAINT fk_question_attachement_question_id FOREIGN KEY (question_id) REFERENCES question(id);


--
-- Name: fk_question_copyrights_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY question
    ADD CONSTRAINT fk_question_copyrights_id FOREIGN KEY (copyrights_type_id) REFERENCES tice.copyrights_type(id);


--
-- Name: fk_question_etablissement_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY question
    ADD CONSTRAINT fk_question_etablissement_id FOREIGN KEY (etablissement_id) REFERENCES ent.etablissement(id);


--
-- Name: fk_question_exercice_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY question
    ADD CONSTRAINT fk_question_exercice_id FOREIGN KEY (exercice_id) REFERENCES sujet(id);


--
-- Name: fk_question_export_format_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY question_export
    ADD CONSTRAINT fk_question_export_format_id FOREIGN KEY (format_id) REFERENCES tice.export_format(id);


--
-- Name: fk_question_export_question_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY question_export
    ADD CONSTRAINT fk_question_export_question_id FOREIGN KEY (question_id) REFERENCES question(id);


--
-- Name: fk_question_matiere_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY question
    ADD CONSTRAINT fk_question_matiere_id FOREIGN KEY (matiere_id) REFERENCES ent.matiere(id);


--
-- Name: fk_question_niveau_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY question
    ADD CONSTRAINT fk_question_niveau_id FOREIGN KEY (niveau_id) REFERENCES ent.niveau(id);


--
-- Name: fk_question_proprietaire_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY question
    ADD CONSTRAINT fk_question_proprietaire_id FOREIGN KEY (proprietaire_id) REFERENCES ent.personne(id);


--
-- Name: fk_question_publication_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY question
    ADD CONSTRAINT fk_question_publication_id FOREIGN KEY (publication_id) REFERENCES tice.publication(id);


--
-- Name: fk_question_type_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY question
    ADD CONSTRAINT fk_question_type_id FOREIGN KEY (type_id) REFERENCES question_type(id);


--
-- Name: fk_reponse_attachement_attachement_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY reponse_attachement
    ADD CONSTRAINT fk_reponse_attachement_attachement_id FOREIGN KEY (attachement_id) REFERENCES tice.attachement(id);


--
-- Name: fk_reponse_attachement_reponse_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY reponse_attachement
    ADD CONSTRAINT fk_reponse_attachement_reponse_id FOREIGN KEY (reponse_id) REFERENCES reponse(id);


--
-- Name: fk_reponse_copie_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY reponse
    ADD CONSTRAINT fk_reponse_copie_id FOREIGN KEY (copie_id) REFERENCES copie(id);


--
-- Name: fk_reponse_correcteur_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY reponse
    ADD CONSTRAINT fk_reponse_correcteur_id FOREIGN KEY (correcteur_id) REFERENCES ent.personne(id);


--
-- Name: fk_reponse_eleve_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY reponse
    ADD CONSTRAINT fk_reponse_eleve_id FOREIGN KEY (eleve_id) REFERENCES ent.personne(id);


--
-- Name: fk_reponse_sujet_question_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY reponse
    ADD CONSTRAINT fk_reponse_sujet_question_id FOREIGN KEY (sujet_question_id) REFERENCES sujet_sequence_questions(id);


--
-- Name: fk_sujet_copyrights_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY sujet
    ADD CONSTRAINT fk_sujet_copyrights_id FOREIGN KEY (copyrights_type_id) REFERENCES tice.copyrights_type(id);


--
-- Name: fk_sujet_etablissement_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY sujet
    ADD CONSTRAINT fk_sujet_etablissement_id FOREIGN KEY (etablissement_id) REFERENCES ent.etablissement(id);


--
-- Name: fk_sujet_matiere_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY sujet
    ADD CONSTRAINT fk_sujet_matiere_id FOREIGN KEY (matiere_id) REFERENCES ent.matiere(id);


--
-- Name: fk_sujet_niveau_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY sujet
    ADD CONSTRAINT fk_sujet_niveau_id FOREIGN KEY (niveau_id) REFERENCES ent.niveau(id);


--
-- Name: fk_sujet_proprietaire_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY sujet
    ADD CONSTRAINT fk_sujet_proprietaire_id FOREIGN KEY (proprietaire_id) REFERENCES ent.personne(id);


--
-- Name: fk_sujet_publication_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY sujet
    ADD CONSTRAINT fk_sujet_publication_id FOREIGN KEY (publication_id) REFERENCES tice.publication(id);


--
-- Name: fk_sujet_sequence_questions_question_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY sujet_sequence_questions
    ADD CONSTRAINT fk_sujet_sequence_questions_question_id FOREIGN KEY (question_id) REFERENCES question(id);


--
-- Name: fk_sujet_sequence_questions_sujet_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY sujet_sequence_questions
    ADD CONSTRAINT fk_sujet_sequence_questions_sujet_id FOREIGN KEY (sujet_id) REFERENCES sujet(id);


--
-- Name: fk_sujet_sujet_type_id; Type: FK CONSTRAINT; Schema: td; Owner: -
--

ALTER TABLE ONLY sujet
    ADD CONSTRAINT fk_sujet_sujet_type_id FOREIGN KEY (sujet_type_id) REFERENCES sujet_type(id);


SET search_path = tice, pg_catalog;

--
-- Name: fk_compte_utilisateur_personne_id; Type: FK CONSTRAINT; Schema: tice; Owner: -
--

ALTER TABLE ONLY compte_utilisateur
    ADD CONSTRAINT fk_compte_utilisateur_personne_id FOREIGN KEY (personne_id) REFERENCES ent.personne(id);


--
-- Name: fk_publication_copyrights_type_id; Type: FK CONSTRAINT; Schema: tice; Owner: -
--

ALTER TABLE ONLY publication
    ADD CONSTRAINT fk_publication_copyrights_type_id FOREIGN KEY (copyrights_type_id) REFERENCES copyrights_type(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--
-- CF workaround
-- REVOKE ALL ON SCHEMA public FROM PUBLIC;
-- REVOKE ALL ON SCHEMA public FROM postgres;
-- GRANT ALL ON SCHEMA public TO postgres;
-- GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

-- For liquibase to work
SET search_path = public ;