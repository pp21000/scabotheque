package fr.scabois.scabotheque.controller.adherent;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class CriteriaAdherent {

    private List<Integer> activiteIds = new ArrayList<>();
//    public List<String> adherentIds;
    private String avertissement;

    private List<Integer> contactFonctionIds = new ArrayList<>();
    private boolean exportAll = false;
    private boolean mailingAdministratif = true;
    private boolean mailingCommerce = true;
    private boolean mailingCompta = true;
    private boolean mailingDirigeant = true;
    private String messageMail;

    private String object;
    private List<Integer> poleIds = new ArrayList<>();
    // private Metier metier;
    private List<Integer> secteurIds = new ArrayList<>();
    private String sender;
    private boolean showAll = false;
    private boolean showIsArtipole = false;
    private boolean showSousCompte = true;
    private String text;

    public List<Integer> getActiviteIds() {
	return activiteIds.isEmpty() ? Arrays.asList(0) : activiteIds;
    }

//    public List<String> getAdherentIds() {
//	return adherentIds;
//    }

    public String getAvertissement() {
	return avertissement;
    }

    public List<Integer> getContactFonctionIds() {
	return contactFonctionIds;
    }

    public boolean getExportAll() {
	return exportAll;
    }

    public String getMessageMail() {
	return messageMail;
    }

    public String getObject() {
	return object;
    }

    public List<Integer> getPoleIds() {
	return poleIds.isEmpty() ? Arrays.asList(0) : poleIds;
    }

    public List<Integer> getSecteurIds() {
	return secteurIds.isEmpty() ? Arrays.asList(0) : secteurIds;
    }

    public String getSender() {
	return sender;
    }

    public boolean getShowAll() {
	return showAll;
    }

    public boolean getShowSousCompte() {
	return showSousCompte;
    }

    public String getText() {
	return text;
    }

    public boolean isMailingAdministratif() {
	return mailingAdministratif;
    }

    public boolean isMailingCommerce() {
	return mailingCommerce;
    }

    public boolean isMailingCompta() {
	return mailingCompta;
    }

    public boolean isMailingDirigeant() {
	return mailingDirigeant;
    }

    public boolean isShowIsArtipole() {
	return showIsArtipole;
    }

//    public void setAdherentIds(List<String> adherentIds) {
//	this.adherentIds = adherentIds;
//    }

    public void setActiviteIds(List<Integer> activiteId) {
	this.activiteIds = activiteId;
    }

    public void setAvertissement(String avertissement) {
	this.avertissement = avertissement;
    }

    public void setContactFonctionIds(List<Integer> contactFonctionIds) {
	this.contactFonctionIds = contactFonctionIds;
    }

    public void setExportAll(Boolean exportAll) {
	this.exportAll = exportAll;
    }

    public void setMailingAdministratif(boolean mailingAdministratif) {
	this.mailingAdministratif = mailingAdministratif;
    }

    public void setMailingCommerce(boolean mailingCommerce) {
	this.mailingCommerce = mailingCommerce;
    }

    public void setMailingCompta(boolean mailingCompta) {
	this.mailingCompta = mailingCompta;
    }

    public void setMailingDirigeant(boolean mailingDirigeant) {
	this.mailingDirigeant = mailingDirigeant;
    }

    public void setMessageMail(String message) {
	this.messageMail = message;
    }

    public void setObject(String object) {
	this.object = object;
    }

    public void setPoleIds(List<Integer> poleIds) {
	this.poleIds = poleIds;
    }

    public void setSecteurIds(List<Integer> secteurIds) {
	this.secteurIds = secteurIds;
    }

    public void setSender(String sender) {
	this.sender = sender;
    }

    public void setShowAll(Boolean showAll) {
	this.showAll = showAll;
    }

    public void setShowIsArtipole(boolean showIsArtipole) {
	this.showIsArtipole = showIsArtipole;
    }

    public void setShowSousCompte(boolean showSousCompte) {
	this.showSousCompte = showSousCompte;
    }

    public void setText(String text) {
	this.text = text;
    }

}
