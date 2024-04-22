package fr.scabois.scabotheque.controller.adherent;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.adherent.AdherentEtat;
import fr.scabois.scabotheque.bean.adherent.AdherentType;
import fr.scabois.scabotheque.bean.adherent.CompteType;
import fr.scabois.scabotheque.bean.adherent.FormeJuridique;
import fr.scabois.scabotheque.bean.adherent.Pole;
import fr.scabois.scabotheque.bean.adherent.Role;
import fr.scabois.scabotheque.bean.adherent.Secteur;
import fr.scabois.scabotheque.bean.adherent.Tournee;
import fr.scabois.scabotheque.bean.commun.Agence;
import fr.scabois.scabotheque.bean.commun.Ape;
import fr.scabois.scabotheque.controller.adherent.edit.EditAdherent;
import fr.scabois.scabotheque.controller.adherent.edit.EditAdherentForm;
import fr.scabois.scabotheque.enums.NavType;
import fr.scabois.scabotheque.enums.PageType;
import fr.scabois.scabotheque.services.IServiceAdherent;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;
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

@Controller
public class AddAdherentController {

    private EditAdherent adhEditable;

    @Autowired
    private MessageSource messages;

    @Autowired
    private IServiceAdherent service;

    private void addSelectLists(final ModelMap pModel) {
        List<Agence> agences = service.loadAgences();
        List<Ape> codeApes = service.loadCodeApes().stream().sorted(Comparator.comparing(Ape::getCode, Comparator.comparing(code -> code.equals("NR") ? "" : code))).collect(Collectors.toList());
        List<AdherentEtat> etats = service.loadEtats();
        List<FormeJuridique> formesJuridiques = service.loadFormesJuridiques();
        List<Pole> poles = service.loadPoles();
        List<Role> roles = service.loadRoles();
        List<Secteur> secteurs = service.loadSecteurs();
        List<Tournee> tournees = service.loadTournees();
        List<AdherentType> adherentTypes = service.loadAdherentTypes();
        List<CompteType> compteTypes = service.loadCompteTypes();

        pModel.addAttribute("agenceList", agences);
        pModel.addAttribute("apeList", codeApes);
        pModel.addAttribute("etatList", etats);
        pModel.addAttribute("formJuridList", formesJuridiques);
        pModel.addAttribute("poleList", poles);
        pModel.addAttribute("roleList", roles);
        pModel.addAttribute("secteurList", secteurs);
        pModel.addAttribute("tourneeList", tournees);
        pModel.addAttribute("adherentTypeList", adherentTypes);
        pModel.addAttribute("compteTypeList", compteTypes);
    }

    @RequestMapping(value = "/addAdherent**", method = RequestMethod.GET)
    public String afficher(final ModelMap pModel) {

        addSelectLists(pModel);

        if (pModel.get("adhToAdd") == null) {
            final EditAdherentForm editAdhForm = new EditAdherentForm();

            // Rend l'adherent éditable (avec des validations test)
            //EditAdherent editableAdh = new EditAdherent(); // adhToEdit(adh);
            //editAdhForm.setAdherent();
            pModel.addAttribute("adhToAdd", editAdhForm);
        } else {
            pModel.addAttribute("adhToAdd", pModel.get("adhToAdd"));
        }

        pModel.addAttribute("navType", NavType.ADHERENTS);
        pModel.addAttribute("pageType", PageType.CREATE_ADHERENT);

        return "addAdherent";
    }

