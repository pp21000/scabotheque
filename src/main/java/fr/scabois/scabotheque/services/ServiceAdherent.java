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
import fr.scabois.scabotheque.dao.IAdherentDAO;
import fr.scabois.scabotheque.enums.PageType;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author dslowensky
 */
@Service
public class ServiceAdherent implements IServiceAdherent {

  @Autowired
  private IAdherentDAO dao;

  @Override
  public String chartDataActif() {
    return dao.chartDataActif();
  }

  @Override
  public String chartDataNew() {
    return dao.chartDataNew();
  }

  @Override
  public String chartDataAnnee() {
    return dao.chartDataAnnee();
  }

  @Override
  public String chartDataInactif() {
    return dao.chartDataInactif();
  }

  @Override
  public Long countAdherents() {
    return dao.countAdherents();
  }

  @Override
  public Long countAdherentsInactif() {
    return dao.countAdherentsInactif();
  }

  @Override
  public Long countAdherentsSansEOLAS() {
    return dao.countAdherentsSansEOLAS();
  }

  @Override
  public void createActivite(String libelle) {
    dao.createActivite(libelle);
  }

  @Override
  public int createAdherent(Adherent datatAdherent) {
    return dao.createAdherent(datatAdherent);
  }

  @Override
  public void createAgence(String libelle) {
    dao.createAgence(libelle);

  }

  @Override
  public void createContactAdherent(AdherentContactRole contact) {
    dao.createContactAdherent(contact);
  }

  @Override
  public void createContactFonction(String libelle) {
    dao.createContactFonction(libelle);
  }

  @Override
  public void createPole(String libelle) {
    dao.createPole(libelle);
  }

  @Override
  public void createRole(String libelle) {
    dao.createRole(libelle);
  }

  @Override
  public void createSecteur(String libelle) {
    dao.createSecteur(libelle);
  }

  @Override
  public void createSuiviAdherent(AdherentSuiviVisite suivi) {
    dao.createSuiviAdherent(suivi);
  }

  @Override
  public void createUtilisateur(String userName, String password) {
    dao.createUtilisateur(userName, password);
  }

  @Override
  public Activite loadActivite(int activiteId) {
    return dao.loadActivite(activiteId);
  }

  @Override
  public List<Activite> loadActivites() {
    return dao.loadActivites();
  }

  @Override
  public List<AdherentActivite> loadActivitesAdherent(int idAdh) {
    return dao.loadActivitesAdherent(idAdh);
  }

  @Override
  public Adherent loadAdherent(int idAdh) {
    return dao.loadAdherent(idAdh);
  }

  @Override
  public String loadAdherentCommentaire(int idAdh, PageType pageType) {
    return dao.loadAdherentCommentaire(idAdh, pageType);
  }

  @Override
  public List<AdherentContactRole> loadAdherentContact(int adhId) {
    return dao.loadAdherentContact(adhId);
  }

  @Override
  public AdherentContactComptable loadAdherentContactComptable(int idAdh) {
    return dao.loadAdherentContactComptable(idAdh);
  }

  @Override
  public List<AdherentContactRole> loadAdherentContactFonction(int adhId, Boolean isDirigeant, Boolean isCommerce,
          Boolean isAdmin, Boolean isCompta) {
    return dao.loadAdherentContactFonction(adhId, isDirigeant, isCommerce, isAdmin, isCompta);
  }

  @Override
  public List<AdherentContactRole> loadAdherentContact(CriteriaAdherent criteria) {
    return dao.loadAdherentContact(criteria);
  }

  @Override
  public AdherentExploitation loadAdherentExploitation(int idAdh) {
    return dao.loadAdherentExploitation(idAdh);
  }

  @Override
  public AdherentInformatique loadAdherentInformatique(int idAdh) {
    return dao.loadAdherentInformatique(idAdh);
  }

  @Override
  public AdherentSuiviVisite loadAdherentSuiviVisite(int suiviId) {
    return dao.loadAdherentSuiviVisite(suiviId);
  }

  @Override
  public List<AdherentSuiviVisite> loadAdherentSuivisVisites(int adhId) {
    return dao.loadAdherentSuivisVisites(adhId);
  }

  @Override
  public List<AdherentSuiviVisite> loadAdherentSuivisVisites(Integer adhId, CriteriaCRM criteria) {
    return loadAdherentSuivisVisites(adhId).stream().filter(sv -> sv.getCommentaireString().contains(criteria.getText())).collect(Collectors.toList());
  }

  @Override
  public List<AdherentType> loadAdherentTypes() {
    return dao.loadAdherentTypes();
  }

  @Override
  public List<Adherent> loadAdherents() {
    return dao.loadAdherents();
  }

