package fr.scabois.scabotheque.controller.tablesDeBases;

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
public class EditCommunesController {

    @Autowired
    private IServiceAdherent service;

    @RequestMapping(value = "/parametrage/listeCommunes", method = RequestMethod.GET)
    public String afficher(@RequestParam(value = "filterCP", required = false, defaultValue = "") String filtreCP,
	    final ModelMap pModel) {

	List<Commune> communeList = service.LoadCommunes();
	Set<String> departementList = communeList.stream().map(c -> c.getDepartement()).collect(Collectors.toSet());

	pModel.addAttribute("departementListe", departementList);

	List<EditCommune> editCommuneList = communeToEdit(
		communeList.stream().filter(c -> c.getLibelle().toLowerCase().contains(filtreCP.toLowerCase()))
			.collect(Collectors.toList()));

	EditCommunesForm communeForm = new EditCommunesForm(editCommuneList);
	pModel.addAttribute("filtreCP", filtreCP);
	pModel.addAttribute("communeListe", communeForm);
	pModel.addAttribute("pageType", PageType.GESTION_COMMUNE);

	return "listeCommunes";
    }

    private List<EditCommune> communeToEdit(List<Commune> communeList) {

	List<EditCommune> retour = new ArrayList<EditCommune>();

	communeList.stream().forEach(c -> {
	    EditCommune edit = new EditCommune();
	    edit.setCodePostal(c.getCodePostal());
	    edit.setDepartement(c.getDepartement());
	    edit.setId(c.getId());
	    edit.setLibelle(c.getLibelle());

	    retour.add(edit);
	});

	return retour;
    }

//    @RequestMapping(value = { "/", "/parametrage/listeCommunes" }, method = RequestMethod.POST)
//    public String rechercheCommune(@RequestParam("filterCP") String filterCP, final BindingResult pBindingResult,
//	    final ModelMap pModel, HttpServletRequest request) {
//
//	List<Commune> communeList = service.LoadCommunes();
//	List<EditCommune> editCommuneList = communeToEdit(
//		communeList.stream().filter(c -> c.getDepartement().equals(filterCP)).collect(Collectors.toList()));
//	EditCommunesForm communeForm = new EditCommunesForm(editCommuneList);
//
//	pModel.addAttribute("communeListe", communeForm);
//
//	return afficher(pModel);
//    }

}
