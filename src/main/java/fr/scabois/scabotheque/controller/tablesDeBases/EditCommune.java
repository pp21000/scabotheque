package fr.scabois.scabotheque.controller.tablesDeBases;

import org.hibernate.validator.constraints.NotEmpty;

public class EditCommune {
    @NotEmpty(message = "{modification.notempty}")
    private String codePostal;
    @NotEmpty(message = "{modification.notempty}")
    private String departement;
    private Integer id;
    @NotEmpty(message = "{modification.notempty}")
    private String libelle;

    public String getCodePostal() {
	return codePostal;
    }

    public String getDepartement() {
	return departement;
    }

    public Integer getId() {
	return id;
    }

    public String getLibelle() {
	return libelle;
    }

    public void setCodePostal(String codePostal) {
	this.codePostal = codePostal;
    }

    public void setDepartement(String departement) {
	this.departement = departement;
    }

    public void setId(Integer id) {
	this.id = id;
    }

    public void setLibelle(String libelle) {
	this.libelle = libelle;
    }

}