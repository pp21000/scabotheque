package fr.scabois.scabotheque.controller.tablesDeBases;

import java.util.List;
import javax.validation.Valid;

public class EditActiviteForm {

    @Valid
    private List<EditActiviteList> list;

    public List<EditActiviteList> getList() {
        return list;
    }

    public void setList(final List<EditActiviteList> list) {
        this.list = list;
    }
}
