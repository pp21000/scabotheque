package fr.scabois.scabotheque.dao;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.adherent.AdherentActivite;
import fr.scabois.scabotheque.bean.adherent.AdherentCertification;
import fr.scabois.scabotheque.bean.adherent.AdherentCommentaire;
import fr.scabois.scabotheque.bean.adherent.AdherentContactComptable;
import fr.scabois.scabotheque.bean.adherent.AdherentContactRole;
import fr.scabois.scabotheque.bean.adherent.AdherentEtat;
import fr.scabois.scabotheque.bean.adherent.AdherentInformatique;
import fr.scabois.scabotheque.bean.adherent.AdherentLogistique;
import fr.scabois.scabotheque.bean.adherent.AdherentMetier;
import fr.scabois.scabotheque.bean.adherent.AdherentSpecialite;
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
import fr.scabois.scabotheque.bean.commun.ActiviteFamille;
import fr.scabois.scabotheque.bean.commun.Agence;
import fr.scabois.scabotheque.bean.commun.Ape;
import fr.scabois.scabotheque.bean.commun.Commune;
import fr.scabois.scabotheque.bean.commun.ContactFonction;
import fr.scabois.scabotheque.bean.security.User;
import fr.scabois.scabotheque.bean.security.UserRole;
import fr.scabois.scabotheque.controller.adherent.CriteriaAdherent;
import fr.scabois.scabotheque.controller.security.LoginController;
import fr.scabois.scabotheque.enums.PageType;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class AdherentDAO implements IAdherentDAO {

  private int startYear;
  @PersistenceContext
  private EntityManager entityManager;
  private static final Logger log;

  public AdherentDAO() {
    this.startYear = 2008;
  }

  @Override
  public String chartDataActif() {
    String ret = "";
    for (int year = startYear; year <= Calendar.getInstance().get(Calendar.YEAR); year++) {
      TypedQuery<Long> query = entityManager.createQuery("select count(*) from Adherent "
              + "where etat_id = 1 "
              + "and adherentType_id = 1"
              + "and date_entree <= :date",
              Long.class)
              .setParameter("date", year + "-12-31");

      ret += query.getSingleResult() + ",";
    };

    return ret;
  }

  @Override
  public String chartDataNew() {
    String ret = "";
    for (int year = startYear; year <= Calendar.getInstance().get(Calendar.YEAR); year++) {
      TypedQuery<Long> query = entityManager.createQuery("select count(*) from Adherent "
              + "where etat_id = 1 "
              + "and adherentType_id = 1"
              + "and date_entree between :dateDeb and :dateFin",
              Long.class)
              .setParameter("dateDeb", year + "-01-01")
              .setParameter("dateFin", year + "-12-31");

      ret += query.getSingleResult() + ",";
    };

    return ret;
  }

  @Override
  public String chartDataAnnee() {
    String ret = "";
    for (int year = startYear; year <= Calendar.getInstance().get(Calendar.YEAR); year++) {
      ret += year + ",";
    };

    return ret;
  }

  @Override
  public String chartDataInactif() {
    return "";
//    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
  }

  @Override
  public Long countAdherents() {
    TypedQuery<Long> query = entityManager.createQuery("select count(*) from Adherent where etat_id = 1", Long.class);
    return query.getSingleResult();
  }

  @Override
  public Long countAdherentsInactif() {
    TypedQuery<Long> query = entityManager.createQuery("select count(*) from Adherent where etat_id = 2", Long.class);
    return query.getSingleResult();
  }

  @Override
  public Long countAdherentsSansEOLAS() {
    TypedQuery<Long> query = entityManager.createQuery("select count(*) from Adherent where cnx_eolas_authorise = 0", Long.class);
    return query.getSingleResult();
  }

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

  @Transactional
  public void createContactClubFemme(final ContactClubFemme contact) {
    final ContactClubFemme newContact = new ContactClubFemme();
    newContact.setAdherent(contact.getAdherent());
    newContact.setCivilite(contact.getCivilite());
    newContact.setNom(contact.getNom());
    newContact.setPrenom(contact.getPrenom());
    newContact.setMail(contact.getMail());
    newContact.setFixe(contact.getFixe());
    newContact.setMobile(contact.getMobile());
    newContact.setDateNaissance(contact.getDateNaissance());
    newContact.setAdresse(contact.getAdresse());
    newContact.setAdresseComplement(contact.getAdresseComplement());
    newContact.setCommune(contact.getCommune());
    this.entityManager.persist((Object) newContact);
  }

  @Transactional
  @Override
  public void createContactRetraite(final ContactRetraite contact) {
    final ContactRetraite newContact = new ContactRetraite();
    newContact.setAdherent(contact.getAdherent());
    newContact.setCivilite(contact.getCivilite());
    newContact.setNom(contact.getNom());
    newContact.setPrenom(contact.getPrenom());
    newContact.setMail(contact.getMail());
    newContact.setFixe(contact.getFixe());
    newContact.setMobile(contact.getMobile());
    newContact.setDateNaissance(contact.getDateNaissance());
    newContact.setAdresse(contact.getAdresse());
    newContact.setAdresseComplement(contact.getAdresseComplement());
    newContact.setCommune(contact.getCommune());
    this.entityManager.persist(newContact);
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
    newData.setDateNaissance(contact.getDateNaissance());
    newData.setNom(contact.getNom());
    newData.setPhoto(contact.getPhoto());
    newData.setPrenom(contact.getPrenom());
    newData.setFonction(contact.getFonction());
    newData.setRoleSalarieEOLASId(contact.getRoleSalarieEOLASId());

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
  public void createSuiviAdherent(AdherentSuiviVisite suivi) {
    entityManager.persist(suivi);
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

    // chargement de l'adherent à modifier
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
    return entityManager.createQuery("from Activite order by position", Activite.class).getResultList();
  }

  @Override
  public List<AdherentActivite> loadActivitesAdherent(int idAdh) {
    List<AdherentActivite> retour = new ArrayList<>();
    Adherent adherent = loadAdherent(idAdh);
//        log.info("id:" + idAdh);
    // recherche de toutes les activités
    List<Activite> activites = loadActivites();

    // recherche des activités renseignées
    List<AdherentActivite> adhActivites = entityManager.createQuery("from AdherentActivite where adherent.id = :idAdh", AdherentActivite.class)
            .setParameter("idAdh", idAdh).getResultList();

    // alimentation de la liste de retour
    activites.stream().forEach(a -> {
      // recherche si une ActiviteAdh est renseignée
      Optional<AdherentActivite> aa = adhActivites.stream().filter(ad -> ad.getActivite().getId().equals(a.getId())).findFirst();
      if (aa.isPresent()) {
        retour.add(aa.get());
        loadAchat(aa.get());
        loadAchatDate(aa.get());
      } else {
        AdherentActivite naa = new AdherentActivite();
        naa.setActivite(a);
        naa.setAdherent(adherent);
//                naa.setCommentaire("Création par la DAO");
        naa.setPourcentage(0);
        loadAchat(naa);
        loadAchatDate(naa);
        retour.add(naa);
      }
    });

    // Ajout de la ligne de total.
    AdherentActivite naa = new AdherentActivite();
    //            naa.setActivite(a);
    naa.setAdherent(adherent);
    naa.setPourcentage(0);
    loadTotalAchat(naa);
    loadTotalAchatDate(naa);
    retour.add(naa);

    return retour;
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
   * Création d'une liste avec tout les types de contact
   */
  @Override
  public List<AdherentContactRole> loadAdherentContact(final int adhId) {
    return this.entityManager.createQuery("from AdherentContactRole where adherent.id = :adhId", AdherentContactRole.class).setParameter("adhId", adhId).getResultList();
  }

  @Override
  public List<AdherentMetier> loadAdherentMetiers(final int adhId) {
    return this.entityManager.createQuery("from AdherentMetier where adherentId = :adhId", AdherentMetier.class).setParameter("adhId", adhId).getResultList();
  }

  @Override
  public List<AdherentCertification> loadAdherentCertifications(final int adhId) {
    return this.entityManager.createQuery("from AdherentCertification where adherentId = :adhId", AdherentCertification.class).setParameter("adhId", adhId).getResultList();
  }

  @Override
  public List<AdherentSpecialite> loadAdherentSpecialites(final int adhId) {
    return this.entityManager.createQuery("from AdherentSpecialite where adherentId = :adhId", AdherentSpecialite.class).setParameter("adhId", adhId).getResultList();
  }

  @Override
  public List<AdherentContactRole> loadAdherentContact(final CriteriaAdherent criteria) {
    final List<AdherentContactRole> list = (List<AdherentContactRole>) this.entityManager.createQuery("from AdherentContactRole adh", AdherentContactRole.class).getResultList();
    return list.stream().filter(ctt -> {
      final String nomCompare = Normalizer.normalize(ctt.getNom().toUpperCase(), Normalizer.Form.NFD).replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
      final String prenomCompare = Normalizer.normalize(ctt.getPrenom().toUpperCase(), Normalizer.Form.NFD).replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
      final String mailCompare = Normalizer.normalize(ctt.getMail().toUpperCase(), Normalizer.Form.NFD).replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
      final String libAdhCompare = Normalizer.normalize(ctt.getAdherent().getLibelle().toUpperCase(), Normalizer.Form.NFD).replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
      final String toCompare = Normalizer.normalize((criteria.getText() == null) ? "" : criteria.getText().toUpperCase(), Normalizer.Form.NFD).replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
      final boolean isLib = nomCompare.contains(toCompare);
      final boolean isCode = prenomCompare.contains(toCompare);
      final boolean isMail = mailCompare.contains(toCompare);
      final boolean isNom = libAdhCompare.contains(toCompare);
      final boolean isActivite = true;
      final boolean isAgence = (criteria.getAgenceIds().get(0) == 0 || criteria.getAgenceIds().contains(ctt.getAdherent().getAgence().getId()));
      final boolean isTypeAdh = (criteria.getTypeAdhIds().get(0) == 0 || criteria.getTypeAdhIds().contains(ctt.getAdherent().getAdherentType().getId()));
      final boolean isFonctionCtct = (criteria.getContactFonctionIds().get(0) == 0 || criteria.getContactFonctionIds().contains(ctt.getFonction().getId()));
      final boolean isPole = (criteria.getPoleIds().get(0) == 0 || criteria.getPoleIds().contains(ctt.getAdherent().getPole().getId()));
      final boolean isSecteur = (criteria.getSecteurIds().get(0) == 0 || criteria.getSecteurIds().contains(ctt.getAdherent().getSecteur().getId()));
      final boolean isActif = true;
      final boolean isSousCompte = (criteria.getShowSousCompte() || ctt.getAdherent().getCodeERPParent().isEmpty());
      final boolean isArtipole = (!criteria.isShowArtipoleOnly() || ctt.getAdherent().getIsArtipole());
      final boolean isAdministrateur = (!criteria.isShowAdminOnly() || (ctt.getAdherent().getRole().getId().equals(2) || ctt.getAdherent().getRole().getId().equals(3) || ctt.getAdherent().getRole().getId().equals(4)));
      return (isLib || isCode || isMail || isNom) && isPole && isSecteur && isActif && isSousCompte && isActivite && isAgence && isTypeAdh && isFonctionCtct && isArtipole && isAdministrateur;
    }).collect(Collectors.toList());
  }

  @Override
  public AdherentContactComptable loadAdherentContactComptable(int idAdh) {
    try {
      return entityManager.createQuery("from AdherentContactComptable where adherentId = :adhId", AdherentContactComptable.class)
              .setParameter("adhId", idAdh)
              .getSingleResult();
    } catch (NoResultException e) {
      return new AdherentContactComptable(idAdh);
    }
  }

  @Override
  public List<ContactRetraite> loadContactsRetraite() {
    return (List<ContactRetraite>) this.entityManager.createQuery("from ContactRetraite cr", (Class) ContactRetraite.class).getResultList();
  }

  @Override
  public ContactClubFemme loadContactClubFemme(final int idAdh) {
    try {
      return (ContactClubFemme) this.entityManager.createQuery("from ContactClubFemme ccf where ccf.id = :id", (Class) ContactClubFemme.class).setParameter("id", (Object) idAdh).getSingleResult();
    } catch (NoResultException e) {
      return new ContactClubFemme();
    }
  }

  public List<ContactClubFemme> loadContactsClubFemme() {
    return (List<ContactClubFemme>) this.entityManager.createQuery("from ContactClubFemme ccf", (Class) ContactClubFemme.class).getResultList();
  }

  /**
   * Création d'une liste avec tout les types de contacte
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
  public AdherentLogistique loadAdherentLogistique(final int idAdh) {
    try {
      return (AdherentLogistique) this.entityManager.createQuery("from AdherentLogistique where adherent_id = :id", (Class) AdherentLogistique.class).setParameter("id", (Object) idAdh).getSingleResult();
    } catch (NoResultException e) {
      final AdherentLogistique retour = new AdherentLogistique();
      retour.setAdherentId(Integer.valueOf(idAdh));
      return retour;
    }
  }

  @Override
  public AdherentInformatique loadAdherentInformatique(int idAdh) {
    try {
      return entityManager
              .createQuery("from AdherentInformatique info where adherentId = :adhId",
                      AdherentInformatique.class)
              .setParameter("adhId", idAdh).getSingleResult();
    } catch (NoResultException e) {
      return new AdherentInformatique();
    }
  }

  @Override
  public AdherentSuiviVisite loadAdherentSuiviVisite(int suiviId) {
    try {
      return entityManager.createQuery("from AdherentSuiviVisite where id = :suiviId", AdherentSuiviVisite.class)
              .setParameter("suiviId", suiviId)
              .getSingleResult();
    } catch (NoResultException e) {
      return null;
    }
  }

  @Override
  public List<AdherentSuiviVisite> loadAdherentSuivisVisites(int idAdh) {
    return entityManager.createQuery("from AdherentSuiviVisite where adherentId = :adhId order by dateCommentaire desc", AdherentSuiviVisite.class)
            .setParameter("adhId", idAdh).getResultList();
  }

  @Override
  public List<AdherentType> loadAdherentTypes() {
    return entityManager.createQuery("from AdherentType", AdherentType.class).getResultList();
  }

  /**
   * Chargement de tous les adhenrents
   *
   * @return Liste de tous le adherents
   */
  @Override
  public List<Adherent> loadAdherents() {
    return entityManager.createQuery("from Adherent", Adherent.class).getResultList();
  }

  /**
   * Chargement de tous les adhenrents
   *
   * @return Liste de tous le adherents
   */
  @Override
  public List<AdherentContactRole> loadAdherentsContact() {
    return entityManager.createQuery("from AdherentContactRole", AdherentContactRole.class).getResultList();
  }

  /**
   * @param criteria Recherche de la liste des adherents correspondant aux
   * critéres
   * @return Liste des adhérents
   */
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
      List<String> mailsCompare = adh.getContacts().stream().map(c -> Normalizer.normalize(c.getMail().toUpperCase(), Normalizer.Form.NFD)
              .replaceAll("\\p{InCombiningDiacriticalMarks}+", "")).collect(Collectors.toList());
      List<String> nomsCompare = adh.getContacts().stream().map(c -> Normalizer.normalize(c.getNom().toUpperCase(), Normalizer.Form.NFD)
              .replaceAll("\\p{InCombiningDiacriticalMarks}+", "")).collect(Collectors.toList());
      String toCompare = Normalizer.normalize((criteria.getText() == null ? "" : criteria.getText().toUpperCase()), Normalizer.Form.NFD)
              .replaceAll("\\p{InCombiningDiacriticalMarks}+", "");

      boolean isLib = libCompare.contains(toCompare);
      boolean isCode = codeCompare.contains(toCompare);
      boolean isDenom = denomCompare.contains(toCompare);
      boolean isMail = mailsCompare.stream().anyMatch(mail -> mail.contains(toCompare));
      boolean isNom = nomsCompare.stream().anyMatch(nom -> nom.contains(toCompare));

//            List<Integer> activitiesId = loadActivitesAdherent(adh.getId()).stream().map(m -> m.getActivite().getId())
//                    .collect(Collectors.toList());
      boolean isActivite = true; //criteria.getActiviteIds().stream().anyMatch(m -> activitiesId.contains(m) || m == 0);
      boolean isAgence = criteria.getAgenceIds().get(0) == 0 ? true
              : criteria.getAgenceIds().contains(adh.getAgence().getId());
      boolean isTypeAdh = criteria.getTypeAdhIds().get(0) == 0 ? true
              : criteria.getTypeAdhIds().contains(adh.getAdherentType().getId());
      boolean isPole = criteria.getPoleIds().get(0) == 0 ? true
              : criteria.getPoleIds().contains(adh.getPole().getId());
      boolean isSecteur = criteria.getSecteurIds().get(0) == 0 ? true
              : criteria.getSecteurIds().contains(adh.getSecteur().getId());
      boolean isActif = criteria.getShowAll() ? true : adh.getEtat().getId() == 1;
      boolean isSousCompte = criteria.getShowSousCompte() ? true : adh.getCodeERPParent().isEmpty();
      boolean isArtipole = criteria.isShowArtipoleOnly() ? adh.getIsArtipole() : true;
      boolean isAdministrateur = criteria.isShowAdminOnly() ? (adh.getRole().getId().equals(2) || adh.getRole().getId().equals(3) || adh.getRole().getId().equals(4)) : true;
//            boolean isChoisey = criteria.getShowChoisey() ? (adh.getAgence().getId() == 1) : false;
//            boolean isBart = criteria.getShowBart()? (adh.getAgence().getId() == 2) : false;

//            boolean test = (isLib || isDenom || isCode || isMail) && isPole && isSecteur && isActif && isSousCompte && isActivite && isArtipole && isAdministrateur && (isChoisey || isBart);
//
//            if (!test ){
//                test = true;
//            }
      return (isLib || isDenom || isCode || isMail || isNom) && isPole && isSecteur && isActif && isSousCompte && isActivite && isAgence && isTypeAdh
              && isArtipole && isAdministrateur; //&& (isChoisey || isBart) ;
    }).collect(Collectors.toList());

  }

  @Override
  public List<Agence> loadAgences() {
    return entityManager.createQuery("from Agence order by position", Agence.class).getResultList();
  }

  @Override
  public List<Ape> loadApes() {
    return entityManager.createQuery("from Ape", Ape.class).getResultList();
  }

  @Override
  public List<Commune> loadCommunes() {
    return entityManager.createQuery("from Commune", Commune.class).getResultList();
  }

  @Override
  public List<CompteType> loadCompteTypes() {
    return entityManager.createQuery("from CompteType order by position", CompteType.class).getResultList();
  }

  public AdherentContactRole loadContact(final Integer contactId) {
    if (contactId == null) {
      return null;
    }
    try {
      return (AdherentContactRole) this.entityManager.find((Class) AdherentContactRole.class, (Object) contactId);
    } catch (NoResultException e) {
      return null;
    }
  }

  @Override
  public List<ContactFonction> loadContactFonction() {
    return entityManager.createQuery("from ContactFonction order by position", ContactFonction.class).getResultList();
  }

  @Override
  public List<AdherentEtat> loadEtats() {
    return entityManager.createQuery("from AdherentEtat order by position", AdherentEtat.class).getResultList();
  }

  @Override
  public List<FormeJuridique> loadFormesJuridiques() {
    return entityManager.createQuery("from FormeJuridique", FormeJuridique.class).getResultList();
  }

  @Override
  public List<Pole> loadPoles() {
    return entityManager.createQuery("from Pole order by position", Pole.class).getResultList();
  }

  @Override
  public List<Role> loadRoles() {
    return entityManager.createQuery("from Role order by position", Role.class).getResultList();
  }

  @Override
  public List<RoleSalarieEOLAS> loadRolesEOLAS() {
    return entityManager.createQuery("from RoleSalarieEOLAS order by position", RoleSalarieEOLAS.class).getResultList();
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

  /**
   * Load UTILISATEUR Chergement de tous les utilisateurs
   *
   * @return Liste de tous les utilisateurs
   */
  @Override
  public List<User> loadUtilisateurs() {
    return entityManager.createQuery("from User", User.class).getResultList();
  }

  @Override
  @Transactional
  public void saveActivites(List<Activite> activites) {

    // Pour tout les contact de la liste
    activites.stream().forEach(a -> {
      Activite activite = a.getId() == null ? new Activite() : entityManager.find(Activite.class, a.getId());
      activite.setPosition(a.getPosition());
      activite.setLibelle(a.getLibelle());
//            activite.setFamillesListe(a.getFamillesListe());
      entityManager.persist(activite);
    });
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

  @Transactional
  public void saveAdherentLogistique(final AdherentLogistique logistiqueAdh) {
    final AdherentLogistique update = this.loadAdherentLogistique(logistiqueAdh.getAdherentId());
    update.setAccesSemi(logistiqueAdh.getIsAccesSemi());
    update.setAdresseLivraison(logistiqueAdh.getAdresseLivraison());
    update.setAdresseComplement(logistiqueAdh.getAdresseComplement());
    update.setContactReceptionId(logistiqueAdh.getContactReceptionId());
    update.setAuthorise(logistiqueAdh.getIsAuthorise());
    update.setCommune(this.loadCommune(logistiqueAdh.getCommune().getId()));
    update.setMaterielDechargement(logistiqueAdh.getIsMaterielDechargement());
    update.setOutillageCommentaire(logistiqueAdh.getOutillageCommentaire());
    update.setProtocolDechargement(logistiqueAdh.getProtocolDechargement());
    this.entityManager.persist(update);
  }

  @Transactional
  public void saveAdherentMetiers(final int adhId, final List<AdherentMetier> adherentMetiers) {
    this.loadAdherentMetiers(adhId).stream().forEach(elmt -> this.entityManager.remove(elmt));
    adherentMetiers.stream().forEach(elmt -> this.entityManager.merge(elmt));
  }

  @Transactional
  public void saveAdherentCertifications(final int adhId, final List<AdherentCertification> adherentCertifications) {
    this.loadAdherentCertifications(adhId).stream().forEach(elmt -> this.entityManager.remove(elmt));
    adherentCertifications.stream().forEach(elmt -> this.entityManager.merge(elmt));
  }

  @Transactional
  public void saveAdherentSpecialites(final int adhId, final List<AdherentSpecialite> adherentSpecialites) {
    this.loadAdherentSpecialites(adhId).stream().forEach(elmt -> this.entityManager.remove(elmt));
    adherentSpecialites.stream().forEach(elmt -> this.entityManager.merge(elmt));
  }

  @Override
  @Transactional
  public void saveAdherentSuiviVisite(AdherentSuiviVisite suivi) {
    AdherentSuiviVisite update = loadAdherentSuiviVisite(suivi.getId());

    update.setCommentaire(suivi.getCommentaire());
    update.setDateCommentaire(suivi.getDateCommentaire());

    entityManager.persist(update);
  }

  @Override
  @Transactional
  public void saveAgences(List<Agence> agences) {

    // Pour toutes les agences de la liste
    agences.stream().forEach(a -> {
      Agence agence = a.getId() == null ? new Agence() : entityManager.find(Agence.class, a.getId());
      agence.setPosition(a.getPosition());
      agence.setLibelle(a.getLibelle());
      entityManager.persist(agence);
    });
  }

  @Override
  @Transactional
  public void saveContactComptableAdherent(AdherentContactComptable contact) {
    AdherentContactComptable contactBdd = contact.getId() == null ? new AdherentContactComptable() : entityManager.find(AdherentContactComptable.class, contact.getId());

    contactBdd.setAdherentId(contact.getAdherentId());
    contactBdd.setCabinet(contact.getCabinet());
    contactBdd.setCivilite(contact.getCivilite());
    contactBdd.setFixe(contact.getFixe());
    contactBdd.setMail(contact.getMail());
    contactBdd.setMobile(contact.getMobile());
    contactBdd.setNom(contact.getNom());
    contactBdd.setPrenom(contact.getPrenom());

    entityManager.persist(contactBdd);
  }

  @Override
  @Transactional
  public void saveContactsFonctions(List<ContactFonction> contactFonctions) {
    // Pour tout les contact de la liste
    contactFonctions.stream().forEach(a -> {
      ContactFonction contactFonction = a.getId() == null ? new ContactFonction()
              : entityManager.find(ContactFonction.class, a.getId());
      contactFonction.setPosition(a.getPosition());
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
      pole.setPosition(a.getPosition());
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
      role.setPosition(a.getPosition());
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
      secteur.setPosition(a.getPosition());
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

  @Transactional
  public void setAdherentLogo(final int adhId, final byte[] logo) {
    final Adherent adh = this.loadAdherent(adhId);
    adh.setLogo(logo);
    this.entityManager.persist((Object) adh);
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
//    entityManager.getTransaction().begin();
    entityManager.remove(del);
//    entityManager.createNativeQuery("delete from adherent_contact where id = " + id);
//    entityManager.getTransaction().commit();
    entityManager.flush();
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

  private void loadAchat(AdherentActivite naa) {

    List<ActiviteFamille> listActiviteFamille = entityManager.createQuery("from ActiviteFamille where activiteId = :id", ActiviteFamille.class)
            .setParameter("id", naa.getActivite().getId()).getResultList();
    String queryTmp = "";

    for (int i = 0; i < listActiviteFamille.size(); i++) {
      queryTmp += i == 0 ? "" : " or ";
      queryTmp += "(famille = " + listActiviteFamille.get(i).getFamille();
      if (listActiviteFamille.get(i).getSousFamille() == null) {
        queryTmp += ")";
      } else {
        queryTmp += " and sous_famille = " + listActiviteFamille.get(i).getSousFamille() + ")";
      }
    }

    String query = "select COALESCE(SUM(montant) , 0) "
            + "from adherent_achat_N aan "
            + "where adherent_id = " + naa.getAdherent().getId() + " "
            + "and (" + queryTmp + ")";

    Double achatN = ((java.math.BigDecimal) entityManager.createNativeQuery(query).getSingleResult()).doubleValue();
    naa.setAchatN(achatN);

    Double achatN1 = ((java.math.BigDecimal) entityManager.createNativeQuery(
            "select COALESCE(SUM(montant) , 0) "
            + "from adherent_achat_N1 aan "
            + "where adherent_id = " + naa.getAdherent().getId() + " "
            + "and (" + queryTmp + ")").getSingleResult()).doubleValue();
    naa.setAchatN1(achatN1);

    Double achatN2 = ((java.math.BigDecimal) entityManager.createNativeQuery(
            "select COALESCE(SUM(montant) , 0) "
            + "from adherent_achat_N2 aan "
            + "where adherent_id = " + naa.getAdherent().getId() + " "
            + "and (" + queryTmp + ")").getSingleResult()).doubleValue();
    naa.setAchatN2(achatN2);

    Double achatN3 = ((java.math.BigDecimal) entityManager.createNativeQuery(
            "select COALESCE(SUM(montant) , 0) "
            + "from adherent_achat_N3 aan "
            + "where adherent_id = " + naa.getAdherent().getId() + " "
            + "and (" + queryTmp + ")").getSingleResult()).doubleValue();
    naa.setAchatN3(achatN3);
  }

  private void loadAchatDate(AdherentActivite naa) {

    List<ActiviteFamille> listActiviteFamille = entityManager.createQuery("from ActiviteFamille where activiteId = :id", ActiviteFamille.class)
            .setParameter("id", naa.getActivite().getId()).getResultList();
    String queryTmp = "";

    for (int i = 0; i < listActiviteFamille.size(); i++) {
      queryTmp += i == 0 ? "" : " or ";
      queryTmp += "(famille = " + listActiviteFamille.get(i).getFamille();
      if (listActiviteFamille.get(i).getSousFamille() == null) {
        queryTmp += ")";
      } else {
        queryTmp += " and sous_famille = " + listActiviteFamille.get(i).getSousFamille() + ")";
      }
    }

    Double achatN = ((java.math.BigDecimal) entityManager.createNativeQuery(
            "select COALESCE(SUM(montant) , 0) "
            + "from adherent_achat_N aan "
            + "where adherent_id = " + naa.getAdherent().getId() + " "
            + "and date_facture < CURDATE() "
            + "and (" + queryTmp + ")").getSingleResult()).doubleValue();
    naa.setAchatDateN(achatN);

    Double achatN1 = ((java.math.BigDecimal) entityManager.createNativeQuery(
            "select COALESCE(SUM(montant) , 0) "
            + "from adherent_achat_N1 aan "
            + "where adherent_id = " + naa.getAdherent().getId() + " "
            + "and date_facture < DATE_ADD(CURRENT_DATE(), INTERVAL -1 YEAR) "
            + "and (" + queryTmp + ")").getSingleResult()).doubleValue();
    naa.setAchatDateN1(achatN1);

    Double achatN2 = ((java.math.BigDecimal) entityManager.createNativeQuery(
            "select COALESCE(SUM(montant) , 0) "
            + "from adherent_achat_N2 aan "
            + "where adherent_id = " + naa.getAdherent().getId() + " "
            + "and date_facture < DATE_ADD(CURRENT_DATE(), INTERVAL -2 YEAR) "
            + "and (" + queryTmp + ")").getSingleResult()).doubleValue();
    naa.setAchatDateN2(achatN2);

    Double achatN3 = ((java.math.BigDecimal) entityManager.createNativeQuery(
            "select COALESCE(SUM(montant) , 0) "
            + "from adherent_achat_N3 aan "
            + "where adherent_id = " + naa.getAdherent().getId() + " "
            + "and date_facture < DATE_ADD(CURRENT_DATE(), INTERVAL -3 YEAR) "
            + "and (" + queryTmp + ")").getSingleResult()).doubleValue();
    naa.setAchatDateN3(achatN3);
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

  private Commune loadCommune(final int communeId) {
    try {
      return this.entityManager.find(Commune.class, communeId);
    } catch (NoResultException e) {
      return null;
    }
  }

  private void loadTotalAchat(AdherentActivite naa) {
    Double totalN = ((java.math.BigDecimal) entityManager.createNativeQuery(
            "select nvl(SUM(montant) , 0) "
            + "from adherent_achat_N aan "
            + "where adherent_id = " + naa.getAdherent().getId() + " "
            + "and date_facture is not null ").getSingleResult()).doubleValue();
    naa.setTotalN(totalN);

    Double totalN1 = ((java.math.BigDecimal) entityManager.createNativeQuery(
            "select nvl(SUM(montant) , 0) "
            + "from adherent_achat_N1 aan "
            + "where adherent_id = " + naa.getAdherent().getId()).getSingleResult()).doubleValue();
    naa.setTotalN1(totalN1);

    Double totalN2 = ((java.math.BigDecimal) entityManager.createNativeQuery(
            "select nvl(SUM(montant) , 0) "
            + "from adherent_achat_N2 aan "
            + "where adherent_id = " + naa.getAdherent().getId()).getSingleResult()).doubleValue();
    naa.setTotalN2(totalN2);

    Double totalN3 = ((java.math.BigDecimal) entityManager.createNativeQuery(
            "select nvl(SUM(montant) , 0) "
            + "from adherent_achat_N3 aan "
            + "where adherent_id = " + naa.getAdherent().getId()).getSingleResult()).doubleValue();
    naa.setTotalN3(totalN3);
  }

  private void loadTotalAchatDate(AdherentActivite naa) {
    Double totalN = ((java.math.BigDecimal) entityManager.createNativeQuery(
            "select nvl(SUM(montant) , 0) "
            + "from adherent_achat_N aan "
            + "where adherent_id = " + naa.getAdherent().getId() + " "
            + "and date_facture < CURDATE() ").getSingleResult()).doubleValue();
    naa.setTotalDateN(totalN);

    Double totalN1 = ((java.math.BigDecimal) entityManager.createNativeQuery(
            "select nvl(SUM(montant) , 0) "
            + "from adherent_achat_N1 aan "
            + "where adherent_id = " + naa.getAdherent().getId() + " "
            + "and date_facture < DATE_ADD(CURRENT_DATE(), INTERVAL -1 YEAR) ").getSingleResult()).doubleValue();
    naa.setTotalDateN1(totalN1);

    Double totalN2 = ((java.math.BigDecimal) entityManager.createNativeQuery(
            "select nvl(SUM(montant) , 0) "
            + "from adherent_achat_N2 aan "
            + "where adherent_id = " + naa.getAdherent().getId() + " "
            + "and date_facture < DATE_ADD(CURRENT_DATE(), INTERVAL -2 YEAR) ").getSingleResult()).doubleValue();
    naa.setTotalDateN2(totalN2);

    Double totalN3 = ((java.math.BigDecimal) entityManager.createNativeQuery(
            "select nvl(SUM(montant) , 0) "
            + "from adherent_achat_N3 aan "
            + "where adherent_id = " + naa.getAdherent().getId() + " "
            + "and date_facture < DATE_ADD(CURRENT_DATE(), INTERVAL -3 YEAR) ").getSingleResult()).doubleValue();
    naa.setTotalDateN3(totalN3);
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
    dbbContact.setDateNaissance(adhContact.getDateNaissance());
    dbbContact.setNom(adhContact.getNom());
    dbbContact.setPhoto(adhContact.getPhoto());
    dbbContact.setPrenom(adhContact.getPrenom());
    dbbContact.setIsAccessEOLAS(adhContact.getIsAccessEOLAS());
    dbbContact.setLoginEOLAS(adhContact.getLoginEOLAS());
    dbbContact.setPassEOLAS(adhContact.getPassEOLAS());
    dbbContact.setRoleSalarieEOLASId(adhContact.getRoleSalarieEOLASId());
    dbbContact.setDateNaissance(adhContact.getDateNaissance());

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
    bddAdherent.setDateSortie(adherent.getDateSortie());
    bddAdherent.setAdresse(adherent.getAdresse());
    bddAdherent.setAdresseComplement(adherent.getAdresseComplement());
    if (adherent.getCommune() != null && adherent.getCommune().getId() != null) {
      bddAdherent.setCommune(loadCommune(adherent.getCommune().getId()));
    }
    bddAdherent.setPole(adherent.getPole());
    bddAdherent.setRole(adherent.getRole());
    bddAdherent.setSecteur(adherent.getSecteur());
    bddAdherent.setIsArtipole(adherent.getIsArtipole());
    bddAdherent.setIsCharteArtipole(adherent.getIsCharteArtipole());
    bddAdherent.setIsFlocageArtipole(adherent.getIsFlocageArtipole());
    bddAdherent.setIsWebArtipole(adherent.getIsWebArtipole());
    bddAdherent.setSiteWeb(adherent.getSiteWeb());
    bddAdherent.setFacebook(adherent.getFacebook());
    bddAdherent.setInstagram(adherent.getInstagram());
    bddAdherent.setLinkedin(adherent.getLinkedin());
    bddAdherent.setYoutube(adherent.getYoutube());
    bddAdherent.setPinterest(adherent.getPinterest());
    bddAdherent.setFormationDirigeant(adherent.getFormationDirigeant());
    bddAdherent.setCnxEolasAllow(adherent.getCnxEolasAllow());
    bddAdherent.setIsFacebookArtipole(adherent.getIsFacebookArtipole());
    bddAdherent.setApe(adherent.getApe());
    bddAdherent.setSiren(adherent.getSiren());
    bddAdherent.setSiret(adherent.getSiret());
    bddAdherent.setNumRepMetier(adherent.getNumRepMetier());
    bddAdherent.setRcsRm(adherent.getRcsRm());
    if (adherent.getRcsCommune() != null && adherent.getRcsCommune().getId() != null) {
      bddAdherent.setRcsCommune(loadCommune(adherent.getRcsCommune().getId()));
    }
    if (adherent.getRmCommune() != null && adherent.getRmCommune().getId() != null) {
      bddAdherent.setRmCommune(loadCommune(adherent.getRmCommune().getId()));
    }
    bddAdherent.setAgence(adherent.getAgence());
    bddAdherent.setDateClotureExe(adherent.getDateClotureExe());
    bddAdherent.setTournee(adherent.getTournee());
    bddAdherent.setIsOutilDechargement(adherent.getIsOutilDechargement());
    bddAdherent.setEtat(adherent.getEtat());
    bddAdherent.setAdherentType(adherent.getAdherentType());
    bddAdherent.setCompteType(adherent.getCompteType());
    bddAdherent.setLatitude(adherent.getLatitude());
    bddAdherent.setLongitude(adherent.getLongitude());
    bddAdherent.setTelephone(adherent.getTelephone());
    bddAdherent.setMail(adherent.getMail());
    bddAdherent.setDescription_activite(adherent.getDescription_activite());
    bddAdherent.setDescription_entreprise(adherent.getDescription_entreprise());
//        if (adherent.getContactComptable() != null) {
//            bddAdherent.setContactComptable(adherent.getContactComptable());
//        }
    return bddAdherent;
  }

  static {
    log = LogManager.getLogger(LoginController.class);
  }
}
