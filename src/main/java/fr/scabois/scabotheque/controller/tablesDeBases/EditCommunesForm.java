package fr.scabois.scabotheque.controller.tablesDeBases;

import java.util.List;

import javax.validation.Valid;

public class EditCommunesForm {

    private String departementFilter;

    @Valid
    private List<EditCommune> list;

    public EditCommunesForm(List<EditCommune> list) {
	this.list = list;
    }

    public String getDepartementFilter() {
	return departementFilter;
    }

    public List<EditCommune> getList() {
	return list;
    }

    public void setDepartementFilter(String departementFilter) {
	this.departementFilter = departementFilter;
    }

    public void setList(final List<EditCommune> list) {
	this.list = list;
    }
}