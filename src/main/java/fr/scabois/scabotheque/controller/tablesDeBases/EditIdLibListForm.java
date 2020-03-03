package fr.scabois.scabotheque.controller.tablesDeBases;

import java.util.List;

import javax.validation.Valid;

public class EditIdLibListForm {

    @Valid
    private List<EditIdLibList> list;

    public List<EditIdLibList> getList() {
	return list;
    }

    public void setList(final List<EditIdLibList> list) {
	this.list = list;
    }
}