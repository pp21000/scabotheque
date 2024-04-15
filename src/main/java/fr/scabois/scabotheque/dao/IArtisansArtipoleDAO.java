/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
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
import java.util.List;

public interface IArtisansArtipoleDAO {

  List<Adherent> loadArtisansArtipole();

  void executeJob(final String p0);

  Actualite loadActualite(final int p0);

  List<Actualite> loadActualites();

  void saveActualite(final Actualite p0);

  void deleteActualite(final int p0);

  Certification loadCertification(final int p0);

  List<Certification> loadCertifications();

  void saveCertification(final Certification p0);

  void deleteCertification(final int p0);

  Emplacement loadEmplacement(final int p0);

  List<Emplacement> loadEmplacements();

  void saveEmplacement(final Emplacement p0);

  void deleteEmplacement(final int p0);

  Inspiration loadInspiration(final int p0);

  List<Inspiration> loadInspirations();

  Metier loadMetier(final int p0);

  List<Metier> loadMetiers();

  void saveMetier(final Metier p0);

  void saveMetiers(final List<Metier> p0);

  void deleteMetier(final int p0);

  Page loadPage(final int p0);

  List<Page> loadPages();

  Photo loadPhoto(final int p0);

  List<Photo> loadPhotos();

  void savePhoto(final Photo p0);

  void deletePhoto(final int p0);

  Realisation loadRealisation(final int p0);

  List<Realisation> loadRealisations(final int adhId);

  void saveRealisation(final Realisation p0);

  void deleteRealisation(final int p0);

  Specialite loadSpecialite(final int p0);

  List<Specialite> loadSpecialites();

  Travaux loadTravaux(final int p0);

  List<Travaux> loadTravauxList();

  void saveTravaux(final Travaux p0);

  void deleteTravaux(final int p0);

  List<Type> loadTypes();

}