package fr.scabois.scabotheque.controller.fournisseur;

import java.io.Serializable;

public class CriteriaFournisseur implements Serializable{

    private String avertissement;

    private String text;


    public String getAvertissement() {
	return avertissement;
    }

    public String getText() {
	return text;
    }

    public void setAvertissement(String avertissement) {
	this.avertissement = avertissement;
    }

    public void setText(String text) {
	this.text = text;
    }
}
