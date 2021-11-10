package fr.scabois.scabotheque.controller.tablesDeBases;

import org.hibernate.validator.constraints.NotEmpty;

public class EditIdLibList {

//    @NotEmpty(message = "{modification.notempty}")
    private Integer id;
    @NotEmpty(message = "{modification.notempty}")
    private String libelle;

    private int position;

    EditIdLibList() {
    }

    EditIdLibList(Integer id, String libelle, Integer position) {
        this.id = id;
        this.libelle = libelle;
        this.position = position == null ? 0 : position;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

}
