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
import fr.scabois.scabotheque.dao.IAdherentDAO;
import fr.scabois.scabotheque.enums.PageType;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServiceAdherent implements IServiceAdherent {

  @Autowired
  private IAdherentDAO dao;

  @Override
  public String chartDataActif() {
    return this.dao.chartDataActif();
  }

  @Override
  public String chartDataNew() {
    return this.dao.chartDataNew();
  }

  @Override
  public String chartDataAnnee() {
    return this.dao.chartDataAnnee();
  }

  @Override
  public String chartDataInactif() {
    return this.dao.chartDataInactif();
  }

  @Override
  public Long countAdherents() {
    return this.dao.countAdherents();
  }

  @Override
  public Long countAdherentsInactif() {
    return this.dao.countAdherentsInactif();
  }

  @Override
  public Long countAdherentsSansEOLAS() {
    return this.dao.countAdherentsSansEOLAS();
  }

  @Override
  public void createActivite(final String libelle) {
    this.dao.createActivite(libelle);
  }

  @Override
  public int createAdherent(final Adherent datatAdherent) {
    return this.dao.createAdherent(datatAdherent);
  }

  @Override
  public void createAgence(final String libelle) {
    this.dao.createAgence(libelle);
  }

  @Override
  public void createContactAdherent(final AdherentContactRole contact) {
    this.dao.createContactAdherent(contact);
  }

  @Override
  public void createContactClubFemme(final ContactClubFemme contact) {
    this.dao.createContactClubFemme(contact);
  }

  @Override
  public void createContactRetraite(final ContactRetraite contact) {
    this.dao.createContactRetraite(contact);
  }

  @Override
  public void createContactFonction(final String libelle) {
    this.dao.createContactFonction(libelle);
  }

  @Override
  public void createPole(final String libelle) {
    this.dao.createPole(libelle);
  }

  @Override
  public void createRole(final String libelle) {
    this.dao.createRole(libelle);
  }

  @Override
  public void createSecteur(final String libelle) {
    this.dao.createSecteur(libelle);
  }

  @Override
  public void createSuiviAdherent(final AdherentSuiviVisite suivi) {
    this.dao.createSuiviAdherent(suivi);
  }

  @Override
  public void createUtilisateur(final String userName, final String password) {
    this.dao.createUtilisateur(userName, password);
  }

  @Override
  public Activite loadActivite(final int activiteId) {
    return this.dao.loadActivite(activiteId);
  }

  @Override
  public List<Activite> loadActivites() {
    return (List<Activite>) this.dao.loadActivites();
  }

  @Override
  public List<AdherentActivite> loadActivitesAdherent(final int idAdh) {
    return (List<AdherentActivite>) this.dao.loadActivitesAdherent(idAdh);
  }

  @Override
  public Adherent loadAdherent(final int idAdh) {
    return this.dao.loadAdherent(idAdh);
  }

  @Override
  public String loadAdherentCommentaire(final int idAdh, final PageType pageType) {
    return this.dao.loadAdherentCommentaire(idAdh, pageType);
  }

  @Override
  public List<AdherentContactRole> loadAdherentContact(final int adhId) {
    return (List<AdherentContactRole>) this.dao.loadAdherentContact(adhId);
  }

  @Override
  public AdherentContactComptable loadAdherentContactComptable(final int idAdh) {
    return this.dao.loadAdherentContactComptable(idAdh);
  }

  @Override
  public List<AdherentContactRole> loadAdherentContactFonction(final int adhId, final Boolean isDirigeant, final Boolean isCommerce, final Boolean isAdmin, final Boolean isCompta) {
    return (List<AdherentContactRole>) this.dao.loadAdherentContactFonction(adhId, isDirigeant, isCommerce, isAdmin, isCompta);
  }

  @Override
  public List<AdherentContactRole> loadAdherentContact(final CriteriaAdherent criteria) {
    return (List<AdherentContactRole>) this.dao.loadAdherentContact(criteria);
  }

  @Override
  public List<AdherentMetier> loadAdherentMetiers(final int idAdh) {
    return (List<AdherentMetier>) this.dao.loadAdherentMetiers(idAdh);
  }

  @Override
  public List<ContactRetraite> loadContactsRetraite() {
    return (List<ContactRetraite>) this.dao.loadContactsRetraite();
  }

  @Override
  public ContactClubFemme loadContactClubFemme(final int idAdh) {
    return this.dao.loadContactClubFemme(idAdh);
  }

  @Override
  public List<ContactClubFemme> loadContactsClubFemme() {
    return (List<ContactClubFemme>) this.dao.loadContactsClubFemme();
  }

  @Override
  public AdherentLogistique loadAdherentLogistique(final int idAdh) {
    return this.dao.loadAdherentLogistique(idAdh);
  }

  /**
   *
   * @param idAdh
   * @return
   */
  @Override
  public AdherentInformatique loadAdherentInformatique(final int idAdh) {
    return this.dao.loadAdherentInformatique(idAdh);
  }

  @Override
  public AdherentSuiviVisite loadAdherentSuiviVisite(final int suiviId) {
    return this.dao.loadAdherentSuiviVisite(suiviId);
  }

  /**
   *
   * @param adhId
   * @return
   */
  @Override
  public List<AdherentSuiviVisite> loadAdherentSuivisVisites(final int adhId) {
    return (List<AdherentSuiviVisite>) this.dao.loadAdherentSuivisVisites(adhId);
  }

  /**
   *
   * @param adhId
   * @param criteria
   * @return
   */
  @Override
  public List<AdherentSuiviVisite> loadAdherentSuivisVisites(final Integer adhId, final CriteriaCRM criteria) {
    return this.loadAdherentSuivisVisites(adhId).stream().filter(sv -> sv.getCommentaireString().contains(criteria.getText())).collect(Collectors.toList());
  }

  @Override
  public List<AdherentType> loadAdherentTypes() {
    return (List<AdherentType>) this.dao.loadAdherentTypes();
  }

  @Override
  public List<Adherent> loadAdherents() {
    return (List<Adherent>) this.dao.loadAdherents();
  }

  @Override
  public List<AdherentContactRole> loadAdherentsContact() {
    return (List<AdherentContactRole>) this.dao.loadAdherentsContact();
  }

  @Override
  public List<Adherent> loadAdherents(final CriteriaAdherent criteria) {
    return (List<Adherent>) this.dao.loadAdherents(criteria);
  }

  @Override
  public List<Agence> loadAgences() {
    return (List<Agence>) this.dao.loadAgences();
  }

  @Override
  public List<Ape> loadCodeApes() {
    return (List<Ape>) this.dao.loadApes();
  }

  @Override
  public List<Commune> loadCommunes() {
    return (List<Commune>) this.dao.loadCommunes();
  }

  @Override
  public List<CompteType> loadCompteTypes() {
    return (List<CompteType>) this.dao.loadCompteTypes();
  }

  /**
   *
   * @return
   */
  @Override
  public List<ContactFonction> loadContactFonctions() {
    return (List<ContactFonction>) this.dao.loadContactFonction();
  }

  @Override
  public List<AdherentEtat> loadEtats() {
    return (List<AdherentEtat>) this.dao.loadEtats();
  }

  @Override
  public List<FormeJuridique> loadFormesJuridiques() {
    return (List<FormeJuridique>) this.dao.loadFormesJuridiques();
  }

  @Override
  public List<Pole> loadPoles() {
    return (List<Pole>) this.dao.loadPoles();
  }

  @Override
  public List<Role> loadRoles() {
    return (List<Role>) this.dao.loadRoles();
  }

  @Override
  public List<RoleSalarieEOLAS> loadRolesEOLAS() {
    return (List<RoleSalarieEOLAS>) this.dao.loadRolesEOLAS();
  }

  @Override
  public List<Secteur> loadSecteurs() {
    return (List<Secteur>) this.dao.loadSecteurs();
  }

  @Override
  public List<Tournee> loadTournees() {
    return (List<Tournee>) this.dao.loadTournees();
  }

  @Override
  public User loadUtilisateur(final int userId) {
    return this.dao.loadUtilisateur(userId);
  }

  @Override
  public AdherentContactRole loadContact(final Integer contactId) {
    return this.dao.loadContact(contactId);
  }

  @Override
  public List<User> loadUtilisateurs() {
    return (List<User>) this.dao.loadUtilisateurs();
  }

  @Override
  public void saveActivites(final List<Activite> activites) {
    this.dao.saveActivites((List) activites);
  }

  @Override
  public void saveActivitesAdherent(final int adhId, final List<AdherentActivite> activitesAdh) {
    this.dao.saveActivitesAdherent(adhId, (List) activitesAdh);
  }

  @Override
  public void saveAdherent(final Adherent pAdherent) {
    this.dao.editAdherent(pAdherent);
  }

  @Override
  public void saveAdherentCommentaire(final int adhId, final PageType type, final String commentaire) {
    this.dao.saveAdherentCommentaire(adhId, type, commentaire);
  }

  @Override
  public void saveAdherentContacts(final List<AdherentContactRole> contacts) {
    this.dao.saveAdherentContacts((List) contacts);
  }

  @Override
  public void saveAdherentMetiers(final int adhId, final List<AdherentMetier> adherentMetiers) {
    this.dao.saveAdherentMetiers(adhId, (List) adherentMetiers);
  }

  @Override
  public void saveAdherentLogistique(final AdherentLogistique logistiqueAdh) {
    this.dao.saveAdherentLogistique(logistiqueAdh);
  }

  @Override
  public void saveAdherentSuiviVisite(final AdherentSuiviVisite suivi) {
    this.dao.saveAdherentSuiviVisite(suivi);
  }

  @Override
  public void saveAgences(final List<Agence> agences) {
    this.dao.saveAgences((List) agences);
  }

  @Override
  public void saveContactComptableAdherent(final AdherentContactComptable contact) {
    this.dao.saveContactComptableAdherent(contact);
  }

  @Override
  public void saveContactFonctions(final List<ContactFonction> contactFonctions) {
    this.dao.saveContactsFonctions((List) contactFonctions);
  }

  @Override
  public void savePoles(final List<Pole> poles) {
    this.dao.savePoles((List) poles);
  }

  @Override
  public void saveRoles(final List<Role> roles) {
    this.dao.saveRoles((List) roles);
  }

  @Override
  public void saveSecteurs(final List<Secteur> secteurs) {
    this.dao.saveSecteurs((List) secteurs);
  }

  @Override
  public void saveUtilisateur(final List<User> users) {
    this.dao.saveUtilisateur((List) users);
  }

  @Override
  public void saveUtilisateurRoles(final int usrId, final List<UserRole> newUserRoles) {
    this.dao.saveUtilisateurRoles(usrId, (List) newUserRoles);
  }

  @Override
  public void setAdherentImage(final int adhId, final byte[] photo) {
    this.dao.setAdherentImage(adhId, photo);
  }

  @Override
  public void setAdherentLogo(final int adhId, final byte[] logo) {
    this.dao.setAdherentLogo(adhId, logo);
  }

  @Override
  public void setContactImage(final int contactId, final byte[] bytes) {
    this.dao.setContactImage(contactId, bytes);
  }

  @Override
  public void supprimeActivite(final Integer id) {
    this.dao.supprimeActivite(id);
  }

  @Override
  public void supprimeAdherentContact(final Integer id) {
    this.dao.supprimeAdherentContact(id);
  }

  @Override
  public void supprimeAgence(final Integer id) {
    this.dao.supprimeAgence(id);
  }

  @Override
  public void supprimeContactFonction(final Integer id) {
    this.dao.supprimeContactFonction(id);
  }

  @Override
  public void supprimePole(final Integer id) {
    this.dao.supprimePole(id);
  }

  @Override
  public void supprimeRole(final Integer id) {
    this.dao.supprimeRole(id);
  }

  /**
   *
   * @param id
   */
  @Override
  public void supprimeSecteur(final Integer id) {
    this.dao.supprimeSecteur(id);
  }
}
