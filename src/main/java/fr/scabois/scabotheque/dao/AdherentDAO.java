package fr.scabois.scabotheque.dao;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.adherent.AdherentActivite;
import fr.scabois.scabotheque.bean.adherent.AdherentCommentaire;
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
import fr.scabois.scabotheque.enums.PageType;

@Repository
public class AdherentDAO implements IAdherentDAO {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    @Transactional
    public void createActivite(String libelle) {
	Activite newData = new Activite();
	newData.setLibelle(libelle);

	entityManager.persist(newData);
    }

    @Override
    @Transactional
    public int createAdherent(Adherent dataAdherent) {

	// chargement de l'adherent a modifier
	Adherent newAdh = new Adherent();

	// mise à jour des données
	updateAdherentData(newAdh, dataAdherent);

	// enregistrement de l'adherent
	entityManager.persist(newAdh);
	entityManager.flush();

	return newAdh.getId();
    }

    @Override
    @Transactional
    public void createAgence(String libelle) {
	Agence newData = new Agence();
	newData.setLibelle(libelle);

	entityManager.persist(newData);
    }

    @Override
    @Transactional
    public void createContactAdherent(AdherentContactRole contact) {
	AdherentContactRole newData = new AdherentContactRole();
	newData.setAdherent(contact.getAdherent());
	newData.setCivilite(contact.getCivilite());
	newData.setFixe(contact.getFixe());
	newData.setMail(contact.getMail());
	newData.setMobile(contact.getMobile());
	newData.setNaissance(contact.getNaissance());
	newData.setNom(contact.getNom());
	newData.setPhoto(contact.getPhoto());
	newData.setPrenom(contact.getPrenom());
	newData.setFonction(contact.getFonction());

	entityManager.persist(newData);

    }

    @Override
    @Transactional
    public void createContactFonction(String libelle) {
	ContactFonction newData = new ContactFonction();
	newData.setLibelle(libelle);

	entityManager.persist(newData);
    }

    @Override
    @Transactional
    public void createPole(String libelle) {
	Pole newData = new Pole();
	newData.setLibelle(libelle);

	entityManager.persist(newData);
    }

    @Override
    @Transactional
    public void createRole(String libelle) {
	Role newData = new Role();
	newData.setLibelle(libelle);

	entityManager.persist(newData);
    }

    @Override
    @Transactional
    public void createSecteur(String libelle) {
	Secteur newData = new Secteur();
	newData.setLibelle(libelle);

	entityManager.persist(newData);
    }

    @Override
    @Transactional
    public void createUtilisateur(String userName, String password) {
	User usr = new User();
	usr.setUsername(userName);
	usr.setPassword(password);

	entityManager.persist(usr);
    }

    @Override
    @Transactional
    public void editAdherent(Adherent dataAdherent) {

	// chargement de l'adherent a modifier
	Adherent bddAdherent = loadAdherent(dataAdherent.getId());

	// mise à jour des données
	updateAdherentData(bddAdherent, dataAdherent);

	// enregistrement de l'adherent
	entityManager.persist(bddAdherent);
    }

    @Override
    public Activite loadActivite(int activiteId) {
	try {
	    return entityManager.find(Activite.class, activiteId);
	} catch (NoResultException e) {
	    return null;
	}
    }

    @Override
    public List<Activite> loadActivites() {
	return entityManager.createQuery("from Activite", Activite.class).getResultList();
    }

    @Override
    public List<AdherentActivite> loadActivitesAdherent(int idAdh) {
	return entityManager.createQuery("from AdherentActivite where adherent.id = :idAdh", AdherentActivite.class)
		.setParameter("idAdh", idAdh).getResultList();
    }

    @Override
    public Adherent loadAdherent(int idAdh) {
	try {
	    return entityManager.find(Adherent.class, idAdh);
	} catch (NoResultException e) {
	    return null;
	}
    }

    @Override
    public String loadAdherentCommentaire(int idAdh, PageType type) {
	try {
	    AdherentCommentaire cmm = loadAdherentPageCommentaire(idAdh, type);

	    return cmm == null ? "" : cmm.getCommentaireString();
	} catch (NoResultException e) {
	    return "";
	}
    }

