package fr.scabois.scabotheque.controller.adherent.edit;

import fr.scabois.scabotheque.bean.adherent.AdherentEtat;
import fr.scabois.scabotheque.bean.adherent.AdherentType;
import fr.scabois.scabotheque.bean.adherent.CompteType;
import fr.scabois.scabotheque.bean.adherent.FormeJuridique;
import fr.scabois.scabotheque.bean.adherent.Pole;
import fr.scabois.scabotheque.bean.adherent.Role;
import fr.scabois.scabotheque.bean.adherent.Secteur;
import fr.scabois.scabotheque.bean.adherent.Tournee;
import fr.scabois.scabotheque.bean.commun.Agence;
import fr.scabois.scabotheque.bean.commun.Ape;
import fr.scabois.scabotheque.bean.commun.Commune;
import java.util.Date;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

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

//    private AdherentContactComptable contactComptable;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateCreation;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateEntree;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateClotureExe;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateSortie;
    @NotEmpty(message = "{modification.notempty}")
    private String denomination;
    private AdherentEtat etat;
    private FormeJuridique formeJuridique;
    private Integer id;
    private Integer nbSalaries;
    private boolean isArtipole;
    private boolean isCharteArtipole;
    private boolean isFacebookArtipole;
    private boolean isFlocageArtipole;
    private String formationDirigeant;
    private boolean isOutilDechargement;
    private boolean isWebArtipole;
    private boolean cnxEolasAllow;
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
    private String siren;
    private String siret;
    private Tournee tournee;
    private AdherentType adherentType;
    private CompteType compteType;

    public AdherentType getAdherentType() {
        return adherentType;
    }

    public void setAdherentType(AdherentType adherentType) {
        this.adherentType = adherentType;
    }

    public CompteType getCompteType() {
        return compteType;
    }

    public void setCompteType(CompteType compteType) {
        this.compteType = compteType;
    }

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

//    public AdherentContactComptable getContactComptable() {
//        return contactComptable;
//    }
    public Date getDateClotureExe() {
        return dateClotureExe;
    }

    public Date getDateCreation() {
        return dateCreation;
    }

    public Date getDateEntree() {
        return dateEntree;
    }

    public Date getDateSortie() {
        return dateSortie;
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

    public Integer getNbSalarie() {
        return nbSalaries;
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

    public String getFormationDirigeant() {
        return formationDirigeant;
    }

    public boolean getCnxEolasAllow() {
        return cnxEolasAllow;
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

    public String getSiren() {
        return siren;
    }

    public String getSiret() {
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

//    public void setContactComptable(AdherentContactComptable contactComptable) {
//        this.contactComptable = contactComptable;
//    }
    public void setDateClotureExe(Date dateClotureExe) {
        this.dateClotureExe = dateClotureExe;
    }

    public void setDateCreation(Date dateCreation) {
        this.dateCreation = dateCreation;
    }

    public void setDateEntree(Date dateEntree) {
        this.dateEntree = dateEntree;
    }

    public void setDateSortie(Date dateSortie) {
        this.dateSortie = dateSortie;
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

    public void setNbSalaries(Integer nbSalaries) {
        this.nbSalaries = nbSalaries;
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

    public void setFormationDirigeant(String formationDirigeant) {
        this.formationDirigeant = formationDirigeant;
    }

    public void setCnxEolasAllow(boolean cnxEolasAllow) {
        this.cnxEolasAllow = cnxEolasAllow;
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

    public void setSiren(String siren) {
        this.siren = siren;
    }

    public void setSiret(String siret) {
        this.siret = siret;
    }

    public void setTournee(Tournee tournee) {
        this.tournee = tournee;
    }

}
