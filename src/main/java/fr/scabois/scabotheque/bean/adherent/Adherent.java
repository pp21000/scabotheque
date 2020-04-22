package fr.scabois.scabotheque.bean.adherent;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import fr.scabois.scabotheque.bean.commun.Agence;
import fr.scabois.scabotheque.bean.commun.Ape;
import fr.scabois.scabotheque.bean.commun.Commune;

@Entity
@Table(name = "adherent")
public class Adherent {

    private String adresse;

    @Column(name = "adresse_complement")
    private String adresseComplement;

    @ManyToOne
    private Agence agence;

    @ManyToOne
    private Ape ape;

    @Column(name = "code_adh")
    private String code;

    @Column(name = "code_erp")
    private String codeERP;

    @Column(name = "code_erp_parent")
    private String codeERPParent;

    @ManyToOne
    private Commune commune;

    @Column(name = "contact_comptable")
    private String contactComptable;

    @OneToMany(mappedBy = "adherent", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<AdherentContactRole> contacts = new ArrayList<>();

    @Column(name = "cloture_exercice")
    private Date dateClotureExe;

    @Column(name = "date_entree")
    private Date dateEntree;

    @Column(name = "denom_sociale")
    private String denomination;

    @ManyToOne
    private AdherentEtat etat;

    @ManyToOne
    private AdherentType adherentType;

    @ManyToOne
    private CompteType compteType;

    @ManyToOne
    @JoinColumn(name = "form_juridique_id")
    private FormeJuridique formeJuridique;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "adhesion_artipole")
    private boolean isArtipole;

    @Column(name = "charte_artipole")
    private boolean isCharteArtipole;

    @Column(name = "facebook_artipole")
    private boolean isFacebookArtipole;

    @Column(name = "flocage_artipole")
    private boolean isFlocageArtipole;

    @Column(name = "formation_commerce")
    private boolean isFormationCommerce;

    @Column(name = "outil_dechargement")
    private boolean isOutilDechargement;

    @Column(name = "site_web_artipole")
    private boolean isWebArtipole;

    private String libelle;

    @Column(name = "num_rep_metier")
    private String numRepMetier;
    private byte[] photo;

    @ManyToOne
    private Pole pole;

    @ManyToOne
    @JoinColumn(name = "rcs_commune_id")
    private Commune rcsCommune;

    @Column(name = "rcs_rm")
    private String rcsRm;

    @ManyToOne
    @JoinColumn(name = "rm_commune_id")
    private Commune rmCommune;

    @ManyToOne
    private Role role;

    @ManyToOne
    private Secteur secteur;

    private Integer siren;

    private Long siret;

    @ManyToOne
    private Tournee tournee;

    public String getAdresse() {
	return adresse;
    }

    public String getAdresseComplement() {
	return adresseComplement;
    }

    public Agence getAgence() {
	return agence;
    }

    public Ape getApe() {
	return ape;
    }

    public String getCode() {
	return code;
    }

    public String getCodeERP() {
	return codeERP;
    }

    public String getCodeERPParent() {
	return codeERPParent;
    }

    public Commune getCommune() {
	return commune;
    }

    public String getContactComptable() {
	return contactComptable;
    }

    public List<AdherentContactRole> getContacts() {
	return contacts;
    }

    public Date getDateClotureExe() {
	return dateClotureExe;
    }

    public Date getDateEntree() {
	return dateEntree;
    }

    public String getDenomination() {
	return denomination;
    }

    public AdherentEtat getEtat() {
	return etat;
    }

    public FormeJuridique getFormeJuridique() {
	return formeJuridique;
    }

    public Integer getId() {
	return id;
    }

    public boolean getIsArtipole() {
	return isArtipole;
    }

    public boolean getIsCharteArtipole() {
	return isCharteArtipole;
    }

    public boolean getIsFacebookArtipole() {
	return isFacebookArtipole;
    }

    public boolean getIsFlocageArtipole() {
	return isFlocageArtipole;
    }

    public boolean getIsFormationCommerce() {
	return isFormationCommerce;
    }

    public boolean getIsOutilDechargement() {
	return isOutilDechargement;
    }

    public boolean getIsWebArtipole() {
	return isWebArtipole;
    }

    public String getLibelle() {
	return libelle;
    }

    public String getNumRepMetier() {
	return numRepMetier;
    }

    public byte[] getPhoto() {
	return photo;
    }

