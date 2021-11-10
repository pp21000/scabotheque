package fr.scabois.scabotheque.controller.logistique.edit;

import fr.scabois.scabotheque.bean.logistique.LogistiqueConducteur;
import java.util.ArrayList;
import java.util.List;
import javax.validation.Valid;

public class EditConducteurForm {

    @Valid
    private List<EditConducteur> conducteurs;
    private String messageErreur;

    public List<EditConducteur> getConducteurs() {
        return conducteurs;
    }

    public List<LogistiqueConducteur> toConducteur() {
        List<LogistiqueConducteur> list = new ArrayList<>();
        conducteurs.stream().forEach(c -> list.add(new LogistiqueConducteur(c)));
        return list;
    }

    public void setConducteurs(List<EditConducteur> conducteurs) {
        this.conducteurs = conducteurs;
    }

    public String getMessageErreur() {
        return messageErreur;
    }

    public void setMessageErreur(String messageErreur) {
        this.messageErreur = messageErreur;
    }
}
