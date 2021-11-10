package fr.scabois.scabotheque.bean.commun;

import fr.scabois.scabotheque.bean.HasIdPositionLibelle;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "activite")
public class Activite implements HasIdPositionLibelle {

    @OneToMany(mappedBy = "activiteId", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<ActiviteFamille> famille = new ArrayList<>();

//    @Column(name = "familles_liste")
//    private String famillesListe;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String libelle;
    @Column(name = "n_position")
    private Integer position;

    public List<ActiviteFamille> getFamille() {
        return famille;
    }

    public void setFamille(List<ActiviteFamille> famille) {
        this.famille = famille;
    }

    public Activite(Integer id, String libelle, Integer position) {
        this.id = id;
        this.libelle = libelle;
        this.position = position;
    }

    public Activite() {
    }

//    public Activite(Integer id, String libelle, String famillesListe, Integer position) {
//        this.famillesListe = famillesListe;
//        this.id = id;
//        this.libelle = libelle;
//        this.position = position;
//    }
//
//    public String getFamillesListe() {
//        return famillesListe;
//    }
//
//    public void setFamillesListe(String famillesListe) {
//        this.famillesListe = famillesListe;
//    }
    @Override
    public Integer getId() {
        return id;
    }

    @Override
    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public String getLibelle() {
        return libelle;
    }

    @Override
    public void setLibelle(String libelle) {
        this.libelle = libelle;
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
