package fr.scabois.scabotheque.bean.commun;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import fr.scabois.scabotheque.bean.HasIdLibelle;

@Entity
@Table(name = "activite")
public class Activite implements HasIdLibelle {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String libelle;

    @Override
    public Integer getId() {
	return id;
    }

    @Override
    public String getLibelle() {
	return libelle;
    }

    @Override
    public void setId(Integer id) {
	this.id = id;
    }

    @Override
    public void setLibelle(String libelle) {
	this.libelle = libelle;
    }

}