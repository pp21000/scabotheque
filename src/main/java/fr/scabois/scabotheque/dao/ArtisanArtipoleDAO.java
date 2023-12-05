/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fr.scabois.scabotheque.dao;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.adherent.Type;
import fr.scabois.scabotheque.bean.artisanArtipole.Actualite;
import fr.scabois.scabotheque.bean.artisanArtipole.Categorie;
import fr.scabois.scabotheque.bean.artisanArtipole.CategorieSpecialite;
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
      final Actualite del = (Actualite) this.entityManager.find(Actualite.class, idActualite);
      this.entityManager.remove(del);
    } catch (Exception ex) {
    }
  }

  @Transactional
  @Override
  public void deleteEmplacement(final int idEmplacement) {
    try {
      final Emplacement del = (Emplacement) this.entityManager.find(Emplacement.class, idEmplacement);
      this.entityManager.remove(del);
    } catch (Exception ex) {
    }
  }

  @Transactional
  @Override
  public void deleteTravaux(final int idTravaux) {

    final Travaux travauxToDelete = (Travaux) this.entityManager.find(Travaux.class, idTravaux);

    travauxToDelete.getSpecialites().stream()
            .forEach(spe -> {
              try {
                final Specialite speToDelete = (Specialite) this.entityManager.find(Specialite.class, spe.getId());
                this.entityManager.remove(speToDelete);
              } catch (Exception ex) {
              }
            });

    try {
      this.entityManager.remove(travauxToDelete);
    } catch (Exception ex) {
    }
  }

  @Transactional
  @Override
  public void deletePhoto(final int idPhoto) {
    try {
      final Photo del = (Photo) this.entityManager.find(Photo.class, idPhoto);
      this.entityManager.remove(del);
    } catch (Exception ex) {
    }
  }

  @Transactional
  @Override
  public void deleteCertification(final int idCertification) {
    try {
      final Certification del = (Certification) this.entityManager.find(Certification.class, idCertification);
      this.entityManager.remove(del);
    } catch (Exception ex) {
    }
  }

  @Transactional
  @Override
  public void deleteCategorie(final int idCategorie) {
    try {
      final Categorie del = (Categorie) this.entityManager.find(Categorie.class, idCategorie);
      this.entityManager.remove(del);
    } catch (Exception ex) {
    }
  }

  @Transactional
  @Override
  public void deleteMetier(final int idMetier) {
    try {
      final Metier del = (Metier) this.entityManager.find(Metier.class, idMetier);
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
  public List<Categorie> loadCategories() {
    final List<Categorie> categories = (List<Categorie>) this.entityManager.createQuery("from Categorie", (Class) Categorie.class).getResultList();
    final List<CategorieSpecialite> specialites = (List<CategorieSpecialite>) this.entityManager.createQuery("from CategorieSpecialite where categorie_id = 1", (Class) CategorieSpecialite.class).getResultList();
    categories.stream().forEach(c -> c.setSpecialites(this.entityManager.createQuery("select specialite from CategorieSpecialite where categorie_id = 1", (Class) Specialite.class).getResultList()));
    return categories;
  }

  @Override
  public List<Actualite> loadActualites() {
    return (List<Actualite>) this.entityManager.createQuery("from Actualite", (Class) Actualite.class).getResultList();
  }

  @Override
  public Actualite loadActualite(final int idActualite) {
    return (Actualite) this.entityManager.find((Class) Actualite.class, idActualite);
  }

  @Override
  public List<Emplacement> loadEmplacements() {
    return (List<Emplacement>) this.entityManager.createQuery("from Emplacement", (Class) Emplacement.class).getResultList();
  }

  @Override
  public Emplacement loadEmplacement(final int idEmplacement) {
    final Emplacement empl = (Emplacement) this.entityManager.find((Class) Emplacement.class, idEmplacement);
    return empl;
  }

  @Override
  public Travaux loadTravaux(final int idTravaux) {
    final Travaux travaux = (Travaux) this.entityManager.find((Class) Travaux.class, idTravaux);
    return travaux;
  }

  @Override
  public List<Travaux> loadTravauxList() {
    return (List<Travaux>) this.entityManager.createQuery("from Travaux", (Class) Travaux.class).getResultList();
  }

  @Override
  public Specialite loadSpecialite(final int idSpecialite) {
    final Specialite specialite = (Specialite) this.entityManager.find((Class) Specialite.class, idSpecialite);
    return specialite;
  }

  @Override
  public List<Specialite> loadSpecialites() {
    return (List<Specialite>) this.entityManager.createQuery("from Specialite", (Class) Specialite.class).getResultList();
  }

  @Override
  public List<Inspiration> loadInspirations() {
    return (List<Inspiration>) this.entityManager.createQuery("from Inspiration", (Class) Inspiration.class).getResultList();
  }

  @Override
  public Inspiration loadInspiration(final int idInspiration) {
    return (Inspiration) this.entityManager.find((Class) Inspiration.class, idInspiration);
  }

  @Override
  public Metier loadMetier(final int idMetier) {
    return (Metier) this.entityManager.find((Class) Metier.class, idMetier);
  }

  @Override
  public List<Metier> loadMetiers() {
    return (List<Metier>) this.entityManager.createQuery("from Metier", (Class) Metier.class).getResultList();
  }

  @Override
  public Page loadPage(final int idPage) {
    return (Page) this.entityManager.find((Class) Page.class, idPage);
  }

  @Override
  public List<Page> loadPages() {
    return (List<Page>) this.entityManager.createQuery("from Page", (Class) Page.class).getResultList();
  }

  @Override
  public Photo loadPhoto(final int idPhoto) {
    return (Photo) this.entityManager.find((Class) Photo.class, idPhoto);
  }

  @Override
  public List<Photo> loadPhotos() {
    return (List<Photo>) this.entityManager.createQuery("from Photo", (Class) Photo.class).getResultList();
  }

  @Override
  public Certification loadCertification(final int idCertification) {
    return (Certification) this.entityManager.find((Class) Certification.class, idCertification);
  }

  @Override
  public List<Certification> loadCertifications() {
    return (List<Certification>) this.entityManager.createQuery("from Certification", (Class) Certification.class).getResultList();
  }

  @Override
  public Categorie loadCategorie(final int idCategorie) {
    return (Categorie) this.entityManager.find((Class) Categorie.class, idCategorie);
  }

  @Override
  public List<Type> loadTypes() {
    return entityManager.createQuery("from Type order by position", Type.class).getResultList();
  }

  @Transactional
  @Override
  public void saveEmplacement(final Emplacement emplacement) {
    if (emplacement.getId() == null) {
      final Emplacement newEmpl = new Emplacement();
      newEmpl.setLibelle(emplacement.getLibelle());
      newEmpl.setContent(emplacement.getContent());
      newEmpl.setType(emplacement.getType());
      newEmpl.setData(emplacement.getData());
      newEmpl.setAlt(emplacement.getAlt());
      newEmpl.setPage(emplacement.getPage());
      this.entityManager.persist(newEmpl);
    } else {
      final Emplacement update = this.loadEmplacement(emplacement.getId());
      update.setLibelle(emplacement.getLibelle());
      update.setContent(emplacement.getContent());
      update.setType(emplacement.getType());
      if (emplacement.getData().length > 0) {
        update.setData(emplacement.getData());
      }
      update.setAlt(emplacement.getAlt());
      update.setPage(emplacement.getPage());
      this.entityManager.persist(update);
    }
  }

  @Transactional
  @Override
  public void saveTravaux(final Travaux travaux) {
    if (travaux.getId() == null) {
      final Travaux newTravaux = new Travaux();
      newTravaux.setLibelle(travaux.getLibelle());
      this.entityManager.persist(newTravaux);

      travaux.getSpecialites().stream()
              .filter(s -> s.getLibelle() != null && !s.getLibelle().isEmpty())
              .forEach(s -> {
                Specialite spe = new Specialite();
                spe.setLibelle(s.getLibelle());
                spe.setTravaux(newTravaux);
                entityManager.persist(spe);
              });

    } else {
      final Travaux update = this.loadTravaux(travaux.getId());
      update.setLibelle(travaux.getLibelle());
      update.setSpecialites(travaux.getSpecialites());
      this.entityManager.persist(update);
    }
  }

  @Transactional
  @Override
  public void savePhoto(final Photo photo) {
    if (photo.getId() == null) {
      final Photo newPhoto = new Photo();
      newPhoto.setLibelle(photo.getLibelle());
      newPhoto.setData(photo.getData());
      newPhoto.setAlt(photo.getAlt());
      newPhoto.setType(photo.getType());
      this.entityManager.persist(newPhoto);
    } else {
      final Photo update = this.loadPhoto(photo.getId());
      update.setLibelle(photo.getLibelle());
      update.setData(photo.getData());
      update.setAlt(photo.getAlt());
      update.setType(photo.getType());
      this.entityManager.persist(update);
    }
  }

  @Transactional
  @Override
  public void saveCertification(final Certification certification) {
    if (certification.getId() == null) {
      final Certification newCertification = new Certification();
      newCertification.setLibelle(certification.getLibelle());
      newCertification.setData(certification.getData());
      newCertification.setAlt(certification.getAlt());
      this.entityManager.persist(newCertification);
    } else {
      final Certification update = this.loadCertification(certification.getId());
      update.setLibelle(certification.getLibelle());
      update.setData(certification.getData());
      update.setAlt(certification.getAlt());
      this.entityManager.persist(update);
    }
  }

  @Transactional
  @Override
  public void saveCategorie(final Categorie categorie) {
    Categorie update = new Categorie();
    if (categorie.getId() != null) {
      update = this.loadCategorie(categorie.getId());
    }
    update.setLibelle(categorie.getLibelle());
    this.entityManager.persist(update);
  }

  @Transactional
  @Override
  public void saveCategories(final List<Categorie> categories) {
    categories.stream().forEach(c -> this.saveCategorie(c));
  }

  @Transactional
  @Override
  public void saveActualite(final Actualite actualite) {
    Actualite update;
    if (actualite.getId() != null) {
      update = this.loadActualite(actualite.getId());
    } else {
      update = new Actualite();
      update.setDate_ajout(Date.valueOf(LocalDate.now()));
    }
    update.setTitre(actualite.getTitre());
    update.setContenu(actualite.getContenu());
    update.setType(actualite.getType());
    update.setSous_type(actualite.getSous_type());
    update.setPosition(actualite.getPosition());
    update.setDetail_contenu(actualite.getDetail_contenu());
    update.setLien_url(actualite.getLien_url());
    update.setAdherentId(actualite.getAdherentId());
    this.entityManager.persist(update);
  }

  @Transactional
  public void saveMetier(final Metier metier) {
    Metier update;
    if (metier.getId() != null) {
      update = this.loadMetier(metier.getId());
    } else {
      update = new Metier();
    }
    update.setLibelle(metier.getLibelle());
    update.setDescription(metier.getDescription());
    this.entityManager.persist(update);
  }

  @Transactional
  public void saveMetiers(final List<Metier> metiers) {
    metiers.stream().forEach(m -> this.saveMetier(m));
  }
}
