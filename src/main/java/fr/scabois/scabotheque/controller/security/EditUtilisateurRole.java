package fr.scabois.scabotheque.controller.security;

import fr.scabois.scabotheque.enums.RoleEnum;

public class EditUtilisateurRole {
    private boolean actif;

    private int id;
    private String libelle;

    private RoleEnum role;

    public EditUtilisateurRole() {

    }

    public EditUtilisateurRole(int id, String libelle, RoleEnum role, boolean actif) {
	this.id = id;
	this.libelle = libelle;
	this.role = role;
	this.actif = actif;
    }

    public int getId() {
	return id;
    }

    public String getLibelle() {
	return libelle;
    }

    public RoleEnum getRole() {
	return role;
    }

    public boolean isActif() {
	return actif;
    }

    public void setActif(boolean actif) {
	this.actif = actif;
    }

    public void setId(int id) {
	this.id = id;
    }

    public void setLibelle(String libelle) {
	this.libelle = libelle;
    }

    public void setRole(RoleEnum role) {
	this.role = role;
    }
}