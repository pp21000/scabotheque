package fr.scabois.scabotheque.controller.adherent;

import java.util.List;
import java.util.Locale;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.adherent.Etat;
import fr.scabois.scabotheque.bean.adherent.FormeJuridique;
import fr.scabois.scabotheque.bean.adherent.Pole;
import fr.scabois.scabotheque.bean.adherent.Role;
import fr.scabois.scabotheque.bean.adherent.Secteur;
import fr.scabois.scabotheque.bean.adherent.Tournee;
import fr.scabois.scabotheque.bean.commun.Agence;
import fr.scabois.scabotheque.bean.commun.Ape;
import fr.scabois.scabotheque.controller.adherent.edit.EditAdherent;
import fr.scabois.scabotheque.controller.adherent.edit.EditAdherentForm;
import fr.scabois.scabotheque.enums.PageType;
import fr.scabois.scabotheque.services.IServiceAdherent;

@Controller
public class AddAdherentController {

    private EditAdherent adhEditable;
    @Autowired
    private MessageSource messages;

    @Autowired
    private IServiceAdherent service;

    private void addSelectLists(final ModelMap pModel) {
	List<Agence> agences = service.LoadAgences();
	List<Ape> codeApes = service.LoadCodeApes();
	List<Etat> etats = service.LoadEtats();
	List<FormeJuridique> formesJuridiques = service.LoadFormesJuridiques();
	List<Pole> poles = service.LoadPoles();
	List<Role> roles = service.LoadRoles();
	List<Secteur> secteurs = service.LoadSecteurs();
	List<Tournee> tournees = service.LoadTournees();

	pModel.addAttribute("agenceList", agences);
	pModel.addAttribute("apeList", codeApes);
	pModel.addAttribute("etatList", etats);
	pModel.addAttribute("formJuridList", formesJuridiques);
	pModel.addAttribute("poleList", poles);
	pModel.addAttribute("roleList", roles);
	pModel.addAttribute("secteurList", secteurs);
	pModel.addAttribute("tourneeList", tournees);

    }

    @RequestMapping(value = "/addAdherent**", method = RequestMethod.GET)
    public String afficher(final ModelMap pModel) {

	addSelectLists(pModel);

	if (pModel.get("adhToAdd") == null) {
	    final EditAdherentForm editAdhForm = new EditAdherentForm();

	    // Rend l'adherent éditable (avec des validations test)
	    EditAdherent editableAdh = new EditAdherent(); // adhToEdit(adh);
	    editAdhForm.setAdherent(editableAdh);

	    pModel.addAttribute("adhToAdd", editAdhForm);
	} else {
	    pModel.addAttribute("adhToAdd", pModel.get("adhToAdd"));
	}

	pModel.addAttribute("pageType", PageType.CREATE_ADHERENT);

	return "addAdh";
    }

    public Adherent editToAdh(EditAdherent editAdh) {
	final Adherent adh = new Adherent();

	adh.setId(editAdh.getId());
	adh.setCode(editAdh.getCode());
	adh.setCodeERP(editAdh.getCodeERP());
	adh.setLibelle(editAdh.getLibelle());
	adh.setDenomination(editAdh.getDenomination());
	adh.setFormeJuridique(editAdh.getFormeJuridique());
	adh.setDateEntree(editAdh.getDateEntree());
	adh.setAdresse(editAdh.getAdresse());
	adh.setAdresseComplement(editAdh.getAdresseComplement());
	adh.setCommune(editAdh.getCommune());
	adh.setPole(editAdh.getPole());
	adh.setRole(editAdh.getRole());
	adh.setSecteur(editAdh.getSecteur());
	adh.setIsArtipole(editAdh.getIsArtipole());
	adh.setIsCharteArtipole(editAdh.getIsCharteArtipole());
	adh.setIsFlocageArtipole(editAdh.getIsFlocageArtipole());
	adh.setIsWebArtipole(editAdh.getIsWebArtipole());
	adh.setIsFormationCommerce(editAdh.getIsFormationCommerce());
	adh.setIsFacebookArtipole(editAdh.getIsFacebookArtipole());
	adh.setApe(editAdh.getApe());
	adh.setSiren(editAdh.getSiren());
	adh.setSiret(editAdh.getSiret());
	adh.setNumRepMetier(editAdh.getNumRepMetier());
	adh.setRcsRm(editAdh.getRcsRm());
	adh.setRcsCommune(editAdh.getRcsCommune());
	adh.setAgence(editAdh.getAgence());
	adh.setDateClotureExe(editAdh.getDateClotureExe());
	adh.setTournee(editAdh.getTournee());
	adh.setOutilDechargement(editAdh.getIsOutilDechargement());
	adh.setContactComptable(editAdh.getContactComptable());
	adh.setEtat(editAdh.getEtat());
	adh.setPhoto(editAdh.getPhoto() == null ? "".getBytes() : editAdh.getPhoto().getBytes());

	return adh;
    }

    @RequestMapping(value = "/addAdherent", method = RequestMethod.POST)
    public String modifier(@Valid @ModelAttribute(value = "adhToAdd") final EditAdherentForm editForm,
	    final BindingResult pBindingResult, final ModelMap pModel) {

	adhEditable = editForm.getAdherent();
	Adherent adh = editToAdh(adhEditable);

	// test de la presence des objets
	// na pas encore trouvé a le faire dans EditAdherent.js
	if (adh.getCommune().getId() == null) {
	    pBindingResult.addError(new FieldError("commune", "adherent.commune",
		    messages.getMessage("modification.notempty", null, Locale.FRANCE)));
	}
	if (adh.getRcsCommune().getId() == null) {
	    pBindingResult.addError(new FieldError("rcsCommune", "adherent.rcsCommune",
		    messages.getMessage("modification.notempty", null, Locale.FRANCE)));
	}
	if (adh.getPole().getId() == null) {
	    pBindingResult.addError(new FieldError("pole", "adherent.pole",
		    messages.getMessage("modification.notempty", null, Locale.FRANCE)));
	}
	if (adh.getSecteur().getId() == null) {
	    pBindingResult.addError(new FieldError("secteur", "adherent.secteur",
		    messages.getMessage("modification.notempty", null, Locale.FRANCE)));
	}

	if (!pBindingResult.hasErrors()) {
	    int id = service.createAdherent(adh);
	    return "redirect:/edit/editAdherentContact?idAdh=" + id;
	}

	// voir retour direct à la liste
	return afficher(pModel);
    }

}
