package fr.scabois.scabotheque.controller.artisanArtipole;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.artisanArtipole.Actualite;
import fr.scabois.scabotheque.bean.artisanArtipole.Categorie;
import fr.scabois.scabotheque.bean.artisanArtipole.Certification;
import fr.scabois.scabotheque.bean.artisanArtipole.Emplacement;
import fr.scabois.scabotheque.bean.artisanArtipole.Inspiration;
import fr.scabois.scabotheque.bean.artisanArtipole.Metier;
import fr.scabois.scabotheque.bean.artisanArtipole.Photo;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditAAActualiteForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditAACategorieForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditAACertificationForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditAAEmplacementForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditAAPhotoForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditAATravauxForm;
import fr.scabois.scabotheque.controller.tablesDeBases.EditMetierForm;
import fr.scabois.scabotheque.enums.NavType;
import fr.scabois.scabotheque.enums.PageType;
import fr.scabois.scabotheque.services.IServiceArtipole;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ArtisanArtipoleController {

  @Autowired
  private IServiceArtipole service;

  @RequestMapping(value = {"/AA-page-accueil"}, method = {RequestMethod.GET})
  public String accueil(final ModelMap pModel) {
    pModel.addAttribute("navType", NavType.ARTISAN_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_ACCUEIL);
    return "AA-page-accueil";
  }

  @RequestMapping(value = {"/AA-page-je-cherche-un-artisan"}, method = {RequestMethod.GET})
  public String JeChercheUnArtisan(final ModelMap pModel) {
    pModel.addAttribute("navType", NavType.ARTISAN_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_JE_CHERCHE_UN_ARTISAN);
    return "AA-page-je-cherche-un-artisan";
  }

  @RequestMapping(value = {"/AA-page-salle-exposition"}, method = {RequestMethod.GET})
  public String SalleExposition(final ModelMap pModel) {
    pModel.addAttribute("navType", NavType.ARTISAN_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_SALLE_EXPOSITION);
    return "AA-page-salle-exposition";
  }

  @RequestMapping(value = {"/AA-page-artisan-artipole"}, method = {RequestMethod.GET})
  public String artisanArtipole(final ModelMap pModel) {
    final List<Adherent> list = this.service.loadArtisanArtipole();
    pModel.addAttribute("nbAdherent", list.size());
    pModel.addAttribute("listeAdherents", list);
    pModel.addAttribute("navType", NavType.ARTISAN_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_ACCUEIL);
    return "AA-page-artisan-artipole";
  }

  @RequestMapping(value = {"/AA-page-categories"}, method = {RequestMethod.GET})
  public String categories(final ModelMap pModel) {
    final List<Categorie> list = this.service.loadCategories();
    EditAACategorieForm addCategorieForm;
    if (pModel.get("addForm") == null) {
      addCategorieForm = new EditAACategorieForm();
    } else {
      addCategorieForm = (EditAACategorieForm) pModel.get("addForm");
    }
    pModel.addAttribute("nbAdherent", list.size());
    pModel.addAttribute("listeCategories", list);
    pModel.addAttribute("addForm", addCategorieForm);
    pModel.addAttribute("navType", NavType.ARTISAN_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_CATEGORIES);
    return "AA-page-categories";
  }

  @RequestMapping(value = {"/AA-page-actualites"}, method = {RequestMethod.GET})
  public String actualites(final ModelMap pModel) {
    final List<Actualite> list = this.service.loadActualites();
    EditAAActualiteForm addActuForm;
    if (pModel.get("addForm") == null) {
      addActuForm = new EditAAActualiteForm();
    } else {
      addActuForm = (EditAAActualiteForm) pModel.get("addForm");
    }
    pModel.addAttribute("nbAdherent", list.size());
    pModel.addAttribute("listeItems", list);
    pModel.addAttribute("addForm", addActuForm);
    pModel.addAttribute("navType", NavType.ARTISAN_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_ACTUALITES);
    return "AA-page-actualites";
  }

  @RequestMapping(value = {"/AA-page-photos"}, method = {RequestMethod.GET})
  public String photo(final ModelMap pModel) {
    final List<Photo> list = this.service.loadPhotos();
    EditAAPhotoForm addPhotoForm;
    if (pModel.get("addForm") == null) {
      addPhotoForm = new EditAAPhotoForm();
    } else {
      addPhotoForm = (EditAAPhotoForm) pModel.get("addForm");
    }
    pModel.addAttribute("nbAdherent", list.size());
    pModel.addAttribute("listeItems", list);
    pModel.addAttribute("addForm", addPhotoForm);
    pModel.addAttribute("navType", NavType.ARTISAN_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_PHOTOS);
    return "AA-page-photos";
  }

  @RequestMapping(value = {"/AA-page-certifications"}, method = {RequestMethod.GET})
  public String certification(final ModelMap pModel) {
    final List<Certification> list = this.service.loadCertifications();
    EditAACertificationForm addCertificationForm;
    if (pModel.get("addForm") == null) {
      addCertificationForm = new EditAACertificationForm();
    } else {
      addCertificationForm = (EditAACertificationForm) pModel.get("addForm");
    }
    pModel.addAttribute("nbAdherent", list.size());
    pModel.addAttribute("listeItems", list);
    pModel.addAttribute("addForm", addCertificationForm);
    pModel.addAttribute("navType", NavType.ARTISAN_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_CERTIFICATIONS);
    return "AA-page-certifications";
  }

  @RequestMapping(value = {"/AA-page-emplacement"}, method = {RequestMethod.GET})
  public String emplacement(final ModelMap pModel) {
    final List<Emplacement> list = this.service.loadEmplacements();
    EditAAEmplacementForm addEmplacementForm;
    if (pModel.get("addForm") == null) {
      addEmplacementForm = new EditAAEmplacementForm();
    } else {
      addEmplacementForm = (EditAAEmplacementForm) pModel.get("addForm");
    }
    pModel.addAttribute("pageList", this.service.loadPages());
    pModel.addAttribute("addForm", addEmplacementForm);
    pModel.addAttribute("listeEmplacements", list);
    pModel.addAttribute("navType", NavType.ARTISAN_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_EMPLACEMENTS);
    return "AA-page-emplacement";
  }

  @RequestMapping(value = {"/AA-page-travaux"}, method = {RequestMethod.GET})
  public String travaux(final ModelMap pModel) {
    EditAATravauxForm addTravauxForm;
    if (pModel.get("addForm") == null) {
      addTravauxForm = new EditAATravauxForm();
    } else {
      addTravauxForm = (EditAATravauxForm) pModel.get("addForm");
    }
    pModel.addAttribute("addForm", addTravauxForm);
    pModel.addAttribute("listeItems", this.service.loadTravauxList());
    pModel.addAttribute("navType", NavType.ARTISAN_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_TRAVAUX);
    return "AA-page-travaux";
  }

  @RequestMapping(value = {"/AA-page-inspirations"}, method = {RequestMethod.GET})
  public String inspiration(final ModelMap pModel) {
    final List<Inspiration> list = this.service.loadInspirations();
    EditAAEmplacementForm addEmplacementForm;
    if (pModel.get("addForm") == null) {
      addEmplacementForm = new EditAAEmplacementForm();
    } else {
      addEmplacementForm = (EditAAEmplacementForm) pModel.get("addForm");
    }
    pModel.addAttribute("addForm", addEmplacementForm);
    pModel.addAttribute("listeEmplacements", list);
    pModel.addAttribute("navType", NavType.ARTISAN_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_INSPIRATIONS);
    return "AA-page-inspirations";
  }

  @RequestMapping(value = {"/AA-page-listes"}, method = {RequestMethod.GET})
  public String lesListes(final ModelMap pModel) {
    final List<Metier> listMetiers = this.service.loadMetiers();
    //final List<Categorie> listCategories = this.service.loadCategories();
    EditMetierForm addForm;
    if (pModel.get("addForm") == null) {
      addForm = new EditMetierForm();
    } else {
      addForm = (EditMetierForm) pModel.get("addForm");
    }
    pModel.addAttribute("addForm", addForm);
    pModel.addAttribute("listeMetiers", listMetiers);
    //pModel.addAttribute("listeCategories", listCategories);
    pModel.addAttribute("navType", NavType.ARTISAN_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.GESTION_METIER);
    return "AA-page-listes";
  }

  @RequestMapping(value = {"/exportDataArtisanArtipole"}, method = {RequestMethod.POST})
  public String exportTables(final ModelMap pModel, final HttpServletRequest request) {
    this.service.executeJob(request.getUserPrincipal().getName());
    return "redirect:/AA-page-accueil";
  }
}
