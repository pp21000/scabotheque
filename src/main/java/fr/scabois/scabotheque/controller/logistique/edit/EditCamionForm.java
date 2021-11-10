package fr.scabois.scabotheque.controller.logistique.edit;

import fr.scabois.scabotheque.bean.logistique.LogistiqueCamion;
import java.util.ArrayList;
import java.util.List;
import javax.validation.Valid;

public class EditCamionForm {

    @Valid
    private List<EditCamion> camions;
    private String messageErreur;

    public List<EditCamion> getCamions() {
        return camions;
    }

    public void setCamions(List<EditCamion> camions) {
        this.camions = camions;
    }

    public String getMessageErreur() {
        return messageErreur;
    }

    public void setMessageErreur(String messageErreur) {
        this.messageErreur = messageErreur;
    }

    public List<LogistiqueCamion> toCamions() {
        List<LogistiqueCamion> list = new ArrayList<>();
        camions.stream().forEach(c -> list.add(new LogistiqueCamion(c)));
        return list;
    }

}
