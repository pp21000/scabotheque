package fr.scabois.scabotheque.controller.adherent.edit;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.adherent.AdherentActivite;
import fr.scabois.scabotheque.bean.adherent.AdherentContactComptable;
import fr.scabois.scabotheque.bean.adherent.AdherentContactRole;
import fr.scabois.scabotheque.bean.adherent.AdherentEtat;
import fr.scabois.scabotheque.bean.adherent.AdherentLogistique;
import fr.scabois.scabotheque.bean.adherent.AdherentMetier;
import fr.scabois.scabotheque.bean.adherent.AdherentSpecialite;
import fr.scabois.scabotheque.bean.adherent.AdherentSuiviVisite;
import fr.scabois.scabotheque.bean.adherent.AdherentType;
import fr.scabois.scabotheque.bean.adherent.CompteType;
import fr.scabois.scabotheque.bean.adherent.FormeJuridique;
import fr.scabois.scabotheque.bean.adherent.Pole;
import fr.scabois.scabotheque.bean.adherent.Role;
import fr.scabois.scabotheque.bean.adherent.Secteur;
import fr.scabois.scabotheque.bean.adherent.Tournee;
import fr.scabois.scabotheque.bean.artisanArtipole.Metier;
import fr.scabois.scabotheque.bean.artisanArtipole.Specialite;
import fr.scabois.scabotheque.bean.artisanArtipole.Travaux;
import fr.scabois.scabotheque.bean.commun.Activite;
import fr.scabois.scabotheque.bean.commun.Agence;
import fr.scabois.scabotheque.bean.commun.Ape;
import fr.scabois.scabotheque.enums.ImageType;
import fr.scabois.scabotheque.enums.NavType;
import fr.scabois.scabotheque.enums.PageType;
import fr.scabois.scabotheque.services.IServiceAdherent;
import fr.scabois.scabotheque.services.IServiceArtipole;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class EditAdhController {

//    private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);
  @Autowired
  private MessageSource messages;
  @Autowired
  private IServiceAdherent service;
  @Autowired
  private ContactController cttControler;
  @Autowired
  private IServiceArtipole serviceArtipole;

//  @RequestMapping(value = "/edit/addAdherentContact", method = RequestMethod.POST)
//  public String addContact(@Valid @ModelAttribute(value = "contactToAdd") final AddAdherentContactForm newContact,
//          final BindingResult pBindingResult, final ModelMap pModel, HttpServletRequest request) {
//
//    if (!pBindingResult.hasErrors()) {
//      service.createContactAdherent(editToContact(newContact.getContact()));
//      return "redirect:/adherentProfil?idAdh=" + newContact.getContact().getAdherentId();
//    }
//
//    return editContact(newContact.getContact().getAdherentId(), pModel, request);
//  }
  @RequestMapping(value = "/edit/addAdherentSuivi", method = RequestMethod.POST)
  public String addSuivi(@Valid @ModelAttribute(value = "suiviToAdd") final EditAdherentSuiviVisiteForm newSuivi,
          final BindingResult pBindingResult, final ModelMap pModel, HttpServletRequest request) {

    if (!pBindingResult.hasErrors()) {
      service.createSuiviAdherent(editToSuivi(newSuivi.getSuiviVisiteAdh()));
      return "redirect:/adherentCRM?idAdh=" + newSuivi.getSuiviVisiteAdh().getAdherentId();
    }

    return editCRM(newSuivi.getSuiviVisiteAdh().getAdherentId(), pModel, request);
  }

  private void addSelectLists(final ModelMap pModel) {
    List<Agence> agences = service.loadAgences();
    List<Ape> codeApes = service.loadCodeApes();
    List<AdherentEtat> etats = service.loadEtats();
    List<AdherentType> adhTypes = service.loadAdherentTypes();
    List<CompteType> cptTypes = service.loadCompteTypes();
    List<FormeJuridique> formesJuridiques = service.loadFormesJuridiques();
    List<Pole> poles = service.loadPoles();
    List<Role> roles = service.loadRoles();
    List<Secteur> secteurs = service.loadSecteurs();
    List<Tournee> tournees = service.loadTournees();

    pModel.addAttribute("agenceList", agences);
    pModel.addAttribute("apeList", codeApes);
    pModel.addAttribute("etatList", etats);
    pModel.addAttribute("adhTypesList", adhTypes);
    pModel.addAttribute("compteTypeList", cptTypes);
    pModel.addAttribute("formJuridList", formesJuridiques);
    pModel.addAttribute("poleList", poles);
    pModel.addAttribute("roleList", roles);
    pModel.addAttribute("secteurList", secteurs);
    pModel.addAttribute("tourneeList", tournees);

  }

  public EditAdherent adhToEdit(Adherent adh) {
    final EditAdherent editableAdh = new EditAdherent();

    editableAdh.setAdresse(adh.getAdresse());
    editableAdh.setAdresseComplement(adh.getAdresseComplement());
    editableAdh.setAdherentType(adh.getAdherentType());
    editableAdh.setAgence(adh.getAgence());
    editableAdh.setApe(adh.getApe());
    editableAdh.setCnxEolasAllow(adh.getCnxEolasAllow());
    editableAdh.setCode(adh.getCode());
    editableAdh.setCodeERP(adh.getCodeERP());
    editableAdh.setCodeERPParent(adh.getCodeERPParent());
    editableAdh.setCompteType(adh.getCompteType());
    editableAdh.setCommune(adh.getCommune());
//    editableAdh.setContactComptable(adh.getContactComptable());
    editableAdh.setDateClotureExe(adh.getDateClotureExe());
    editableAdh.setDateEntree(adh.getDateEntree());
    editableAdh.setDateSortie(adh.getDateSortie());
    editableAdh.setDenomination(adh.getDenomination());
    editableAdh.setEtat(adh.getEtat());
    editableAdh.setFormationDirigeant(adh.getFormationDirigeant());
    editableAdh.setFormeJuridique(adh.getFormeJuridique());
    editableAdh.setIsArtipole(adh.getIsArtipole());
    editableAdh.setIsCharteArtipole(adh.getIsCharteArtipole());
    editableAdh.setIsFacebookArtipole(adh.getIsFacebookArtipole());
    editableAdh.setIsFlocageArtipole(adh.getIsFlocageArtipole());
    editableAdh.setIsOutilDechargement(adh.getIsOutilDechargement());
    editableAdh.setIsWebArtipole(adh.getIsWebArtipole());
    editableAdh.setLatitude(adh.getLatitude());
    editableAdh.setLibelle(adh.getLibelle());
    editableAdh.setLatitude(adh.getLatitude());
    editableAdh.setLongitude(adh.getLongitude());
    editableAdh.setNumRepMetier(adh.getNumRepMetier());
    editableAdh.setPole(adh.getPole());
    editableAdh.setPhoto(adh.getPhotoImg());
    editableAdh.setRcsCommune(adh.getRcsCommune());
    editableAdh.setRcsRm(adh.getRcsRm());
    editableAdh.setRmCommune(adh.getRmCommune());
    editableAdh.setRole(adh.getRole());
    editableAdh.setSecteur(adh.getSecteur());
    editableAdh.setSiren(adh.getSiren());
    editableAdh.setSiret(adh.getSiret());
    editableAdh.setTournee(adh.getTournee());
    editableAdh.setIsWebArtipole(adh.getIsWebArtipole());
    return editableAdh;
  }

  private EditContactComptableAdherent contactComptableAdhToEdit(AdherentContactComptable contactCpt) {
    EditContactComptableAdherent editable = new EditContactComptableAdherent();

    editable.setId(contactCpt.getId());
    editable.setAdherentId(contactCpt.getAdherentId());
    editable.setCabinet(contactCpt.getCabinet());
    editable.setCivilite(contactCpt.getCivilite());
    editable.setFixe(contactCpt.getFixe());
    editable.setMail(contactCpt.getMail());
    editable.setMobile(contactCpt.getMobile());
    editable.setNom(contactCpt.getNom());
    editable.setPrenom(contactCpt.getPrenom());

    return editable;
  }

  private List<EditAdherentContact> contactToEdit(List<AdherentContactRole> contacts) {
    final List<EditAdherentContact> ret = new ArrayList<>();

    contacts.stream().forEach(c -> {
      EditAdherentContact edit = new EditAdherentContact();
      // si il exist, il faut le rendre editable
      edit.setAdherentId(c.getAdherent().getId());
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
      edit.setContactFonctionId(c.getFonction().getId());
      edit.setIsAccessEOLAS(c.getIsAccessEOLAS());
      edit.setLoginEOLAS(c.getLoginEOLAS());
      edit.setPassEOLAS(c.getPassEOLAS());
//            edit.setRoleSalarieEOLAS(c.getRoleSalarieEOLAS());
      edit.setRoleSalarieEOLASId(c.getRoleSalarieEOLASId());
      edit.setDateNaissance(c.getDateNaissance());

      ret.add(edit);
    });
    return ret;

  }

  @RequestMapping(value = {"/edit/editMetiersAdherent"}, method = {RequestMethod.GET})
  public String editAdherentMetiers(@RequestParam("idAdh") final int idAdh, final ModelMap pModel, final HttpServletRequest request) {
    final Adherent adh = this.service.loadAdherent(idAdh);
    final List<Metier> metiers = (List<Metier>) this.serviceArtipole.loadMetiers();
    final List<AdherentMetier> metiersAdh = (List<AdherentMetier>) this.service.loadAdherentMetiers(idAdh);
    if (pModel.get("editForm") == null) {
      final EditAdherentMetiersForm editForm = new EditAdherentMetiersForm((List) metiersAdh, (List) metiers, idAdh);
      pModel.addAttribute("editForm", editForm);
    } else {
      pModel.addAttribute("editForm", pModel.get("editForm"));
    }
    pModel.addAttribute("adherent", adh);
    pModel.addAttribute("metiers", metiers);
    pModel.addAttribute("adherentMetiers", metiersAdh);
    pModel.addAttribute("navType", NavType.ADHERENT);
    pModel.addAttribute("pageType", PageType.ADHERENT_METIERS);
    return "editMetiersAdherent";
  }

  @RequestMapping(value = {"/edit/editMetiersAdherent/{idAdh}"}, method = {RequestMethod.POST})
  public String modifieMetiersAdh(@Valid @ModelAttribute("editForm") final EditAdherentMetiersForm editForm, @PathVariable final int idAdh, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.saveAdherentMetiers(idAdh, editForm.getAdherentMetiers());
      return "redirect:/adherentProfil?idAdh=" + idAdh;
    }
    return this.editAdherentMetiers(idAdh, pModel, request);
  }

  @RequestMapping(value = {"/edit/editSpecialitesAdherent"}, method = {RequestMethod.GET})
  public String editAdherentSpecialites(@RequestParam("idAdh") final int idAdh, final ModelMap pModel, final HttpServletRequest request) {
    final Adherent adh = this.service.loadAdherent(idAdh);
    final List<Travaux> travauxList = this.serviceArtipole.loadTravauxList();
    final List<Specialite> specialites = this.serviceArtipole.loadSpecialites();
    final List<AdherentSpecialite> specialitesAdh = this.service.loadAdherentSpecialites(idAdh);
    if (pModel.get("editForm") == null) {
      final EditAdherentSpecialitesForm editForm = new EditAdherentSpecialitesForm(specialitesAdh, specialites, idAdh);
      pModel.addAttribute("editForm", editForm);
    } else {
      pModel.addAttribute("editForm", pModel.get("editForm"));
    }
    pModel.addAttribute("adherent", adh);
    pModel.addAttribute("travaux", travauxList);
    pModel.addAttribute("specialites", specialites);
    pModel.addAttribute("adherentSpecialites", specialitesAdh);
    pModel.addAttribute("navType", NavType.ADHERENT);
    pModel.addAttribute("pageType", PageType.ADHERENT_METIERS);
    return "editSpecialitesAdherent";
  }

  @RequestMapping(value = {"/edit/editSpecialitesAdherent/{idAdh}"}, method = {RequestMethod.POST})
  public String modifieSpecialitesAdh(@Valid @ModelAttribute("editForm") final EditAdherentSpecialitesForm editForm, @PathVariable final int idAdh, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    if (!pBindingResult.hasErrors()) {
      this.service.saveAdherentSpecialites(idAdh, editForm.getAdherentSpecialites());
      return "redirect:/adherentProfil?idAdh=" + idAdh;
    }
    return this.editAdherentSpecialites(idAdh, pModel, request);
  }

  @RequestMapping(value = {"/edit/editLivraisonAdh"}, method = {RequestMethod.GET})
  public String editAdherentLogistique(@RequestParam("idAdh") final int idAdh, final ModelMap pModel, final HttpServletRequest request) {
    final Adherent adh = this.service.loadAdherent(idAdh);
    final AdherentLogistique logistiqueAdh = this.service.loadAdherentLogistique(idAdh);
    final EditAdherentLogistiqueForm editForm = new EditAdherentLogistiqueForm(logistiqueAdh);
    final List<AdherentContactRole> contacts = (List<AdherentContactRole>) this.service.loadAdherentContact(idAdh);
    if (pModel.get("editForm") == null) {
      pModel.addAttribute("editForm", editForm);
    } else {
      pModel.addAttribute("editForm", pModel.get("editForm"));
    }
    pModel.addAttribute("adherent", adh);
    pModel.addAttribute("contacts", contacts);
    pModel.addAttribute("logistiqueAdh", logistiqueAdh);
    pModel.addAttribute("navType", NavType.ADHERENT);
    pModel.addAttribute("pageType", PageType.LIST_ADHERENT);
    return "editLivraisonAdh";
  }

  @RequestMapping(value = {"/edit/editLivraisonAdh"}, method = {RequestMethod.POST})
  public String saveAdherentLogistique(@Valid @ModelAttribute("editForm") final EditAdherentLogistiqueForm editForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) {
    final AdherentLogistique adhLog = editForm.getLogistiqueAdh();
    if (!pBindingResult.hasErrors()) {
      this.service.saveAdherentLogistique(adhLog);
      return "redirect:/adherentProfil?idAdh=" + adhLog.getAdherentId();
    }
    return this.editAdherentLogistique(adhLog.getAdherentId(), pModel, request);
  }

  private void submitFile(final int adhId, final MultipartFile file, final ImageType type) throws Exception {
    if (file.getSize() == 0L) {
      return;
    }
    final String extension = file.getOriginalFilename().substring(file.getOriginalFilename().length() - 3);
    final String fileName = "data:image/" + extension + ";base64," + Base64.encodeBase64String(file.getBytes());
    if (adhId != 0) {
      if (type == ImageType.ADHERENT_PHOTO) {
        this.service.setAdherentImage(adhId, fileName.getBytes());
      } else {
        this.service.setAdherentLogo(adhId, fileName.getBytes());
      }
    }
  }

  @RequestMapping(value = {"/edit/editIdentiteAdh", "/edit/editArtipoleAdh", "/edit/editAdministratifAdh", "/edit/editExploitationAdh", "/edit/editInformatiqueAdh"}, method = RequestMethod.GET)
  public String editAdherent(@RequestParam(value = "idAdh") final int idAdh, final ModelMap pModel, HttpServletRequest request) {

    addSelectLists(pModel);

    if (pModel.get("adhToEdit") == null) {
      final Adherent adh = service.loadAdherent(idAdh);
      final EditAdherentForm editAdhForm = new EditAdherentForm(adh);
      editAdhForm.setCommentaire(service.loadAdherentCommentaire(idAdh, extractPageType(request.getServletPath().substring(6))));
      pModel.addAttribute("editForm", editAdhForm);
    } else {
      pModel.addAttribute("editForm", pModel.get("adhToEdit"));
    }
    pModel.addAttribute("navType", NavType.ADHERENT);
    pModel.addAttribute("pageType", PageType.LIST_ADHERENT);

    // Implique que le nom des Tiles soit correctement alimenté
    return request.getServletPath().substring(6);
  }

  @RequestMapping(value = "/edit/editActiviteAdh", method = RequestMethod.GET)
  public String editAdherentActivite(@RequestParam(value = "idAdh") final int idAdh, final ModelMap pModel,
          HttpServletRequest request) {

    Adherent adh = service.loadAdherent(idAdh);
    List<Activite> activitees = service.loadActivites();
    List<AdherentActivite> activiteesAdh = service.loadActivitesAdherent(idAdh);
    EditAdherentActivitesForm editForm = new EditAdherentActivitesForm();
    List<EditAdherentActivite> editList = new ArrayList<>();

    editForm.setCommentaire(service.loadAdherentCommentaire(idAdh, PageType.ADHERENT_ACTIVITE));

    // mise en forme des activitèes Adherent en ajoutant les activitées non
    // renseignés
    if (pModel.get("editForm") == null) {
      activitees.stream().forEach(a -> {
        EditAdherentActivite editActiviteAdh = new EditAdherentActivite();

        editActiviteAdh.setActiviteId(a.getId());
        editActiviteAdh.setActiviteLibelle(a.getLibelle());
        editActiviteAdh.setAdherentId(adh.getId());
        Optional<AdherentActivite> adhActivite = activiteesAdh.stream()
                .filter(aa -> aa.getActivite().getId().equals(a.getId())).findFirst();

        if (adhActivite.isPresent()) {
          editActiviteAdh.setCommentaire(adhActivite.get().getCommentaire());
          editActiviteAdh.setPourcentage(adhActivite.get().getPourcentage());
          editActiviteAdh.setId(adhActivite.get().getId());
        }
        editList.add(editActiviteAdh);
      });
      pModel.addAttribute("editForm", editForm);
    } else {
      pModel.addAttribute("editForm", pModel.get("editForm"));
    }
    editForm.setActivitesAdh(editList);

    pModel.addAttribute("adherent", adh);
    pModel.addAttribute("activitees", activitees);
    pModel.addAttribute("navType", NavType.ADHERENT);
    pModel.addAttribute("pageType", PageType.LIST_ADHERENT);

    return "editActiviteAdh";

  }

  @RequestMapping(value = "/edit/editCRMAdh", method = RequestMethod.GET)
  public String editCRM(@RequestParam(value = "idSuivi") final int idSuivi, final ModelMap pModel,
          HttpServletRequest request) {

    addSelectLists(pModel);
    AdherentSuiviVisite suivi = service.loadAdherentSuiviVisite(idSuivi);
    Adherent adh = service.loadAdherent(suivi.getAdherentId());

    EditAdherentSuiviVisiteForm editForm = new EditAdherentSuiviVisiteForm();
    editForm.setSuiviVisiteAdh(suiviToEdit(suivi));

    pModel.addAttribute("adherent", adh);
    pModel.addAttribute("editForm", editForm);
    pModel.addAttribute("pageType", PageType.LIST_ADHERENT);

    return "editCRMAdh";
  }

  public Adherent editToAdh(EditAdherent editAdh) {
    final Adherent adh = new Adherent();

    adh.setApe(editAdh.getApe());
    adh.setAdresse(editAdh.getAdresse());
    adh.setAdresseComplement(editAdh.getAdresseComplement());
    adh.setAdherentType(editAdh.getAdherentType());
    adh.setAgence(editAdh.getAgence());
    adh.setCnxEolasAllow(editAdh.getCnxEolasAllow());
    adh.setCode(editAdh.getCode());
    adh.setCodeERP(editAdh.getCodeERP());
    adh.setCodeERPParent(editAdh.getCodeERPParent());
    adh.setCompteType(editAdh.getCompteType());
    adh.setCommune(editAdh.getCommune());
//    adh.setContactComptable(editAdh.getContactComptable());
    adh.setDateClotureExe(editAdh.getDateClotureExe());
    adh.setDateEntree(editAdh.getDateEntree());
    adh.setDateSortie(editAdh.getDateSortie());
    adh.setDenomination(editAdh.getDenomination());
    adh.setDescription_activite(editAdh.getDescription_activite());
    adh.setDescription_entreprise(editAdh.getDescription_entreprise());
    adh.setEtat(editAdh.getEtat());
    adh.setFacebook(editAdh.getFacebook());
    adh.setFormationDirigeant(editAdh.getFormationDirigeant());
    adh.setFormeJuridique(editAdh.getFormeJuridique());
    adh.setId(editAdh.getId());
    adh.setInstagram(editAdh.getInstagram());
    adh.setIsArtipole(editAdh.getIsArtipole());
    adh.setIsCharteArtipole(editAdh.getIsCharteArtipole());
    adh.setIsFacebookArtipole(editAdh.getIsFacebookArtipole());
    adh.setIsFlocageArtipole(editAdh.getIsFlocageArtipole());
    adh.setIsOutilDechargement(editAdh.getIsOutilDechargement());
    adh.setIsWebArtipole(editAdh.getIsWebArtipole());
    adh.setLibelle(editAdh.getLibelle());
    adh.setLinkedin(editAdh.getLinkedin());
    adh.setLogo(editAdh.getLogo().getBytes());
    adh.setLatitude(editAdh.getLatitude());
    adh.setLongitude(editAdh.getLongitude());
    adh.setMail(editAdh.getMail());
    adh.setNumRepMetier(editAdh.getNumRepMetier());
    adh.setPole(editAdh.getPole());
    adh.setPhoto(editAdh.getPhoto().getBytes());
    adh.setPinterest(editAdh.getPinterest());
    adh.setRole(editAdh.getRole());
    adh.setRcsCommune(editAdh.getRcsCommune());
    adh.setRcsRm(editAdh.getRcsRm());
    adh.setRmCommune(editAdh.getRmCommune());
    adh.setSecteur(editAdh.getSecteur());
    adh.setSiren(editAdh.getSiren());
    adh.setSiret(editAdh.getSiret());
    adh.setSiteWeb(editAdh.getSiteWeb());
    adh.setTelephone(editAdh.getTelephone());
    adh.setTournee(editAdh.getTournee());
    adh.setYoutube(editAdh.getYoutube());
    return adh;
  }

  private AdherentContactRole editToContact(EditAdherentContact adhContactEditable) {
    AdherentContactRole contact = new AdherentContactRole();

    String fileName = adhContactEditable.getPhotoImg() == null ? "" : adhContactEditable.getPhotoImg();

    contact.setAdherent(service.loadAdherent(adhContactEditable.getAdherentId()));
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
//        contact.setRoleSalarieEOLASId(adhContactEditable.getRoleSalarieEOLASId());
    contact.setDateNaissance(adhContactEditable.getDateNaissance());
    try {
      if (adhContactEditable.getFile() != null) {
        if (adhContactEditable.getFile().getOriginalFilename() != "") {
          String extension = adhContactEditable.getFile().getOriginalFilename()
                  .substring(adhContactEditable.getFile().getOriginalFilename().length() - 3);
          fileName = "data:image/" + extension + ";base64,"
                  + Base64.encodeBase64String(adhContactEditable.getFile().getBytes());
        }
      }
    } catch (IOException e) {
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

  private AdherentContactComptable editToContactComptable(EditContactComptableAdherent contactEditable) {
    AdherentContactComptable contact = new AdherentContactComptable();

    contact.setId(contactEditable.getId());
    contact.setAdherentId(contactEditable.getAdherentId());
    contact.setCabinet(contactEditable.getCabinet());
    contact.setCivilite(contactEditable.getCivilite());
    contact.setFixe(contactEditable.getFixe());
    contact.setMail(contactEditable.getMail());
    contact.setMobile(contactEditable.getMobile());
    contact.setNom(contactEditable.getNom());
    contact.setPrenom(contactEditable.getPrenom());

    return contact;
  }

  private List<AdherentContactRole> editToContactList(List<EditAdherentContact> adhContactEditable) {
    List<AdherentContactRole> contacts = new ArrayList<>();

    adhContactEditable.stream().forEach(e -> {
      contacts.add(editToContact(e));
    });
    return contacts;
  }

  private AdherentSuiviVisite editToSuivi(EditAdherentSuiviVisite adhSuiviEditable) {
    AdherentSuiviVisite suivi = new AdherentSuiviVisite();

    suivi.setId(adhSuiviEditable.getId());
    suivi.setAdherentId(adhSuiviEditable.getAdherentId());
    suivi.setDateCommentaire(adhSuiviEditable.getDateCommentaire());
    suivi.setCommentaireString(adhSuiviEditable.getCommentaire());

    return suivi;
  }

  private PageType extractPageType(String servletPath) {

    switch (servletPath) {
      case "editActiviteAdh":
        return PageType.ADHERENT_ACTIVITE;
      case "editArtipoleAdh":
        return PageType.ADHERENT_ARTIPOLE;
      case "editAdministratifAdh":
        return PageType.ADHERENT_ADMINISTRATIF;
      case "editExploitationAdh":
        return PageType.ADHERENT_EXPLOITATION;
      case "editInformatiqueAdh":
        return PageType.ADHERENT_INFORMATIQUE;
      case "editDetailAdh":
        return PageType.ADHERENT_DETAIL;
      case "editCRM":
        return PageType.ADHERENT_CRM;
      default:
        return PageType.LIST_ADHERENT;
    }
  }

  @RequestMapping(value = "/edit/editActiviteAdh", method = RequestMethod.POST)
  public String modifieActiviteAdh(
          @Valid @ModelAttribute(value = "editForm") final EditAdherentActivitesForm editForm,
          final BindingResult pBindingResult, final ModelMap pModel, HttpServletRequest request) {

    int adhId = editForm.getActivitesAdh().get(0).getAdherentId();

    // validation de la somme des pourcentage
    if (editForm.getActivitesAdh().stream().mapToInt(a -> a.getPourcentage() == null ? 0 : a.getPourcentage()).sum() != 100) {
      pBindingResult.addError(new FieldError("messageErreur", "messageErreur", "La somme des pourcentages doit être de 100% !"));
    }

    if (!pBindingResult.hasErrors()) {
      service.saveAdherentCommentaire(adhId, PageType.ADHERENT_ACTIVITE, editForm.getCommentaire());

      List<AdherentActivite> activitesAdh = new ArrayList<>();
      editForm.getActivitesAdh().stream().forEach(a -> {
        if (a.getPourcentage() != null) {
          AdherentActivite aa = new AdherentActivite();
          aa.setActivite(service.loadActivite(a.getActiviteId()));
          aa.setAdherent(service.loadAdherent(a.getAdherentId()));
          aa.setCommentaire(a.getCommentaire());
          aa.setPourcentage(a.getPourcentage());

          activitesAdh.add(aa);
        }
      });

      service.saveActivitesAdherent(adhId, activitesAdh);
      return redirectOkPage(PageType.ADHERENT_ACTIVITE, adhId);
    }

    return editAdherentActivite(adhId, pModel, request);
  }

  @RequestMapping(value = "/edit/editContactComptableAdh", method = RequestMethod.POST)
  public String modifieContactCptAdh(@Valid @ModelAttribute(value = "adhContactComptable") final EditContactComptableAdherentForm editForm,
          final BindingResult pBindingResult, final ModelMap pModel, HttpServletRequest request) {

    EditContactComptableAdherent contactEditable = editForm.getContactComptableAdherent();
    AdherentContactComptable contact = editToContactComptable(contactEditable);

    if (!pBindingResult.hasErrors()) {
      service.saveContactComptableAdherent(contact);
      return redirectOkPage(PageType.ADHERENT_PROFIL, contact.getAdherentId());
    }
    final Adherent adh = this.service.loadAdherent(editForm.getContactComptableAdherent().getAdherentId());
    pModel.addAttribute("adherent", adh);
    return editAdherent(editForm.getContactComptableAdherent().getAdherentId(), pModel, request);

  }

  @RequestMapping(value = {"/edit/editArtipoleAdh", "/edit/editAdministratifAdh", "/edit/editExploitationAdh"}, method = RequestMethod.POST)
  public String modifieAdh(@Valid @ModelAttribute(value = "adhToEdit") final EditAdherentForm editForm, final BindingResult pBindingResult, final ModelMap pModel, HttpServletRequest request) {

    EditAdherent adhEditable = editForm.getEditAdherent();
    Adherent adh = editToAdh(adhEditable);

    if (adh.getCommune().getId() == null) {
      pBindingResult.addError(new FieldError("commune", "adherent.commune", messages.getMessage("modification.notempty", null, Locale.FRANCE)));
    }
    if (adh.getEtat().getId() == 2 && adh.getDateSortie() == null) {
      pBindingResult.addError(new FieldError("dateSortie", "adherent.dateSortie", messages.getMessage("modification.notempty", null, Locale.FRANCE)));
    }

    if (!pBindingResult.hasErrors()) {
      service.saveAdherentCommentaire(adh.getId(), extractPageType(request.getServletPath().substring(6)), editForm.getCommentaire());
      service.saveAdherent(adh);
      //return redirectOkPage(extractPageType(request.getServletPath().substring(6)), adh.getId());
      return redirectOkPage(PageType.ADHERENT_PROFIL, adh.getId());
    }
    return editAdherent(editForm.getEditAdherent().getId(), pModel, request);
  }

  @RequestMapping(value = {"/edit/editIdentiteAdh"}, method = {RequestMethod.POST})
  public String modifieIdentiteAdh(@Valid @ModelAttribute("adhToEdit") final EditAdherentForm editForm, final BindingResult pBindingResult, final ModelMap pModel, final HttpServletRequest request) throws Exception {
    final EditAdherent adhEditable = editForm.getEditAdherent();
    final Adherent adh = this.editToAdh(adhEditable);
    this.submitFile(adh.getId(), adhEditable.getFilePhoto(), ImageType.ADHERENT_PHOTO);
    this.submitFile(adh.getId(), adhEditable.getFileLogo(), ImageType.ADHERENT_LOGO);
    if (adh.getCommune().getId() == null) {
      pBindingResult.addError((ObjectError) new FieldError("commune", "adherent.commune", this.messages.getMessage("modification.notempty", (Object[]) null, Locale.FRANCE)));
    }
    if (adh.getEtat().getId() == 2 && adh.getDateSortie() == null) {
      pBindingResult.addError((ObjectError) new FieldError("dateSortie", "adherent.dateSortie", this.messages.getMessage("modification.notempty", (Object[]) null, Locale.FRANCE)));
    }
    if (!pBindingResult.hasErrors()) {
      this.service.saveAdherentCommentaire((int) adh.getId(), this.extractPageType(request.getServletPath().substring(6)), editForm.getCommentaire());
      this.service.saveAdherent(adh);
      return "redirect:/adherentProfil?idAdh=" + adh.getId();
    }
    return this.editAdherent(editForm.getEditAdherent().getId(), pModel, request);
  }

  @RequestMapping(value = "/edit/editInformatiqueAdh", method = RequestMethod.POST)
  public String modifieInformatiqueAdh(@Valid
          @ModelAttribute(value = "editForm")
          final EditAdherentActivitesForm editForm,
          final BindingResult pBindingResult, final ModelMap pModel, HttpServletRequest request) {

    int adhId = editForm.getActivitesAdh().get(0).getAdherentId();

    if (!pBindingResult.hasErrors()) {
      service.saveAdherentCommentaire(adhId, PageType.ADHERENT_INFORMATIQUE, editForm.getCommentaire());
//      service.saveInformatiqueAdherent(adhId, );
      return redirectOkPage(PageType.ADHERENT_INFORMATIQUE, adhId);
    }

    return cttControler.editContact(adhId, pModel, request);
  }

  @RequestMapping(value = "/edit/editCRMAdh", method = RequestMethod.POST)
  public String modifieCRM(@Valid
          @ModelAttribute(value = "editForm")
          final EditAdherentSuiviVisiteForm editForm,
          final BindingResult pBindingResult, final ModelMap pModel, HttpServletRequest request) {

    int adhId = editForm.getSuiviVisiteAdh().getAdherentId();

    if (!pBindingResult.hasErrors()) {
      service.saveAdherentSuiviVisite(editToSuivi(editForm.getSuiviVisiteAdh()));
      return redirectOkPage(PageType.ADHERENT_CRM, adhId);
    }

    return editCRM(editForm.getSuiviVisiteAdh().getId(), pModel, request);
  }

  private String redirectOkPage(PageType pageType, Integer adhId) {
    String page;

    switch (pageType) {
      case ADHERENT_ACTIVITE:
        page = "adherentActivite";
        break;
      case ADHERENT_ADMINISTRATIF:
        page = "adherentAdministratif";
        break;
      case ADHERENT_ARTIPOLE:
        page = "adherentArtipole";
        break;
      case ADHERENT_DETAIL:
        page = "adherentDetail";
        break;
      case ADHERENT_EXPLOITATION:
        page = "adherentExploitation";
        break;
      case ADHERENT_INFORMATIQUE:
        page = "adherentInformatique";
        break;
      case ADHERENT_CRM:
        page = "adherentCRM";
        break;
      default:
        page = "adherentProfil";
        break;
    }
    return "redirect:/" + page + "?idAdh=" + adhId;
  }

  private EditAdherentSuiviVisite suiviToEdit(AdherentSuiviVisite adhSuivi) {
    EditAdherentSuiviVisite suiviEditable = new EditAdherentSuiviVisite();

    suiviEditable.setId(adhSuivi.getId());
    suiviEditable.setAdherentId(adhSuivi.getAdherentId());
    suiviEditable.setDateCommentaire(adhSuivi.getDateCommentaire());
    suiviEditable.setCommentaire(adhSuivi.getCommentaireString());

    return suiviEditable;
  }

//  @RequestMapping(value = "/edit/supprimeContact", method = RequestMethod.GET)
//  public String supprimeAdherentContact(@RequestParam(value = "adhId") final Integer adhId,
//          @RequestParam(value = "ctId") final Integer contactId, final ModelMap pModel, HttpServletRequest request) {
//
//    if (contactId != null) {
//      service.supprimeAdherentContact(contactId);
//    }
//
//    return editContact(adhId, pModel, request);
//  }
}
