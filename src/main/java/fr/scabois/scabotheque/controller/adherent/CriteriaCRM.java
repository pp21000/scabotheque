package fr.scabois.scabotheque.controller.adherent;

import java.io.Serializable;

public class CriteriaCRM implements Serializable {

    private String text;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

}
