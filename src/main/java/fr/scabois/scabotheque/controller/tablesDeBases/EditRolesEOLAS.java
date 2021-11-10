package fr.scabois.scabotheque.controller.tablesDeBases;

import org.hibernate.validator.constraints.NotEmpty;

public class EditRolesEOLAS {
    @NotEmpty(message = "{modification.notempty}")
    private String nomFlux;
    private String commentaire;
    private Integer id;
    @NotEmpty(message = "{modification.notempty}")
    private String libelle;

    public String getNomFlux() {
	return nomFlux;
    }

    public String getCommentaire() {
	return commentaire;
    }

    public Integer getId() {
	return id;
    }

    public String getLibelle() {
	return libelle;
    }

    public void setNomFlux(String nomFlux) {
	this.nomFlux = nomFlux;
    }

    public void setCommentaire(String commentaire) {
	this.commentaire = commentaire;
    }

    public void setId(Integer id) {
	this.id = id;
    }

    public void setLibelle(String libelle) {
	this.libelle = libelle;
    }

}