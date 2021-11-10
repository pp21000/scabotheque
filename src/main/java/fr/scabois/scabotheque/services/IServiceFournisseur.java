package fr.scabois.scabotheque.services;

import java.util.List;

import fr.scabois.scabotheque.bean.fournisseur.Fournisseur;

public interface IServiceFournisseur {

    Fournisseur LoadFournisseur(int idFournisseur);

    List<Fournisseur> LoadFournisseurs();
}