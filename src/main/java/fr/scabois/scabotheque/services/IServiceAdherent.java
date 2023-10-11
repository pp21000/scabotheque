package fr.scabois.scabotheque.services;

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
import fr.scabois.scabotheque.controller.adherent.CriteriaCRM;
import fr.scabois.scabotheque.enums.PageType;
import java.util.List;

public interface IServiceAdherent {

  public void createActivite(String var1);

  public int createAdherent(Adherent var1);

  public void createAgence(String var1);

  public void createContactAdherent(AdherentContactRole var1);

  public void createContactFonction(String var1);

  public void createPole(String var1);

  public void createRole(String var1);

  public void createSecteur(String var1);

  public void createSuiviAdherent(AdherentSuiviVisite var1);

  public void createUtilisateur(String var1, String var2);

  public Activite loadActivite(int var1);

  public List<Activite> loadActivites();

  public List<AdherentActivite> loadActivitesAdherent(int var1);

  public Adherent loadAdherent(int var1);

  public String loadAdherentCommentaire(int var1, PageType var2);

  public List<AdherentContactRole> loadAdherentContact(int var1);

  public List<AdherentContactRole> loadAdherentContactFonction(int var1, Boolean var2, Boolean var3, Boolean var4, Boolean var5);

  public AdherentLogistique loadAdherentLogistique(int var1);

  public AdherentInformatique loadAdherentInformatique(int var1);

  public AdherentSuiviVisite loadAdherentSuiviVisite(int var1);

  public List<AdherentSuiviVisite> loadAdherentSuivisVisites(int var1);

  public List<AdherentSuiviVisite> loadAdherentSuivisVisites(Integer var1, CriteriaCRM var2);

  public List<AdherentType> loadAdherentTypes();

  public List<Adherent> loadAdherents();

  public List<AdherentContactRole> loadAdherentsContact();

  public List<ContactRetraite> loadContactsRetraite();

  public ContactClubFemme loadContactClubFemme(int var1);

  public List<ContactClubFemme> loadContactsClubFemme();

  public List<Adherent> loadAdherents(CriteriaAdherent var1);

  public List<Agence> loadAgences();

  public List<Ape> loadCodeApes();

  public List<Commune> loadCommunes();

  public List<CompteType> loadCompteTypes();

  public List<ContactFonction> loadContactFonctions();

  public List<AdherentEtat> loadEtats();

  public List<FormeJuridique> loadFormesJuridiques();

  public List<Pole> loadPoles();

  public List<Role> loadRoles();

  public List<RoleSalarieEOLAS> loadRolesEOLAS();

  public List<Secteur> loadSecteurs();

  public List<Tournee> loadTournees();

  public User loadUtilisateur(int var1);

  public List<User> loadUtilisateurs();

  public void saveActivites(List<Activite> var1);

  public void saveActivitesAdherent(int var1, List<AdherentActivite> var2);

  public void saveAdherent(Adherent var1);

  public void saveAdherentCommentaire(int var1, PageType var2, String var3);

  public void saveAdherentContacts(List<AdherentContactRole> var1);

  public void saveAdherentSuiviVisite(AdherentSuiviVisite var1);

  public void saveAgences(List<Agence> var1);

  public void saveContactFonctions(List<ContactFonction> var1);

  public void savePoles(List<Pole> var1);

  public void saveRoles(List<Role> var1);

  public void saveSecteurs(List<Secteur> var1);

  public void saveUtilisateur(List<User> var1);

  public void saveUtilisateurRoles(int var1, List<UserRole> var2);

  public void setAdherentImage(int var1, byte[] var2);

  public void setAdherentLogo(int var1, byte[] var2);

  public void setContactImage(int var1, byte[] var2);

  public void supprimeActivite(Integer var1);

  public void supprimeAdherentContact(Integer var1);

  public void supprimeAgence(Integer var1);

  public void supprimeContactFonction(Integer var1);

  public void supprimePole(Integer var1);

  public void supprimeRole(Integer var1);

  public void supprimeSecteur(Integer var1);

  public Long countAdherents();

  public Long countAdherentsInactif();

  public Long countAdherentsSansEOLAS();

  public AdherentContactComptable loadAdherentContactComptable(int var1);

  public List<AdherentContactRole> loadAdherentContact(CriteriaAdherent var1);

  public void saveContactComptableAdherent(AdherentContactComptable var1);

  public String chartDataActif();

  public String chartDataNew();

  public String chartDataAnnee();

  public String chartDataInactif();

  public void createContactClubFemme(ContactClubFemme var1);

  public void createContactRetraite(ContactRetraite var1);

  public List<AdherentMetier> loadAdherentMetiers(int var1);

  public AdherentContactRole loadContact(Integer var1);

  public void saveAdherentLogistique(AdherentLogistique var1);

  public void saveAdherentMetiers(int var1, List<AdherentMetier> var2);
}
