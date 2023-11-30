package fr.scabois.scabotheque.controller.adherent;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.adherent.AdherentActivite;
import fr.scabois.scabotheque.bean.adherent.AdherentContactRole;
import fr.scabois.scabotheque.bean.adherent.AdherentInformatique;
import fr.scabois.scabotheque.bean.adherent.AdherentLogistique;
import fr.scabois.scabotheque.bean.adherent.AdherentSuiviVisite;
import fr.scabois.scabotheque.bean.artisanArtipole.Specialite;
import fr.scabois.scabotheque.controller.adherent.edit.EditAdherentSuiviVisite;
import fr.scabois.scabotheque.controller.adherent.edit.EditAdherentSuiviVisiteForm;
import fr.scabois.scabotheque.enums.NavType;
import fr.scabois.scabotheque.enums.PageType;
import fr.scabois.scabotheque.services.IServiceAdherent;
import fr.scabois.scabotheque.services.IServiceArtipole;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ShowAdherentController {

  @Autowired
  private IServiceAdherent service;

  @Autowired
  private IServiceArtipole serviceArtipole;

  @RequestMapping(value = "/adherentProfil", method = RequestMethod.GET)
  public String profile(@RequestParam(value = "idAdh") final int idAdh, final ModelMap pModel,
          HttpServletRequest request) {

    PageType pageType = PageType.LIST_ADHERENT;
    String commentaire = "";
    commentaire = this.service.loadAdherentCommentaire(idAdh, pageType);
    Adherent adherent = this.service.loadAdherent(idAdh);
    List contacts = this.service.loadAdherentContact(idAdh);
    List infoSuiviVisite = this.service.loadAdherentSuivisVisites(idAdh);
    EditAdherentSuiviVisite newSuivi = new EditAdherentSuiviVisite(idAdh);
    EditAdherentSuiviVisiteForm newSuiviForm = new EditAdherentSuiviVisiteForm();
    newSuiviForm.setSuiviVisiteAdh(newSuivi);
    pModel.addAttribute("suiviToAdd", newSuiviForm);
    List adhActivites = this.service.loadActivitesAdherent(idAdh);

    AdherentLogistique infoExploitation = this.service.loadAdherentLogistique(idAdh);
    AdherentContactRole contactReception = this.service.loadContact(infoExploitation.getContactReceptionId());
    List adherentMetiersId = this.service.loadAdherentMetiers(idAdh).stream().map(am -> am.getMetierId()).collect(Collectors.toList());
    List adherentCertificationsId = this.service.loadAdherentCertifications(idAdh).stream().map(am -> am.getCertificationId()).collect(Collectors.toList());

    /*    List<Specialite> specialites = this.serviceArtipole.loadSpecialites();
    List<Specialite> specialitesOfAdherent = this.service.loadAdherentSpecialites(idAdh)
            .stream()
            .map(as -> specialites.stream()
                    .filter(s -> s.getId() == as.getSpecialiteId())
                    .findFirst()
                    .orElse(null))
            .collect(Collectors.toList());*/
    List<Integer> AdherentSpecialitesIds = this.service.loadAdherentSpecialites(idAdh).stream()
            .map(adhSpe -> adhSpe.getSpecialiteId()).collect(Collectors.toList());

    List<Specialite> specialitesOfAdherent = this.serviceArtipole.loadSpecialites().stream()
            .filter(spe -> AdherentSpecialitesIds.contains(spe.getId()))
            .collect(Collectors.toList());

    pModel.addAttribute("contacts", contacts);
    pModel.addAttribute("infoSuiviVisite", infoSuiviVisite);
    pModel.addAttribute("criteria", new CriteriaAdherent());
    pModel.addAttribute("commentaire", commentaire);
    pModel.addAttribute("contactComptable", this.service.loadAdherentContactComptable(idAdh));
    pModel.addAttribute("adhActivites", adhActivites);
    pModel.addAttribute("infoExploitation", infoExploitation);
    pModel.addAttribute("contactReception", contactReception);
    pModel.addAttribute("adherent", adherent);
    pModel.addAttribute("metiers", this.serviceArtipole.loadMetiers());
    pModel.addAttribute("certifications", this.serviceArtipole.loadCertifications());
    pModel.addAttribute("metiersAdherentId", adherentMetiersId);
    pModel.addAttribute("certificationsAdherentId", adherentCertificationsId);
    pModel.addAttribute("specialitesOfAdherent", specialitesOfAdherent);
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
  public String afficher(@RequestParam(value = "idAdh") final int idAdh, final ModelMap pModel, HttpServletRequest request) {

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
    AdherentLogistique infoExploitation;
    infoExploitation = service.loadAdherentLogistique(idAdh);
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