    public Adherent editToAdh(EditAdherent editAdh) {
        final Adherent adh = new Adherent();
        adh.setAdherentType(editAdh.getAdherentType());
        adh.setAdresse(editAdh.getAdresse());
        adh.setAdresseComplement(editAdh.getAdresseComplement());
        adh.setAgence(editAdh.getAgence());
        adh.setApe(editAdh.getApe());
        adh.setCnxEolasAllow(editAdh.getCnxEolasAllow());
        adh.setCode(editAdh.getCode());
        adh.setCodeERP(editAdh.getCodeERP());
        adh.setCodeERPParent(editAdh.getCodeERPParent());
        adh.setCommune(editAdh.getCommune());
        adh.setCompteType(editAdh.getCompteType());
//    adh.setContactComptable(editAdh.getContactComptable());
        adh.setDateClotureExe(editAdh.getDateClotureExe());
        adh.setDateCreation(editAdh.getDateCreation());
        adh.setDateEntree(editAdh.getDateEntree());
        adh.setDateSortie(editAdh.getDateSortie());
        adh.setDenomination(editAdh.getDenomination());
        adh.setDescription_activite(editAdh.getDescription_activite());
        adh.setDescription_entreprise(editAdh.getDescription_entreprise());
        adh.setEtat(editAdh.getEtat());
        adh.setFacebook(editAdh.getFacebook());
        adh.setFormationDirigeant(editAdh.getFormationDirigeant());
        adh.setFormeJuridique(editAdh.getFormeJuridique());
        adh.setId(editAdh.getId());
        adh.setInstagram(editAdh.getInstagram());
        adh.setIsArtipole(editAdh.getIsArtipole());
        adh.setIsCharteArtipole(editAdh.getIsCharteArtipole());
        adh.setIsFacebookArtipole(editAdh.getIsFacebookArtipole());
        adh.setIsFlocageArtipole(editAdh.getIsFlocageArtipole());
        adh.setIsOutilDechargement(editAdh.getIsOutilDechargement());
        adh.setIsWebArtipole(editAdh.getIsWebArtipole());
        adh.setLatitude(editAdh.getLatitude());
        adh.setLibelle(editAdh.getLibelle());
        adh.setLinkedin(editAdh.getLinkedin());
        adh.setLongitude(editAdh.getLongitude());
        adh.setMail(editAdh.getMail());
        adh.setNbSalaries(editAdh.getNbSalaries());
        adh.setNumRepMetier(editAdh.getNumRepMetier());
        adh.setPhoto((editAdh.getPhoto() == null) ? "".getBytes() : editAdh.getPhoto().getBytes());
        adh.setPinterest(editAdh.getPinterest());
        adh.setPole(editAdh.getPole());
        adh.setRole(editAdh.getRole());
        adh.setRcsCommune(editAdh.getRcsCommune());
        adh.setRcsRm(editAdh.getRcsRm());
        adh.setRmCommune(editAdh.getRmCommune());
        adh.setSecteur(editAdh.getSecteur());
        adh.setSiren(editAdh.getSiren());
        adh.setSiret(editAdh.getSiret());
        adh.setSiteWeb(editAdh.getSiteWeb());
        adh.setTelephone(editAdh.getTelephone());
        adh.setTournee(editAdh.getTournee());
        adh.setYoutube(editAdh.getYoutube());
        return adh;
    }

    @RequestMapping(value = "/addAdherent", method = RequestMethod.POST)
    public String modifier(@Valid @ModelAttribute(value = "adhToAdd") final EditAdherentForm editForm, final BindingResult pBindingResult, final ModelMap pModel) {

        adhEditable = editForm.getAdherent();
        Adherent adh = editToAdh(adhEditable);

        // test de la presence des objets
        // na pas encore trouvé à le faire dans EditAdherent.js
        if (adh.getCommune() == null) {
            pBindingResult.addError(new FieldError("commune", "adherent.commune",
                    messages.getMessage("modification.notempty", null, Locale.FRANCE)));
        }
        if (adh.getRcsCommune() == null) {
            pBindingResult.addError(new FieldError("rcsCommune", "adherent.rcsCommune",
                    messages.getMessage("modification.notempty", null, Locale.FRANCE)));
        }

//    if (adh.getPole() == null) {
//      pBindingResult.addError(new FieldError("pole", "adherent.pole",
//              messages.getMessage("modification.notempty", null, Locale.FRANCE)));
//    }
//    if (adh.getSecteur() == null) {
//      pBindingResult.addError(new FieldError("secteur", "adherent.secteur",
//              messages.getMessage("modification.notempty", null, Locale.FRANCE)));
//    }
        if (!pBindingResult.hasErrors()) {
            int id = service.createAdherent(adh);
            return "redirect:/edit/editAdherentContact?idAdh=" + id;
        }

        // voir retour direct à la liste
        return afficher(pModel);
    }

}