    /**
     * Création d'une liste avec tout les type de contacte
     */
    @Override
    public List<AdherentContactRole> loadAdherentContact(int adhId) {

	List<AdherentContactRole> contacts = entityManager
		.createQuery("from AdherentContactRole where adherent.id = :adhId", AdherentContactRole.class)
		.setParameter("adhId", adhId).getResultList();

	return contacts;
    }

    /**
     * Création d'une liste avec tout les type de contacte
     */
    @Override
//    public List<AdherentContactRole> loadAdherentContactFonction(int adhId, List<Integer> fonctionIds) {
    public List<AdherentContactRole> loadAdherentContactFonction(int adhId, Boolean isDirigeant, Boolean isCommerce,
	    Boolean isAdmin, Boolean isCompta) {

	List<AdherentContactRole> contacts = entityManager
		.createQuery("from AdherentContactRole where adherent.id = :adhId", AdherentContactRole.class)
		.setParameter("adhId", adhId).getResultList();

	// filtre sur les differents Type de Mailling
	List<AdherentContactRole> retour = new ArrayList<>();
	if (isDirigeant) {
	    retour.addAll(contacts.stream().filter(c -> c.getIsMailingDirigeant()).collect(Collectors.toList()));
	}
	if (isCommerce) {
	    retour.addAll(contacts.stream().filter(c -> c.getIsMailingCommerce()).collect(Collectors.toList()));
	}
	if (isAdmin) {
	    retour.addAll(contacts.stream().filter(c -> c.getIsMailingAdministratif()).collect(Collectors.toList()));
	}
	if (isCompta) {
	    retour.addAll(contacts.stream().filter(c -> c.getIsMailingCompta()).collect(Collectors.toList()));
	}

	return retour;
    }

    @Override
    public AdherentExploitation LoadAdherentExploitation(int idAdh) {
	try {
	    return entityManager.createQuery("from AdherentExploitation", AdherentExploitation.class).getSingleResult();
	} catch (NoResultException e) {
	    return new AdherentExploitation();
	}
    }

    private AdherentCommentaire loadAdherentPageCommentaire(int idAdh, PageType type) {
	try {
	    return entityManager
		    .createQuery("from AdherentCommentaire com where adherentId = :adhId and type = :type",
			    AdherentCommentaire.class)
		    .setParameter("adhId", idAdh).setParameter("type", type).getSingleResult();

	} catch (NoResultException e) {
	    return null;
	}
    }

    @Override
    public List<Adherent> loadAdherents() {
	return entityManager.createQuery("from Adherent", Adherent.class).getResultList();
    }

    @Override
    public List<Adherent> loadAdherents(CriteriaAdherent criteria) {

	List<Adherent> list = entityManager.createQuery("from Adherent adh", Adherent.class).getResultList();

	// filtre la liste des adherents sur les libellés
	return list.stream().filter(adh -> {
	    String libCompare = Normalizer.normalize(adh.getLibelle().toUpperCase(), Normalizer.Form.NFD)
		    .replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
	    String codeCompare = Normalizer.normalize(adh.getCode().toUpperCase(), Normalizer.Form.NFD)
		    .replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
	    String denomCompare = Normalizer.normalize(adh.getDenomination().toUpperCase(), Normalizer.Form.NFD)
		    .replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
	    String toCompare = Normalizer.normalize(criteria.getText().toUpperCase(), Normalizer.Form.NFD)
		    .replaceAll("\\p{InCombiningDiacriticalMarks}+", "");

	    boolean isLib = libCompare.contains(toCompare);
	    boolean isCode = codeCompare.contains(toCompare);
	    boolean isDenom = denomCompare.contains(toCompare);
	    List<Integer> activitiesId = loadActivitesAdherent(adh.getId()).stream().map(m -> m.getActivite().getId())
		    .collect(Collectors.toList());
	    boolean isActivite = criteria.getActiviteIds().stream().anyMatch(m -> activitiesId.contains(m) || m == 0);
	    boolean isPole = criteria.getPoleIds().get(0) == 0 ? true
		    : criteria.getPoleIds().contains(adh.getPole().getId());
	    boolean isSecteur = criteria.getSecteurIds().get(0) == 0 ? true
		    : criteria.getSecteurIds().contains(adh.getSecteur().getId());
	    boolean isActif = criteria.getShowAll() ? true : adh.getEtat().getId() == 1;
	    boolean isSousCompte = criteria.getShowSousCompte() ? true : adh.getCodeERPParent().isEmpty();
	    boolean isArtipole = criteria.isShowIsArtipole() ? adh.getIsArtipole() : true;

	    return (isLib || isDenom || isCode) && isPole && isSecteur && isActif && isSousCompte && isActivite
		    && isArtipole;
	}).collect(Collectors.toList());

    }

