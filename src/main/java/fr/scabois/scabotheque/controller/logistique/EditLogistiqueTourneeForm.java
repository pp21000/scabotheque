package fr.scabois.scabotheque.controller.logistique;

import fr.scabois.scabotheque.bean.logistique.LogistiqueTournee;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.validation.Valid;

public class EditLogistiqueTourneeForm implements Serializable {

    @Valid
    private List<EditLogistiqueTournee> tournees;
    private int camionId;
    private int chauffeurId;
    private int tournee;
    private int messageErreur;

    List<LogistiqueTournee> toLogistiqueTournee() {
        List<LogistiqueTournee> list = new ArrayList<>();
        tournees.stream().forEach(t -> list.add(new LogistiqueTournee(t, camionId, chauffeurId, tournee)));
        return list;
    }

    public int getCamionId() {
        return camionId;
    }

    public void setCamionId(int camionId) {
        this.camionId = camionId;
    }

    public int getChauffeurId() {
        return chauffeurId;
    }

    public void setChauffeurId(int chauffeurId) {
        this.chauffeurId = chauffeurId;
    }

    public int getMessageErreur() {
        return messageErreur;
    }

    public void setMessageErreur(int messageErreur) {
        this.messageErreur = messageErreur;
    }

    public int getTournee() {
        return tournee;
    }

    public void setTournee(int tournee) {
        this.tournee = tournee;
    }

    public List<EditLogistiqueTournee> getTournees() {
        return tournees;
    }

    public void setTournees(List<EditLogistiqueTournee> tournees) {
        this.tournees = tournees;
    }

}
