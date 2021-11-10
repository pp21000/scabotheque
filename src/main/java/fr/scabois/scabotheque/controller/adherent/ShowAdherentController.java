package fr.scabois.scabotheque.controller.adherent;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.adherent.AdherentActivite;
import fr.scabois.scabotheque.bean.adherent.AdherentContactRole;
import fr.scabois.scabotheque.bean.adherent.AdherentExploitation;
import fr.scabois.scabotheque.bean.adherent.AdherentInformatique;
import fr.scabois.scabotheque.bean.adherent.AdherentSuiviVisite;
import fr.scabois.scabotheque.controller.adherent.edit.EditAdherentSuiviVisite;
import fr.scabois.scabotheque.controller.adherent.edit.EditAdherentSuiviVisiteForm;
import fr.scabois.scabotheque.enums.NavType;
import fr.scabois.scabotheque.enums.PageType;
import fr.scabois.scabotheque.services.IServiceAdherent;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ShowAdherentController {

  @Autowired
  private IServiceAdherent service;

  @RequestMapping(value = "/adherentProfil", method = RequestMethod.GET)
  public String profile(@RequestParam(value = "idAdh") final int idAdh, final ModelMap pModel,
          HttpServletRequest request) {

    PageType pageType = PageType.LIST_ADHERENT;

    String commentaire = "";
    commentaire = service.loadAdherentCommentaire(idAdh, pageType);
    final Adherent adherent = service.loadAdherent(idAdh);

    final List<AdherentContactRole> contacts = service.loadAdherentContact(idAdh);
    List<AdherentSuiviVisite> infoSuiviVisite = service.loadAdherentSuivisVisites(idAdh);

    // EXCEPTION -> le nouveau suivi est saisie avec la liste ...
    EditAdherentSuiviVisite newSuivi = new EditAdherentSuiviVisite(idAdh);
    EditAdherentSuiviVisiteForm newSuiviForm = new EditAdherentSuiviVisiteForm();
    newSuiviForm.setSuiviVisiteAdh(newSuivi);
    pModel.addAttribute("suiviToAdd", newSuiviForm);

    pModel.addAttribute("contacts", contacts);
    pModel.addAttribute("infoSuiviVisite", infoSuiviVisite);
//    pModel.addAttribute("criteria", new CriteriaCRM());
    pModel.addAttribute("commentaire", commentaire);
    pModel.addAttribute("adherent", adherent);
    pModel.addAttribute("navType", NavType.ADHERENT);
    pModel.addAttribute("pageType", pageType);
    return "adherentProfil";
  }

  @RequestMapping(value = "/adherentProfilArtipole", method = RequestMethod.GET)
  public String profileArtipole(@RequestParam(value = "idAdh") final int idAdh, final ModelMap pModel,
          HttpServletRequest request) {

    PageType pageType = PageType.LIST_ADHERENT;

    String commentaire = "";
    commentaire = service.loadAdherentCommentaire(idAdh, pageType);
    final Adherent adherent = service.loadAdherent(idAdh);

    pModel.addAttribute("pageType", pageType);
    pModel.addAttribute("commentaire", commentaire);
    pModel.addAttribute("adherent", adherent);

    return "adherentProfilArtipole";
  }

  @RequestMapping(value = "/adherentProfilAdmin", method = RequestMethod.GET)
  public String profileAdmin(@RequestParam(value = "idAdh") final int idAdh, final ModelMap pModel,
          HttpServletRequest request) {

    PageType pageType = PageType.LIST_ADHERENT;

    String commentaire = "";
    commentaire = service.loadAdherentCommentaire(idAdh, pageType);
    final Adherent adherent = service.loadAdherent(idAdh);

    List<AdherentActivite> adhActivites = service.loadActivitesAdherent(idAdh);

    pModel.addAttribute("adhActivites", adhActivites);
    pModel.addAttribute("criteria", new CriteriaCRM());
    pModel.addAttribute("commentaire", commentaire);
    pModel.addAttribute("adherent", adherent);
    pModel.addAttribute("navType", NavType.ADHERENT);
    pModel.addAttribute("pageType", pageType);

    return "adherentProfilAdmin";
  }

  @RequestMapping(value = {"/adherentArtipole", "/adherentAdministratif", "/adherentDetail", "/adherentCapitalSocial"}, method = RequestMethod.GET)
  public String afficher(@RequestParam(value = "idAdh") final int idAdh, final ModelMap pModel,
          HttpServletRequest request) {

    String commentaire = "";
    final Adherent adherent = service.loadAdherent(idAdh);

    PageType pageType = PageType.LIST_ADHERENT;
    switch (request.getServletPath().substring(1)) {
      case "adherentActivite":
        pageType = PageType.ADHERENT_ACTIVITE;
        break;
      case "adherentArtipole":
        pageType = PageType.ADHERENT_ARTIPOLE;
        break;
      case "adherentAdministratif":
        pageType = PageType.ADHERENT_ADMINISTRATIF;
        pModel.addAttribute("contactComptable", service.loadAdherentContactComptable(idAdh));
        break;
      case "adherentCapitalSocial":
        pageType = PageType.ADHERENT_CAPITAL_SOCIAL;
        break;
      case "adherentDetail":
        final List<AdherentContactRole> contacts = service.loadAdherentContact(idAdh);
        pageType = request.getServletPath().substring(1).equals("adherentDetail") ? PageType.ADHERENT_DETAIL : PageType.ADHERENT_INFORMATIQUE;
        pModel.addAttribute("contacts", contacts);
        break;
      default:
        pageType = PageType.LIST_ADHERENT;
    }

    commentaire = service.loadAdherentCommentaire(idAdh, pageType);
    pModel.addAttribute("navType", NavType.ADHERENT);
    pModel.addAttribute("pageType", pageType);

    pModel.addAttribute("commentaire", commentaire);
    pModel.addAttribute("adherent", adherent);

    return request.getServletPath().substring(1);
  }

  @RequestMapping(value = "/adherentInformatique", method = RequestMethod.GET)
  public String afficherInformatique(@RequestParam(value = "idAdh") final int idAdh, final ModelMap pModel,
          HttpServletRequest request) {

    Adherent adherent = service.loadAdherent(idAdh);
    AdherentInformatique informatique = service.loadAdherentInformatique(idAdh);
    String commentaire = service.loadAdherentCommentaire(idAdh, PageType.ADHERENT_INFORMATIQUE);
    final List<AdherentContactRole> contacts = service.loadAdherentContact(idAdh);

    pModel.addAttribute("contacts", contacts);
    pModel.addAttribute("commentaire", commentaire);
    pModel.addAttribute("adherent", adherent);
    pModel.addAttribute("informatiqueData", informatique);
    pModel.addAttribute("navType", NavType.ADHERENT);
    pModel.addAttribute("pageType", PageType.ADHERENT_INFORMATIQUE);

    return "adherentInformatique";
  }

  @RequestMapping(value = "/adherentActivite", method = RequestMethod.GET)
  public String afficherActivite(@RequestParam(value = "idAdh") final int idAdh, final ModelMap pModel,
          HttpServletRequest request) {

    Logger.getLogger("1" + ShowAdherentController.class.getName()).log(Level.SEVERE, "lenght:" + idAdh);

    Adherent adherent = service.loadAdherent(idAdh);
    String commentaire = service.loadAdherentCommentaire(idAdh, PageType.ADHERENT_ACTIVITE);

//        List<Activite> activites = service.loadActivites();
    List<AdherentActivite> adhActivites = service.loadActivitesAdherent(idAdh);

    Logger.getLogger("1" + ShowAdherentController.class.getName()).log(Level.SEVERE, "lenght:" + adhActivites.size());

    pModel.addAttribute("adherent", adherent);
    pModel.addAttribute("adhActivites", adhActivites);
    pModel.addAttribute("commentaire", commentaire);
    pModel.addAttribute("navType", NavType.ADHERENT);
    pModel.addAttribute("pageType", PageType.ADHERENT_ACTIVITE);
    return "adherentActivite";
  }

  @RequestMapping(value = "/adherentCRM", method = RequestMethod.GET)
  public String afficherSuiviVisite(@RequestParam(value = "idAdh") final int idAdh, final ModelMap pModel,
          HttpServletRequest request) {

    Adherent adherent = service.loadAdherent(idAdh);

    if (pModel.get("infoSuiviVisite") == null) {
      List<AdherentSuiviVisite> infoSuiviVisite = service.loadAdherentSuivisVisites(idAdh);
      pModel.addAttribute("infoSuiviVisite", infoSuiviVisite);
      pModel.addAttribute("criteria", new CriteriaCRM());
//        } else {
    }

    // EXCEPTION -> le nouveau suivi est saisie avec la liste ...
    EditAdherentSuiviVisite newSuivi = new EditAdherentSuiviVisite();
    newSuivi.setAdherentId(idAdh);
    EditAdherentSuiviVisiteForm newSuiviForm = new EditAdherentSuiviVisiteForm();
    newSuiviForm.setSuiviVisiteAdh(newSuivi);
    pModel.addAttribute("suiviToAdd", newSuiviForm);

    pModel.addAttribute("adherent", adherent);
//        pModel.addAttribute("criteria", criteria);
    pModel.addAttribute("navType", NavType.ADHERENT);
    pModel.addAttribute("pageType", PageType.ADHERENT_CRM);
    return "adherentCRM";
  }

  @RequestMapping(value = "/adherentExploitation", method = RequestMethod.GET)
  public String afficherExploitation(@RequestParam(value = "idAdh") final int idAdh, final ModelMap pModel,
          HttpServletRequest request) {

    Adherent adherent = service.loadAdherent(idAdh);
    AdherentExploitation infoExploitation = service.loadAdherentExploitation(idAdh);
    String commentaire = service.loadAdherentCommentaire(idAdh, PageType.ADHERENT_EXPLOITATION);

    pModel.addAttribute("adherent", adherent);
    pModel.addAttribute("infoExploitation", infoExploitation);
    pModel.addAttribute("commentaire", commentaire);
    pModel.addAttribute("navType", NavType.LOGISTIQUE);
    pModel.addAttribute("pageType", PageType.LOGISTIQUE_TOURNEE);
    return "adherentExploitation";
  }

  @RequestMapping(value = {"/adherentCRM"}, method = RequestMethod.POST)
  public String adherentCRM(@RequestParam(value = "adhId") final Integer adhId,
          @ModelAttribute(value = "criteria") final CriteriaCRM criteria,
          final BindingResult pBindingResult, final ModelMap pModel, HttpServletResponse response, HttpServletRequest request) {

    pModel.addAttribute("infoSuiviVisite", service.loadAdherentSuivisVisites(adhId, criteria));
    pModel.addAttribute("criteria", criteria);

    return afficherSuiviVisite(adhId, pModel, request);
  }
}
