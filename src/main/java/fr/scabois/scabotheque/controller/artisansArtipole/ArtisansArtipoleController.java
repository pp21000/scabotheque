package fr.scabois.scabotheque.controller.artisansArtipole;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.artisansArtipole.Actualite;
import fr.scabois.scabotheque.bean.artisansArtipole.Realisation;
import fr.scabois.scabotheque.controller.adherent.CriteriaAdherent;
import fr.scabois.scabotheque.controller.artisansArtipole.edit.EditAAActualiteForm;
import fr.scabois.scabotheque.controller.artisansArtipole.edit.EditAACertificationForm;
import fr.scabois.scabotheque.controller.artisansArtipole.edit.EditAAEmplacementForm;
import fr.scabois.scabotheque.controller.artisansArtipole.edit.EditAAPhotoForm;
import fr.scabois.scabotheque.controller.artisansArtipole.edit.EditAARealisationForm;
import fr.scabois.scabotheque.controller.artisansArtipole.edit.EditAATravauxForm;
import fr.scabois.scabotheque.controller.tablesDeBases.EditMetierForm;
import fr.scabois.scabotheque.enums.NavType;
import fr.scabois.scabotheque.enums.PageType;
import fr.scabois.scabotheque.services.IServiceAdherent;
import fr.scabois.scabotheque.services.IServiceArtipole;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ArtisansArtipoleController {

  @Autowired
  private IServiceArtipole service;
  @Autowired
  private IServiceAdherent serviceAdherent;

  @RequestMapping(value = {"/AA-page-accueil"}, method = {RequestMethod.GET})
  public String GETpage_accueil(final ModelMap pModel) {
    pModel.addAttribute("navType", NavType.ARTISANS_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_ACCUEIL);
    return "AA-page-accueil";
  }

  @RequestMapping(value = {"/AA-page-actualites"}, method = {RequestMethod.GET})
  public String GETpage_actualites(final ModelMap pModel, @RequestParam(name = "idAdh", required = false) Integer idAdh) {
    EditAAActualiteForm addForm;
    if (pModel.get("addForm") == null) {
      addForm = new EditAAActualiteForm();
      //addActuForm.setIdAdh(idAdh);
      //addActuForm.getEditAAActualite().getAdherent();//
    } else {
      addForm = (EditAAActualiteForm) pModel.get("addForm");
    }
    CriteriaAdherent criteria = new CriteriaAdherent();
    criteria.setShowArtipoleOnly(true);
    List<Adherent> adherentsArtipoleList = this.serviceAdherent.loadAdherents(criteria);
    adherentsArtipoleList.sort(Comparator.comparing(Adherent::getLibelle));
    List<Actualite> itemsList;
    if (idAdh != null) {
      pModel.addAttribute("adherent", this.serviceAdherent.loadAdherent(idAdh));
      itemsList = this.service.loadActualites().stream().filter(actu -> actu.getAdherent() != null && idAdh.equals(actu.getAdherent().getId())).collect(Collectors.toList());
    } else {
      itemsList = this.service.loadActualites();
    }
    pModel.addAttribute("adherentsList", adherentsArtipoleList);
    pModel.addAttribute("addForm", addForm);
    pModel.addAttribute("itemsList", itemsList);
    pModel.addAttribute("navType", NavType.ARTISANS_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_ACTUALITES);
    return "AA-page-actualites";
  }

  @RequestMapping(value = {"/AA-page-certifications"}, method = {RequestMethod.GET})
  public String GETpage_certifications(final ModelMap pModel) {
    EditAACertificationForm addForm;
    if (pModel.get("addForm") == null) {
      addForm = new EditAACertificationForm();
    } else {
      addForm = (EditAACertificationForm) pModel.get("addForm");
    }
    pModel.addAttribute("addForm", addForm);
    pModel.addAttribute("itemsList", this.service.loadCertifications());
    pModel.addAttribute("navType", NavType.ARTISANS_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_CERTIFICATIONS);
    return "AA-page-certifications";
  }

  @RequestMapping(value = {"/AA-page-emplacements"}, method = {RequestMethod.GET})
  public String GETpage_emplacements(final ModelMap pModel) {
    EditAAEmplacementForm addForm;
    if (pModel.get("addForm") == null) {
      addForm = new EditAAEmplacementForm();
    } else {
      addForm = (EditAAEmplacementForm) pModel.get("addForm");
    }
    pModel.addAttribute("pageList", this.service.loadPages());
    pModel.addAttribute("addForm", addForm);
    pModel.addAttribute("itemsList", this.service.loadEmplacements());
    pModel.addAttribute("navType", NavType.ARTISANS_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_EMPLACEMENTS);
    return "AA-page-emplacements";
  }

  @RequestMapping(value = {"/AA-page-inspirations"}, method = {RequestMethod.GET})
  public String GETpage_inspirations(final ModelMap pModel) {
    EditAAEmplacementForm addForm;
    if (pModel.get("addForm") == null) {
      addForm = new EditAAEmplacementForm();
    } else {
      addForm = (EditAAEmplacementForm) pModel.get("addForm");
    }
    pModel.addAttribute("addForm", addForm);
    pModel.addAttribute("itemsList", this.service.loadInspirations());
    pModel.addAttribute("navType", NavType.ARTISANS_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_INSPIRATIONS);
    return "AA-page-inspirations";
  }

  @RequestMapping(value = {"/AA-page-metiers"}, method = {RequestMethod.GET})
  public String GETpage_metiers(final ModelMap pModel) {
    EditMetierForm addForm;
    if (pModel.get("addForm") == null) {
      addForm = new EditMetierForm();
    } else {
      addForm = (EditMetierForm) pModel.get("addForm");
    }
    pModel.addAttribute("addForm", addForm);
    pModel.addAttribute("itemsList", this.service.loadMetiers());
    pModel.addAttribute("navType", NavType.ARTISANS_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.GESTION_METIER);
    return "AA-page-metiers";
  }

  @RequestMapping(value = {"/AA-page-photos"}, method = {RequestMethod.GET})
  public String GETpage_photos(final ModelMap pModel) {

    EditAAPhotoForm addForm;
    if (pModel.get("addForm") == null) {
      addForm = new EditAAPhotoForm();
    } else {
      addForm = (EditAAPhotoForm) pModel.get("addForm");
    }
    pModel.addAttribute("types", this.service.loadTypes());
    pModel.addAttribute("addForm", addForm);
    pModel.addAttribute("itemsList", this.service.loadPhotos());
    pModel.addAttribute("navType", NavType.ARTISANS_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_PHOTOS);
    return "AA-page-photos";
  }

  @RequestMapping(value = {"/AA-page-realisations"}, method = {RequestMethod.GET})
  public String GETpage_realisations(@RequestParam("idAdh") final int idAdh, final ModelMap pModel) {

    EditAARealisationForm addForm;
    if (pModel.get("addForm") == null) {
      addForm = new EditAARealisationForm();
    } else {
      addForm = (EditAARealisationForm) pModel.get("addForm");
    }
    List<Realisation> r = this.service.loadRealisations(idAdh);
    pModel.addAttribute("adherent", this.serviceAdherent.loadAdherent(idAdh));
    pModel.addAttribute("types", this.service.loadTypes());
    pModel.addAttribute("addForm", addForm);
    pModel.addAttribute("itemsList", this.service.loadRealisations(idAdh));
    pModel.addAttribute("navType", NavType.ADHERENTS);
    pModel.addAttribute("pageType", PageType.AA_REALISATIONS);
    return "AA-page-realisations";
  }

  @RequestMapping(value = {"/AA-page-travaux"}, method = {RequestMethod.GET})
  public String GETpage_travaux(final ModelMap pModel) {
    EditAATravauxForm addForm;
    if (pModel.get("addForm") == null) {
      addForm = new EditAATravauxForm();
    } else {
      addForm = (EditAATravauxForm) pModel.get("addForm");
    }
    pModel.addAttribute("addForm", addForm);
    pModel.addAttribute("itemsList", this.service.loadTravauxList());
    pModel.addAttribute("navType", NavType.ARTISANS_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_TRAVAUX);
    return "AA-page-travaux";
  }

  @RequestMapping(value = {"/AA-page-je-cherche-un-artisan"}, method = {RequestMethod.GET})
  public String GETpage_JeChercheUnArtisan(final ModelMap pModel) {
    pModel.addAttribute("navType", NavType.ARTISANS_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_JE_CHERCHE_UN_ARTISAN);
    return "AA-page-je-cherche-un-artisan";
  }

  @RequestMapping(value = {"/AA-page-salle-exposition"}, method = {RequestMethod.GET})
  public String GETpage_SalleExposition(final ModelMap pModel) {
    pModel.addAttribute("navType", NavType.ARTISANS_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_SALLE_EXPOSITION);
    return "AA-page-salle-exposition";
  }

  @RequestMapping(value = {"/exportDataArtisansArtipole"}, method = {RequestMethod.POST})
  public String exportTables(final ModelMap pModel, final HttpServletRequest request) {
    this.service.executeJob(request.getUserPrincipal().getName());
    return "redirect:/AA-page-accueil";
  }
}