  @Override
  public List<AdherentContactRole> loadAdherentsContact() {
    return dao.loadAdherentsContact();
  }

  @Override
  public List<Adherent> loadAdherents(CriteriaAdherent criteria) {
    return dao.loadAdherents(criteria);
  }

  @Override
  public List<Agence> loadAgences() {
    return dao.loadAgences();
  }

  @Override
  public List<Ape> loadCodeApes() {
    return dao.loadApes();
  }

  @Override
  public List<Commune> loadCommunes() {
    return dao.loadCommunes();
  }

  @Override
  public List<CompteType> loadCompteTypes() {
    return dao.loadCompteTypes();
  }

  @Override
  public List<ContactFonction> loadContactFonctions() {
    return dao.loadContactFonction();
  }

  @Override
  public List<AdherentEtat> loadEtats() {
    return dao.loadEtats();
  }

  @Override
  public List<FormeJuridique> loadFormesJuridiques() {
    return dao.loadFormesJuridiques();
  }

  @Override
  public List<Pole> loadPoles() {
    return dao.loadPoles();
  }

  @Override
  public List<Role> loadRoles() {
    return dao.loadRoles();
  }

  @Override
  public List<RoleSalarieEOLAS> loadRolesEOLAS() {
    return dao.loadRolesEOLAS();
  }

  @Override
  public List<Secteur> loadSecteurs() {
    return dao.loadSecteurs();
  }

  @Override
  public List<Tournee> loadTournees() {
    return dao.loadTournees();
  }

  @Override
  public User loadUtilisateur(int userId) {
    return dao.loadUtilisateur(userId);
  }

  @Override
  public List<User> loadUtilisateurs() {
    return dao.loadUtilisateurs();
  }

  @Override
  public void saveActivites(List<Activite> activites) {
    dao.saveActivites(activites);
  }

  @Override
  public void saveActivitesAdherent(int adhId, List<AdherentActivite> activitesAdh) {
    dao.saveActivitesAdherent(adhId, activitesAdh);
  }

  @Override
  public void saveAdherent(Adherent pAdherent) {
    dao.editAdherent(pAdherent);
  }

  @Override
  public void saveAdherentCommentaire(int adhId, PageType type, String commentaire) {
    dao.saveAdherentCommentaire(adhId, type, commentaire);
  }

  @Override
  public void saveAdherentContacts(List<AdherentContactRole> contacts) {
    dao.saveAdherentContacts(contacts);
  }

  @Override
  public void saveAdherentSuiviVisite(AdherentSuiviVisite suivi) {
    dao.saveAdherentSuiviVisite(suivi);
  }

  @Override
  public void saveAgences(List<Agence> agences) {
    dao.saveAgences(agences);

  }

  @Override
  public void saveContactComptableAdherent(AdherentContactComptable contact) {
    dao.saveContactComptableAdherent(contact);
  }

  @Override
  public void saveContactFonctions(List<ContactFonction> contactFonctions) {
    dao.saveContactsFonctions(contactFonctions);
  }

  @Override
  public void savePoles(List<Pole> poles) {
    dao.savePoles(poles);
  }

  @Override
  public void saveRoles(List<Role> roles) {
    dao.saveRoles(roles);
  }

  @Override
  public void saveSecteurs(List<Secteur> secteurs) {
    dao.saveSecteurs(secteurs);
  }

  @Override
  public void saveUtilisateur(List<User> users) {
    dao.saveUtilisateur(users);
  }

  @Override
  public void saveUtilisateurRoles(int usrId, List<UserRole> newUserRoles) {
    dao.saveUtilisateurRoles(usrId, newUserRoles);
  }

  @Override
  public void setAdherentImage(int adhId, byte[] photo) {
    dao.setAdherentImage(adhId, photo);
  }

  @Override
  public void setContactImage(int contactId, byte[] bytes) {
    dao.setContactImage(contactId, bytes);
  }

  @Override
  public void supprimeActivite(Integer id) {
    dao.supprimeActivite(id);
  }

  @Override
  public void supprimeAdherentContact(Integer id) {
    dao.supprimeAdherentContact(id);
  }

  @Override
  public void supprimeAgence(Integer id) {
    dao.supprimeAgence(id);
  }

  @Override
  public void supprimeContactFonction(Integer id) {
    dao.supprimeContactFonction(id);
  }

  @Override
  public void supprimePole(Integer id) {
    dao.supprimePole(id);
  }

  @Override
  public void supprimeRole(Integer id) {
    dao.supprimeRole(id);
  }

  @Override
  public void supprimeSecteur(Integer id) {
    dao.supprimeSecteur(id);
  }

}
