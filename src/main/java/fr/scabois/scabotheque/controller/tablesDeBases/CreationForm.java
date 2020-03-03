package fr.scabois.scabotheque.controller.tablesDeBases;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class CreationForm {

    @NotEmpty
    @NotNull
    private String libelle;

    public String getLibelle() {
	return libelle;
    }

    public void setLibelle(final String pLibelle) {
	libelle = pLibelle;
    }

}