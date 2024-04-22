package fr.scabois.scabotheque.controller.adherent.edit;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import javax.validation.Valid;

public class EditAdherentForm {

    @Valid
    private EditAdherent adherent;
    private EditAdherent editAdherent;
    private String commentaire;

    public EditAdherentForm() {
        this.editAdherent = new EditAdherent();
    }

    public EditAdherentForm(final Adherent adh) {
        this.editAdherent = new EditAdherent();
        this.editAdherent.setAdherentType(adh.getAdherentType());
        this.editAdherent.setAdresse(adh.getAdresse());
        this.editAdherent.setAdresseComplement(adh.getAdresseComplement());
        this.editAdherent.setAgence(adh.getAgence());
        this.editAdherent.setApe(adh.getApe());
        this.editAdherent.setCode(adh.getCode());
        this.editAdherent.setCodeERP(adh.getCodeERP());
        this.editAdherent.setCodeERPParent(adh.getCodeERPParent());
        this.editAdherent.setCommune(adh.getCommune());
        this.editAdherent.setCompteType(adh.getCompteType());
        this.editAdherent.setCnxEolasAllow(adh.getCnxEolasAllow());
        this.editAdherent.setDateClotureExe(adh.getDateClotureExe());
        this.editAdherent.setDateCreation(adh.getDateCreation());
        this.editAdherent.setDateEntree(adh.getDateEntree());
        this.editAdherent.setDateSortie(adh.getDateSortie());
        this.editAdherent.setDenomination(adh.getDenomination());
        this.editAdherent.setDescription_activite(adh.getDescription_activite());
        this.editAdherent.setDescription_entreprise(adh.getDescription_entreprise());
        this.editAdherent.setEtat(adh.getEtat());
        this.editAdherent.setFacebook(adh.getFacebook());
        this.editAdherent.setFormationDirigeant(adh.getFormationDirigeant());
        this.editAdherent.setFormeJuridique(adh.getFormeJuridique());
        this.editAdherent.setInstagram(adh.getInstagram());
        this.editAdherent.setId(adh.getId());
        this.editAdherent.setIsArtipole(adh.getIsArtipole());
        this.editAdherent.setIsCharteArtipole(adh.getIsCharteArtipole());
        this.editAdherent.setIsFacebookArtipole(adh.getIsFacebookArtipole());
        this.editAdherent.setIsFlocageArtipole(adh.getIsFlocageArtipole());
        this.editAdherent.setIsOutilDechargement(adh.getIsOutilDechargement());
        this.editAdherent.setIsWebArtipole(adh.getIsWebArtipole());
        this.editAdherent.setLatitude(adh.getLatitude());
        this.editAdherent.setLibelle(adh.getLibelle());
        this.editAdherent.setLinkedin(adh.getLinkedin());
        this.editAdherent.setLongitude(adh.getLongitude());
        this.editAdherent.setMail(adh.getMail());
        this.editAdherent.setNbSalaries(adh.getNbSalaries());
        this.editAdherent.setNumRepMetier(adh.getNumRepMetier());
        this.editAdherent.setPinterest(adh.getPinterest());
        this.editAdherent.setPole(adh.getPole());
        this.editAdherent.setRcsRm(adh.getRcsRm());
        this.editAdherent.setRcsCommune(adh.getRcsCommune());
        this.editAdherent.setRmCommune(adh.getRmCommune());
        this.editAdherent.setRole(adh.getRole());
        this.editAdherent.setSecteur(adh.getSecteur());
        this.editAdherent.setSiren(adh.getSiren());
        this.editAdherent.setSiret(adh.getSiret());
        this.editAdherent.setSiteWeb(adh.getSiteWeb());
        this.editAdherent.setTelephone(adh.getTelephone());
        this.editAdherent.setTournee(adh.getTournee());
        this.editAdherent.setYoutube(adh.getYoutube());
    }

    public EditAdherent getAdherent() {
        return this.adherent;
    }

    public EditAdherent getEditAdherent() {
        return this.editAdherent;
    }

    public String getCommentaire() {
        return this.commentaire;
    }

    public void setAdherent(final EditAdherent adherent) {
        this.adherent = adherent;
    }

    public void setEditAdherent(final EditAdherent pAdherent) {
        this.editAdherent = pAdherent;
    }

    public void setCommentaire(final String commentaire) {
        this.commentaire = commentaire;
    }

    /*public EditAdherent getAdherent() {
    return adherent;
  }
     */

 /*public void setAdherent(final EditAdherent pAdherent) {
    adherent = pAdherent;
  }*/
}
