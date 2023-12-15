package fr.scabois.scabotheque.services;

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
import fr.scabois.scabotheque.dao.IArtisanArtipoleDAO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
  public void deleteCertification(final int idCertification) {
    this.dao.deleteCertification(idCertification);
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
    return this.dao.loadArtisanArtipole();
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
  public Inspiration loadInspiration(final int idInspiration) {
    return this.dao.loadInspiration(idInspiration);
  }

  @Override
  public List<Inspiration> loadInspirations() {
    return this.dao.loadInspirations();
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
  public Travaux loadTravaux(final int idTravaux) {
    return this.dao.loadTravaux(idTravaux);
  }

  @Override
  public List<Travaux> loadTravauxList() {
    return this.dao.loadTravauxList();
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
  public List<Page> loadPages() {
    return this.dao.loadPages();
  }

  @Override
  public Photo loadPhoto(final Integer idPhoto) {
    return this.dao.loadPhoto((int) idPhoto);
  }

  @Override
  public List<Photo> loadPhotos() {
    return this.dao.loadPhotos();
  }

  @Override
  public Certification loadCertification(final Integer idCertification) {
    return this.dao.loadCertification((int) idCertification);
  }

  @Override
  public List<Certification> loadCertifications() {
    return this.dao.loadCertifications();
  }

  @Override
  public Metier loadMetier(final Integer idMetier) {
    return this.dao.loadMetier((int) idMetier);
  }

  @Override
  public List<Metier> loadMetiers() {
    return this.dao.loadMetiers();
  }

  @Override
  public Page loadPage(final Integer idPage) {
    return this.dao.loadPage((int) idPage);
  }

  @Override
  public List<Type> loadTypes() {
    return this.dao.loadTypes();
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

  @Override
  public void saveCertification(final Certification certification) {
    this.dao.saveCertification(certification);
  }
}
