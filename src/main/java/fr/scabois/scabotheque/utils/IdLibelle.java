package fr.scabois.scabotheque.utils;

import fr.scabois.scabotheque.bean.HasIdPositionLibelle;
import fr.scabois.scabotheque.controller.tablesDeBases.EditIdLibList;
import java.util.ArrayList;
import java.util.List;

public class IdLibelle<T extends HasIdPositionLibelle> {

    private Class<T> typeArgumentClass;

    public IdLibelle(Class<T> typeArgumentClass) {
        this.typeArgumentClass = typeArgumentClass;
    }

    public List<T> setEditList(List<EditIdLibList> editList) {
        List<T> listToSave = new ArrayList<T>();

        editList.stream().forEach(e -> {
            try {
                T add = typeArgumentClass.newInstance();
                add.setId(e.getId());
                add.setLibelle(e.getLibelle());
                add.setPosition(e.getPosition());
                listToSave.add(add);
            } catch (InstantiationException | IllegalAccessException e1) {
                e1.printStackTrace();
            }

        });

        return listToSave;
    }

}
