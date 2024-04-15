package fr.scabois.scabotheque.controller.artisansArtipole.edit;

import javax.validation.constraints.NotNull;

public class EditMetier
{
    private Integer id;
    @NotNull(message = "{modification.notempty}")
    private String libelle;
    private String description;
    
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(final String description) {
        this.description = description;
    }
    
    public Integer getId() {
        return this.id;
    }
    
    public void setId(final Integer id) {
        this.id = id;
    }
    
    public String getLibelle() {
        return this.libelle;
    }
    
    public void setLibelle(final String libelle) {
        this.libelle = libelle;
    }
}