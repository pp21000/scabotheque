/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fr.scabois.scabotheque.dao;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.adherent.Type;
import fr.scabois.scabotheque.bean.artisansArtipole.Actualite;
import fr.scabois.scabotheque.bean.artisansArtipole.Certification;
import fr.scabois.scabotheque.bean.artisansArtipole.Emplacement;
import fr.scabois.scabotheque.bean.artisansArtipole.Inspiration;
import fr.scabois.scabotheque.bean.artisansArtipole.Metier;
import fr.scabois.scabotheque.bean.artisansArtipole.Page;
import fr.scabois.scabotheque.bean.artisansArtipole.Photo;
import fr.scabois.scabotheque.bean.artisansArtipole.Realisation;
import fr.scabois.scabotheque.bean.artisansArtipole.Specialite;
import fr.scabois.scabotheque.bean.artisansArtipole.Travaux;
import fr.scabois.scabotheque.utils.AppProperties;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class ArtisansArtipoleDAO implements IArtisansArtipoleDAO {

  @PersistenceContext
  private EntityManager entityManager;

  @Override
  public List<Adherent> loadArtisansArtipole() {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  @Override
  public void executeJob(final String user) {
    try {
      System.err.println("debug fileName :" + AppProperties.getPropertie("artisansArtipole.transfert.tables.path"));
      final Process p = Runtime.getRuntime().exec(AppProperties.getPropertie("artisansArtipole.transfert.tables.path"));
      p.waitFor();
    } catch (IOException ex) {
      System.err.println("Accès au fichier :" + ex.getMessage());
    } catch (InterruptedException ex2) {
      System.err.println("Arrêt inattendu :" + ex2.getMessage());
    }
  }

  @Override
  public Actualite loadActualite(final int idActualite) {
    return this.entityManager.find(Actualite.class, idActualite);
  }

  @Override
  public List<Actualite> loadActualites() {
    return this.entityManager.createQuery("from Actualite", Actualite.class).getResultList();
  }

  @Transactional
  @Override
  public void saveActualite(final Actualite actualite) {
    Actualite update = (actualite.getId() == null) ? new Actualite() : this.loadActualite(actualite.getId());
    if (actualite.getId() == null) {

      update.setDate_ajout(Date.valueOf(LocalDate.now()));
    }
//    else{
//      this.entityManager.remove(update);
//    }
    update.setTitre(actualite.getTitre());
    update.setContenu(actualite.getContenu());
    update.setType(actualite.getType());
    update.setSous_type(actualite.getSous_type());
    update.setPosition(actualite.getPosition());
    update.setDetail_contenu(actualite.getDetail_contenu());
    update.setLien_url(actualite.getLien_url());
    update.setAdherent(actualite.getAdherent());
    this.entityManager.persist(update);
  }

  @Transactional
  @Override
  public void deleteActualite(final int idActualite) {
    try {
      final Actualite del = this.entityManager.find(Actualite.class, idActualite);
      this.entityManager.remove(del);
    } catch (Exception ex) {
    }
  }

  @Override
  public Certification loadCertification(final int idCertification) {
    return this.entityManager.find(Certification.class, idCertification);
  }

  @Override
  public List<Certification> loadCertifications() {
    return this.entityManager.createQuery("from Certification", Certification.class).getResultList();
  }

  @Transactional
  @Override
  public void saveCertification(final Certification certification) {
    final Certification update = (certification.getId() == null) ? new Certification() : this.loadCertification(certification.getId());
    update.setLibelle(certification.getLibelle());
    update.setData(certification.getData());
    update.setAlt(certification.getAlt());
    this.entityManager.persist(update);
  }

  @Transactional
  @Override
  public void deleteCertification(final int idCertification) {
    try {
      final Certification del = this.entityManager.find(Certification.class, idCertification);
      this.entityManager.remove(del);
    } catch (Exception ex) {
    }
  }

  @Override
  public Emplacement loadEmplacement(final int idEmplacement) {
    return this.entityManager.find(Emplacement.class, idEmplacement);
  }

  @Override
  public List<Emplacement> loadEmplacements() {
    return this.entityManager.createQuery("from Emplacement", Emplacement.class).getResultList();
  }

  @Transactional
  @Override
  public void saveEmplacement(final Emplacement emplacement) {
    final Emplacement update = (emplacement.getId() == null) ? new Emplacement() : this.loadEmplacement(emplacement.getId());
    update.setLibelle(emplacement.getLibelle());
    update.setContent(emplacement.getContent());
    update.setType(emplacement.getType());
    update.setAlt(emplacement.getAlt());
    update.setPage(emplacement.getPage());
    if ((emplacement.getId() == null) || (emplacement.getData() != null && emplacement.getData().length > 0)) {
      update.setData(emplacement.getData());
    }
    this.entityManager.persist(update);
  }

  @Transactional
  @Override
  public void deleteEmplacement(final int idEmplacement) {
    try {
      final Emplacement del = this.entityManager.find(Emplacement.class, idEmplacement);
      this.entityManager.remove(del);
    } catch (Exception ex) {
    }
  }

  @Override
  public Inspiration loadInspiration(final int idInspiration) {
    return this.entityManager.find(Inspiration.class, idInspiration);
  }

  @Override
  public List<Inspiration> loadInspirations() {
    return this.entityManager.createQuery("from Inspiration", Inspiration.class).getResultList();
  }

  @Override
  public Metier loadMetier(final int idMetier) {
    return this.entityManager.find(Metier.class, idMetier);
  }

  @Override
  public List<Metier> loadMetiers() {
    return this.entityManager.createQuery("from Metier", Metier.class).getResultList();
  }

  @Transactional
  public void saveMetier(final Metier metier) {
    Metier update = (metier.getId() == null) ? new Metier() : this.loadMetier(metier.getId());
    update.setLibelle(metier.getLibelle());
    update.setDescription(metier.getDescription());
    this.entityManager.persist(update);
  }

  @Transactional
  public void saveMetiers(final List<Metier> metiers) {
    metiers.stream().forEach(m -> this.saveMetier(m));
  }

  @Transactional
  @Override
  public void deleteMetier(final int idMetier) {
    try {
      final Metier del = this.entityManager.find(Metier.class, idMetier);
      this.entityManager.remove(del);
    } catch (Exception ex) {
    }
  }

  @Override
  public Page loadPage(final int idPage) {
    return this.entityManager.find(Page.class, idPage);
  }

  @Override
  public List<Page> loadPages() {
    return this.entityManager.createQuery("from Page", Page.class).getResultList();
  }

  @Override
  public Photo loadPhoto(final int idPhoto) {
    return this.entityManager.find(Photo.class, idPhoto);
  }

  @Override
  public List<Photo> loadPhotos() {
    return this.entityManager.createQuery("from Photo", Photo.class).getResultList();
  }

  @Transactional
  @Override
  public void savePhoto(final Photo photo) {
    final Photo update = (photo.getId() == null) ? new Photo() : this.loadPhoto(photo.getId());
    update.setLibelle(photo.getLibelle());
    update.setData(photo.getData());
    update.setAlt(photo.getAlt());
    update.setType(photo.getType());
    this.entityManager.persist(update);
  }

  @Transactional
  @Override
  public void deletePhoto(final int idPhoto) {
    try {
      final Photo del = this.entityManager.find(Photo.class, idPhoto);
      this.entityManager.remove(del);
    } catch (Exception ex) {
    }
  }

  @Override
  public Realisation loadRealisation(final int idRealisation) {
    return this.entityManager.find(Realisation.class, idRealisation);
  }

  @Override
  public List<Realisation> loadRealisations(final int adhId) {
    return this.entityManager.createQuery("from Realisation where adherents_id = :adhId", Realisation.class).setParameter("adhId", adhId).getResultList();
  }

  @Transactional
  @Override
  public void saveRealisation(final Realisation realisation) {
//    savePhoto(realisation.getPhoto());
    final Realisation update = (realisation.getId() == null) ? new Realisation() : this.loadRealisation(realisation.getId());
    update.setLegende(realisation.getLegende());
    //    update.setData(realisation.getData());
    update.setPosition(realisation.getPosition());
    update.setPhoto(realisation.getPhoto());
    update.setAdherent(realisation.getAdherent());
    this.entityManager.persist(update);
  }

//  @Transactional
//  @Override
//  public void saveRealisation(final Realisation realisation) {
//    // Vérifiez d'abord si la réalisation est nouvellement créée (n'a pas d'identifiant)
//    if (realisation.getId() == null) {
//      // Nouvelle réalisation, persistez-la d'abord
//      this.entityManager.persist(realisation);
//    } else {
//      // Réalisation existante, chargez-la depuis la base de données
//      final Realisation update = this.loadRealisation(realisation.getId());
//      // Mettez à jour les propriétés de la réalisation
//      update.setLegende(realisation.getLegende());
//      update.setPosition(realisation.getPosition());
//      update.setPhoto(realisation.getPhoto());
//      update.setAdherent(realisation.getAdherent());
//      // Mettez à jour la réalisation dans la base de données
//      this.entityManager.merge(update);
//    }
//    // Sauvegardez ensuite la photo
//    savePhoto(realisation.getPhoto());
//  }
  @Transactional
  @Override
  public void deleteRealisation(final int idRealisation) {
    try {
      final Realisation del = this.entityManager.find(Realisation.class, idRealisation);
      this.entityManager.remove(del);
    } catch (Exception ex) {
    }
  }

  @Override
  public Specialite loadSpecialite(final int idSpecialite) {
    return this.entityManager.find(Specialite.class, idSpecialite);
  }

  @Override
  public List<Specialite> loadSpecialites() {
    return this.entityManager.createQuery("from Specialite", Specialite.class).getResultList();
  }

  @Override
  public Travaux loadTravaux(final int idTravaux) {
    return this.entityManager.find(Travaux.class, idTravaux);
  }

  @Override
  public List<Travaux> loadTravauxList() {
    return this.entityManager.createQuery("from Travaux", Travaux.class).getResultList();
  }

  @Transactional
  @Override
  public void saveTravaux(final Travaux travaux) {
    Travaux update = (travaux.getId() == null) ? new Travaux() : this.loadTravaux(travaux.getId());
    update.setLibelle(travaux.getLibelle());
    this.entityManager.persist(update);

    travaux.getSpecialites().stream()
            //.filter(s -> s.getLibelle() != null && s.getLibelle() != "")
            .forEach(s -> {
              Specialite spe = (s.getId() == null) ? new Specialite() : this.loadSpecialite(s.getId());
              spe.setLibelle(s.getLibelle());
              spe.setTravaux(update);
              entityManager.persist(spe);
            });

    List<Integer> travauxSpecialitesIds = travaux.getSpecialites().stream().map(Specialite::getId).collect(Collectors.toList());
    loadSpecialites().stream()
            .filter(s -> Objects.equals(s.getTravaux().getId(), travaux.getId()) && !travauxSpecialitesIds.contains(s.getId()))
            .forEach(s -> this.entityManager.remove(s));
  }

  @Transactional
  @Override
  public void deleteTravaux(final int idTravaux) {
    try {
      final Travaux del = this.entityManager.find(Travaux.class, idTravaux);
      this.entityManager.remove(del);
    } catch (Exception ex) {
    }
  }

  @Override
  public List<Type> loadTypes() {
    return this.entityManager.createQuery("from Type order by position", Type.class).getResultList();
  }

}
