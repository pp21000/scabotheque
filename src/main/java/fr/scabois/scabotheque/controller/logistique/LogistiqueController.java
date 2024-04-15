package fr.scabois.scabotheque.controller.logistique;

import fr.scabois.scabotheque.bean.logistique.LogistiqueCamion;
import fr.scabois.scabotheque.bean.logistique.LogistiqueConducteur;
import fr.scabois.scabotheque.bean.logistique.LogistiqueTournee;
import fr.scabois.scabotheque.controller.adherent.ListeAdherentsController;
import fr.scabois.scabotheque.controller.logistique.edit.EditCamion;
import fr.scabois.scabotheque.controller.logistique.edit.EditCamionForm;
import fr.scabois.scabotheque.controller.logistique.edit.EditConducteur;
import fr.scabois.scabotheque.controller.logistique.edit.EditConducteurForm;
import fr.scabois.scabotheque.enums.LogistiqueJobType;
import fr.scabois.scabotheque.enums.NavType;
import fr.scabois.scabotheque.enums.PageType;
import fr.scabois.scabotheque.services.ExportService;
import fr.scabois.scabotheque.services.IServiceAdherent;
import fr.scabois.scabotheque.services.IServiceLogistique;
import fr.scabois.scabotheque.utils.AppProperties;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LogistiqueController {

  @Autowired
  private ExportService serviceExport;
  @Autowired
  private IServiceLogistique serviceLog;
  @Autowired
  private IServiceAdherent serviceAdh;

  @RequestMapping(value = "/ordreTournee", method = RequestMethod.GET)
  public String afficherTounee(@CookieValue(value = "criteriaLog", defaultValue = "") String cookieLog, final ModelMap pModel, EditLogistiqueTourneeForm tourneeForm) {
    CriteriaLogistique criteriaLog = null;
    try {
      if (cookieLog.length() != 0) {
        criteriaLog = deserialiseTournee(cookieLog);
        criteriaLog.setDateLivraison(new Date());
      } else {
        criteriaLog = new CriteriaLogistique();
        criteriaLog.setDateLivraison(new Date());
      }
    } catch (IOException ex) {
      Logger.getLogger("1" + LogistiqueController.class.getName()).log(Level.SEVERE, "lenght:" + cookieLog.length(), "1" + cookieLog);
    } catch (ClassNotFoundException ex) {
      Logger.getLogger("2" + LogistiqueController.class.getName()).log(Level.SEVERE, "lenght:" + cookieLog.length(), "2" + cookieLog);
    }

    if (tourneeForm.getTournees() == null) {
      pModel.addAttribute("tourneeForm", new EditLogistiqueTourneeForm());
    } else {
      pModel.addAttribute("tourneeForm", tourneeForm);
    }
    pModel.addAttribute("camions", serviceLog.loadCamions());
    pModel.addAttribute("chauffeurs", serviceLog.loadChauffeurs());
    pModel.addAttribute("agenceList", serviceAdh.loadAgences());
    pModel.addAttribute("criteriaLog", criteriaLog);
    pModel.addAttribute("navType", NavType.LOGISTIQUE);
    pModel.addAttribute("pageType", PageType.LOGISTIQUE_TOURNEE);
    return "ordreTournee";
  }

  @RequestMapping(value = "/listeCamions", method = RequestMethod.GET)
  public String listeCamions(final ModelMap pModel, EditCamionForm camionsForm) {

    if (camionsForm.getCamions() == null) {
      camionsForm.setCamions(new ArrayList<>());
      List<LogistiqueCamion> camions = serviceLog.loadCamions();
      camions.stream().forEach(c -> camionsForm.getCamions().add(new EditCamion(c)));
    }
    pModel.addAttribute("camionsForm", camionsForm);
    pModel.addAttribute("navType", NavType.LOGISTIQUE);
    pModel.addAttribute("pageType", PageType.LISTE_CAMIONS);
    return "listeCamions";
  }

  @RequestMapping(value = "/listeConducteurs", method = RequestMethod.GET)
  public String listeChauffeurs(final ModelMap pModel, EditConducteurForm conducteursForm) {
    if (conducteursForm.getConducteurs() == null) {
      conducteursForm.setConducteurs(new ArrayList<>());
      List<LogistiqueConducteur> conducteurs = serviceLog.loadChauffeurs();
      conducteurs.stream().forEach(c -> conducteursForm.getConducteurs().add(new EditConducteur(c)));
    }

    pModel.addAttribute("conducteursForm", conducteursForm);
    pModel.addAttribute("newConducteur", new LogistiqueConducteur());
    pModel.addAttribute("navType", NavType.LOGISTIQUE);
    pModel.addAttribute("pageType", PageType.LISTE_CONDUCTEURS);
    return "listeConducteurs";
  }

  @RequestMapping(value = "/ordreTournee", method = RequestMethod.POST)
  public String rechercheTournee(@ModelAttribute(value = "criteriaLog") final CriteriaLogistique criteriaLog,
          final BindingResult pBindingResult, final ModelMap pModel, HttpServletResponse response, HttpServletRequest request
  ) {

    try {
      Cookie cookie = new Cookie("criteriaLog", serialiseTournee(criteriaLog));
      cookie.setPath("/ordreTournee");
      cookie.setMaxAge(7 * 24 * 60 * 60);
      response.addCookie(cookie);
    } catch (IOException ex) {
      Logger.getLogger(ListeAdherentsController.class.getName()).log(Level.SEVERE, null, ex);
    }

    List<LogistiqueTournee> list;
    list = serviceLog.loadTournees(criteriaLog.getCodeAgence(), criteriaLog.getZone(), criteriaLog.getDateLivraison(), request.getUserPrincipal().getName());
    EditLogistiqueTourneeForm form = new EditLogistiqueTourneeForm();
    form.setTournees(new ArrayList<>());

    list.stream().forEach(m -> form.getTournees().add(new EditLogistiqueTournee(m)));

    pModel.addAttribute("camions", serviceLog.loadCamions());
    pModel.addAttribute("chauffeurs", serviceLog.loadChauffeurs());
    pModel.addAttribute("zonePrep", serviceLog.loadZonePrep(criteriaLog.getCodeAgence()));
    pModel.addAttribute("agenceList", serviceAdh.loadAgences());
    pModel.addAttribute("criteriaLog", criteriaLog);
    pModel.addAttribute("tourneeForm", form);
    pModel.addAttribute("navType", NavType.LOGISTIQUE);
    pModel.addAttribute("pageType", PageType.LOGISTIQUE_TOURNEE);

    return "ordreTournee";
  }

  @RequestMapping(value = "/chargeTournee", method = RequestMethod.POST)
  public String loadFromERP(@ModelAttribute(value = "criteriaLog") final CriteriaLogistique criteriaLog, final BindingResult pBindingResult, final ModelMap pModel, HttpServletResponse response, HttpServletRequest request) {
    try {
      Cookie cookie = new Cookie("criteriaLog", serialiseTournee(criteriaLog));
      cookie.setMaxAge(7 * 24 * 60 * 60);
      cookie.setPath("/ordreTournee");
      response.addCookie(cookie);
    } catch (IOException ex) {
      Logger.getLogger(ListeAdherentsController.class.getName()).log(Level.SEVERE, null, ex);
    }

    serviceLog.executeJob(LogistiqueJobType.COLLECT_JOB, request.getUserPrincipal().getName());
    EditLogistiqueTourneeForm form = new EditLogistiqueTourneeForm();
    form.setTournees(new ArrayList<>());

    pModel.addAttribute("agenceList", serviceAdh.loadAgences());
    pModel.addAttribute("zonePrep", serviceLog.loadZonePrep(criteriaLog.getCodeAgence()));
    pModel.addAttribute("criteriaLog", criteriaLog);
    pModel.addAttribute("tourneeForm", form);
    pModel.addAttribute("navType", NavType.LOGISTIQUE);
    pModel.addAttribute("pageType", PageType.LOGISTIQUE_TOURNEE);

    return "ordreTournee";
  }

  @RequestMapping(value = "/listeCamions", method = RequestMethod.POST)
  public String saveCamions(@Valid @ModelAttribute(value = "camionsForm") final EditCamionForm camionsForm,
          @CookieValue(value = "criteriaLog", defaultValue = "") String cookie,
          final BindingResult pBindingResult, final ModelMap pModel, HttpServletResponse response) {

//        pBindingResult.addError(new FieldError("messageErreur", "messageErreur", "Gestion des erreurs ..."));
    if (!pBindingResult.hasErrors()) {
      // recup et enregistrement des lignes de la Tournées (EditLogistiqueTourneeForm)
      List<LogistiqueCamion> list = camionsForm.toCamions();
      serviceLog.saveCamions(list);

      return "redirect:/ordreTournee";
    }

    return listeCamions(pModel, camionsForm);
  }

  @RequestMapping(value = "/listeConducteurs", method = RequestMethod.POST)
  public String saveConducteur(@Valid @ModelAttribute(value = "conducteursForm") final EditConducteurForm conducteurForm,
          final BindingResult pBindingResult, final ModelMap pModel, HttpServletResponse response) {

    if (!pBindingResult.hasErrors()) {
      // recup et enregistrement des lignes de la Tournées (EditLogistiqueTourneeForm)
      List<LogistiqueConducteur> list = conducteurForm.toConducteur();
      serviceLog.saveConducteurs(list);

      return "redirect:/ordreTournee";
    }

    return listeChauffeurs(pModel, conducteurForm);
  }

  @RequestMapping(value = "/sendMissionConducteur", method = RequestMethod.POST)
  public void sendMission(@Valid @ModelAttribute(value = "tourneeForm") final EditLogistiqueTourneeForm tourneeForm,
          @CookieValue(value = "criteriaLog", defaultValue = "") String cookie,
          final BindingResult pBindingResult, final ModelMap pModel, HttpServletResponse response, HttpServletRequest request) {

    if (tourneeForm.getTournees() == null) {
      pBindingResult.addError(new FieldError("messageErreur", "messageErreur", "Candice, quand même... Merci de charger les données avant d'envoyer! "));
    } else {
      // validation de la suite des ordres de tournées
      List<Integer> ordres = new ArrayList<>();
      tourneeForm.getTournees().stream().mapToInt(m -> m.getOrdre()).sorted().forEach(c -> ordres.add(c));

      for (int cpt = 0; cpt < ordres.size() - 1; cpt++) {
        if (!(ordres.get(cpt) == ordres.get(cpt + 1) || (ordres.get(cpt) + 1) == ordres.get(cpt + 1))) {
          pBindingResult.addError(new FieldError("messageErreur", "messageErreur", "Les numeros de tournées ne ce suivent pas..."));
          break;
        }
        if (ordres.get(cpt) == 0) {
          pBindingResult.addError(new FieldError("messageErreur", "messageErreur", "Tous les numeros d'ordre ne sont pas renseigné."));
          break;
        }
      }
    }

    if (!pBindingResult.hasErrors()) {
      // recup et enregistrement des lignes de la Tournées (EditLogistiqueTourneeForm)
      List<LogistiqueTournee> list = tourneeForm.toLogistiqueTournee();
      serviceLog.saveTounree(list);

      serviceLog.executeJob(LogistiqueJobType.SEND_MISSION_JOB, request.getUserPrincipal().getName());

      String fileName = AppProperties.getPropertie("export.modelePath") + "/"
              + AppProperties.getPropertie("export.exportOrdreMissionFileName");
      serviceExport.downloadFile(fileName, response);

//      return rechercheTournee(cookie, pBindingResult, pModel, response, request);
//      return "redirect:/ordreTournee";
    }

//    return afficherTounee(cookie, pModel, tourneeForm);
  }

  /**
   * Déserialise Base64 string.
   */
  private CriteriaLogistique deserialiseTournee(String s) throws IOException, ClassNotFoundException {
    byte[] data = Base64.getDecoder().decode(s);
    ObjectInputStream ois = new ObjectInputStream(
            new ByteArrayInputStream(data));
    Object cookie = ois.readObject();
    ois.close();
    return (CriteriaLogistique) cookie;
  }

  /**
   * Write the object to a Base64 string.
   */
  private String serialiseTournee(CriteriaLogistique o) throws IOException {
    ByteArrayOutputStream baos = new ByteArrayOutputStream();
    ObjectOutputStream oos = new ObjectOutputStream(baos);
    oos.writeObject(o);
    oos.close();
    return Base64.getEncoder().encodeToString(baos.toByteArray());
  }
}
