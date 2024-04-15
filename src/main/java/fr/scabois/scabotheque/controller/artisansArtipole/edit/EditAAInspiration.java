package fr.scabois.scabotheque.controller.artisansArtipole.edit;

import org.hibernate.validator.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class EditAAInspiration
{
    private Integer id;
    @NotNull(message = "{modification.notempty}")
    private String libelle;
    @NotEmpty(message = "{modification.notempty}")
    private Integer metierId;
    @NotEmpty(message = "{modification.notempty}")
    private Integer photoId;
    @NotEmpty(message = "{modification.notempty}")
    private Integer pageId;
    @NotEmpty(message = "{modification.notempty}")
    private Integer position;
    
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
    
    public Integer getMetierId() {
        return this.metierId;
    }
    
    public void setMetierId(final Integer metierId) {
        this.metierId = metierId;
    }
    
    public Integer getPageId() {
        return this.pageId;
    }
    
    public void setPageId(final Integer pageId) {
        this.pageId = pageId;
    }
    
    public Integer getPhotoId() {
        return this.photoId;
    }
    
    public void setPhotoId(final Integer photoId) {
        this.photoId = photoId;
    }
    
    public Integer getPosition() {
        return this.position;
    }
    
    public void setPosition(final Integer position) {
        this.position = position;
    }
}