    @Override
    public List<Agence> loadAgences() {
	return entityManager.createQuery("from Agence", Agence.class).getResultList();
    }

    @Override
    public List<Ape> loadApes() {
	return entityManager.createQuery("from Ape", Ape.class).getResultList();
    }

    private Commune loadCommune(int communeId) {
	try {
	    return entityManager.find(Commune.class, communeId);
	} catch (NoResultException e) {
	    return null;
	}
    }

    @Override
    public List<Commune> loadCommunes() {
	return entityManager.createQuery("from Commune", Commune.class).getResultList();
    }

    @Override
    public List<ContactFonction> loadContactFonction() {
	return entityManager.createQuery("from ContactFonction", ContactFonction.class).getResultList();
    }

    @Override
    public List<Etat> loadEtats() {
	return entityManager.createQuery("from Etat", Etat.class).getResultList();
    }

    @Override
    public List<FormeJuridique> loadFormesJuridiques() {
	return entityManager.createQuery("from FormeJuridique", FormeJuridique.class).getResultList();
    }

    @Override
    public List<Pole> loadPoles() {
	return entityManager.createQuery("from Pole", Pole.class).getResultList();
    }

    @Override
    public List<Role> loadRoles() {
	return entityManager.createQuery("from Role", Role.class).getResultList();
    }

    @Override
    public List<Secteur> loadSecteurs() {
	return entityManager.createQuery("from Secteur", Secteur.class).getResultList();
    }

    @Override
    public List<Tournee> loadTournees() {
	return entityManager.createQuery("from Tournee", Tournee.class).getResultList();
    }

    @Override
    public User loadUtilisateur(int userId) {
	try {
	    return entityManager.find(User.class, userId);
	} catch (NoResultException e) {
	    return null;
	}
    }

    @Override
    public List<User> LoadUtilisateurs() {
	return entityManager.createQuery("from User", User.class).getResultList();
    }

    @Override
    @Transactional
    public void saveActivitesAdherent(int adhId, List<AdherentActivite> activitesAdh) {
	// suppression de toutes les activite de l'adherent pour enregistrer les
	// nouvelles
	loadActivitesAdherent(adhId).stream().forEach(a -> entityManager.remove(a));

	activitesAdh.stream().forEach(a -> entityManager.persist(a));
    }

    @Transactional
    @Override
    public void saveAdherentCommentaire(int adhId, PageType type, String commentaire) {

	AdherentCommentaire adhCommentaire = loadAdherentPageCommentaire(adhId, type);
	if (adhCommentaire == null) {
	    adhCommentaire = new AdherentCommentaire();
	    adhCommentaire.setAdherentId(adhId);
	    adhCommentaire.setType(type);
	    adhCommentaire.setCommentaireString(commentaire);
	} else {
	    adhCommentaire.setCommentaireString(commentaire);
	}

	entityManager.persist(adhCommentaire);

    }

    @Override
    @Transactional
    public void saveAdherentContacts(List<AdherentContactRole> contacts) {

	// Pour tout les contact de la liste
	contacts.stream().forEach(c -> {
	    AdherentContactRole adhContact = c.getId() == null ? new AdherentContactRole()
		    : entityManager.find(AdherentContactRole.class, c.getId());
	    updateAdherentContactData(adhContact, c);
	    entityManager.persist(adhContact);
	});
    }

    @Override
    @Transactional
    public void saveAgences(List<Agence> agences) {

	// Pour tout les contact de la liste
	agences.stream().forEach(a -> {
	    Agence agence = a.getId() == null ? new Agence() : entityManager.find(Agence.class, a.getId());
	    agence.setLibelle(a.getLibelle());
	    entityManager.persist(agence);
	});
    }

