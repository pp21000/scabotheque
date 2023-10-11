package fr.scabois.scabotheque.controller.adherent.edit;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.adherent.AdherentContactComptable;
import fr.scabois.scabotheque.bean.adherent.AdherentContactRole;
import fr.scabois.scabotheque.bean.adherent.AdherentEtat;
import fr.scabois.scabotheque.bean.adherent.AdherentType;
import fr.scabois.scabotheque.bean.adherent.CompteType;
import fr.scabois.scabotheque.bean.adherent.ContactClubFemme;
import fr.scabois.scabotheque.bean.adherent.ContactRetraite;
import fr.scabois.scabotheque.bean.adherent.FormeJuridique;
import fr.scabois.scabotheque.bean.adherent.Pole;
import fr.scabois.scabotheque.bean.adherent.Role;
import fr.scabois.scabotheque.bean.adherent.RoleSalarieEOLAS;
import fr.scabois.scabotheque.bean.adherent.Secteur;
import fr.scabois.scabotheque.bean.adherent.Tournee;
import fr.scabois.scabotheque.bean.commun.Agence;
import fr.scabois.scabotheque.bean.commun.Ape;
import fr.scabois.scabotheque.bean.commun.ContactFonction;
import fr.scabois.scabotheque.controller.adherent.CriteriaAdherent;
import fr.scabois.scabotheque.enums.PageType;
import fr.scabois.scabotheque.services.ExportService;
import fr.scabois.scabotheque.services.IServiceAdherent;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ContactController {

  @Autowired
  private MessageSource messages;
  @Autowired
  private IServiceAdherent service;
  @Autowired
  public ExportService exportService;

  @RequestMapping(value = {"/edit/addAdherentContact"}, method = {RequestMethod.POST})
  public String addContact(@Valid @ModelAttribute("contactToAdd") final AddAdherentContactForm newContact, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.createContactAdherent(this.editToContact(newContact.getContact()));
      return "redirect:/adherentDetail?idAdh=" + newContact.getContact().getAdherentId();
    }
    return this.editContact(newContact.getContact().getAdherentId(), pModel, request);
  }

  @RequestMapping(value = {"/addContactClubFemme**"}, method = {RequestMethod.GET})
  public String addContactClubFemme(final ModelMap pModel) {
    if (pModel.get((Object) "addContactForm") == null) {
      final EditContactClubFemmeForm editContactForm = new EditContactClubFemmeForm();
      final EditContactClubFemme contactEditable = new EditContactClubFemme();
      editContactForm.setEditContactClubFemme(contactEditable);
      pModel.addAttribute("addContactForm", (Object) editContactForm);
    } else {
      pModel.addAttribute("addContactForm", pModel.get((Object) "addContactForm"));
    }
    pModel.addAttribute("pageType", (Object) PageType.CREATE_CONTACT_CLUB_FEMME);
    final Map<Integer, String> listAdherents = (Map<Integer, String>) this.service.loadAdherents().stream().collect(Collectors.toMap(a -> a.getId(), a -> a.getLibelle()));
    final Map<String, String> civilite = new HashMap<String, String>();
    civilite.put("Mme", "Mme");
    civilite.put("Mr", "Mr");
    pModel.addAttribute("civilite", (Object) civilite);
    pModel.addAttribute("listAdherents", (Object) listAdherents);
    pModel.addAttribute("criteria", (Object) new CriteriaAdherent());
    return "addContactClubFemme";
  }

  @RequestMapping(value = {"/addContactClubFemme"}, method = {RequestMethod.POST})
  public String addContactClubFemme(@Valid @ModelAttribute("addContactForm") final EditContactClubFemmeForm newContact, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      final EditContactClubFemme contact = newContact.getEditContactClubFemme();
      final ContactClubFemme newContactClub = newContact.getContactClubFemme(contact);
      newContactClub.setAdherent(this.service.loadAdherent((int) contact.getAdherentId()));
      newContactClub.setId(Integer.valueOf(0));
      this.service.createContactClubFemme(newContactClub);
      return "redirect:/listeClubFemmes";
    }
    return this.addContactClubFemme(pModel);
  }

  @RequestMapping(value = {"/addContactRetraite**"}, method = {RequestMethod.GET})
  public String addContactRetraite(final ModelMap pModel) {
    if (pModel.get((Object) "addContactForm") == null) {
      final EditContactRetraiteForm editContactForm = new EditContactRetraiteForm();
      final EditContactRetraite contactEditable = new EditContactRetraite();
      editContactForm.setEditContactRetraite(contactEditable);
      pModel.addAttribute("addContactForm", (Object) editContactForm);
    } else {
      pModel.addAttribute("addContactForm", pModel.get((Object) "addContactForm"));
    }
    pModel.addAttribute("pageType", (Object) PageType.CREATE_CONTACT_RETRAITE);
    final Map<Integer, String> listAdherents = (Map<Integer, String>) this.service.loadAdherents().stream().collect(Collectors.toMap(a -> a.getId(), a -> a.getLibelle()));
    final Map<String, String> civilite = new HashMap<String, String>();
    civilite.put("Mr", "Mr");
    civilite.put("Mme", "Mme");
    pModel.addAttribute("civilite", (Object) civilite);
    pModel.addAttribute("listAdherents", (Object) listAdherents);
    pModel.addAttribute("criteria", (Object) new CriteriaAdherent());
    return "addContactRetraite";
  }

  @RequestMapping(value = {"/addContactRetraite"}, method = {RequestMethod.POST})
  public String addContactRetraite(@Valid @ModelAttribute("addContactForm") final EditContactRetraiteForm newContact, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      final EditContactRetraite contact = newContact.getEditContactRetraite();
      final ContactRetraite newContactRetraite = newContact.getContactRetraite(contact);
      newContactRetraite.setAdherent(this.service.loadAdherent((int) contact.getAdherentId()));
      newContactRetraite.setId(Integer.valueOf(0));
      this.service.createContactRetraite(newContactRetraite);
      return "redirect:/listeRetraite";
    }
    return this.addContactRetraite(pModel);
  }

  @RequestMapping(value = {"/exportRetraiteList"}, method = {RequestMethod.POST})
  public void exportRetraiteListPost(@ModelAttribute("criteria") final CriteriaAdherent criteria, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletResponse response) {
//    this.exportService.exportListRetraiteToFile(response);
  }

  @RequestMapping(value = {"/exportClubFemmeList"}, method = {RequestMethod.POST})
  public void exportClubFemmeList(@ModelAttribute("criteria") final CriteriaAdherent criteria, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request, final HttpServletResponse response) {
//    this.exportService.exportListClubFemmeToFile(response);
  }

  private EditContactComptableAdherent contactComptableAdhToEdit(final AdherentContactComptable contactCpt) {
    final EditContactComptableAdherent editable = new EditContactComptableAdherent();
    editable.setId(contactCpt.getId());
    editable.setAdherentId(Integer.valueOf(contactCpt.getAdherentId()));
    editable.setCabinet(contactCpt.getCabinet());
    editable.setCivilite(contactCpt.getCivilite());
    editable.setFixe(contactCpt.getFixe());
    editable.setMail(contactCpt.getMail());
    editable.setMobile(contactCpt.getMobile());
    editable.setNom(contactCpt.getNom());
    editable.setPrenom(contactCpt.getPrenom());
    return editable;
  }

  private List<EditAdherentContact> contactToEdit(final List<AdherentContactRole> contacts) {
//    final List<EditAdherentContact> ret = new ArrayList<EditAdherentContact>();
//    final EditAdherentContact edit;
    final List<EditAdherentContact> list = new ArrayList<EditAdherentContact>();
    contacts.stream().forEach(c -> {
      EditAdherentContact edit = new EditAdherentContact();
      edit.setAdherentId((int) c.getAdherent().getId());
      edit.setCivilite(c.getCivilite());
      edit.setFixe(c.getFixe());
      edit.setId(c.getId());
      edit.setIsMailingAdministratif(c.getIsMailingAdministratif());
      edit.setIsMailingCommercial(c.getIsMailingCommerce());
      edit.setIsMailingComptabilite(c.getIsMailingCompta());
      edit.setIsMailingDirigeant(c.getIsMailingDirigeant());
      edit.setMail(c.getMail());
      edit.setMobile(c.getMobile());
      edit.setNom(c.getNom());
      edit.setDateNaissance(c.getDateNaissance());
      edit.setPhotoImg(c.getPhotoImg());
      edit.setPrenom(c.getPrenom());
      edit.setFonction(c.getFonction());
      edit.setContactFonctionId((int) c.getFonction().getId());
      edit.setIsAccessEOLAS(c.getIsAccessEOLAS());
      edit.setLoginEOLAS(c.getLoginEOLAS());
      edit.setPassEOLAS(c.getPassEOLAS());
      edit.setRoleSalarieEOLASId(c.getRoleSalarieEOLASId());
      edit.setDateNaissance(c.getDateNaissance());
      list.add(edit);
      return;
    });
    return list;
  }

  @RequestMapping(value = {"/edit/editContactComptableAdh"}, method = {RequestMethod.GET})
  public String editAdherentContactComptable(@RequestParam("idAdh") final int idAdh, final ModelMap pModel, final HttpServletRequest request) {
    if (pModel.get((Object) "adhContactComptable") == null) {
      final AdherentContactComptable contactCpt = this.service.loadAdherentContactComptable(idAdh);
      final EditContactComptableAdherentForm editContactComptableAdhForm = new EditContactComptableAdherentForm();
      final EditContactComptableAdherent editableContact = this.contactComptableAdhToEdit(contactCpt);
      editContactComptableAdhForm.setContactComptableAdherent(editableContact);
      pModel.addAttribute("adhContactComptable", (Object) editContactComptableAdhForm);
    } else {
      pModel.addAttribute("adhContactComptable", pModel.get((Object) "adhContactComptable"));
    }
    final Adherent adh = this.service.loadAdherent(idAdh);
    pModel.addAttribute("adherent", (Object) adh);
    pModel.addAttribute("pageType", (Object) PageType.LIST_ADHERENT);
    return "editContactComptableAdh";
  }

  private void addSelectLists(final ModelMap pModel) {
    final List<Agence> agences = (List<Agence>) this.service.loadAgences();
    final List<Ape> codeApes = (List<Ape>) this.service.loadCodeApes();
    final List<AdherentEtat> etats = (List<AdherentEtat>) this.service.loadEtats();
    final List<AdherentType> adhTypes = (List<AdherentType>) this.service.loadAdherentTypes();
    final List<CompteType> cptTypes = (List<CompteType>) this.service.loadCompteTypes();
    final List<FormeJuridique> formesJuridiques = (List<FormeJuridique>) this.service.loadFormesJuridiques();
    final List<Pole> poles = (List<Pole>) this.service.loadPoles();
    final List<Role> roles = (List<Role>) this.service.loadRoles();
    final List<Secteur> secteurs = (List<Secteur>) this.service.loadSecteurs();
    final List<Tournee> tournees = (List<Tournee>) this.service.loadTournees();
    pModel.addAttribute("agenceList", (Object) agences);
    pModel.addAttribute("apeList", (Object) codeApes);
    pModel.addAttribute("etatList", (Object) etats);
    pModel.addAttribute("adhTypesList", (Object) adhTypes);
    pModel.addAttribute("compteTypeList", (Object) cptTypes);
    pModel.addAttribute("formJuridList", (Object) formesJuridiques);
    pModel.addAttribute("poleList", (Object) poles);
    pModel.addAttribute("roleList", (Object) roles);
    pModel.addAttribute("secteurList", (Object) secteurs);
    pModel.addAttribute("tourneeList", (Object) tournees);
  }

  @RequestMapping(value = {"/edit/editAdherentContact"}, method = {RequestMethod.GET})
  public String editContact(@RequestParam("idAdh") final int idAdh, final ModelMap pModel, final HttpServletRequest request) {
    this.addSelectLists(pModel);
    final Map<String, String> civilite = new HashMap<String, String>();
    civilite.put("Mme", "Mme");
    civilite.put("Mr", "Mr");
    pModel.addAttribute("civilite", (Object) civilite);
    final Adherent adh = this.service.loadAdherent(idAdh);
    final List<ContactFonction> contactFonctions = (List<ContactFonction>) this.service.loadContactFonctions();
    final List<RoleSalarieEOLAS> roleSalarieEOLAS = (List<RoleSalarieEOLAS>) this.service.loadRolesEOLAS();
    pModel.addAttribute("adherent", (Object) adh);
    pModel.addAttribute("contactFonctions", (Object) contactFonctions);
    pModel.addAttribute("roleSalarieEOLAS", (Object) roleSalarieEOLAS);
    if (pModel.get((Object) "contactToEdit") == null) {
      final EditAdherentContactsForm editAdhContactsForm = new EditAdherentContactsForm();
      editAdhContactsForm.setCommentaire(this.service.loadAdherentCommentaire(idAdh, PageType.ADHERENT_DETAIL));
      final List<EditAdherentContact> editableAdhContacts = this.contactToEdit(adh.getContacts());
      editAdhContactsForm.setAdherentContacts((List) editableAdhContacts);
      pModel.addAttribute("contactToEdit", (Object) editAdhContactsForm);
    } else {
      pModel.addAttribute("contactToEdit", pModel.get((Object) "contactToEdit"));
    }
    if (pModel.get((Object) "contactToAdd") == null) {
      final AddAdherentContactForm addContactForm = new AddAdherentContactForm();
      final EditAdherentContact addContact = new EditAdherentContact();
      addContact.setAdherentId(idAdh);
      addContactForm.setContact(addContact);
      pModel.addAttribute("contactToAdd", (Object) addContactForm);
    } else {
      pModel.addAttribute("contactToAdd", pModel.get((Object) "contactToAdd"));
    }
    pModel.addAttribute("pageType", (Object) PageType.LIST_ADHERENT);
    return "editContactAdh";
  }

  public Adherent editToAdh(final EditAdherent editAdh) {
    final Adherent adh = new Adherent();
    adh.setId(editAdh.getId());
    adh.setCode(editAdh.getCode());
    adh.setCodeERP(editAdh.getCodeERP());
    adh.setCodeERPParent(editAdh.getCodeERPParent());
    adh.setLibelle(editAdh.getLibelle());
    adh.setDenomination(editAdh.getDenomination());
    adh.setFormeJuridique(editAdh.getFormeJuridique());
    adh.setDateEntree(editAdh.getDateEntree());
    adh.setDateSortie(editAdh.getDateSortie());
    adh.setAdresse(editAdh.getAdresse());
    adh.setAdresseComplement(editAdh.getAdresseComplement());
    adh.setCommune(editAdh.getCommune());
    adh.setPhoto(editAdh.getPhoto().getBytes());
    adh.setPole(editAdh.getPole());
    adh.setRole(editAdh.getRole());
    adh.setSecteur(editAdh.getSecteur());
    adh.setIsArtipole(editAdh.getIsArtipole());
    adh.setIsCharteArtipole(editAdh.getIsCharteArtipole());
    adh.setIsFlocageArtipole(editAdh.getIsFlocageArtipole());
    adh.setIsWebArtipole(editAdh.getIsWebArtipole());
    adh.setSiteWeb(editAdh.getSiteWeb());
    adh.setFacebook(editAdh.getFacebook());
    adh.setInstagram(editAdh.getInstagram());
    adh.setLinkedin(editAdh.getLinkedin());
    adh.setYoutube(editAdh.getYoutube());
    adh.setPinterest(editAdh.getPinterest());
    adh.setFormationDirigeant(editAdh.getFormationDirigeant());
    adh.setCnxEolasAllow(editAdh.getCnxEolasAllow());
    adh.setIsFacebookArtipole(editAdh.getIsFacebookArtipole());
    adh.setApe(editAdh.getApe());
    adh.setSiren(editAdh.getSiren());
    adh.setSiret(editAdh.getSiret());
    adh.setNumRepMetier(editAdh.getNumRepMetier());
    adh.setRcsRm(editAdh.getRcsRm());
    adh.setRcsCommune(editAdh.getRcsCommune());
    adh.setRmCommune(editAdh.getRmCommune());
    adh.setAgence(editAdh.getAgence());
    adh.setDateClotureExe(editAdh.getDateClotureExe());
    adh.setTournee(editAdh.getTournee());
    adh.setOutilDechargement(editAdh.getIsOutilDechargement());
    adh.setEtat(editAdh.getEtat());
    adh.setAdherentType(editAdh.getAdherentType());
    adh.setCompteType(editAdh.getCompteType());
    adh.setDescription_activite(editAdh.getDescription_activite());
    adh.setDescription_entreprise(editAdh.getDescription_entreprise());
    return adh;
  }

  private AdherentContactRole editToContact(final EditAdherentContact adhContactEditable) {
    final AdherentContactRole contact = new AdherentContactRole();
    String fileName = (adhContactEditable.getPhotoImg() == null) ? "" : adhContactEditable.getPhotoImg();
    contact.setAdherent(this.service.loadAdherent(adhContactEditable.getAdherentId()));
    contact.setCivilite(adhContactEditable.getCivilite());
    contact.setFonction(adhContactEditable.getFonction());
    contact.setFixe(adhContactEditable.getFixe());
    contact.setId(adhContactEditable.getId());
    contact.setIsMailingAdministratif(adhContactEditable.getIsMailingAdministratif());
    contact.setIsMailingCommerce(adhContactEditable.getIsMailingCommercial());
    contact.setIsMailingCompta(adhContactEditable.getIsMailingComptabilite());
    contact.setIsMailingDirigeant(adhContactEditable.getIsMailingDirigeant());
    contact.setMail(adhContactEditable.getMail());
    contact.setMobile(adhContactEditable.getMobile());
    contact.setNom(adhContactEditable.getNom());
    contact.setDateNaissance(adhContactEditable.getDateNaissance());
    try {
      if (adhContactEditable.getFile() != null && adhContactEditable.getFile().getOriginalFilename() != "") {
        final String extension = adhContactEditable.getFile().getOriginalFilename().substring(adhContactEditable.getFile().getOriginalFilename().length() - 3);
        fileName = "data:image/" + extension + ";base64," + Base64.encodeBase64String(adhContactEditable.getFile().getBytes());
      }
    } catch (IOException ex) {
    }
    contact.setPhoto(fileName.getBytes());
    contact.setPrenom(adhContactEditable.getPrenom());
    contact.setIsAccessEOLAS(adhContactEditable.getIsAccessEOLAS());
    contact.setLoginEOLAS(adhContactEditable.getLoginEOLAS());
    contact.setPassEOLAS(adhContactEditable.getPassEOLAS());
    contact.setRoleSalarieEOLASId(adhContactEditable.getRoleSalarieEOLASId());
    contact.setDateNaissance(adhContactEditable.getDateNaissance());
    return contact;
  }

  private AdherentContactComptable editToContactComptable(final EditContactComptableAdherent contactEditable) {
    final AdherentContactComptable contact = new AdherentContactComptable();
    contact.setId(contactEditable.getId());
    contact.setAdherentId((int) contactEditable.getAdherentId());
    contact.setCabinet(contactEditable.getCabinet());
    contact.setCivilite(contactEditable.getCivilite());
    contact.setFixe(contactEditable.getFixe());
    contact.setMail(contactEditable.getMail());
    contact.setMobile(contactEditable.getMobile());
    contact.setNom(contactEditable.getNom());
    contact.setPrenom(contactEditable.getPrenom());
    return contact;
  }

  private List<AdherentContactRole> editToContactList(final List<EditAdherentContact> adhContactEditable) {
    final List<AdherentContactRole> contacts = new ArrayList<AdherentContactRole>();
    adhContactEditable.stream().forEach(e -> contacts.add(this.editToContact(e)));
    return contacts;
  }

  private PageType extractPageType(final String servletPath) {
    switch (servletPath) {
      case "editActiviteAdh": {
        return PageType.ADHERENT_ACTIVITE;
      }
      case "editArtipoleAdh": {
        return PageType.ADHERENT_ARTIPOLE;
      }
      case "editAdministratifAdh": {
        return PageType.ADHERENT_ADMINISTRATIF;
      }
      case "editExploitationAdh": {
        return PageType.ADHERENT_EXPLOITATION;
      }
      case "editInformatiqueAdh": {
        return PageType.ADHERENT_INFORMATIQUE;
      }
      case "editDetailAdh": {
        return PageType.ADHERENT_DETAIL;
      }
      case "editCRM": {
        return PageType.ADHERENT_CRM;
      }
      default: {
        return PageType.LIST_ADHERENT;
      }
    }
  }

  @RequestMapping(value = {"/edit/editAdherentContact"}, method = {RequestMethod.POST})
  public String modifieContact(@Valid @ModelAttribute("contactToEdit") final EditAdherentContactsForm editForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    final List<EditAdherentContact> adhContactEditable = (List<EditAdherentContact>) editForm.getAdherentContacts();
    final int adhId = adhContactEditable.get(0).getAdherentId();
    if (!pBindingResult.hasErrors()) {
      final List<AdherentContactRole> contacts = this.editToContactList(adhContactEditable);
      this.service.saveAdherentContacts((List) contacts);
      this.service.saveAdherentCommentaire(adhId, PageType.ADHERENT_DETAIL, editForm.getCommentaire());
      return "redirect:/adherentDetail?idAdh=" + adhId;
    }
    return this.editContact(adhId, pModel, request);
  }

  private String redirectOkPage(final PageType pageType, final Integer adhId) {
    String page = null;
    switch (pageType) {
      case ADHERENT_ACTIVITE: {
        page = "adherentActivite";
        break;
      }
      case ADHERENT_ADMINISTRATIF: {
        page = "adherentAdministratif";
        break;
      }
      case ADHERENT_ARTIPOLE: {
        page = "adherentArtipole";
        break;
      }
      case ADHERENT_DETAIL: {
        page = "adherentDetail";
        break;
      }
      case LOGISTIQUE_TOURNEE: {
        page = "adherentLogistique";
        break;
      }
      case ADHERENT_INFORMATIQUE: {
        page = "adherentInformatique";
        break;
      }
      case ADHERENT_CRM: {
        page = "adherentCRM";
        break;
      }
      case ADHERENT_PROFIL: {
        page = "adherentProfil";
        break;
      }
      default: {
        page = "adherentDetail";
        break;
      }
    }
    return "redirect:/" + page + "?idAdh=" + adhId;
  }

  @RequestMapping(value = {"/edit/supprimeContact"}, method = {RequestMethod.GET})
  public String supprimeAdherentContact(@RequestParam("adhId") final Integer adhId, @RequestParam("ctId") final Integer contactId, final ModelMap pModel, final HttpServletRequest request) {
    if (contactId != null) {
      this.service.supprimeAdherentContact(contactId);
      return "redirect:/adherentProfil?idAdh=" + adhId;
    }
    return this.editContact(adhId, pModel, request);
  }
}