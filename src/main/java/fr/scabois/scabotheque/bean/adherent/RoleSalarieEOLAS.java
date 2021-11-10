package fr.scabois.scabotheque.bean.adherent;

import fr.scabois.scabotheque.bean.HasIdPositionLibelle;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "roles_salarie_eolas")
public class RoleSalarieEOLAS implements HasIdPositionLibelle {

    private String commentaire;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String libelle;
    @Column(name = "nom_flux")
    private String nomFlux;
    @Column(name = "n_position")
    private Integer position;

    public String getCommentaire() {
        return commentaire;
    }

    public void setCommentaire(String commentaire) {
        this.commentaire = commentaire;
    }

    @Override
    public Integer getId() {
        return id;
    }

    @Override
    public void setId(Integer pId) {
        this.id = id;
    }

    @Override
    public String getLibelle() {
        return libelle;
    }

    @Override
    public void setLibelle(String pLibelle) {
        this.libelle = libelle;
    }

    public String getNomFlux() {
        return nomFlux;
    }

    public void setNomFlux(String nomFlux) {
        this.nomFlux = nomFlux;
    }

    @Override
    public Integer getPosition() {
        return position;
    }

    @Override
    public void setPosition(Integer pPosition) {
        this.position = position;
    }
}
