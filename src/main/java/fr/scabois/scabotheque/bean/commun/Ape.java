package fr.scabois.scabotheque.bean.commun;

import fr.scabois.scabotheque.bean.HasIdLibelle;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "code_ape")
public class Ape implements HasIdLibelle {

    private String code;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String libelle;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getId() {
        return id;
    }

    public void setId(final Integer pId) {
        id = pId;
    }

    @Override
    public String getLibelle() {
        return code + " - " + libelle;
    }

    public void setLibelle(final String pLibelle) {
        libelle = pLibelle;
    }
}
