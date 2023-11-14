package fr.scabois.scabotheque.services;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.artisanArtipole.Actualite;
import fr.scabois.scabotheque.bean.artisanArtipole.Categorie;
import fr.scabois.scabotheque.bean.artisanArtipole.Emplacement;
import fr.scabois.scabotheque.bean.artisanArtipole.Inspiration;
import fr.scabois.scabotheque.bean.artisanArtipole.Metier;
import fr.scabois.scabotheque.bean.artisanArtipole.Page;
import fr.scabois.scabotheque.bean.artisanArtipole.Photo;
import fr.scabois.scabotheque.bean.artisanArtipole.Specialite;
import fr.scabois.scabotheque.bean.artisanArtipole.Travaux;
import fr.scabois.scabotheque.dao.IArtisanArtipoleDAO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author dslowensky
 */
@Service
public class ServiceArtipole implements IServiceArtipole {

  @Autowired
  private IArtisanArtipoleDAO dao;

  @Override
  public void deleteActualite(final int idActualite) {
    this.dao.deleteActualite(idActualite);
  }

  @Override
  public void deleteEmplacement(final int idEmplacement) {
    this.dao.deleteEmplacement(idEmplacement);
  }

  @Override
  public void deleteTravaux(final int idTravaux) {
    this.dao.deleteTravaux(idTravaux);
  }

  @Override
  public void deletePhoto(final int idPhoto) {
    this.dao.deletePhoto(idPhoto);
  }

  @Override
  public void deleteCategorie(final int idCategorie) {
    this.dao.deleteCategorie(idCategorie);
  }

  @Override
  public void deleteMetier(final int idMetier) {
    this.dao.deleteMetier(idMetier);
  }

  @Override
  public void executeJob(final String user) {
    this.dao.executeJob(user);
  }

  @Override
  public List<Adherent> loadArtisanArtipole() {
    return (List<Adherent>) this.dao.loadArtisanArtipole();
  }

  @Override
  public List<Categorie> loadCategories() {
    return (List<Categorie>) this.dao.loadCategories();
  }

  @Override
  public Actualite loadActualite(final int idActualite) {
    return this.dao.loadActualite(idActualite);
  }

  @Override
  public List<Actualite> loadActualites() {
    return (List<Actualite>) this.dao.loadActualites();
  }

  @Override
  public Inspiration loadInspiration(final int idInspiration) {
    return this.dao.loadInspiration(idInspiration);
  }

  @Override
  public List<Inspiration> loadInspirations() {
    return (List<Inspiration>) this.dao.loadInspirations();
  }

  @Override
  public Emplacement loadEmplacement(final int idEmplacement) {
    return this.dao.loadEmplacement(idEmplacement);
  }

  @Override
  public List<Emplacement> loadEmplacements() {
    return (List<Emplacement>) this.dao.loadEmplacements();
  }

  @Override
  public Travaux loadTravaux(final int idTravaux) {
    return this.dao.loadTravaux(idTravaux);
  }

  @Override
  public List<Travaux> loadTravauxList() {
    return (List<Travaux>) this.dao.loadTravauxList();
  }

  @Override
  public Specialite loadSpecialite(final int idSpecialite) {
    return this.dao.loadSpecialite(idSpecialite);
  }

  @Override
  public List<Specialite> loadSpecialites() {
    return (List<Specialite>) this.dao.loadSpecialites();
  }

  @Override
  public List<Page> loadPages() {
    return (List<Page>) this.dao.loadPages();
  }

  @Override
  public Photo loadPhoto(final Integer idPhoto) {
    return this.dao.loadPhoto((int) idPhoto);
  }

  /**
   *
   * @return
   */
  @Override
  public List<Photo> loadPhotos() {
    return (List<Photo>) this.dao.loadPhotos();
  }

  @Override
  public Metier loadMetier(final Integer idMetier) {
    return this.dao.loadMetier((int) idMetier);
  }

  @Override
  public List<Metier> loadMetiers() {
    return (List<Metier>) this.dao.loadMetiers();
  }

  @Override
  public Page loadPage(final Integer idPage) {
    return this.dao.loadPage((int) idPage);
  }

  @Override
  public void saveActualite(final Actualite actualite) {
    this.dao.saveActualite(actualite);
  }

  @Override
  public void saveEmplacement(final Emplacement emplacement) {
    this.dao.saveEmplacement(emplacement);
  }

  @Override
  public void saveTravaux(final Travaux travaux) {
    this.dao.saveTravaux(travaux);
  }

  @Override
  public void saveCategorie(final Categorie categorie) {
    this.dao.saveCategorie(categorie);
  }

  @Override
  public void saveCategories(final List<Categorie> categories) {
    this.dao.saveCategories((List) categories);
  }

  @Override
  public void saveMetier(final Metier metier) {
    this.dao.saveMetier(metier);
  }

  @Override
  public void saveMetiers(final List<Metier> metiers) {
    this.dao.saveMetiers((List) metiers);
  }

  @Override
  public void savePhoto(final Photo photo) {
    this.dao.savePhoto(photo);
  }
}
