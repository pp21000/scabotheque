package fr.scabois.scabotheque.controller.security;

import java.util.List;

import javax.validation.Valid;

public class EditUtilisateursForm {

    @Valid
    private List<EditUtilisateur> list;

    public EditUtilisateursForm(List<EditUtilisateur> list) {
	this.list = list;
    }

    public List<EditUtilisateur> getList() {
	return list;
    }

    public void setList(final List<EditUtilisateur> list) {
	this.list = list;
    }
}