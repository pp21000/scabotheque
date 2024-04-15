package fr.scabois.scabotheque.controller.security;

import fr.scabois.scabotheque.bean.security.User;
import fr.scabois.scabotheque.bean.security.UserRole;
import fr.scabois.scabotheque.enums.NavType;
import fr.scabois.scabotheque.enums.PageType;
import fr.scabois.scabotheque.enums.RoleEnum;
import fr.scabois.scabotheque.services.IServiceAdherent;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EditUtilisateurController {

  @Autowired
  private IServiceAdherent service;

  @RequestMapping(value = {"/parametrage/listeUtilisateurs"}, method = {RequestMethod.GET})
  public String afficher(ModelMap pModel) {
    List<User> utilisateurList = this.service.loadUtilisateurs();
    List<EditUtilisateur> editUsersList = this.utilisateurToEdit(utilisateurList);
    editUsersList.sort(Comparator.comparing(EditUtilisateur::getUsername));

    if (pModel.get("utilisateurListe") == null) {
      EditUtilisateursForm utilisateurForm = new EditUtilisateursForm(editUsersList);
      pModel.addAttribute("utilisateurListe", utilisateurForm);
    } else {
      pModel.addAttribute("utilisateurListe", pModel.get("utilisateurListe"));
    }

    pModel.addAttribute("pageType", PageType.GESTION_USERS);
    if (pModel.get("creation") == null) {
      pModel.addAttribute("creation", new CreationUtilisateurForm());
    }
    pModel.addAttribute("navType", NavType.ADMINISTRATION);
    pModel.addAttribute("pageType", PageType.GESTION_USERS);

    return "listeUtilisateurs";
  }

  @RequestMapping(value = {"/parametrage/AjoutUtilisateur"}, method = {RequestMethod.POST})
  public String ajoutUtilisateur(@Valid @ModelAttribute("creation") CreationUtilisateurForm creation, BindingResult pBindingResult, ModelMap pModel) {
    if (!pBindingResult.hasErrors()) {
      this.service.createUtilisateur(creation.getUserName(), creation.getPassword());
    }
    return this.afficher(pModel);
  }

  @RequestMapping(value = {"/parametrage/listeUtilisateurs"}, method = {RequestMethod.POST})
  public String editUtl(@Valid @ModelAttribute("utilisateurListe") EditUtilisateursForm utlList, BindingResult pBindingResult, ModelMap pModel, HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      List<User> users = this.editToUtilisateur(utlList);
      this.service.saveUtilisateur(users);
      users.stream().forEach((u) -> {
        this.service.saveUtilisateurRoles(u.getId(), u.getRoles());
      });
    }
    return this.afficher(pModel);
  }

  private List<User> editToUtilisateur(EditUtilisateursForm utlList) {
    List<User> list = new ArrayList();
    utlList.getList().stream().forEach((u) -> {
      User usr = new User();
      usr.setId(u.getId());
      usr.setEnabled(u.getEnabled());
      usr.setPassword(u.getNewPassword().isEmpty() ? u.getPassword() : u.getNewPassword());
      usr.setUsername(u.getUsername());
      u.getUserRoles().stream().forEach((ur) -> {
        if (ur.isActif()) {
          UserRole usrRole = new UserRole();
          usrRole.setId(ur.getId());
          usrRole.setRole(ur.getRole());
          usrRole.setUser(this.service.loadUtilisateur(u.getId()));
          usr.getRoles().add(usrRole);
        }
      });
      list.add(usr);
    });
    return list;
  }

  private List<EditUtilisateur> utilisateurToEdit(List<User> utilisateurList) {
    List<EditUtilisateur> retour = new ArrayList();
    utilisateurList.stream().forEach((c) -> {
      EditUtilisateur edit = new EditUtilisateur();
      edit.setId(c.getId());
      edit.setEnabled(c.getEnabled());
      edit.setUsername(c.getUsername());
      edit.setPassword(c.getPassword());
      List<EditUtilisateurRole> utlRoles = new ArrayList();
      RoleEnum[] var4 = RoleEnum.values();
      int var5 = var4.length;

      for (int var6 = 0; var6 < var5; ++var6) {
        RoleEnum role = var4[var6];
        Optional<UserRole> usrRole = c.getRoles().stream().filter((r) -> {
          return r.getRole().equals(role);
        }).findFirst();
        if (usrRole.isPresent()) {
          utlRoles.add(new EditUtilisateurRole(((UserRole) usrRole.get()).getId(), role.libelle, role, true));
        } else {
          utlRoles.add(new EditUtilisateurRole(0, role.libelle, role, false));
        }
      }
      edit.setUserRoles(utlRoles);
      retour.add(edit);
    });
    return retour;
  }
}
