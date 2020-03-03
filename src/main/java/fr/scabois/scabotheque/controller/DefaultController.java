package fr.scabois.scabotheque.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fr.scabois.scabotheque.enums.PageType;

@Controller
@RequestMapping("/enCours")
public class DefaultController {

    @RequestMapping(method = RequestMethod.GET)
    public String afficherBonjour(final ModelMap pModel) {
//	pModel.addAttribute("pageType", PageType.GESTION_FOURNISSEUR);
	pModel.addAttribute("pageType", PageType.GESTION_PRODUIT);
	return "enCours";
    }
}