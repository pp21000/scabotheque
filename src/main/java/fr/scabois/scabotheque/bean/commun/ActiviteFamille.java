package fr.scabois.scabotheque.bean.commun;

import fr.scabois.scabotheque.bean.HasId;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "activite_famille")
public class ActiviteFamille implements HasId {

    @Column(name = "activite_id")
    private Integer activiteId;

    private Integer famille;
    //    @Column(name = "familles_liste")
//    private String famillesListe;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "sous_famille")
    private Integer sousFamille;

    public Integer getActiviteId() {
        return activiteId;
    }

    public void setActiviteId(Integer activiteId) {
        this.activiteId = activiteId;
    }

    public Integer getFamille() {
        return famille;
    }

    public void setFamille(Integer famille) {
        this.famille = famille;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSousFamille() {
        return sousFamille;
    }

    public void setSousFamille(Integer sousFamille) {
        this.sousFamille = sousFamille;
    }

}
