package fr.scabois.scabotheque.bean.commun;

import fr.scabois.scabotheque.bean.HasIdPositionLibelle;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "fonction_contact")
public class ContactFonction implements HasIdPositionLibelle, Comparable<ContactFonction> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String libelle;
    @Column(name = "n_position")
    private Integer position;

    @Override
    public int compareTo(ContactFonction o) {
        return position.compareTo(o.getPosition());
    }

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

    @Override
    public Integer getPosition() {
        return position;
    }

    @Override
    public void setPosition(Integer position) {
        this.position = position;
    }
}
