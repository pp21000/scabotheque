/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fr.scabois.scabotheque.dao;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.adherent.Type;
import fr.scabois.scabotheque.bean.artisanArtipole.Actualite;
import fr.scabois.scabotheque.bean.artisanArtipole.Certification;
import fr.scabois.scabotheque.bean.artisanArtipole.Emplacement;
import fr.scabois.scabotheque.bean.artisanArtipole.Inspiration;
import fr.scabois.scabotheque.bean.artisanArtipole.Metier;
import fr.scabois.scabotheque.bean.artisanArtipole.Page;
import fr.scabois.scabotheque.bean.artisanArtipole.Photo;
import fr.scabois.scabotheque.bean.artisanArtipole.Specialite;
import fr.scabois.scabotheque.bean.artisanArtipole.Travaux;
import fr.scabois.scabotheque.utils.AppProperties;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Objects;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class ArtisanArtipoleDAO implements IArtisanArtipoleDAO {

  @PersistenceContext
  private EntityManager entityManager;

  @Transactional
  @Override
  public void deleteActualite(final int idActualite) {
    try {
      final Actualite del = this.entityManager.find(Actualite.class, idActualite);
      this.entityManager.remove(del);
    } catch (Exception ex) {
    }
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

  @Transactional
  @Override
  public void deleteTravaux(final int idTravaux) {
    try {
      final Travaux del = this.entityManager.find(Travaux.class, idTravaux);
      this.entityManager.remove(del);
    } catch (Exception ex) {
    }
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

  @Transactional
  @Override
  public void deleteCertification(final int idCertification) {
    try {
      final Certification del = this.entityManager.find(Certification.class, idCertification);
      this.entityManager.remove(del);
    } catch (Exception ex) {
    }
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
  public void executeJob(final String user) {
    try {
      System.err.println("debug fileName :" + AppProperties.getPropertie("artisanArtipole.transfert.tables.path"));
      final Process p = Runtime.getRuntime().exec(AppProperties.getPropertie("artisanArtipole.transfert.tables.path"));
      p.waitFor();
    } catch (IOException ex) {
      System.err.println("Access au fichier :" + ex.getMessage());
    } catch (InterruptedException ex2) {
      System.err.println("Arret inatentdu :" + ex2.getMessage());
    }
  }

  @Override
  public List<Adherent> loadArtisanArtipole() {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  @Override
  public Actualite loadActualite(final int idActualite) {
    return this.entityManager.find(Actualite.class, idActualite);
  }

  @Override
  public List<Actualite> loadActualites() {
    return this.entityManager.createQuery("from Actualite", Actualite.class).getResultList();
  }

  @Override
  public Emplacement loadEmplacement(final int idEmplacement) {
    return this.entityManager.find(Emplacement.class, idEmplacement);
  }

  @Override
  public List<Emplacement> loadEmplacements() {
    return this.entityManager.createQuery("from Emplacement", Emplacement.class).getResultList();
  }

  @Override
  public Travaux loadTravaux(final int idTravaux) {
    return this.entityManager.find(Travaux.class, idTravaux);
  }

  @Override
  public List<Travaux> loadTravauxList() {
    return this.entityManager.createQuery("from Travaux", Travaux.class).getResultList();
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

  @Override
  public Certification loadCertification(final int idCertification) {
    return this.entityManager.find(Certification.class, idCertification);
  }

  @Override
  public List<Certification> loadCertifications() {
    return this.entityManager.createQuery("from Certification", Certification.class).getResultList();
  }

  @Override
  public List<Type> loadTypes() {
    return this.entityManager.createQuery("from Type order by position", Type.class).getResultList();
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
  public void saveTravaux(final Travaux travaux) {
    Travaux update = (travaux.getId() == null) ? new Travaux() : this.loadTravaux(travaux.getId());
    update.setLibelle(travaux.getLibelle());
    this.entityManager.persist(update);

    if (travaux.getId() != null) {
      this.loadSpecialites().stream()
              .filter(s -> Objects.equals(s.getTravaux().getId(), travaux.getId()))
              .forEach(s -> this.entityManager.remove(s));
    }
    travaux.getSpecialites().stream()
            .filter(s -> s.getLibelle() != null)
            .forEach(s -> {
              Specialite spe = new Specialite();
              spe.setLibelle(s.getLibelle());
              spe.setTravaux(update);
              entityManager.persist(spe);
            });
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
  public void saveCertification(final Certification certification) {
    final Certification update = (certification.getId() == null) ? new Certification() : this.loadCertification(certification.getId());
    update.setLibelle(certification.getLibelle());
    update.setData(certification.getData());
    update.setAlt(certification.getAlt());
    this.entityManager.persist(update);
  }

  @Transactional
  @Override
  public void saveActualite(final Actualite actualite) {
    Actualite update = (actualite.getId() == null) ? new Actualite() : this.loadActualite(actualite.getId());
    if (actualite.getId() == null) {
      update.setDate_ajout(Date.valueOf(LocalDate.now()));
    }
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
}
