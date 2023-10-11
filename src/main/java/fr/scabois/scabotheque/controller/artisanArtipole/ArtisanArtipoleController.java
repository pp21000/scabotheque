package fr.scabois.scabotheque.controller.artisanArtipole;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.artisanArtipole.Actualite;
import fr.scabois.scabotheque.bean.artisanArtipole.Categorie;
import fr.scabois.scabotheque.bean.artisanArtipole.Emplacement;
import fr.scabois.scabotheque.bean.artisanArtipole.Inspiration;
import fr.scabois.scabotheque.bean.artisanArtipole.Metier;
import fr.scabois.scabotheque.bean.artisanArtipole.Photo;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditAAActualiteForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditAACategorieForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditAAEmplacementForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditAAPhotoForm;
import fr.scabois.scabotheque.controller.tablesDeBases.EditMetierForm;
import fr.scabois.scabotheque.enums.PageType;
import fr.scabois.scabotheque.services.IServiceArtipole;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.HandlerMapping;

@Controller
public class ArtisanArtipoleController {

  @Autowired
  private IServiceArtipole service;

  @RequestMapping({"/AA-admin", "/AA-page-accueil", "/AA-page-je-cherche-un-artisan", "/AA-page-inspirations", "/AA-page-nos-metiers", "/AA-page-salle-exposition"})
  public String show(final HttpServletRequest request) {

    return request.getAttribute(HandlerMapping.BEST_MATCHING_PATTERN_ATTRIBUTE).toString().substring(1);
  }

  @RequestMapping(value = {"/AA-page-je-cherche-un-artisan"}, method = {RequestMethod.GET})
  public String showJeCherche(final HttpServletRequest request) {
    return "AA-page-je-cherche-un-artisan";
  }

  @RequestMapping(value = {"/AA-page-artisan-artipole"}, method = {RequestMethod.GET})
  public String artisanArtipole(final ModelMap pModel) {
    final List<Adherent> list = (List<Adherent>) this.service.loadArtisanArtipole();
    pModel.addAttribute("nbAdherent", (Object) list.size());
    pModel.addAttribute("listeAdherents", (Object) list);
    pModel.addAttribute("pageType", (Object) PageType.AA_ADMIN);
    return "AA-page-artisan-artipole";
  }

  @RequestMapping(value = {"/AA-page-categories"}, method = {RequestMethod.GET})
  public String categories(final ModelMap pModel) {
    final List<Categorie> list = (List<Categorie>) this.service.loadCategories();
    EditAACategorieForm addCategorieForm;
    if (pModel.get((Object) "addForm") == null) {
      addCategorieForm = new EditAACategorieForm();
    } else {
      addCategorieForm = (EditAACategorieForm) pModel.get((Object) "addForm");
    }
    pModel.addAttribute("nbAdherent", (Object) list.size());
    pModel.addAttribute("listeCategories", (Object) list);
    pModel.addAttribute("addForm", (Object) addCategorieForm);
    pModel.addAttribute("pageType", (Object) PageType.AA_CATEGORIES);
    return "AA-page-categories";
  }

  @RequestMapping(value = {"/AA-page-actualites"}, method = {RequestMethod.GET})
  public String actualites(final ModelMap pModel) {
    final List<Actualite> list = (List<Actualite>) this.service.loadActualites();
    EditAAActualiteForm addActuForm;
    if (pModel.get((Object) "addForm") == null) {
      addActuForm = new EditAAActualiteForm();
    } else {
      addActuForm = (EditAAActualiteForm) pModel.get((Object) "addForm");
    }
    pModel.addAttribute("nbAdherent", (Object) list.size());
    pModel.addAttribute("listeItems", (Object) list);
    pModel.addAttribute("addForm", (Object) addActuForm);
    pModel.addAttribute("pageType", (Object) PageType.AA_ACTUALITES);
    return "AA-page-actualites";
  }

  @RequestMapping(value = {"/AA-page-photos"}, method = {RequestMethod.GET})
  public String photo(final ModelMap pModel) {
    final List<Photo> list = (List<Photo>) this.service.loadPhotos();
    EditAAPhotoForm addPhotoForm;
    if (pModel.get((Object) "addForm") == null) {
      addPhotoForm = new EditAAPhotoForm();
    } else {
      addPhotoForm = (EditAAPhotoForm) pModel.get((Object) "addForm");
    }
    pModel.addAttribute("nbAdherent", (Object) list.size());
    pModel.addAttribute("listeItems", (Object) list);
    pModel.addAttribute("addForm", (Object) addPhotoForm);
    pModel.addAttribute("pageType", (Object) PageType.AA_PHOTO);
    return "AA-page-photos";
  }

  @RequestMapping(value = {"/AA-page-emplacement"}, method = {RequestMethod.GET})
  public String emplacement(final ModelMap pModel) {
    final List<Emplacement> list = (List<Emplacement>) this.service.loadEmplacements();
    EditAAEmplacementForm addEmplacementForm;
    if (pModel.get((Object) "addForm") == null) {
      addEmplacementForm = new EditAAEmplacementForm();
    } else {
      addEmplacementForm = (EditAAEmplacementForm) pModel.get((Object) "addForm");
    }
    pModel.addAttribute("pageList", (Object) this.service.loadPages());
    pModel.addAttribute("addForm", (Object) addEmplacementForm);
    pModel.addAttribute("listeEmplacements", (Object) list);
    pModel.addAttribute("pageType", (Object) PageType.AA_EMPLACEMENT);
    return "AA-page-emplacement";
  }

  @RequestMapping(value = {"/AA-page-inspiration"}, method = {RequestMethod.GET})
  public String inspiration(final ModelMap pModel) {
    final List<Inspiration> list = (List<Inspiration>) this.service.loadInspirations();
    EditAAEmplacementForm addEmplacementForm;
    if (pModel.get((Object) "addForm") == null) {
      addEmplacementForm = new EditAAEmplacementForm();
    } else {
      addEmplacementForm = (EditAAEmplacementForm) pModel.get((Object) "addForm");
    }
    pModel.addAttribute("addForm", (Object) addEmplacementForm);
    pModel.addAttribute("listeEmplacements", (Object) list);
    pModel.addAttribute("pageType", (Object) PageType.AA_EMPLACEMENT);
    return "AA-page-emplacement";
  }

  @RequestMapping(value = {"/AA-page-listes"}, method = {RequestMethod.GET})
  public String lesListes(final ModelMap pModel) {
    final List<Metier> listMetiers = (List<Metier>) this.service.loadMetiers();
    final List<Categorie> listCategories = (List<Categorie>) this.service.loadCategories();
    EditMetierForm addForm;
    if (pModel.get((Object) "addForm") == null) {
      addForm = new EditMetierForm();
    } else {
      addForm = (EditMetierForm) pModel.get((Object) "addForm");
    }
    pModel.addAttribute("addForm", (Object) addForm);
    pModel.addAttribute("listeMetiers", (Object) listMetiers);
    pModel.addAttribute("listeCategories", (Object) listCategories);
    pModel.addAttribute("pageType", (Object) PageType.GESTION_METIER);
    return "AA-page-listes";
  }

  @RequestMapping(value = {"/exportDataArtisanArtipole"}, method = {RequestMethod.POST})
  public String exportTables(final ModelMap pModel, final HttpServletRequest request) {
    this.service.executeJob(request.getUserPrincipal().getName());
    return "redirect:/AA-page-accueil";
  }
}