    @Override
    @Transactional
    public void saveContactsFonctions(List<ContactFonction> contactFonctions) {
	// Pour tout les contact de la liste
	contactFonctions.stream().forEach(a -> {
	    ContactFonction contactFonction = a.getId() == null ? new ContactFonction()
		    : entityManager.find(ContactFonction.class, a.getId());
	    contactFonction.setLibelle(a.getLibelle());
	    entityManager.persist(contactFonction);
	});
    }

    @Override
    @Transactional
    public void savePoles(List<Pole> poles) {
	// Pour tout les contact de la liste
	poles.stream().forEach(a -> {
	    Pole pole = a.getId() == null ? new Pole() : entityManager.find(Pole.class, a.getId());
	    pole.setLibelle(a.getLibelle());
	    entityManager.persist(pole);
	});
    }

    @Override
    @Transactional
    public void saveRoles(List<Role> roles) {
	// Pour tout les contact de la liste
	roles.stream().forEach(a -> {
	    Role role = a.getId() == null ? new Role() : entityManager.find(Role.class, a.getId());
	    role.setLibelle(a.getLibelle());
	    entityManager.persist(role);
	});
    }

    @Override
    @Transactional
    public void saveSecteurs(List<Secteur> secteurs) {
	// Pour tout les contact de la liste
	secteurs.stream().forEach(a -> {
	    Secteur secteur = a.getId() == null ? new Secteur() : entityManager.find(Secteur.class, a.getId());
	    secteur.setLibelle(a.getLibelle());
	    entityManager.persist(secteur);
	});
    }

    @Override
    @Transactional
    public void saveUtilisateur(List<User> users) {
	users.stream().forEach(u -> {
	    User utl = loadUtilisateur(u.getId());
	    utl.setEnabled(u.getEnabled());
	    utl.setPassword(u.getPassword());
	    utl.setUsername(u.getUsername());

	    entityManager.persist(utl);
	});
    }

    @Override
    @Transactional
    public void saveUtilisateurRoles(int usrId, List<UserRole> newUserRoles) {
	List<UserRole> usrRoles = entityManager.createQuery("from UserRole where user.id = :usrId", UserRole.class)
		.setParameter("usrId", usrId).getResultList();
	// suppression des anciens Roles
	usrRoles.stream().forEach(r -> {
	    Optional<UserRole> role = newUserRoles.stream().filter(ur -> ur.getId() == r.getId()).findFirst();
	    if (!role.isPresent()) {
		entityManager.remove(r);
	    }
	});

	// Ajout des nouveaux Roles
	newUserRoles.stream().forEach(r -> {
	    Optional<UserRole> role = usrRoles.stream().filter(f -> f.getId() == r.getId()).findFirst();
	    if (!role.isPresent()) {
		UserRole newRole = new UserRole();
		newRole.setRole(r.getRole());
		newRole.setUser(r.getUser());
		entityManager.persist(newRole);
	    }
	});
    }

    @Override
    @Transactional
    public void setAdherentImage(int adhId, byte[] photo) {
	Adherent adh = loadAdherent(adhId);
	adh.setPhoto(photo);

	entityManager.persist(adh);

    }

    @Override
    @Transactional
    public void setContactImage(int contactId, byte[] photo) {

	try {
	    AdherentContactRole contact = entityManager.find(AdherentContactRole.class, contactId);
	    contact.setPhoto(photo);
	    entityManager.persist(contact);

	} catch (NoResultException e) {
	}

    }

    @Override
    @Transactional
    public void supprimeActivite(Integer id) {
	Activite del = entityManager.find(Activite.class, id);
	entityManager.remove(del);
    }

    @Override
    @Transactional
    public void supprimeAdherentContact(Integer id) {
	AdherentContactRole del = entityManager.find(AdherentContactRole.class, id);
	entityManager.remove(del);
    }

    @Override
    @Transactional
    public void supprimeAgence(Integer id) {
	Agence del = entityManager.find(Agence.class, id);
	entityManager.remove(del);
    }

    @Override
    @Transactional
    public void supprimeContactFonction(Integer id) {
	ContactFonction del = entityManager.find(ContactFonction.class, id);
	entityManager.remove(del);
    }

