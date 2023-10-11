/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fr.scabois.scabotheque.dao;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.artisanArtipole.Actualite;
import fr.scabois.scabotheque.bean.artisanArtipole.Categorie;
import fr.scabois.scabotheque.bean.artisanArtipole.CategorieSpecialite;
import fr.scabois.scabotheque.bean.artisanArtipole.Emplacement;
import fr.scabois.scabotheque.bean.artisanArtipole.Inspiration;
import fr.scabois.scabotheque.bean.artisanArtipole.Metier;
import fr.scabois.scabotheque.bean.artisanArtipole.Page;
import fr.scabois.scabotheque.bean.artisanArtipole.Photo;
import fr.scabois.scabotheque.bean.artisanArtipole.Specialite;
import fr.scabois.scabotheque.utils.AppProperties;
import java.io.IOException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author paul.petit
 */
@Repository
public class ArtisanArtipoleDAO implements IArtisanArtipoleDAO {

  @PersistenceContext
  private EntityManager entityManager;

  /**
   *
   * @param idActualite
   */
  @Transactional
  @Override
  public void deleteActualite(final int idActualite) {
    try {
      final Actualite del = (Actualite) this.entityManager.find((Class) Actualite.class, (Object) idActualite);
      this.entityManager.remove((Object) del);
    } catch (Exception ex) {
    }
  }

  /**
   *
   * @param idEmplacement
   */
  @Transactional
  @Override
  public void deleteEmplacement(final int idEmplacement) {
    try {
      final Emplacement del = (Emplacement) this.entityManager.find((Class) Emplacement.class, (Object) idEmplacement);
      this.entityManager.remove((Object) del);
    } catch (Exception ex) {
    }
  }

  @Transactional
  @Override
  public void deletePhoto(final int idPhoto) {
    try {
      final Photo del = (Photo) this.entityManager.find((Class) Photo.class, (Object) idPhoto);
      this.entityManager.remove((Object) del);
    } catch (Exception ex) {
    }
  }

  @Transactional
  @Override
  public void deleteCategorie(final int idCategorie) {
    try {
      final Categorie del = (Categorie) this.entityManager.find((Class) Categorie.class, (Object) idCategorie);
      this.entityManager.remove((Object) del);
    } catch (Exception ex) {
    }
  }

  @Transactional
  @Override
  public void deleteMetier(final int idMetier) {
    try {
      final Metier del = (Metier) this.entityManager.find((Class) Metier.class, (Object) idMetier);
      this.entityManager.remove((Object) del);
    } catch (Exception ex) {
    }
  }

  @Override
  public void executeJob(final String user) {
    try {
      System.err.println("debug fileName :" + AppProperties.getPropertie("artisanArtipole.transfert.tables.path") + " " + user);
      final Process p = Runtime.getRuntime().exec(AppProperties.getPropertie("artisanArtipole.transfert.tables.path") + " " + user);
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
  public List<Emplacement> loadEmplacements() {
    return (List<Emplacement>) this.entityManager.createQuery("from Emplacement", (Class) Emplacement.class).getResultList();
  }

  @Override
  public List<Inspiration> loadInspirations() {
    return (List<Inspiration>) this.entityManager.createQuery("from Inspiration", (Class) Inspiration.class).getResultList();
  }

  @Override
  public Emplacement loadEmplacement(final int idEmplacement) {
    final Emplacement empl = (Emplacement) this.entityManager.find((Class) Emplacement.class, (Object) idEmplacement);
    return empl;
  }

  @Override
  public Actualite loadActualite(final int idActualite) {
    return (Actualite) this.entityManager.find((Class) Actualite.class, (Object) idActualite);
  }

  @Override
  public Inspiration loadInspiration(final int idInspiration) {
    return (Inspiration) this.entityManager.find((Class) Inspiration.class, (Object) idInspiration);
  }

  @Override
  public Metier loadMetier(final int idMetier) {
    return (Metier) this.entityManager.find((Class) Metier.class, (Object) idMetier);
  }

  @Override
  public List<Metier> loadMetiers() {
    return (List<Metier>) this.entityManager.createQuery("from Metier", (Class) Metier.class).getResultList();
  }

  @Override
  public Page loadPage(final int idPage) {
    return (Page) this.entityManager.find((Class) Page.class, (Object) idPage);
  }

  @Override
  public List<Page> loadPages() {
    return (List<Page>) this.entityManager.createQuery("from Page", (Class) Page.class).getResultList();
  }

  @Override
  public Photo loadPhoto(final int idPhoto) {
    return (Photo) this.entityManager.find((Class) Photo.class, (Object) idPhoto);
  }

  @Override
  public List<Photo> loadPhotos() {
    return (List<Photo>) this.entityManager.createQuery("from Photo", (Class) Photo.class).getResultList();
  }

  @Override
  public Categorie loadCategorie(final int idCategorie) {
    return (Categorie) this.entityManager.find((Class) Categorie.class, (Object) idCategorie);
  }

  @Transactional
  @Override
  public void saveEmplacement(final Emplacement emplacement) {
    if (emplacement.getId() == null) {
      this.createEmplacement(emplacement);
    } else {
      final Emplacement update = this.loadEmplacement(emplacement.getId());
      update.setLibelle(emplacement.getLibelle());
      update.setContent(emplacement.getContent());
      update.setType(emplacement.getType());
      if (emplacement.getData() != null) {
        update.setData(emplacement.getData());
      }
      update.setAlt(emplacement.getAlt());
      update.setPage(emplacement.getPage());
      this.entityManager.persist((Object) update);
    }
  }

  @Transactional
  @Override
  public void savePhoto(final Photo photo) {
    if (photo.getId() == null) {
      final Photo newItem = new Photo();
      newItem.setLibelle(photo.getLibelle());
      newItem.setData(photo.getData());
      newItem.setAlt(photo.getAlt());
      this.entityManager.persist((Object) newItem);
    } else {
      final Photo update = this.loadPhoto(photo.getId());
      update.setLibelle(photo.getLibelle());
      update.setData(photo.getData());
      update.setAlt(photo.getAlt());
      this.entityManager.persist((Object) update);
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
    this.entityManager.persist((Object) update);
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
    }
    update.setTitre(actualite.getTitre());
    update.setContenu(actualite.getContenu());
    update.setType(actualite.getType());
    update.setPosition(actualite.getPosition());
    update.setDate_ajout(actualite.getDate_ajout());
    this.entityManager.persist((Object) update);
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
    this.entityManager.persist((Object) update);
  }

  @Transactional
  public void saveMetiers(final List<Metier> metiers) {
    metiers.stream().forEach(m -> this.saveMetier(m));
  }

  @Transactional
  public void createEmplacement(final Emplacement emplacement) {
    final Emplacement newEmpl = new Emplacement();
    newEmpl.setLibelle(emplacement.getLibelle());
    newEmpl.setContent(emplacement.getContent());
    newEmpl.setType(emplacement.getType());
    newEmpl.setData(emplacement.getData());
    newEmpl.setAlt(emplacement.getAlt());
    newEmpl.setPage(emplacement.getPage());
    this.entityManager.persist((Object) newEmpl);
  }

  @Transactional
  public void createCategorie(final Categorie categorie) {
    final Emplacement newEmpl = new Emplacement();
    newEmpl.setLibelle(categorie.getLibelle());
    this.entityManager.persist((Object) newEmpl);
  }
}