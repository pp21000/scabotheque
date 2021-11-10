package fr.scabois.scabotheque.controller.tablesDeBases;

import java.util.List;

import javax.validation.Valid;

public class EditRolesEOLASForm {

//    private String departementFilter;

    @Valid
    private List<EditRolesEOLAS> list;

    public EditRolesEOLASForm(List<EditRolesEOLAS> list) {
	this.list = list;
    }

//    public String getDepartementFilter() {
//	return departementFilter;
//    }

    public List<EditRolesEOLAS> getList() {
	return list;
    }

//    public void setDepartementFilter(String departementFilter) {
//	this.departementFilter = departementFilter;
//    }

    public void setList(final List<EditRolesEOLAS> list) {
	this.list = list;
    }
}