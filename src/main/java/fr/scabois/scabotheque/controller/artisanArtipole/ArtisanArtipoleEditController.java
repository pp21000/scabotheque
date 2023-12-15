package fr.scabois.scabotheque.controller.artisanArtipole;

import fr.scabois.scabotheque.bean.adherent.Type;
import fr.scabois.scabotheque.bean.artisanArtipole.Actualite;
import fr.scabois.scabotheque.bean.artisanArtipole.Certification;
import fr.scabois.scabotheque.bean.artisanArtipole.Emplacement;
import fr.scabois.scabotheque.bean.artisanArtipole.Photo;
import fr.scabois.scabotheque.bean.artisanArtipole.Travaux;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.AddMetierForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditAAActualiteForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditAACertificationForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditAAEmplacementForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditAAPhotoForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditAATravauxForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditMetiersForm;
import fr.scabois.scabotheque.enums.NavType;
import fr.scabois.scabotheque.enums.PageType;
import fr.scabois.scabotheque.services.IServiceAdherent;
import fr.scabois.scabotheque.services.IServiceArtipole;
import java.util.List;
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
  private IServiceAdherent serviceAdherent;
  @Autowired
  private ArtisanArtipoleController aaController;

  @RequestMapping(value = {"/AA-add-actualite"}, method = {RequestMethod.POST})
  public String addActualite(@Valid @ModelAttribute("addForm") final EditAAActualiteForm addForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.saveActualite(addForm.getActualite());
      return "redirect:/AA-page-actualites";
    }
    return this.aaController.GETpage_actualites(pModel);
  }

  @RequestMapping(value = {"/AA-edit-actualite"}, method = {RequestMethod.GET})
  public String editActualite(@RequestParam("idActualite") final int idActualite, final ModelMap pModel, final HttpServletRequest request) {
    final Actualite actualite = this.service.loadActualite(idActualite);
    EditAAActualiteForm editForm;
    if (pModel.get("editForm") == null) {
      editForm = new EditAAActualiteForm(actualite);
    } else {
      editForm = (EditAAActualiteForm) pModel.get("editForm");
    }
    pModel.addAttribute("adherentsList", this.serviceAdherent.loadAdherents());
    pModel.addAttribute("editForm", editForm);
    pModel.addAttribute("navType", NavType.ARTISAN_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_ACTUALITES);
    return "AA-edit-actualite";
  }

  @RequestMapping(value = {"/AA-edit-actualite"}, method = {RequestMethod.POST})
  public String saveActualite(@Valid @ModelAttribute("editForm") final EditAAActualiteForm addForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.saveActualite(addForm.getActualite());
      return "redirect:/AA-page-actualites";
    }
    return this.editActualite(addForm.getActualite().getId(), pModel, request);
  }

  @RequestMapping(value = {"/AA-delete-actualite"}, method = {RequestMethod.GET})
  public String deleteActualite(@RequestParam("idActualite") final int idActualite, final ModelMap pModel, final HttpServletRequest request) {
    this.service.deleteActualite(idActualite);
    return "redirect:/AA-page-actualites";
  }

  @RequestMapping(value = {"/AA-add-certification"}, method = {RequestMethod.POST})
  public String addCertification(@Valid @ModelAttribute("addForm") final EditAACertificationForm addForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.saveCertification(addForm.getCertification());
      return "redirect:/AA-page-certifications";
    }
    return this.aaController.GETpage_certifications(pModel);
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

  @RequestMapping(value = {"/AA-edit-certification"}, method = {RequestMethod.POST})
  public String saveCertification(@Valid @ModelAttribute("editForm") final EditAACertificationForm editForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.saveCertification(editForm.getCertification());
      return "redirect:/AA-page-certifications";
    }
    return this.editCertification(editForm.getCertification().getId(), pModel, request);
  }

  @RequestMapping(value = {"/AA-delete-certification"}, method = {RequestMethod.GET})
  public String deleteCertification(@RequestParam("idCertification") final int idCertification, final ModelMap pModel, final HttpServletRequest request) {
    this.service.deleteCertification(idCertification);
    return "redirect:/AA-page-certifications";
  }

  @RequestMapping(value = {"/AA-add-emplacement"}, method = {RequestMethod.POST})
  public String addEmplacement(@Valid @ModelAttribute("addForm") final EditAAEmplacementForm addForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.saveEmplacement(addForm.getEmplacement());
      return "redirect:/AA-page-emplacements";
    }
    return this.aaController.GETpage_emplacements(pModel);
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

  @RequestMapping(value = {"/AA-edit-emplacement"}, method = {RequestMethod.POST})
  public String saveEmplacement(@Valid @ModelAttribute("editForm") final EditAAEmplacementForm editForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.saveEmplacement(editForm.getEmplacement());
      return "redirect:/AA-page-emplacements";
    }
    return this.editEmplacement(editForm.getEmplacement().getId(), pModel, request);
  }

  @RequestMapping(value = {"/AA-delete-emplacement"}, method = {RequestMethod.GET})
  public String deleteEmplacement(@RequestParam("idEmplacement") final int idEmplacement, final ModelMap pModel, final HttpServletRequest request) {
    this.service.deleteEmplacement(idEmplacement);
    return "redirect:/AA-page-emplacements";
  }

  @RequestMapping(value = {"/AA-add-metier"}, method = {RequestMethod.POST})
  public String addMetier(@Valid @ModelAttribute("addForm") final AddMetierForm addForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.saveMetier(addForm.getMetier());
      return "redirect:/AA-page-metiers";
    }
    return this.aaController.GETpage_metiers(pModel);
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

  @RequestMapping(value = {"/AA-edit-metiers"}, method = {RequestMethod.POST})
  public String saveMetiers(@Valid @ModelAttribute("editForm") final EditMetiersForm editForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.saveMetiers(editForm.getMetiers());
      return "redirect:/AA-page-metiers";
    }
    return this.editMetiers(pModel, request);
  }

  @RequestMapping(value = {"/AA-delete-metier"}, method = {RequestMethod.GET})
  public String deleteMetier(@RequestParam("idMetier") final int idMetier, final ModelMap pModel, final HttpServletRequest request) {
    this.service.deleteMetier(idMetier);
    return "redirect:/AA-page-metiers";
  }

  @RequestMapping(value = {"/AA-add-photo"}, method = {RequestMethod.POST})
  public String addPhoto(@Valid @ModelAttribute("addForm") final EditAAPhotoForm addForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.savePhoto(addForm.getPhoto());
      return "redirect:/AA-page-photos";
    }
    return this.aaController.GETpage_photos(pModel);
  }

  @RequestMapping(value = {"/AA-edit-photo"}, method = {RequestMethod.GET})
  public String editPhoto(@RequestParam("idPhoto") final int idPhoto, final ModelMap pModel, final HttpServletRequest request) {
    final Photo photo = this.service.loadPhoto(Integer.valueOf(idPhoto));
    final List<Type> types = this.service.loadTypes();
    EditAAPhotoForm editForm;
    if (pModel.get("editForm") == null) {
      editForm = new EditAAPhotoForm(photo);
    } else {
      editForm = (EditAAPhotoForm) pModel.get("editForm");
    }
    pModel.addAttribute("photo", photo);
    pModel.addAttribute("types", types);
    pModel.addAttribute("editForm", editForm);
    pModel.addAttribute("navType", NavType.ARTISAN_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_PHOTOS);
    return "AA-edit-photo";
  }

  @RequestMapping(value = {"/AA-edit-photo"}, method = {RequestMethod.POST})
  public String savePhoto(@Valid @ModelAttribute("editForm") final EditAAPhotoForm editForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.savePhoto(editForm.getPhoto());
      return "redirect:/AA-page-photos";
    }
    return this.editPhoto(editForm.getEditAAPhoto().getId(), pModel, request);
  }

  @RequestMapping(value = {"/AA-delete-photo"}, method = {RequestMethod.GET})
  public String deletePhoto(@RequestParam("idPhoto") final int idPhoto, final ModelMap pModel, final HttpServletRequest request) {
    this.service.deletePhoto(idPhoto);
    return "redirect:/AA-page-photos";
  }

  @RequestMapping(value = {"/AA-add-travaux"}, method = {RequestMethod.POST})
  public String addTravaux(@Valid @ModelAttribute("addForm") final EditAATravauxForm addForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.saveTravaux(addForm.getTravaux());
      return "redirect:/AA-page-travaux";
    }
    return this.aaController.GETpage_travaux(pModel);
  }

  @RequestMapping(value = {"/AA-edit-travaux"}, method = {RequestMethod.GET})
  public String editTravaux(@RequestParam("idTravaux") final int idTravaux, final ModelMap pModel, final HttpServletRequest request) {
    final Travaux travaux = this.service.loadTravaux(Integer.valueOf(idTravaux));
    EditAATravauxForm editForm;
    if (pModel.get("editForm") == null) {
      editForm = new EditAATravauxForm(travaux);
    } else {
      editForm = (EditAATravauxForm) pModel.get("editForm");
    }
    pModel.addAttribute("travaux", travaux);
    pModel.addAttribute("editForm", editForm);
    pModel.addAttribute("navType", NavType.ARTISAN_ARTIPOLE);
    pModel.addAttribute("pageType", PageType.AA_TRAVAUX);
    return "AA-edit-travaux";
  }

  @RequestMapping(value = {"/AA-edit-travaux"}, method = {RequestMethod.POST})
  public String saveTravaux(@Valid @ModelAttribute("editForm") final EditAATravauxForm editForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.saveTravaux(editForm.getTravaux());
      return "redirect:/AA-page-travaux";
    }
    return this.editTravaux(editForm.getTravaux().getId(), pModel, request);
  }

  @RequestMapping(value = {"/AA-delete-travaux"}, method = {RequestMethod.GET})
  public String deleteTravaux(@RequestParam("idTravaux") final int idTravaux, final ModelMap pModel, final HttpServletRequest request) {
    this.service.deleteTravaux(idTravaux);
    return "redirect:/AA-page-travaux";
  }

}
