package fr.scabois.scabotheque.controller.adherent.edit;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import fr.scabois.scabotheque.bean.adherent.Etat;
import fr.scabois.scabotheque.bean.adherent.FormeJuridique;
import fr.scabois.scabotheque.bean.adherent.Pole;
import fr.scabois.scabotheque.bean.adherent.Role;
import fr.scabois.scabotheque.bean.adherent.Secteur;
import fr.scabois.scabotheque.bean.adherent.Tournee;
import fr.scabois.scabotheque.bean.commun.Agence;
import fr.scabois.scabotheque.bean.commun.Ape;
import fr.scabois.scabotheque.bean.commun.Commune;

public class EditAdherent {
    @NotEmpty(message = "{modification.notempty}")
    private String adresse;
    private String adresseComplement;
    private Agence agence;
    private Ape ape;
    @NotEmpty(message = "{modification.notempty}")
    private String code;
    @NotEmpty(message = "{modification.notempty}")
    private String codeERP;
    private String codeERPParent;
    // la présence de la commune est testée dans le controleur
    private Commune commune;
    private String contactComptable;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateClotureExe;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateEntree;
    @NotEmpty(message = "{modification.notempty}")
    private String denomination;
    private Etat etat;
    private FormeJuridique formeJuridique;
    private Integer id;
    private boolean isArtipole;
    private boolean isCharteArtipole;
    private boolean isFacebookArtipole;
    private boolean isFlocageArtipole;
    private boolean isFormationCommerce;
    private boolean isOutilDechargement;
    private boolean isWebArtipole;
    @NotEmpty(message = "{modification.notempty}")
    private String libelle;
    private String numRepMetier;
    private String photo;
    private Pole pole;
    // la présence de la commune RCS est testée dans le controleur
    private Commune rcsCommune;
    private String rcsRm;
    private Commune rmCommune;
    private Role role;
    // la présence de la commune est testée dans le controleur
    private Secteur secteur;
    @NotNull(message = "{modification.notempty}")
    private Integer siren;
    private Long siret;
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

    public Date getDateClotureExe() {
	return dateClotureExe;
    }

    public Date getDateEntree() {
	return dateEntree;
    }

    public String getDenomination() {
	return denomination;
    }

    public Etat getEtat() {
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

    public String getPhoto() {
	return photo == null ? "" : photo;
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

    public void setDateClotureExe(Date dateClotureExe) {
	this.dateClotureExe = dateClotureExe;
    }

    public void setDateEntree(Date dateEntree) {
	this.dateEntree = dateEntree;
    }

    public void setDenomination(String denomination) {
	this.denomination = denomination;
    }

    public void setEtat(Etat etat) {
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

    public void setIsOutilDechargement(boolean outilDechargement) {
	this.isOutilDechargement = outilDechargement;
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

    public void setPhoto(String photo) {
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

}