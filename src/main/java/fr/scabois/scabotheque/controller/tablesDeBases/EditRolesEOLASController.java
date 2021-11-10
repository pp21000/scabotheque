package fr.scabois.scabotheque.controller.tablesDeBases;

import fr.scabois.scabotheque.bean.adherent.RoleSalarieEOLAS;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import fr.scabois.scabotheque.bean.commun.Commune;
import fr.scabois.scabotheque.enums.PageType;
import fr.scabois.scabotheque.services.IServiceAdherent;

@Controller
public class EditRolesEOLASController {

    @Autowired
    private IServiceAdherent service;

    @RequestMapping(value = "/parametrage/listeRolesEOLAS", method = RequestMethod.GET)
    public String afficher(final ModelMap pModel) {

	List<RoleSalarieEOLAS> rolesList = service.loadRolesEOLAS();

	List<EditRolesEOLAS> editRoleList = rolesToEdit(rolesList);

        EditRolesEOLASForm rolesForm = new EditRolesEOLASForm(editRoleList);
	pModel.addAttribute("roleListe", rolesForm);
	pModel.addAttribute("pageType", PageType.GESTION_ROLES_EOLAS);

	return "listeRolesEOLAS";
    }
    
    private List<EditRolesEOLAS> rolesToEdit(List<RoleSalarieEOLAS> communeList) {

	List<EditRolesEOLAS> retour = new ArrayList<EditRolesEOLAS>();

	communeList.stream().forEach(c -> {
	    EditRolesEOLAS edit = new EditRolesEOLAS();
	    edit.setId(c.getId());
	    edit.setNomFlux(c.getNomFlux());
	    edit.setLibelle(c.getLibelle());
	    edit.setCommentaire(c.getCommentaire());

	    retour.add(edit);
	});

	return retour;
    }
}
