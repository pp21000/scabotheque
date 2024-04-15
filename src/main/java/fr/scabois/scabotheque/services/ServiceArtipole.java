package fr.scabois.scabotheque.services;

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
import fr.scabois.scabotheque.dao.IArtisansArtipoleDAO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServiceArtipole implements IServiceArtipole {

  @Autowired
  private IArtisansArtipoleDAO dao;

  @Override
  public List<Adherent> loadArtisansArtipole() {
    return this.dao.loadArtisansArtipole();
  }

  @Override
  public void executeJob(final String user) {
    this.dao.executeJob(user);
  }

  @Override
  public Actualite loadActualite(final int idActualite) {
    return this.dao.loadActualite(idActualite);
  }

  @Override
  public List<Actualite> loadActualites() {
    return this.dao.loadActualites();
  }

  @Override
  public void saveActualite(final Actualite actualite) {
    this.dao.saveActualite(actualite);
  }

  @Override
  public void deleteActualite(final int idActualite) {
    this.dao.deleteActualite(idActualite);
  }

  @Override
  public Certification loadCertification(final Integer idCertification) {
    return this.dao.loadCertification(idCertification);
  }

  @Override
  public List<Certification> loadCertifications() {
    return this.dao.loadCertifications();
  }

  @Override
  public void saveCertification(final Certification certification) {
    this.dao.saveCertification(certification);
  }

  @Override
  public void deleteCertification(final int idCertification) {
    this.dao.deleteCertification(idCertification);
  }

  @Override
  public Emplacement loadEmplacement(final int idEmplacement) {
    return this.dao.loadEmplacement(idEmplacement);
  }

  @Override
  public List<Emplacement> loadEmplacements() {
    return this.dao.loadEmplacements();
  }

  @Override
  public void saveEmplacement(final Emplacement emplacement) {
    this.dao.saveEmplacement(emplacement);
  }

  @Override
  public void deleteEmplacement(final int idEmplacement) {
    this.dao.deleteEmplacement(idEmplacement);
  }

  @Override
  public Inspiration loadInspiration(final int idInspiration) {
    return this.dao.loadInspiration(idInspiration);
  }

  @Override
  public List<Inspiration> loadInspirations() {
    return this.dao.loadInspirations();
  }

  @Override
  public Metier loadMetier(final Integer idMetier) {
    return this.dao.loadMetier(idMetier);
  }

  @Override
  public List<Metier> loadMetiers() {
    return this.dao.loadMetiers();
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
  public void deleteMetier(final int idMetier) {
    this.dao.deleteMetier(idMetier);
  }

  @Override
  public Page loadPage(final Integer idPage) {
    return this.dao.loadPage(idPage);
  }

  @Override
  public List<Page> loadPages() {
    return this.dao.loadPages();
  }

  @Override
  public Photo loadPhoto(final Integer idPhoto) {
    return this.dao.loadPhoto(idPhoto);
  }

  @Override
  public List<Photo> loadPhotos() {
    return this.dao.loadPhotos();
  }

  @Override
  public void savePhoto(final Photo photo) {
    this.dao.savePhoto(photo);
  }

  @Override
  public void deletePhoto(final int idPhoto) {
    this.dao.deletePhoto(idPhoto);
  }

  @Override
  public Realisation loadRealisation(final Integer idRealisation) {
    return this.dao.loadRealisation(idRealisation);
  }

  @Override
  public List<Realisation> loadRealisations(final int adhId) {
    return this.dao.loadRealisations(adhId);
  }

  @Override
  public void saveRealisation(final Realisation realisation) {
    this.dao.saveRealisation(realisation);
  }

  @Override
  public void deleteRealisation(final int idRealisation) {
    this.dao.deleteRealisation(idRealisation);
  }

  @Override
  public Specialite loadSpecialite(final int idSpecialite) {
    return this.dao.loadSpecialite(idSpecialite);
  }

  @Override
  public List<Specialite> loadSpecialites() {
    return this.dao.loadSpecialites();
  }

  @Override
  public Travaux loadTravaux(final int idTravaux) {
    return this.dao.loadTravaux(idTravaux);
  }

  @Override
  public List<Travaux> loadTravauxList() {
    return this.dao.loadTravauxList();
  }

  @Override
  public void saveTravaux(final Travaux travaux) {
    this.dao.saveTravaux(travaux);
  }

  @Override
  public void deleteTravaux(final int idTravaux) {
    this.dao.deleteTravaux(idTravaux);
  }

  @Override
  public List<Type> loadTypes() {
    return this.dao.loadTypes();
  }

}
