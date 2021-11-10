package fr.scabois.scabotheque.dao;

import java.util.List;

import fr.scabois.scabotheque.bean.fournisseur.Fournisseur;

public interface IFournisseurDAO {

    Fournisseur loadFournisseur(int idFournisseur);

    List<Fournisseur> loadFournisseurs();
}