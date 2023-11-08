package fr.scabois.scabotheque.controller.adherent;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.adherent.AdherentContactRole;
import fr.scabois.scabotheque.bean.adherent.AdherentType;
import fr.scabois.scabotheque.bean.adherent.ContactClubFemme;
import fr.scabois.scabotheque.bean.adherent.ContactRetraite;
import fr.scabois.scabotheque.bean.adherent.Pole;
import fr.scabois.scabotheque.bean.adherent.Secteur;
import fr.scabois.scabotheque.bean.commun.Activite;
import fr.scabois.scabotheque.bean.commun.Agence;
import fr.scabois.scabotheque.bean.commun.ContactFonction;
import fr.scabois.scabotheque.enums.NavType;
import fr.scabois.scabotheque.enums.PageType;
import fr.scabois.scabotheque.services.ApplicationMailer;
import fr.scabois.scabotheque.services.ExportService;
import fr.scabois.scabotheque.services.IServiceAdherent;
import java.io.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Comparator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ListeAdherentsController {

  @Autowired
  public ExportService exportService;

  @Autowired
  public ApplicationMailer mailer;

  @Autowired
  private IServiceAdherent service;

  @RequestMapping(value = {"/listeAdherents", "adherentListe"}, method = RequestMethod.GET)
  public String afficher(@CookieValue(value = "criteria", defaultValue = "") String cookie, ModelMap pModel, HttpServletRequest request) {
    String param = request.getParameter("page");
    Integer page = param == null ? 1 : Integer.parseInt(param);

    CriteriaAdherent criteria = null;
    try {
      if (cookie.length() != 0) {
        criteria = deserialiseAdh(cookie);
      }
    } catch (IOException ex) {
      Logger.getLogger("1" + ListeAdherentsController.class.getName()).log(Level.SEVERE, "lenght:" + cookie.length(), "1" + cookie);
    } catch (ClassNotFoundException ex) {
      Logger.getLogger("2" + ListeAdherentsController.class.getName()).log(Level.SEVERE, "lenght:" + cookie.length(), "2" + cookie);
    }
    return chargementListe(criteria, pModel, page);
  }

  @RequestMapping(value = "/listeContact", method = RequestMethod.GET)
  public String contactListe(@CookieValue(value = "criteria", defaultValue = "") String cookie, ModelMap pModel, HttpServletRequest request) {
    String param = request.getParameter("page");
    Integer page = param == null ? 1 : Integer.parseInt(param);

    CriteriaAdherent criteria = null;
    try {
      if (cookie.length() != 0) {
        criteria = deserialiseAdh(cookie);
      }
    } catch (IOException ex) {
      Logger.getLogger("1" + ListeAdherentsController.class.getName()).log(Level.SEVERE, "lenght:" + cookie.length(), "1" + cookie);
    } catch (ClassNotFoundException ex) {
      Logger.getLogger("2" + ListeAdherentsController.class.getName()).log(Level.SEVERE, "lenght:" + cookie.length(), "2" + cookie);
    }

    return chargementListeContact(criteria, pModel, page);
  }

  @RequestMapping(value = {"/listeRetraite"}, method = {RequestMethod.GET})
  public String retraiteListe(@CookieValue(value = "criteria", defaultValue = "") final String cookie, final ModelMap pModel, final HttpServletRequest request) {
    final String param = request.getParameter("page");
    final Integer page = (param == null) ? 1 : Integer.parseInt(param);
    final List<ContactRetraite> list = (List<ContactRetraite>) this.service.loadContactsRetraite();
    final int pageSize = 1000;
    pModel.addAttribute("listeContacts", (Object) list.stream().sorted(Comparator.comparing(ContactRetraite::getNom)).skip(pageSize * (page - 1)).limit(pageSize).collect(Collectors.toList()));
    pModel.addAttribute("nbContact", (Object) list.size());
    pModel.addAttribute("criteria", (Object) new CriteriaAdherent());
    pModel.addAttribute("navType", NavType.ADHERENT);
    pModel.addAttribute("pageType", (Object) PageType.LIST_CONTACT_RETRAITE);
    return "listeContactRetraite";
  }

  @RequestMapping(value = {"/listeClubFemmes"}, method = {RequestMethod.GET})
  public String clubFemmeListe(@CookieValue(value = "criteria", defaultValue = "") final String cookie, final ModelMap pModel, final HttpServletRequest request) {
    final String param = request.getParameter("page");
    final Integer page = (param == null) ? 1 : Integer.parseInt(param);
    final List<ContactClubFemme> list = (List<ContactClubFemme>) this.service.loadContactsClubFemme();
    final int pageSize = 1000;
    pModel.addAttribute("listeContacts", (Object) list.stream().sorted(Comparator.comparing(ContactClubFemme::getNom)).skip(pageSize * (page - 1)).limit(pageSize).collect(Collectors.toList()));
    pModel.addAttribute("nbContact", (Object) list.size());
    pModel.addAttribute("criteria", (Object) new CriteriaAdherent());
    pModel.addAttribute("navType", NavType.ADHERENT);
    pModel.addAttribute("pageType", (Object) PageType.LIST_CONTACT_CLUB_FEMMES);
    return "listeContactClubFemmes";
  }

  @RequestMapping(value = "/initListeAdherents", method = RequestMethod.GET)
  public String initRechercheAdh(ModelMap pModel, HttpServletResponse response) {
    response.addCookie(resetCriteriaAdherentCookie());
    return "redirect:/listeAdherents";
  }

  @RequestMapping(value = "/initListeContact", method = RequestMethod.GET)
  public String initRechercheContact(ModelMap pModel, HttpServletResponse response) {
    response.addCookie(resetCriteriaAdherentCookie());
    return "redirect:/listeContact";
  }

  @RequestMapping(value = "/exportContacts", method = RequestMethod.POST)
  public void exportContacts(@ModelAttribute(value = "criteria") final CriteriaAdherent criteria,
          final BindingResult pBindingResult, final ModelMap pModel, HttpServletRequest request,
          HttpServletResponse response) {

    exportService.exportContactToFile(criteria, response);
  }

  @RequestMapping(value = "/exportList", method = RequestMethod.POST)
  public void exportList(@ModelAttribute(value = "criteria") final CriteriaAdherent criteria,
          final BindingResult pBindingResult, final ModelMap pModel, HttpServletRequest request,
          HttpServletResponse response) {

    exportService.exportListToFile(criteria, response);
  }

  @RequestMapping(value = "/exportListAll", method = RequestMethod.POST)
  public void exportListAll(@ModelAttribute(value = "criteria") final CriteriaAdherent criteria,
          final BindingResult pBindingResult, final ModelMap pModel, HttpServletRequest request,
          HttpServletResponse response) {

    criteria.setExportAll(Boolean.TRUE);
    exportService.exportListToFile(criteria, response);
  }

  @RequestMapping(value = "/exportMail", method = RequestMethod.POST)
  public void exportMail(@ModelAttribute(value = "criteria") final CriteriaAdherent criteria,
          final BindingResult pBindingResult, final ModelMap pModel, HttpServletRequest request,
          HttpServletResponse response) {

    exportService.exportListToFile(criteria, response);
  }

  @RequestMapping(value = {"/", "/listeAdherents", "/adherentListe"}, method = RequestMethod.POST)
  public String rechercheAdh(@ModelAttribute(value = "criteria") final CriteriaAdherent criteria,
          final BindingResult pBindingResult, final ModelMap pModel, HttpServletResponse response, HttpServletRequest request) {

    String param = request.getParameter("page");
    Integer page = param == null ? 1 : Integer.parseInt(param);

    try {
      Cookie cookie = new Cookie("criteria", serialiseAdh(criteria));
      cookie.setMaxAge(7 * 24 * 60 * 60);
      response.addCookie(cookie);
    } catch (IOException ex) {
      Logger.getLogger(ListeAdherentsController.class.getName()).log(Level.SEVERE, null, ex);
    }
    return chargementListe(criteria, pModel, page);
  }

  @RequestMapping(value = "/listeContact", method = RequestMethod.POST)
  public String rechercheContact(@ModelAttribute(value = "criteria") final CriteriaAdherent criteria,
          final BindingResult pBindingResult, final ModelMap pModel, HttpServletResponse response, HttpServletRequest request) {

    String param = request.getParameter("page");
    Integer page = param == null ? 1 : Integer.parseInt(param);

    try {
      Cookie cookie = new Cookie("criteria", serialiseAdh(criteria));
      cookie.setMaxAge(7 * 24 * 60 * 60);
      response.addCookie(cookie);
    } catch (IOException ex) {
      Logger.getLogger(ListeAdherentsController.class.getName()).log(Level.SEVERE, null, ex);
    }
    return chargementListeContact(criteria, pModel, page);
  }

  @RequestMapping(value = "/sendMail", method = RequestMethod.POST)
  public String sendMail(@ModelAttribute(value = "criteria") final CriteriaAdherent criteria,
          final BindingResult pBindingResult, final ModelMap pModel, HttpServletRequest request) {

    String param = request.getParameter("page");
    Integer page = param == null ? 1 : Integer.parseInt(param);

    // recherche de tous les contacts pour envoy du message.
    final List<Adherent> listeAdherents = service.loadAdherents(criteria);
    List<AdherentContactRole> listeTotal = new ArrayList<>();
    try {
      mailer.sendHTMLMail(criteria.getSender(), criteria.getSender(),
              "Copie de votre message :" + criteria.getObject(), criteria.getMessageMail());
      listeAdherents.stream().forEach(a -> {
        final List<AdherentContactRole> contacts = service.loadAdherentContactFonction(a.getId(),
                criteria.isMailingDirigeant(), criteria.isMailingCommerce(), criteria.isMailingAdministratif(),
                criteria.isMailingCompta());

        listeTotal.addAll(contacts);

        mailer.sendHTMLMail(criteria.getSender(),
                contacts.stream().map(m -> m.getMail()).collect(Collectors.toSet()).toString(),
                criteria.getObject(), criteria.getMessageMail());
      });

      // message de compte rendu
      mailer.sendHTMLMail(criteria.getSender(), criteria.getSender(), "Compte rendu:" + criteria.getObject(),
              "Votre message est envoyé à tout les destinataires suivant :"
              + listeTotal.stream().map(m -> m.getMail()).collect(Collectors.toList()).toString());

      criteria.setAvertissement("Votre message est envoyé.");

    } catch (Exception e) {
      mailer.sendHTMLMail(criteria.getSender(), criteria.getSender(), "Compte rendu:" + criteria.getObject(),
              "Une erreur est survenue : \n Exception:" + e.getMessage()
              + "\n Le message a été envoyé aux destinataire suivant : "
              + listeTotal.stream().map(m -> m.getMail()).collect(Collectors.toList()).toString());

      criteria.setAvertissement("Une erreur est survenue, Le message na pas été envoyé." + e.getMessage());
    }

    pModel.addAttribute("listeAdherents", listeAdherents);

    return chargementListe(criteria, pModel, page);
  }

  private String chargementListe(CriteriaAdherent criteria, ModelMap pModel, Integer page) {

    List<Adherent> listeAdherents;
    // Chargement des listes de recherche rapide
    List<Pole> poles = service.loadPoles();
    List<Agence> agences = service.loadAgences();
    List<Secteur> secteurs = service.loadSecteurs();
    List<Activite> activites = service.loadActivites();
    List<AdherentType> types = service.loadAdherentTypes();
    List<ContactFonction> contactFonctions = service.loadContactFonctions();

    pModel.addAttribute("polesList", poles);
    pModel.addAttribute("agencesList", agences);
    pModel.addAttribute("secteursList", secteurs);
    pModel.addAttribute("activitesList", activites);
    pModel.addAttribute("adhTypesList", types);
    pModel.addAttribute("contactFonctionList", contactFonctions);

    // Si on a trouvé un cookie avec les criteres de recherche
    if (criteria == null) {
      criteria = new CriteriaAdherent();
    }
    listeAdherents = service.loadAdherents(criteria).stream().sorted(Comparator.comparing(Adherent::getLibelle)).collect(Collectors.toList());

    final int pageSize = 25;
    pModel.addAttribute("nbAdherent", listeAdherents.size());
    pModel.addAttribute("page", page);
    pModel.addAttribute("maxPage", (int) Math.ceil(listeAdherents.size() / pageSize));
    pModel.addAttribute("listeAdherents", listeAdherents.stream().sorted(Comparator.comparing(Adherent::getLibelle)).skip(pageSize * (page - 1)).limit(pageSize).collect(Collectors.toList()));
    pModel.addAttribute("criteria", criteria);
    pModel.addAttribute("navType", NavType.ADHERENT);
    pModel.addAttribute("pageType", PageType.LIST_ADHERENT);

    return "adherentListe";
  }

  private String chargementListeContact(CriteriaAdherent criteria, ModelMap pModel, Integer page) {
    List<Pole> poles = service.loadPoles();
    List<Agence> agences = service.loadAgences();
    List<Secteur> secteurs = service.loadSecteurs();
    List<Activite> activites = service.loadActivites();
    List<ContactFonction> contactFonctions = service.loadContactFonctions();

    pModel.addAttribute("polesList", poles);
    pModel.addAttribute("agencesList", agences);
    pModel.addAttribute("secteursList", secteurs);
    pModel.addAttribute("activitesList", activites);
    pModel.addAttribute("contactFonctionList", contactFonctions);

    List<AdherentContactRole> listContact;

    if (criteria != null) {
      listContact = service.loadAdherentContact(criteria).stream().sorted(Comparator.comparing(AdherentContactRole::getNom)).collect(Collectors.toList());
    } else {
      criteria = new CriteriaAdherent();
      // filtre quand même temps sur les actifs
      listContact = service.loadAdherentsContact().stream().filter(a -> a.getAdherent().getEtat().getId() == 1)
              .sorted(Comparator.comparing(AdherentContactRole::getNom)).collect(Collectors.toList());
    }

    int pageSize = 25;
    pModel.addAttribute("page", page);
    pModel.addAttribute("maxPage", (int) Math.ceil(listContact.size() / pageSize));
    pModel.addAttribute("listeContacts", listContact.stream().sorted(Comparator.comparing(AdherentContactRole::getNom)).skip(pageSize * (page - 1)).limit(pageSize).collect(Collectors.toList()));
    pModel.addAttribute("nbContact", listContact.size());
    pModel.addAttribute("criteria", criteria);
    pModel.addAttribute("navType", NavType.ADHERENT);
    pModel.addAttribute("pageType", PageType.LIST_CONTACT);

    return "listeContact";
  }

  /**
   * Déserialise Base64 string.
   */
  private CriteriaAdherent deserialiseAdh(String s) throws IOException, ClassNotFoundException {
    byte[] data = Base64.getDecoder().decode(s);
    ObjectInputStream ois = new ObjectInputStream(
            new ByteArrayInputStream(data));
    Object cookie = ois.readObject();
    ois.close();
    return (CriteriaAdherent) cookie;
  }

  private Cookie resetCriteriaAdherentCookie() {
    Cookie cookie = new Cookie("criteria", null);
    cookie.setMaxAge(0);
    return cookie;
  }

  /**
   * Write the object to a Base64 string.
   */
  private String serialiseAdh(CriteriaAdherent o) throws IOException {
    ByteArrayOutputStream baos = new ByteArrayOutputStream();
    ObjectOutputStream oos = new ObjectOutputStream(baos);
    oos.writeObject(o);
    oos.close();
    return Base64.getEncoder().encodeToString(baos.toByteArray());
  }

}
