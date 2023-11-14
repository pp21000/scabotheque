package fr.scabois.scabotheque.dao;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.adherent.AdherentActivite;
import fr.scabois.scabotheque.bean.adherent.AdherentContactComptable;
import fr.scabois.scabotheque.bean.adherent.AdherentContactRole;
import fr.scabois.scabotheque.bean.adherent.AdherentEtat;
import fr.scabois.scabotheque.bean.adherent.AdherentInformatique;
import fr.scabois.scabotheque.bean.adherent.AdherentLogistique;
import fr.scabois.scabotheque.bean.adherent.AdherentMetier;
import fr.scabois.scabotheque.bean.adherent.AdherentSuiviVisite;
import fr.scabois.scabotheque.bean.adherent.AdherentType;
import fr.scabois.scabotheque.bean.adherent.CompteType;
import fr.scabois.scabotheque.bean.adherent.ContactClubFemme;
import fr.scabois.scabotheque.bean.adherent.ContactRetraite;
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
import fr.scabois.scabotheque.enums.PageType;
import java.util.List;

public interface IAdherentDAO {

  public String chartDataActif();

  public String chartDataNew();

  public String chartDataAnnee();

  public String chartDataInactif();

  public Long countAdherents();

  public Long countAdherentsInactif();

  public Long countAdherentsSansEOLAS();

  public void createActivite(String libelle);

  public int createAdherent(Adherent adherent);

  public void createAgence(String libelle);

  public void createContactAdherent(AdherentContactRole contact);

  public void createContactClubFemme(ContactClubFemme contact);

  public void createContactFonction(String libelle);

  public void createContactRetraite(ContactRetraite contact);

  public void createPole(String libelle);

  public void createRole(String libelle);

  public void createSecteur(String libelle);

  public void createSuiviAdherent(AdherentSuiviVisite suivi);

  public void createUtilisateur(String userName, String password);

  public void editAdherent(Adherent pAdherent);

  public Activite loadActivite(int activiteId);

  public List<Activite> loadActivites();

  public List<AdherentActivite> loadActivitesAdherent(int idAdh);

  public Adherent loadAdherent(int idAdh);

  public String loadAdherentCommentaire(int idAdh, PageType type);

  public List<AdherentContactRole> loadAdherentContact(int adhId);

  public List<AdherentContactRole> loadAdherentContact(CriteriaAdherent criteria);

  public List<AdherentMetier> loadAdherentMetiers(final int idAdh);

  public List<ContactRetraite> loadContactsRetraite();

  public List<ContactClubFemme> loadContactsClubFemme();

  public AdherentContactComptable loadAdherentContactComptable(int idAdh);

  public List<AdherentContactRole> loadAdherentContactFonction(int adhId, Boolean isDirigeant, Boolean isCommerce, Boolean isAdmin, Boolean isCompta);

  public AdherentLogistique loadAdherentLogistique(int idAdh);

  public AdherentInformatique loadAdherentInformatique(int idAdh);

  public AdherentSuiviVisite loadAdherentSuiviVisite(int suiviId);

  public List<AdherentSuiviVisite> loadAdherentSuivisVisites(int adhId);

  public List<AdherentType> loadAdherentTypes();

  public List<Adherent> loadAdherents();

  public List<AdherentContactRole> loadAdherentsContact();

  public List<Adherent> loadAdherents(CriteriaAdherent criteria);

  public List<Agence> loadAgences();

  public List<Ape> loadApes();

  public List<Commune> loadCommunes();

  public List<CompteType> loadCompteTypes();

  public AdherentContactRole loadContact(Integer contactId);

  public ContactClubFemme loadContactClubFemme(int idAdh);

  public List<ContactFonction> loadContactFonction();

  public List<AdherentEtat> loadEtats();

  public List<FormeJuridique> loadFormesJuridiques();

  public List<Pole> loadPoles();

  public List<Role> loadRoles();

  public List<RoleSalarieEOLAS> loadRolesEOLAS();

  public List<Secteur> loadSecteurs();

  public List<Tournee> loadTournees();

  public User loadUtilisateur(int userId);

  public List<User> loadUtilisateurs();

  public void saveActivites(List<Activite> secteurs);

  public void saveActivitesAdherent(int adhId, List<AdherentActivite> activitesAdh);

  public void saveAdherentCommentaire(int adhId, PageType type, String commentaire);

  public void saveAdherentContacts(List<AdherentContactRole> contacts);

  public void saveAdherentLogistique(AdherentLogistique logistiqueAdh);

  public void saveAdherentMetiers(int adhId, List<AdherentMetier> adherentMetiers);

  public void saveAdherentSuiviVisite(AdherentSuiviVisite suivi);

  public void saveAgences(List<Agence> agences);

  public void saveContactComptableAdherent(AdherentContactComptable contact);

  public void saveContactsFonctions(List<ContactFonction> contactsFonction);

  public void savePoles(List<Pole> poles);

  public void saveRoles(List<Role> roles);

  public void saveSecteurs(List<Secteur> secteurs);

  public void saveUtilisateur(List<User> users);

  public void saveUtilisateurRoles(int usrId, List<UserRole> newUserRoles);

  public void setAdherentImage(int adhId, byte[] photo);

  public void setAdherentLogo(int adhId, byte[] logo);

  public void setContactImage(int contactId, byte[] bytes);

  public void supprimeActivite(Integer id);

  public void supprimeAdherentContact(Integer id);

  public void supprimeAgence(Integer id);

  public void supprimeContactFonction(Integer id);

  public void supprimePole(Integer id);

  public void supprimeRole(Integer id);

  public void supprimeSecteur(Integer id);
}
