package fr.scabois.scabotheque.bean.adherent;

import fr.scabois.scabotheque.bean.HasId;
import fr.scabois.scabotheque.bean.commun.Activite;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "adherent_activite")
public class AdherentActivite implements HasId {

    @Transient
    private Double achatDateN;
    @Transient
    private Double achatDateN1;
    @Transient
    private Double achatDateN2;
    @Transient
    private Double achatDateN3;

    @Transient
    private Double achatN;
    @Transient
    private Double achatN1;
    @Transient
    private Double achatN2;
    @Transient
    private Double achatN3;

    @ManyToOne
    @JoinColumn(name = "activite_id")
    private Activite activite;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "adherent_id")
    private Adherent adherent;
    private String commentaire;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private int pourcentage;
    @Transient
    private Double totalDateN;
    @Transient
    private Double totalDateN1;
    @Transient
    private Double totalDateN2;
    @Transient
    private Double totalDateN3;

    @Transient
    private Double totalN;
    @Transient
    private Double totalN1;
    @Transient
    private Double totalN2;
    @Transient
    private Double totalN3;

    public Double getAchatDateN() {
        return achatDateN;
    }

    public void setAchatDateN(Double achatDateN) {
        this.achatDateN = achatDateN;
    }

    public Double getAchatDateN1() {
        return achatDateN1;
    }

    public void setAchatDateN1(Double achatDateN1) {
        this.achatDateN1 = achatDateN1;
    }

    public Double getAchatDateN2() {
        return achatDateN2;
    }

    public void setAchatDateN2(Double achatDateN2) {
        this.achatDateN2 = achatDateN2;
    }

    public Double getAchatDateN3() {
        return achatDateN3;
    }

    public void setAchatDateN3(Double achatDateN3) {
        this.achatDateN3 = achatDateN3;
    }

    public Double getAchatN() {
        return achatN;
    }

    public void setAchatN(Double achatN) {
        this.achatN = achatN;
    }

    public Double getAchatN1() {
        return achatN1;
    }

    public void setAchatN1(Double achatN1) {
        this.achatN1 = achatN1;
    }

    public Double getAchatN2() {
        return achatN2;
    }

    public void setAchatN2(Double achatN2) {
        this.achatN2 = achatN2;
    }

    public Double getAchatN3() {
        return achatN3;
    }

    public void setAchatN3(Double achatN3) {
        this.achatN3 = achatN3;
    }

    public Activite getActivite() {
        return activite;
    }

    public void setActivite(Activite activite) {
        this.activite = activite;
    }

    public Adherent getAdherent() {
        return adherent;
    }

    public void setAdherent(Adherent adherent) {
        this.adherent = adherent;
    }

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
    public void setId(Integer id) {
        this.id = id;
    }

    public int getPourcentage() {
        return pourcentage;
    }

    public void setPourcentage(int pourcentage) {
        this.pourcentage = pourcentage;
    }

    public Double getTotalDateN() {
        return totalDateN;
    }

    public void setTotalDateN(Double totalDateN) {
        this.totalDateN = totalDateN;
    }

    public Double getTotalDateN1() {
        return totalDateN1;
    }

    public void setTotalDateN1(Double totalDateN1) {
        this.totalDateN1 = totalDateN1;
    }

    public Double getTotalDateN2() {
        return totalDateN2;
    }

    public void setTotalDateN2(Double totalDateN2) {
        this.totalDateN2 = totalDateN2;
    }

    public Double getTotalDateN3() {
        return totalDateN3;
    }

    public void setTotalDateN3(Double totalDateN3) {
        this.totalDateN3 = totalDateN3;
    }

    public Double getTotalN() {
        return totalN;
    }

    public void setTotalN(Double totalN) {
        this.totalN = totalN;
    }

    public Double getTotalN1() {
        return totalN1;
    }

    public void setTotalN1(Double totalN1) {
        this.totalN1 = totalN1;
    }

    public Double getTotalN2() {
        return totalN2;
    }

    public void setTotalN2(Double totalN2) {
        this.totalN2 = totalN2;
    }

    public Double getTotalN3() {
        return totalN3;
    }

    public void setTotalN3(Double totalN3) {
        this.totalN3 = totalN3;
    }

}
