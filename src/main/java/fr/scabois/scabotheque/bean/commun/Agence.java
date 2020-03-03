package fr.scabois.scabotheque.bean.commun;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import fr.scabois.scabotheque.bean.HasIdLibelle;

@Entity
@Table(name = "agence")
public class Agence implements HasIdLibelle {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String libelle;

    @Override
    public Integer getId() {
	return id;
    }

    @Override
    public void setId(final Integer pId) {
	id = pId;
    }

    @Override
    public String getLibelle() {
	return libelle;
    }

    @Override
    public void setLibelle(final String pLibelle) {
	libelle = pLibelle;
    }
}