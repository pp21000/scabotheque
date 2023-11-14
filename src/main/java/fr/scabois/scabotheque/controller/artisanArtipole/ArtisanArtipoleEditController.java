package fr.scabois.scabotheque.controller.artisanArtipole;

import fr.scabois.scabotheque.bean.artisanArtipole.Actualite;
import fr.scabois.scabotheque.bean.artisanArtipole.Emplacement;
import fr.scabois.scabotheque.bean.artisanArtipole.Photo;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.AddCategorieForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.AddMetierForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditAAActualiteForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditAAEmplacementForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditAAPhotoForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditAATravauxForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditCategoriesForm;
import fr.scabois.scabotheque.controller.artisanArtipole.edit.EditMetiersForm;
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
    if (pModel.get((Object) "editForm") == null) {
      editForm = new EditAAActualiteForm(actualite);
    } else {
      editForm = (EditAAActualiteForm) pModel.get((Object) "editForm");
    }
    pModel.addAttribute("editForm", (Object) editForm);
    pModel.addAttribute("pageType", (Object) PageType.AA_ACTUALITES);
    return "AA-edit-actualite";
  }

  @RequestMapping(value = {"/AA-edit-emplacement"}, method = {RequestMethod.GET})
  public String editEmplacement(@RequestParam("idEmplacement") final int idEmplacement, final ModelMap pModel, final HttpServletRequest request) {
    final Emplacement emplacement = this.service.loadEmplacement(idEmplacement);
    EditAAEmplacementForm editForm;
    if (pModel.get((Object) "editForm") == null) {
      editForm = new EditAAEmplacementForm(emplacement);
    } else {
      editForm = (EditAAEmplacementForm) pModel.get((Object) "editForm");
    }
    pModel.addAttribute("emplacement", (Object) emplacement);
    pModel.addAttribute("editForm", (Object) editForm);
    pModel.addAttribute("pageList", (Object) this.service.loadPages());
    pModel.addAttribute("pageType", (Object) PageType.AA_EMPLACEMENT);
    return "AA-edit-emplacement";
  }

  @RequestMapping(value = {"/AA-edit-metiers"}, method = {RequestMethod.GET})
  public String editMetiers(final ModelMap pModel, final HttpServletRequest request) {
    if (pModel.get((Object) "editForm") == null) {
      final EditMetiersForm editForm = new EditMetiersForm(this.service.loadMetiers());
      pModel.addAttribute("editForm", (Object) editForm);
    } else {
      pModel.addAttribute("editForm", pModel.get((Object) "editForm"));
    }
    if (pModel.get((Object) "addForm") == null) {
      final AddMetierForm addForm = new AddMetierForm();
      pModel.addAttribute("addForm", (Object) addForm);
    } else {
      pModel.addAttribute("addForm", pModel.get((Object) "addForm"));
    }
    pModel.addAttribute("pageType", (Object) PageType.AA_METIER);
    return "AA-edit-metiers";
  }

  @RequestMapping(value = {"/AA-edit-categories"}, method = {RequestMethod.GET})
  public String editCategories(final ModelMap pModel, final HttpServletRequest request) {
    if (pModel.get((Object) "editForm") == null) {
      final EditCategoriesForm editForm = new EditCategoriesForm(this.service.loadCategories());
      pModel.addAttribute("editForm", (Object) editForm);
    } else {
      pModel.addAttribute("editForm", pModel.get((Object) "editForm"));
    }
    if (pModel.get((Object) "addForm") == null) {
      final AddCategorieForm addForm = new AddCategorieForm();
      pModel.addAttribute("addForm", (Object) addForm);
    } else {
      pModel.addAttribute("addForm", pModel.get((Object) "addForm"));
    }
    pModel.addAttribute("pageType", (Object) PageType.AA_METIER);
    return "AA-edit-categories";
  }

  @RequestMapping(value = {"/AA-edit-photo"}, method = {RequestMethod.GET})
  public String editPhoto(@RequestParam("idPhoto") final int idPhoto, final ModelMap pModel, final HttpServletRequest request) {
    final Photo photo = this.service.loadPhoto(Integer.valueOf(idPhoto));
    EditAAPhotoForm editForm;
    if (pModel.get((Object) "editForm") == null) {
      editForm = new EditAAPhotoForm(photo);
    } else {
      editForm = (EditAAPhotoForm) pModel.get((Object) "editForm");
    }
    pModel.addAttribute("photo", (Object) photo);
    pModel.addAttribute("editForm", (Object) editForm);
    pModel.addAttribute("pageType", (Object) PageType.AA_PHOTO);
    return "AA-edit-photo";
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
//       List<String> nouvellesSpecialites = addForm.getNouvellesSpecialites();
//
//        if (nouvellesSpecialites != null && !nouvellesSpecialites.isEmpty()) {
//            Travaux travail = addForm.getTravaux(); // Obtenez le travail existant
//
//            // Créez de nouvelles instances de Specialite pour les nouvelles spécialités
//            for (String libelle : nouvellesSpecialites) {
//                Specialite nouvelleSpecialite = new Specialite();
//                nouvelleSpecialite.setLibelle(libelle);
//
//                // Associez la spécialité au travail
//                nouvelleSpecialite.setTravaux(travail);
//
//                // Enregistrez la nouvelle spécialité en utilisant votre service ou repository
//                specialiteService.save(nouvelleSpecialite);
//            }
//        }
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
}
