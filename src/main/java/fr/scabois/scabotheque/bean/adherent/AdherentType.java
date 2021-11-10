package fr.scabois.scabotheque.bean.adherent;

import fr.scabois.scabotheque.bean.HasIdLibelle;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "adherent_type")
public class AdherentType implements HasIdLibelle {

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