    @Override
    @Transactional
    public void supprimePole(Integer id) {
	Pole del = entityManager.find(Pole.class, id);
	entityManager.remove(del);
    }

    @Override
    @Transactional
    public void supprimeRole(Integer id) {
	Role del = entityManager.find(Role.class, id);
	entityManager.remove(del);
    }

    @Override
    @Transactional
    public void supprimeSecteur(Integer id) {
	Secteur del = entityManager.find(Secteur.class, id);
	entityManager.remove(del);
    }

    private AdherentContactRole updateAdherentContactData(AdherentContactRole dbbContact,
	    AdherentContactRole adhContact) {

	dbbContact.setAdherent(adhContact.getAdherent());
	dbbContact.setCivilite(adhContact.getCivilite());
	dbbContact.setFixe(adhContact.getFixe());
	dbbContact.setFonction(adhContact.getFonction());
	dbbContact.setIsMailingAdministratif(adhContact.getIsMailingAdministratif());
	dbbContact.setIsMailingCommerce(adhContact.getIsMailingCommerce());
	dbbContact.setIsMailingCompta(adhContact.getIsMailingCompta());
	dbbContact.setIsMailingDirigeant(adhContact.getIsMailingDirigeant());
	dbbContact.setMail(adhContact.getMail());
	dbbContact.setMobile(adhContact.getMobile());
	dbbContact.setNaissance(adhContact.getNaissance());
	dbbContact.setNom(adhContact.getNom());
	dbbContact.setPhoto(adhContact.getPhoto());
	dbbContact.setPrenom(adhContact.getPrenom());

	return dbbContact;

    }

    private Adherent updateAdherentData(Adherent bddAdherent, Adherent adherent) {

	bddAdherent.setId(adherent.getId());
	bddAdherent.setCode(adherent.getCode());
	bddAdherent.setCodeERP(adherent.getCodeERP());
	bddAdherent.setCodeERPParent(adherent.getCodeERPParent());
	bddAdherent.setLibelle(adherent.getLibelle());
	bddAdherent.setDenomination(adherent.getDenomination());
	bddAdherent.setFormeJuridique(adherent.getFormeJuridique());
	bddAdherent.setDateEntree(adherent.getDateEntree());
	bddAdherent.setAdresse(adherent.getAdresse());
	bddAdherent.setAdresseComplement(adherent.getAdresseComplement());
	if (adherent.getCommune().getId() != null) {
	    bddAdherent.setCommune(loadCommune(adherent.getCommune().getId()));
	}
	bddAdherent.setPole(adherent.getPole());
	bddAdherent.setRole(adherent.getRole());
	bddAdherent.setSecteur(adherent.getSecteur());
	bddAdherent.setIsArtipole(adherent.getIsArtipole());
	bddAdherent.setIsCharteArtipole(adherent.getIsCharteArtipole());
	bddAdherent.setIsFlocageArtipole(adherent.getIsFlocageArtipole());
	bddAdherent.setIsWebArtipole(adherent.getIsWebArtipole());
	bddAdherent.setIsFormationCommerce(adherent.getIsFormationCommerce());
	bddAdherent.setIsFacebookArtipole(adherent.getIsFacebookArtipole());
	bddAdherent.setApe(adherent.getApe());
	bddAdherent.setSiren(adherent.getSiren());
	bddAdherent.setSiret(adherent.getSiret());
	bddAdherent.setNumRepMetier(adherent.getNumRepMetier());
	bddAdherent.setRcsRm(adherent.getRcsRm());
	if (adherent.getRcsCommune().getId() != null) {
	    bddAdherent.setRcsCommune(loadCommune(adherent.getRcsCommune().getId()));
	}
//	if (adherent.getRmCommune().getId() != null) {
//	    bddAdherent.setRmCommune(loadCommune(adherent.getRmCommune().getId()));
//	}
	bddAdherent.setAgence(adherent.getAgence());
	bddAdherent.setDateClotureExe(adherent.getDateClotureExe());
	bddAdherent.setTournee(adherent.getTournee());
	bddAdherent.setOutilDechargement(adherent.getIsOutilDechargement());
	bddAdherent.setContactComptable(adherent.getContactComptable());
	bddAdherent.setEtat(adherent.getEtat());

	return bddAdherent;
    }

}