    public String getPhotoImg() {
	return photo == null ? "" : new String(photo);
    }

    public Pole getPole() {
	return pole;
    }

    public Commune getRcsCommune() {
	return rcsCommune;
    }

    public String getRcsRm() {
	return rcsRm;
    }

    public CompteType getCompteType() {
        return compteType;
    }

    public Commune getRmCommune() {
	return rmCommune;
    }

    public Role getRole() {
	return role;
    }

    public Secteur getSecteur() {
	return secteur;
    }

    public Integer getSiren() {
	return siren;
    }

    public Long getSiret() {
	return siret;
    }

    public Tournee getTournee() {
	return tournee;
    }

    public AdherentType getAdherentType() {
        return adherentType;
    }

    public void setAdresse(String adresse) {
	this.adresse = adresse;
    }

    public void setAdresseComplement(String adresseComplement) {
	this.adresseComplement = adresseComplement;
    }

    public void setAgence(Agence agence) {
	this.agence = agence;
    }

    public void setApe(Ape ape) {
	this.ape = ape;
    }

    public void setCode(String code) {
	this.code = code;
    }

    public void setCodeERP(String codeERP) {
	this.codeERP = codeERP;
    }

    public void setCodeERPParent(String codeERPParent) {
	this.codeERPParent = codeERPParent;
    }

    public void setCommune(Commune commune) {
	this.commune = commune;
    }

    public void setContactComptable(String contactComptable) {
	this.contactComptable = contactComptable;
    }

    public void setContacts(List<AdherentContactRole> contacts) {
	this.contacts.clear();
	this.contacts.addAll(contacts);
    }

    public void setDateClotureExe(Date dateClotureExe) {
	this.dateClotureExe = dateClotureExe;
    }

    public void setDateEntree(Date dateEntree) {
	this.dateEntree = dateEntree;
    }

    public void setDenomination(String denomination) {
	this.denomination = denomination;
    }

    public void setEtat(AdherentEtat etat) {
	this.etat = etat;
    }

    public void setFormeJuridique(FormeJuridique formeJuridique) {
	this.formeJuridique = formeJuridique;
    }

    public void setId(Integer id) {
	this.id = id;
    }

    public void setIsArtipole(boolean isArtipole) {
	this.isArtipole = isArtipole;
    }

    public void setIsCharteArtipole(boolean isCharteArtipole) {
	this.isCharteArtipole = isCharteArtipole;
    }

    public void setIsFacebookArtipole(boolean isFacebookArtipole) {
	this.isFacebookArtipole = isFacebookArtipole;
    }

    public void setIsFlocageArtipole(boolean isFlocageArtipole) {
	this.isFlocageArtipole = isFlocageArtipole;
    }

    public void setIsFormationCommerce(boolean isFormationCommerce) {
	this.isFormationCommerce = isFormationCommerce;
    }

    public void setIsWebArtipole(boolean isWebArtipole) {
	this.isWebArtipole = isWebArtipole;
    }

    public void setLibelle(String libelle) {
	this.libelle = libelle;
    }

    public void setNumRepMetier(String numRepMetier) {
	this.numRepMetier = numRepMetier;
    }

    public void setOutilDechargement(boolean outilDechargement) {
	this.isOutilDechargement = outilDechargement;
    }

    public void setPhoto(byte[] photo) {
	this.photo = photo;
    }

    public void setPole(Pole pole) {
	this.pole = pole;
    }

    public void setRcsCommune(Commune rcsCommune) {
	this.rcsCommune = rcsCommune;
    }

    public void setRcsRm(String rcsRm) {
	this.rcsRm = rcsRm;
    }

    public void setCompteType(CompteType compteType) {
        this.compteType = compteType;
    }

    public void setRmCommune(Commune rmCommune) {
	this.rmCommune = rmCommune;
    }

    public void setRole(Role role) {
	this.role = role;
    }

    public void setSecteur(Secteur secteur) {
	this.secteur = secteur;
    }

    public void setSiren(Integer siren) {
	this.siren = siren;
    }

    public void setSiret(Long siret) {
	this.siret = siret;
    }

    public void setTournee(Tournee tournee) {
	this.tournee = tournee;
    }

//    @Column(name = "nb_parts")
//    private Integer nbParts;

    public void setAdherentType(AdherentType adherentType) {
        this.adherentType = adherentType;
    }

}