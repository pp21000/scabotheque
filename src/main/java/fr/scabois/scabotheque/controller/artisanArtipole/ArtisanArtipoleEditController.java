package fr.scabois.scabotheque.controller.artisanArtipole;

import fr.scabois.scabotheque.bean.artisanArtipole.Actualite;
import fr.scabois.scabotheque.bean.artisanArtipole.Certification;
import fr.scabois.scabotheque.bean.artisanArtipole.Emplacement;
import fr.scabois.scabotheque.bean.artisanArtipole.Photo;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.AddCategorieForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.AddMetierForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditAAActualiteForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditAACertificationForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditAAEmplacementForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditAAPhotoForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditAATravauxForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditCategoriesForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditMetiersForm;
import fr.scabois.scabotheque.enums.NavType;
import fr.scabois.scabotheque.enums.PageType;
import fr.scabois.scabotheque.services.IServiceArtipole;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ArtisanArtipoleEditController {

  @Autowired
  private IServiceArtipole service;
  @Autowired
  private ArtisanArtipoleController aaController;

  @RequestMapping(value = {"/AA-edit-actualite"}, method = {RequestMethod.GET})
  public String editActualite(@RequestParam("idActualite") final int idActualite, final ModelMap pModel, final HttpServletRequest request) {
    final Actualite actualite = this.service.loadActualite(idActualite);
    EditAAActualiteForm editForm;
    if (pModel.get("editForm") == null) {
      editForm = new EditAAActualiteForm(actualite);
    } else {
      editForm = (EditAAActualiteForm) pModel.get("editForm");
    }
    pModel.addAttribute("editForm", editForm);
    pModel.addAttribute("navType", NavType.ARTISAN_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_ACTUALITES);
    return "AA-edit-actualite";
  }

  @RequestMapping(value = {"/AA-edit-emplacement"}, method = {RequestMethod.GET})
  public String editEmplacement(@RequestParam("idEmplacement") final int idEmplacement, final ModelMap pModel, final HttpServletRequest request) {
    final Emplacement emplacement = this.service.loadEmplacement(idEmplacement);
    EditAAEmplacementForm editForm;
    if (pModel.get("editForm") == null) {
      editForm = new EditAAEmplacementForm(emplacement);
    } else {
      editForm = (EditAAEmplacementForm) pModel.get("editForm");
    }
    pModel.addAttribute("emplacement", emplacement);
    pModel.addAttribute("editForm", editForm);
    pModel.addAttribute("pageList", this.service.loadPages());
    pModel.addAttribute("navType", NavType.ARTISAN_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_EMPLACEMENTS);
    return "AA-edit-emplacement";
  }

  @RequestMapping(value = {"/AA-edit-metiers"}, method = {RequestMethod.GET})
  public String editMetiers(final ModelMap pModel, final HttpServletRequest request) {
    if (pModel.get("editForm") == null) {
      final EditMetiersForm editForm = new EditMetiersForm(this.service.loadMetiers());
      pModel.addAttribute("editForm", editForm);
    } else {
      pModel.addAttribute("editForm", pModel.get("editForm"));
    }
    if (pModel.get("addForm") == null) {
      final AddMetierForm addForm = new AddMetierForm();
      pModel.addAttribute("addForm", addForm);
    } else {
      pModel.addAttribute("addForm", pModel.get("addForm"));
    }
    pModel.addAttribute("navType", NavType.ARTISAN_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_METIERS);
    return "AA-edit-metiers";
  }

  @RequestMapping(value = {"/AA-edit-categories"}, method = {RequestMethod.GET})
  public String editCategories(final ModelMap pModel, final HttpServletRequest request) {
    if (pModel.get("editForm") == null) {
      final EditCategoriesForm editForm = new EditCategoriesForm(this.service.loadCategories());
      pModel.addAttribute("editForm", editForm);
    } else {
      pModel.addAttribute("editForm", pModel.get("editForm"));
    }
    if (pModel.get("addForm") == null) {
      final AddCategorieForm addForm = new AddCategorieForm();
      pModel.addAttribute("addForm", addForm);
    } else {
      pModel.addAttribute("addForm", pModel.get("addForm"));
    }
    pModel.addAttribute("navType", NavType.ARTISAN_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_CATEGORIES);
    return "AA-edit-categories";
  }

  @RequestMapping(value = {"/AA-edit-photo"}, method = {RequestMethod.GET})
  public String editPhoto(@RequestParam("idPhoto") final int idPhoto, final ModelMap pModel, final HttpServletRequest request) {
    final Photo photo = this.service.loadPhoto(Integer.valueOf(idPhoto));
    EditAAPhotoForm editForm;
    if (pModel.get("editForm") == null) {
      editForm = new EditAAPhotoForm(photo);
    } else {
      editForm = (EditAAPhotoForm) pModel.get("editForm");
    }
    pModel.addAttribute("photo", photo);
    pModel.addAttribute("editForm", editForm);
    pModel.addAttribute("navType", NavType.ARTISAN_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_PHOTOS);
    return "AA-edit-photo";
  }

  @RequestMapping(value = {"/AA-edit-certification"}, method = {RequestMethod.GET})
  public String editCertification(@RequestParam("idCertification") final int idCertification, final ModelMap pModel, final HttpServletRequest request) {
    final Certification certification = this.service.loadCertification(Integer.valueOf(idCertification));
    EditAACertificationForm editForm;
    if (pModel.get("editForm") == null) {
      editForm = new EditAACertificationForm(certification);
    } else {
      editForm = (EditAACertificationForm) pModel.get("editForm");
    }
    pModel.addAttribute("certification", certification);
    pModel.addAttribute("editForm", editForm);
    pModel.addAttribute("navType", NavType.ARTISAN_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_CERTIFICATIONS);
    return "AA-edit-certification";
  }

  @RequestMapping(value = {"/AA-delete-actualite"}, method = {RequestMethod.GET})
  public String deleteActualite(@RequestParam("idActualite") final int idActualite, final ModelMap pModel, final HttpServletRequest request) {
    this.service.deleteActualite(idActualite);
    return "redirect:/AA-page-actualites";
  }

  @RequestMapping(value = {"/AA-delete-photo"}, method = {RequestMethod.GET})
  public String deletePhoto(@RequestParam("idPhoto") final int idPhoto, final ModelMap pModel, final HttpServletRequest request) {
    this.service.deletePhoto(idPhoto);
    return "redirect:/AA-page-photos";
  }

  @RequestMapping(value = {"/AA-delete-certification"}, method = {RequestMethod.GET})
  public String deleteCertification(@RequestParam("idCertification") final int idCertification, final ModelMap pModel, final HttpServletRequest request) {
    this.service.deleteCertification(idCertification);
    return "redirect:/AA-page-certifications";
  }

  @RequestMapping(value = {"/AA-delete-categorie"}, method = {RequestMethod.GET})
  public String deleteCategorie(@RequestParam("idCategorie") final int idCategorie, final ModelMap pModel, final HttpServletRequest request) {
    this.service.deleteCategorie(idCategorie);
    return "redirect:/AA-page-listes";
  }

  @RequestMapping(value = {"/AA-delete-metier"}, method = {RequestMethod.GET})
  public String deleteMetier(@RequestParam("idMetier") final int idMetier, final ModelMap pModel, final HttpServletRequest request) {
    this.service.deleteMetier(idMetier);
    return "redirect:/AA-page-listes";
  }

  @RequestMapping(value = {"/AA-delete-emplacement"}, method = {RequestMethod.GET})
  public String deleteEmplacement(@RequestParam("idEmplacement") final int idEmplacement, final ModelMap pModel, final HttpServletRequest request) {
    this.service.deleteEmplacement(idEmplacement);
    return "redirect:/AA-page-emplacement";
  }

  @RequestMapping(value = {"/AA-delete-travaux"}, method = {RequestMethod.GET})
  public String deleteTravaux(@RequestParam("idTravaux") final int idTravaux, final ModelMap pModel, final HttpServletRequest request) {
    this.service.deleteTravaux(idTravaux);
    return "redirect:/AA-page-travaux";
  }

  @RequestMapping(value = {"/AA-edit-photo"}, method = {RequestMethod.POST})
  public String savePhoto(@Valid @ModelAttribute("editForm") final EditAAPhotoForm editForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.savePhoto(editForm.getPhoto());
      return "redirect:/AA-page-photos";
    }
    return this.editPhoto(editForm.getEditAAPhoto().getId(), pModel, request);
  }

  @RequestMapping(value = {"/AA-edit-certification"}, method = {RequestMethod.POST})
  public String saveCertification(@Valid @ModelAttribute("editForm") final EditAACertificationForm editForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.saveCertification(editForm.getCertification());
      return "redirect:/AA-page-certifications";
    }
    return this.editPhoto(editForm.getEditAACertification().getId(), pModel, request);
  }

  @RequestMapping(value = {"/AA-edit-categories"}, method = {RequestMethod.POST})
  public String saveCategories(@Valid @ModelAttribute("editForm") final EditCategoriesForm editForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.saveCategories(editForm.getCategories());
      return "redirect:/AA-page-listes";
    }
    return this.editMetiers(pModel, request);
  }

  @RequestMapping(value = {"/AA-edit-metiers"}, method = {RequestMethod.POST})
  public String saveMetiers(@Valid @ModelAttribute("editForm") final EditMetiersForm editForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.saveMetiers(editForm.getMetiers());
      return "redirect:/AA-page-listes";
    }
    return this.editMetiers(pModel, request);
  }

  @RequestMapping(value = {"/AA-add-emplacement"}, method = {RequestMethod.POST})
  public String AddEmplacement(@Valid @ModelAttribute("addForm") final EditAAEmplacementForm addForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.saveEmplacement(addForm.getEmplacement());
      return "redirect:/AA-page-emplacement";
    }
    return this.aaController.emplacement(pModel);
  }

  @RequestMapping(value = {"/AA-add-travaux"}, method = {RequestMethod.POST})
  public String AddTravaux(@Valid @ModelAttribute("addForm") final EditAATravauxForm addForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.saveTravaux(addForm.getTravaux());
      return "redirect:/AA-page-travaux";
    }
    return this.aaController.travaux(pModel);
  }

  @RequestMapping(value = {"/AA-add-actualite"}, method = {RequestMethod.POST})
  public String AddActualite(@Valid @ModelAttribute("addForm") final EditAAActualiteForm addForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.saveActualite(addForm.getActualite());
      return "redirect:/AA-page-actualites";
    }
    return this.aaController.actualites(pModel);
  }

  @RequestMapping(value = {"/AA-add-metier"}, method = {RequestMethod.POST})
  public String AddMetier(@Valid @ModelAttribute("addForm") final AddMetierForm addForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.saveMetier(addForm.getMetier());
      return "redirect:/AA-page-listes";
    }
    return this.aaController.lesListes(pModel);
  }

  @RequestMapping(value = {"/AA-edit-actualite"}, method = {RequestMethod.POST})
  public String saveActualite(@Valid @ModelAttribute("editForm") final EditAAActualiteForm addForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.saveActualite(addForm.getActualite());
      return "redirect:/AA-page-actualites";
    }
    return this.editActualite(addForm.getActualite().getId(), pModel, request);
  }

  @RequestMapping(value = {"/AA-edit-emplacement"}, method = {RequestMethod.POST})
  public String saveEmplacement(@Valid @ModelAttribute("addForm") final EditAAEmplacementForm addForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.saveEmplacement(addForm.getEmplacement());
      return "redirect:/AA-page-emplacement";
    }
    return this.editEmplacement(addForm.getEmplacement().getId(), pModel, request);
  }

  @RequestMapping(value = {"/AA-add-categorie"}, method = {RequestMethod.POST})
  public String AddCategorie(@Valid @ModelAttribute("addForm") final AddCategorieForm addForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.saveCategorie(addForm.getCategorie());
      return "redirect:/AA-page-listes";
    }
    return this.aaController.categories(pModel);
  }

  @RequestMapping(value = {"/AA-add-photo"}, method = {RequestMethod.POST})
  public String AddPhoto(@Valid @ModelAttribute("addForm") final EditAAPhotoForm addForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.savePhoto(addForm.getPhoto());
      return "redirect:/AA-page-photos";
    }
    return this.aaController.photo(pModel);
  }

  @RequestMapping(value = {"/AA-add-certification"}, method = {RequestMethod.POST})
  public String AddCertification(@Valid @ModelAttribute("addForm") final EditAACertificationForm addForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.saveCertification(addForm.getCertification());
      return "redirect:/AA-page-certifications";
    }
    return this.aaController.certification(pModel);
  }
}
