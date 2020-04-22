package fr.scabois.scabotheque.bean.adherent;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "adherent_etat")
public class AdherentEtat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String libelle;

    public Integer getId() {
	return id;
    }

    public void setId(final Integer pId) {
	id = pId;
    }

    public String getLibelle() {
	return libelle;
    }

    public void setLibelle(final String pLibelle) {
	libelle = pLibelle;
    }

}