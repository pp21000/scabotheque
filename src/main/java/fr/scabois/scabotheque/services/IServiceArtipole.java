package fr.scabois.scabotheque.services;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.adherent.Type;
import fr.scabois.scabotheque.bean.artisanArtipole.Actualite;
import fr.scabois.scabotheque.bean.artisanArtipole.Categorie;
import fr.scabois.scabotheque.bean.artisanArtipole.Certification;
import fr.scabois.scabotheque.bean.artisanArtipole.Emplacement;
import fr.scabois.scabotheque.bean.artisanArtipole.Inspiration;
import fr.scabois.scabotheque.bean.artisanArtipole.Metier;
import fr.scabois.scabotheque.bean.artisanArtipole.Page;
import fr.scabois.scabotheque.bean.artisanArtipole.Photo;
import fr.scabois.scabotheque.bean.artisanArtipole.Specialite;
import fr.scabois.scabotheque.bean.artisanArtipole.Travaux;
import java.util.List;

public interface IServiceArtipole {

  List<Adherent> loadArtisanArtipole();

  Emplacement loadEmplacement(final int p0);

  List<Emplacement> loadEmplacements();

  Travaux loadTravaux(final int p0);

  List<Travaux> loadTravauxList();

  Specialite loadSpecialite(final int p0);

  List<Specialite> loadSpecialites();

  Inspiration loadInspiration(final int p0);

  Actualite loadActualite(final int p0);

  void deleteActualite(final int p0);

  void deleteCategorie(final int p0);

  void deleteEmplacement(final int p0);

  void deleteTravaux(final int p0);

  void deleteMetier(final int p0);

  void deletePhoto(final int p0);

  void deleteCertification(final int p0);

  void executeJob(final String p0);

  List<Actualite> loadActualites();

  Metier loadMetier(final Integer p0);

  List<Metier> loadMetiers();

  Page loadPage(final Integer p0);

  List<Page> loadPages();

  Photo loadPhoto(final Integer p0);

  Certification loadCertification(final Integer p0);

  List<Categorie> loadCategories();

  List<Inspiration> loadInspirations();

  List<Photo> loadPhotos();

  List<Certification> loadCertifications();

  List<Type> loadTypes();

  void saveEmplacement(final Emplacement p0);

  void saveTravaux(final Travaux p0);

  void saveActualite(final Actualite p0);

  void saveCategorie(final Categorie p0);

  void saveCategories(final List<Categorie> p0);

  void saveMetier(final Metier p0);

  void saveMetiers(final List<Metier> p0);

  void savePhoto(final Photo p0);

  void saveCertification(final Certification p0);
}
