package fr.scabois.scabotheque.controller.artisanArtipole.edit;

import javax.validation.constraints.NotNull;

public class EditAACategorie
{
    private Integer id;
    @NotNull(message = "{modification.notempty}")
    private String libelle;
    
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
