package fr.scabois.scabotheque.utils;

import java.util.ArrayList;
import java.util.List;

import fr.scabois.scabotheque.bean.HasIdLibelle;
import fr.scabois.scabotheque.controller.tablesDeBases.EditIdLibList;

public class IdLibelle<T extends HasIdLibelle> {

    private Class<T> typeArgumentClass;

    public IdLibelle(Class<T> typeArgumentClass) {
	this.typeArgumentClass = typeArgumentClass;
    }

    public List<T> setEditList(List<EditIdLibList> editList) {
	List<T> listToSave = new ArrayList<>();

	editList.stream().forEach(e -> {
	    try {
		T add = typeArgumentClass.newInstance();
		add.setId(e.getId());
		add.setLibelle(e.getLibelle());
		listToSave.add(add);
	    } catch (InstantiationException | IllegalAccessException e1) {
		e1.printStackTrace();
	    }

	});

	return listToSave;
    }

}
