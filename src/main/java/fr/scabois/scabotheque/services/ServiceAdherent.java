package fr.scabois.scabotheque.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.adherent.AdherentActivite;
import fr.scabois.scabotheque.bean.adherent.AdherentContactRole;
import fr.scabois.scabotheque.bean.adherent.AdherentExploitation;
import fr.scabois.scabotheque.bean.adherent.Etat;
import fr.scabois.scabotheque.bean.adherent.FormeJuridique;
import fr.scabois.scabotheque.bean.adherent.Pole;
import fr.scabois.scabotheque.bean.adherent.Role;
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
import fr.scabois.scabotheque.dao.IAdherentDAO;
import fr.scabois.scabotheque.enums.PageType;

@Service
public class ServiceAdherent implements IServiceAdherent {

    @Autowired
    private IAdherentDAO dao;

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
    public void createUtilisateur(String userName, String password) {
	dao.createUtilisateur(userName, password);
    }

    @Override
    public Activite LoadActivite(int activiteId) {
	return dao.loadActivite(activiteId);
    }

    @Override
    public List<Activite> LoadActivites() {
	return dao.loadActivites();
    }

//    @Override
//    public Map<TypeContact, List<AdherentContact>> LoadAdherentContact(int adhId) {
//	return dao.loadAdherentContact(adhId);
//    }

    @Override
    public List<AdherentActivite> LoadActivitesAdherent(int idAdh) {
	return dao.loadActivitesAdherent(idAdh);
    }

    @Override
    public Adherent LoadAdherent(int idAdh) {
	return dao.loadAdherent(idAdh);
    }

    @Override
    public String LoadAdherentCommentaire(int idAdh, PageType pageType) {
	return dao.loadAdherentCommentaire(idAdh, pageType);
    }

    @Override
    public List<AdherentContactRole> LoadAdherentContact(int adhId) {
	return dao.loadAdherentContact(adhId);
    }

    @Override
    public List<AdherentContactRole> loadAdherentContactFonction(int adhId, Boolean isDirigeant, Boolean isCommerce,
	    Boolean isAdmin, Boolean isCompta) {
	return dao.loadAdherentContactFonction(adhId, isDirigeant, isCommerce, isAdmin, isCompta);
    }

    @Override
    public AdherentExploitation LoadAdherentExploitation(int idAdh) {
	return dao.LoadAdherentExploitation(idAdh);
    }

    @Override
    public List<Adherent> LoadAdherents() {
	return dao.loadAdherents();
    }

    @Override
    public List<Adherent> LoadAdherents(CriteriaAdherent criteria) {
	return dao.loadAdherents(criteria);
    }

    @Override
    public List<Agence> LoadAgences() {
	return dao.loadAgences();
    }

    @Override
    public List<Ape> LoadCodeApes() {
	return dao.loadApes();
    }

    @Override
    public List<Commune> LoadCommunes() {
	return dao.loadCommunes();
    }

    @Override
    public List<ContactFonction> LoadContactFonctions() {
	return dao.loadContactFonction();
    }

    @Override
    public List<Etat> LoadEtats() {
	return dao.loadEtats();
    }

    @Override
    public List<FormeJuridique> LoadFormesJuridiques() {
	return dao.loadFormesJuridiques();
    }

    @Override
    public List<Pole> LoadPoles() {
	return dao.loadPoles();
    }

    @Override
    public List<Role> LoadRoles() {
	return dao.loadRoles();
    }

    @Override
    public List<Secteur> LoadSecteurs() {
	return dao.loadSecteurs();
    }

    @Override
    public List<Tournee> LoadTournees() {
	return dao.loadTournees();
    }

    @Override
    public User LoadUtilisateur(int userId) {
	return dao.loadUtilisateur(userId);
    }

    @Override
    public List<User> LoadUtilisateurs() {
	return dao.LoadUtilisateurs();
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
    public void saveAgences(List<Agence> agences) {
	dao.saveAgences(agences);

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