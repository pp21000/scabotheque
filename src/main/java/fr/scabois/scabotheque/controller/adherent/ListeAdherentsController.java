package fr.scabois.scabotheque.controller.adherent;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.adherent.AdherentContactRole;
import fr.scabois.scabotheque.bean.adherent.Pole;
import fr.scabois.scabotheque.bean.adherent.Secteur;
import fr.scabois.scabotheque.bean.commun.Activite;
import fr.scabois.scabotheque.bean.commun.ContactFonction;
import fr.scabois.scabotheque.enums.PageType;
import fr.scabois.scabotheque.services.ApplicationMailer;
import fr.scabois.scabotheque.services.ExportService;
import fr.scabois.scabotheque.services.IServiceAdherent;

@Controller
public class ListeAdherentsController {

    @Autowired
    public ExportService exportService;

    @Autowired
    public ApplicationMailer mailer;

    @Autowired
    private IServiceAdherent service;

    @RequestMapping(value = { "/", "/listeAdherents" }, method = RequestMethod.GET)
    public String afficher(ModelMap pModel) {

	// Chargement des listes de recherche rapide
	List<Pole> poles = service.LoadPoles();
	List<Secteur> secteurs = service.LoadSecteurs();
	List<Activite> activites = service.LoadActivites();
	List<ContactFonction> contactFonctions = service.LoadContactFonctions();

	pModel.addAttribute("polesList", poles);
	pModel.addAttribute("secteursList", secteurs);
	pModel.addAttribute("activitesList", activites);
	pModel.addAttribute("contactFonctionList", contactFonctions);

	// Si on arrive de la requestMethode POST
	if (pModel.get("listeAdherents") == null) {
	    // filtre en même temps sur les actifs
	    List<Adherent> listeAdherents = service.LoadAdherents().stream().filter(a -> a.getEtat().getId() == 1)
		    .sorted(Comparator.comparing(Adherent::getLibelle)).collect(Collectors.toList());
	    pModel.addAttribute("listeAdherents", listeAdherents);

	    final CriteriaAdherent criteria = new CriteriaAdherent();
	    pModel.addAttribute("criteria", criteria);
	}

	pModel.addAttribute("pageType", PageType.LIST_ADHERENT);

	return "listeAdh";
    }

    @RequestMapping(value = "/exportList", method = RequestMethod.POST)
    public void exportList(@ModelAttribute(value = "criteria") final CriteriaAdherent criteria,
	    final BindingResult pBindingResult, final ModelMap pModel, HttpServletRequest request,
	    HttpServletResponse response) {

	exportService.downloadFile(criteria, response);

    }

    @RequestMapping(value = { "/", "/listeAdherents" }, method = RequestMethod.POST)
    public String rechercheAdh(@ModelAttribute(value = "criteria") final CriteriaAdherent criteria,
	    final BindingResult pBindingResult, final ModelMap pModel, HttpServletRequest request) {

	final List<Adherent> listeAdherents = service.LoadAdherents(criteria);

	pModel.addAttribute("listeAdherents", listeAdherents);

	return afficher(pModel);
    }

    @RequestMapping(value = "/sendMail", method = RequestMethod.POST)
    public String sendMail(@ModelAttribute(value = "criteria") final CriteriaAdherent criteria,
	    final BindingResult pBindingResult, final ModelMap pModel, HttpServletRequest request) {

	// recherche de tous les contacts pour envoy du message.
	final List<Adherent> listeAdherents = service.LoadAdherents(criteria);
	List<AdherentContactRole> listeTotal = new ArrayList<>();

	try {
            
            mailer.sendHTMLMail(criteria.getSender(), criteria.getSender(),
                "Copie de votre message :" + criteria.getObject(), criteria.getMessageMail());

            listeAdherents.stream().forEach(a -> {
		final List<AdherentContactRole> contacts = service.loadAdherentContactFonction(a.getId(),
			criteria.isMailingDirigeant(), criteria.isMailingCommerce(), criteria.isMailingAdministratif(),
			criteria.isMailingCompta());

		listeTotal.addAll(contacts);

		mailer.sendHTMLMail(criteria.getSender(),
			contacts.stream().map(m -> m.getMail()).collect(Collectors.toSet()).toString(),
			criteria.getObject(), criteria.getMessageMail());

	    });

	    // message de compte rendu
	    mailer.sendHTMLMail(criteria.getSender(), criteria.getSender(), "Compte rendu:" + criteria.getObject(),
		    "Votre message est envoyé à tout les destinataires suivant :"
			    + listeTotal.stream().map(m -> m.getMail()).collect(Collectors.toList()).toString());

	    criteria.setAvertissement("Votre message est envoyé.");

	} catch (Exception e) {
	    mailer.sendHTMLMail(criteria.getSender(), criteria.getSender(), "Compte rendu:" + criteria.getObject(),
		    "Une erreur est survenue : \n Exception:" + e.getMessage()
			    + "\n Le message a été envoyé aux destinataire suivant : "
			    + listeTotal.stream().map(m -> m.getMail()).collect(Collectors.toList()).toString());

	    criteria.setAvertissement("Une erreur est survenue, Le message na pas été envoyé." + e.getMessage());
	}

	pModel.addAttribute("listeAdherents", listeAdherents);

	return afficher(pModel);
    }
}
