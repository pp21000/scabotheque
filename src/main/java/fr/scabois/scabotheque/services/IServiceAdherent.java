package fr.scabois.scabotheque.services;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.adherent.AdherentActivite;
import fr.scabois.scabotheque.bean.adherent.AdherentContactComptable;
import fr.scabois.scabotheque.bean.adherent.AdherentContactRole;
import fr.scabois.scabotheque.bean.adherent.AdherentEtat;
import fr.scabois.scabotheque.bean.adherent.AdherentExploitation;
import fr.scabois.scabotheque.bean.adherent.AdherentInformatique;
import fr.scabois.scabotheque.bean.adherent.AdherentSuiviVisite;
import fr.scabois.scabotheque.bean.adherent.AdherentType;
import fr.scabois.scabotheque.bean.adherent.CompteType;
import fr.scabois.scabotheque.bean.adherent.FormeJuridique;
import fr.scabois.scabotheque.bean.adherent.Pole;
import fr.scabois.scabotheque.bean.adherent.Role;
import fr.scabois.scabotheque.bean.adherent.RoleSalarieEOLAS;
import fr.scabois.scabotheque.bean.adherent.Secteur;
import fr.scabois.scabotheque.bean.adherent.Tournee;
import fr.scabois.scabotheque.bean.commun.Activite;
import fr.scabois.scabotheque.bean.commun.Agence;
import fr.scabois.scabotheque.bean.commun.Ape;
import fr.scabois.scabotheque.bean.commun.Commune;
import fr.scabois.scabotheque.bean.commun.ContactFonction;
import fr.scabois.scabotheque.bean.security.User;
import fr.scabois.scabotheque.bean.security.UserRole;
import fr.scabois.scabotheque.controller.adherent.CriteriaAdherent;
import fr.scabois.scabotheque.controller.adherent.CriteriaCRM;
import fr.scabois.scabotheque.enums.PageType;
import java.util.List;

public interface IServiceAdherent {

  void createActivite(String libelle);

  int createAdherent(Adherent dataAdherent);

  void createAgence(String libelle);

  void createContactAdherent(AdherentContactRole contact);

  void createContactFonction(String libelle);

  void createPole(String libelle);

  void createRole(String libelle);

  void createSecteur(String libelle);

  void createSuiviAdherent(AdherentSuiviVisite suivi);

  void createUtilisateur(String userName, String password);

  Activite loadActivite(int activiteId);

  List<Activite> loadActivites();

  List<AdherentActivite> loadActivitesAdherent(int idAdh);

  Adherent loadAdherent(int idAdh);

  String loadAdherentCommentaire(int idAdh, PageType pageType);

  List<AdherentContactRole> loadAdherentContact(int adhId);

  List<AdherentContactRole> loadAdherentContactFonction(int adhId, Boolean isDirigeant, Boolean isCommerce,
          Boolean isAdmin, Boolean isCompta);

  AdherentExploitation loadAdherentExploitation(int idAdh);

  AdherentInformatique loadAdherentInformatique(int idAdh);

  AdherentSuiviVisite loadAdherentSuiviVisite(int suiviId);

  List<AdherentSuiviVisite> loadAdherentSuivisVisites(int adhId);

  List<AdherentSuiviVisite> loadAdherentSuivisVisites(Integer adhId, CriteriaCRM criteria);

  List<AdherentType> loadAdherentTypes();

  List<Adherent> loadAdherents();

  List<AdherentContactRole> loadAdherentsContact();

  List<Adherent> loadAdherents(CriteriaAdherent criteria);

  List<Agence> loadAgences();

  List<Ape> loadCodeApes();

  List<Commune> loadCommunes();

  List<CompteType> loadCompteTypes();

  List<ContactFonction> loadContactFonctions();

  List<AdherentEtat> loadEtats();

  List<FormeJuridique> loadFormesJuridiques();

  List<Pole> loadPoles();

  List<Role> loadRoles();

  List<RoleSalarieEOLAS> loadRolesEOLAS();

  List<Secteur> loadSecteurs();

  List<Tournee> loadTournees();

  User loadUtilisateur(int userId);

  List<User> loadUtilisateurs();

  void saveActivites(List<Activite> activites);

  void saveActivitesAdherent(int adhId, List<AdherentActivite> activitesAdh);

  void saveAdherent(final Adherent pAdherent);

  void saveAdherentCommentaire(int adhId, PageType type, String commentaire);

  void saveAdherentContacts(List<AdherentContactRole> contacts);

  void saveAdherentSuiviVisite(AdherentSuiviVisite suivi);

  void saveAgences(List<Agence> agences);

  void saveContactFonctions(List<ContactFonction> contactFonctions);

  void savePoles(List<Pole> setEditList);

  void saveRoles(List<Role> setEditList);

  void saveSecteurs(List<Secteur> setEditList);

  void saveUtilisateur(List<User> users);

  void saveUtilisateurRoles(int usrId, List<UserRole> newUserRoles);

  void setAdherentImage(int adhId, byte[] bytes);

  void setContactImage(int contactId, byte[] bytes);

  void supprimeActivite(Integer id);

  void supprimeAdherentContact(Integer id);

  void supprimeAgence(Integer id);

  void supprimeContactFonction(Integer id);

  void supprimePole(Integer id);

  void supprimeRole(Integer id);

  void supprimeSecteur(Integer id);

  Long countAdherents();

  Long countAdherentsInactif();

  Long countAdherentsSansEOLAS();

  AdherentContactComptable loadAdherentContactComptable(int idAdh);

  List<AdherentContactRole> loadAdherentContact(CriteriaAdherent criteria);

  void saveContactComptableAdherent(AdherentContactComptable contact);

  String chartDataActif();

  String chartDataNew();

  String chartDataAnnee();

  String chartDataInactif();

}
