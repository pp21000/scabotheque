/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package fr.scabois.scabotheque.dao;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.artisanArtipole.Actualite;
import fr.scabois.scabotheque.bean.artisanArtipole.Categorie;
import fr.scabois.scabotheque.bean.artisanArtipole.Emplacement;
import fr.scabois.scabotheque.bean.artisanArtipole.Inspiration;
import fr.scabois.scabotheque.bean.artisanArtipole.Metier;
import fr.scabois.scabotheque.bean.artisanArtipole.Page;
import fr.scabois.scabotheque.bean.artisanArtipole.Photo;
import java.util.List;

/**
 *
 * @author paul.petit
 */
public interface IArtisanArtipoleDAO {

  void deleteActualite(final int p0);

  void deleteCategorie(final int p0);

  void deleteEmplacement(final int p0);

  void deleteMetier(final int p0);

  void deletePhoto(final int p0);

  void executeJob(final String p0);

  Actualite loadActualite(final int p0);

  List<Actualite> loadActualites();

  List<Adherent> loadArtisanArtipole();

  List<Categorie> loadCategories();

  Emplacement loadEmplacement(final int p0);

  Categorie loadCategorie(final int p0);

  List<Emplacement> loadEmplacements();

  Inspiration loadInspiration(final int p0);

  List<Inspiration> loadInspirations();

  Metier loadMetier(final int p0);

  List<Metier> loadMetiers();

  Page loadPage(final int p0);

  List<Page> loadPages();

  Photo loadPhoto(final int p0);

  List<Photo> loadPhotos();

  void saveActualite(final Actualite p0);

  void saveCategories(final List<Categorie> p0);

  void saveEmplacement(final Emplacement p0);

  void saveCategorie(final Categorie p0);

  void saveMetier(final Metier p0);

  void saveMetiers(final List<Metier> p0);

  void savePhoto(final Photo p0);
}
