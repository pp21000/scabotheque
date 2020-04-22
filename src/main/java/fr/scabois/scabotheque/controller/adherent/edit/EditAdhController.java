package fr.scabois.scabotheque.controller.adherent.edit;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.adherent.AdherentActivite;
import fr.scabois.scabotheque.bean.adherent.AdherentContactRole;
import fr.scabois.scabotheque.bean.adherent.AdherentType;
import fr.scabois.scabotheque.bean.adherent.CompteType;
import fr.scabois.scabotheque.bean.adherent.AdherentEtat;
import fr.scabois.scabotheque.bean.adherent.FormeJuridique;
import fr.scabois.scabotheque.bean.adherent.Pole;
import fr.scabois.scabotheque.bean.adherent.Role;
import fr.scabois.scabotheque.bean.adherent.Secteur;
import fr.scabois.scabotheque.bean.adherent.Tournee;
import fr.scabois.scabotheque.bean.commun.Activite;
import fr.scabois.scabotheque.bean.commun.Agence;
import fr.scabois.scabotheque.bean.commun.Ape;
import fr.scabois.scabotheque.bean.commun.ContactFonction;
import fr.scabois.scabotheque.enums.PageType;
import fr.scabois.scabotheque.services.IServiceAdherent;

@Controller
public class EditAdhController {

//    private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);

    @Autowired
    private MessageSource messages;

    @Autowired
    private IServiceAdherent service;

    @RequestMapping(value = "/edit/addAdherentContact", method = RequestMethod.POST)
    public String addContact(@Valid @ModelAttribute(value = "contactToAdd") final AddAdherentContactForm newContact,
	    final BindingResult pBindingResult, final ModelMap pModel, HttpServletRequest request) {

	if (!pBindingResult.hasErrors()) {
	    service.createContactAdherent(editToContact(newContact.getContact()));
	    return "redirect:/adherentDetail?idAdh=" + newContact.getContact().getAdherentId();
	}

	return editContact(newContact.getContact().getAdherentId(), pModel, request);
    }

    private void addSelectLists(final ModelMap pModel) {
	List<Agence> agences = service.LoadAgences();
	List<Ape> codeApes = service.LoadCodeApes();
	List<AdherentEtat> etats = service.LoadEtats();
	List<AdherentType> adhTypes = service.LoadAdherentTypes();
	List<CompteType> cptTypes = service.LoadCompteTypes();
	List<FormeJuridique> formesJuridiques = service.LoadFormesJuridiques();
	List<Pole> poles = service.LoadPoles();
	List<Role> roles = service.LoadRoles();
	List<Secteur> secteurs = service.LoadSecteurs();
	List<Tournee> tournees = service.LoadTournees();

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

    private List<EditAdherentContact> contactToEdit(List<AdherentContactRole> contacts) {
	final List<EditAdherentContact> ret = new ArrayList<>();

	contacts.stream().forEach(c -> {
	    EditAdherentContact edit = new EditAdherentContact();
	    // si il exist,, il faut le rendre editable
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
	    edit.setNaissance(c.getNaissance());
	    edit.setPhotoImg(c.getPhotoImg());
	    edit.setPrenom(c.getPrenom());
	    edit.setFonction(c.getFonction());
	    edit.setContactFonctionId(c.getFonction().getId());
            edit.setIsAccessEOLAS(c.getIsAccessEOLAS());
            edit.setLoginEOLAS(c.getLoginEOLAS());
            edit.setPassEOLAS(c.getPassEOLAS());            
            
	    ret.add(edit);
	});
	return ret;

    }

    public EditAdherent adhToEdit(Adherent adh) {
	final EditAdherent editableAdh = new EditAdherent();

	editableAdh.setId(adh.getId());
	editableAdh.setCode(adh.getCode());
	editableAdh.setCodeERP(adh.getCodeERP());
	editableAdh.setCodeERPParent(adh.getCodeERPParent());
	editableAdh.setLibelle(adh.getLibelle());
	editableAdh.setDenomination(adh.getDenomination());
	editableAdh.setFormeJuridique(adh.getFormeJuridique());
	editableAdh.setDateEntree(adh.getDateEntree());
	editableAdh.setAdresse(adh.getAdresse());
	editableAdh.setAdresseComplement(adh.getAdresseComplement());
	editableAdh.setCommune(adh.getCommune());
	editableAdh.setPhoto(adh.getPhotoImg());
	editableAdh.setPole(adh.getPole());
	editableAdh.setRole(adh.getRole());
	editableAdh.setSecteur(adh.getSecteur());
	editableAdh.setIsArtipole(adh.getIsArtipole());
	editableAdh.setIsCharteArtipole(adh.getIsCharteArtipole());
	editableAdh.setIsFlocageArtipole(adh.getIsFlocageArtipole());
	editableAdh.setIsWebArtipole(adh.getIsWebArtipole());
	editableAdh.setIsFormationCommerce(adh.getIsFormationCommerce());
	editableAdh.setIsFacebookArtipole(adh.getIsFacebookArtipole());
	editableAdh.setApe(adh.getApe());
	editableAdh.setSiren(adh.getSiren());
	editableAdh.setSiret(adh.getSiret());
	editableAdh.setNumRepMetier(adh.getNumRepMetier());
	editableAdh.setRcsRm(adh.getRcsRm());
	editableAdh.setRcsCommune(adh.getRcsCommune());
	editableAdh.setRmCommune(adh.getRmCommune());
	editableAdh.setAgence(adh.getAgence());
	editableAdh.setDateClotureExe(adh.getDateClotureExe());
	editableAdh.setTournee(adh.getTournee());
	editableAdh.setIsOutilDechargement(adh.getIsOutilDechargement());
	editableAdh.setContactComptable(adh.getContactComptable());
	editableAdh.setEtat(adh.getEtat());
	editableAdh.setAdherentType(adh.getAdherentType());
	editableAdh.setCompteType(adh.getCompteType());

	return editableAdh;
    }

    @RequestMapping(value = { "/edit/editArtipoleAdh", "/edit/editAdministratifAdh", "/edit/editExploitationAdh",
	    "/edit/editArtipoleAdh", "/edit/editIdentiteAdh" }, method = RequestMethod.GET)
    public String editAdherent(@RequestParam(value = "idAdh") final int idAdh, final ModelMap pModel,
	    HttpServletRequest request) {

	addSelectLists(pModel);

	if (pModel.get("adhToEdit") == null) {

	    final Adherent adh = service.LoadAdherent(idAdh);
	    final EditAdherentForm editAdhForm = new EditAdherentForm();
	    editAdhForm.setCommentaire(
		    service.LoadAdherentCommentaire(idAdh, extractPageType(request.getServletPath().substring(6))));

	    // Rend l'adherent éditable (avec des validations test)
	    EditAdherent editableAdh = adhToEdit(adh);
	    editAdhForm.setAdherent(editableAdh);

	    pModel.addAttribute("adhToEdit", editAdhForm);
	} else {
	    pModel.addAttribute("adhToEdit", pModel.get("adhToEdit"));
	}

	pModel.addAttribute("pageType", PageType.LIST_ADHERENT);

	// Implique que le nom des Tiles soit correctement alimenté
	return request.getServletPath().substring(6);
    }

    @RequestMapping(value = "/edit/editActiviteAdh", method = RequestMethod.GET)
    public String editAdherentActivite(@RequestParam(value = "idAdh") final int idAdh, final ModelMap pModel,
	    HttpServletRequest request) {

	Adherent adh = service.LoadAdherent(idAdh);
	List<Activite> activitees = service.LoadActivites();
	List<AdherentActivite> activiteesAdh = service.LoadActivitesAdherent(idAdh);
	EditAdherentActivitesForm editForm = new EditAdherentActivitesForm();
	List<EditAdherentActivite> editList = new ArrayList<>();

	editForm.setCommentaire(service.LoadAdherentCommentaire(idAdh, PageType.ADHERENT_ACTIVITE));

	// mise en forme des activitées Adherent en ajoutant les activitées non
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

	return "editActiviteAdh";

    }

    @RequestMapping(value = "/edit/editAdherentContact", method = RequestMethod.GET)
    public String editContact(@RequestParam(value = "idAdh") final int idAdh, final ModelMap pModel,
	    HttpServletRequest request) {

	addSelectLists(pModel);

//	Passage par une map pour la civilité selection auto de la valeur
	Map<String, String> civilite = new HashMap<>();
	civilite.put("Mme", "Mme");
	civilite.put("Mr", "Mr");
	pModel.addAttribute("civilite", civilite);

	final Adherent adh = service.LoadAdherent(idAdh);
	final List<ContactFonction> contactFonctions = service.LoadContactFonctions();
	pModel.addAttribute("adherent", adh);
	pModel.addAttribute("contactFonctions", contactFonctions);

	if (pModel.get("contactToEdit") == null) {

	    final EditAdherentContactsForm editAdhContactsForm = new EditAdherentContactsForm();

	    editAdhContactsForm.setCommentaire(service.LoadAdherentCommentaire(idAdh, PageType.ADHERENT_DETAIL));
	    List<EditAdherentContact> editableAdhContacts = contactToEdit(adh.getContacts());
	    editAdhContactsForm.setAdherentContacts(editableAdhContacts);
	    pModel.addAttribute("contactToEdit", editAdhContactsForm);
	} else {
	    pModel.addAttribute("contactToEdit", pModel.get("contactToEdit"));
	}

	if (pModel.get("contactToAdd") == null) {

	    final AddAdherentContactForm addContactForm = new AddAdherentContactForm();

	    // Prépare la possibilité de créer un contact
	    EditAdherentContact addContact = new EditAdherentContact(); // adhToEdit(adh);
	    addContact.setAdherentId(idAdh);
	    addContactForm.setContact(addContact);
	    pModel.addAttribute("contactToAdd", addContactForm);

	} else {
	    pModel.addAttribute("contactToAdd", pModel.get("contactToAdd"));
	}

	pModel.addAttribute("pageType", PageType.LIST_ADHERENT);

	return "editContactAdh";
    }

    public Adherent editToAdh(EditAdherent editAdh) {
	final Adherent adh = new Adherent();

	adh.setId(editAdh.getId());
	adh.setCode(editAdh.getCode());
	adh.setCodeERP(editAdh.getCodeERP());
	adh.setCodeERPParent(editAdh.getCodeERPParent());
	adh.setLibelle(editAdh.getLibelle());
	adh.setDenomination(editAdh.getDenomination());
	adh.setFormeJuridique(editAdh.getFormeJuridique());
	adh.setDateEntree(editAdh.getDateEntree());
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
	adh.setIsFormationCommerce(editAdh.getIsFormationCommerce());
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
	adh.setContactComptable(editAdh.getContactComptable());
	adh.setEtat(editAdh.getEtat());
	adh.setAdherentType(editAdh.getAdherentType());
	adh.setCompteType(editAdh.getCompteType());

	return adh;
    }

    private AdherentContactRole editToContact(EditAdherentContact adhContactEditable) {
	AdherentContactRole contact = new AdherentContactRole();

	String fileName = adhContactEditable.getPhotoImg() == null ? "" : adhContactEditable.getPhotoImg();

	contact.setAdherent(service.LoadAdherent(adhContactEditable.getAdherentId()));
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
	contact.setNaissance(adhContactEditable.getNaissance());
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

	return contact;
    }

    private List<AdherentContactRole> editToContactList(List<EditAdherentContact> adhContactEditable) {
	List<AdherentContactRole> contacts = new ArrayList<>();

	adhContactEditable.stream().forEach(e -> {
	    contacts.add(editToContact(e));
	});

	return contacts;
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
//	case "editInformatiqueAdh":
//	    return PageType.ADHERENT_INFORMATIQUE;
	case "editDetailAdh":
	    return PageType.ADHERENT_DETAIL;
	default:
	    return PageType.LIST_ADHERENT;
	}
    }

    @RequestMapping(value = "/edit/editActiviteAdh", method = RequestMethod.POST)
    public String modifieActiviteAdh(
	    @Valid @ModelAttribute(value = "editForm") final EditAdherentActivitesForm editForm,
	    final BindingResult pBindingResult, final ModelMap pModel, HttpServletRequest request) {

	int adhId = editForm.getActivitesAdh().get(0).getAdherentId();

	if (!pBindingResult.hasErrors()) {
	    service.saveAdherentCommentaire(adhId, PageType.ADHERENT_ACTIVITE, editForm.getCommentaire());

	    List<AdherentActivite> activitesAdh = new ArrayList<>();
	    editForm.getActivitesAdh().stream().forEach(a -> {
		if (a.getPourcentage() != null) {
		    AdherentActivite aa = new AdherentActivite();
		    aa.setActivite(service.LoadActivite(a.getActiviteId()));
		    aa.setAdherent(service.LoadAdherent(a.getAdherentId()));
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
                            
    @RequestMapping(value = "/edit/editInformatiqueAdh", method = RequestMethod.POST)
    public String modifieInformatiqueAdh(
	    @Valid @ModelAttribute(value = "editForm") final EditAdherentActivitesForm editForm,
	    final BindingResult pBindingResult, final ModelMap pModel, HttpServletRequest request) {

	int adhId = editForm.getActivitesAdh().get(0).getAdherentId();

	if (!pBindingResult.hasErrors()) {
	    service.saveAdherentCommentaire(adhId, PageType.ADHERENT_INFORMATIQUE, editForm.getCommentaire());

//	    service.saveInformatiqueAdherent(adhId, );
	    return redirectOkPage(PageType.ADHERENT_INFORMATIQUE, adhId);
	}

	return "editInformatiqueAdh" ;//editad(adhId, pModel, request);
    }

    @RequestMapping(value = { "/edit/editAdministratifAdh", "/edit/editExploitationAdh", "/edit/editInformatiqueAdh",
	    "/edit/editArtipoleAdh", "/edit/editIdentiteAdh" }, method = RequestMethod.POST)
    public String modifieAdh(@Valid @ModelAttribute(value = "adhToEdit") final EditAdherentForm editForm,
	    final BindingResult pBindingResult, final ModelMap pModel, HttpServletRequest request) {

	EditAdherent adhEditable = editForm.getAdherent();
	Adherent adh = editToAdh(adhEditable);

	if (adh.getCommune().getId() == null) {
	    pBindingResult.addError(new FieldError("commune", "adherent.commune",
		    messages.getMessage("modification.notempty", null, Locale.FRANCE)));
	}

	if (!pBindingResult.hasErrors()) {
	    service.saveAdherentCommentaire(adh.getId(), extractPageType(request.getServletPath().substring(6)),
		    editForm.getCommentaire());
	    service.saveAdherent(adh);
	    return redirectOkPage(extractPageType(request.getServletPath().substring(6)), adh.getId());
	}

	return editAdherent(editForm.getAdherent().getId(), pModel, request);
    }

    @RequestMapping(value = "/edit/editAdherentContact", method = RequestMethod.POST)
    public String modifieContact(
	    @Valid @ModelAttribute(value = "contactToEdit") final EditAdherentContactsForm editForm,
	    final BindingResult pBindingResult, final ModelMap pModel, HttpServletRequest request) {

	List<EditAdherentContact> adhContactEditable = editForm.getAdherentContacts();
	System.out.println("id ..: " + adhContactEditable.get(0).getAdherentId());
	int adhId = adhContactEditable.get(0).getAdherentId();

	if (!pBindingResult.hasErrors()) {
	    List<AdherentContactRole> contacts = editToContactList(adhContactEditable);

	    service.saveAdherentContacts(contacts);
	    service.saveAdherentCommentaire(adhId, PageType.ADHERENT_DETAIL, editForm.getCommentaire());
	    return "redirect:/adherentDetail?idAdh=" + adhId;
	}

	return editContact(adhId, pModel, request);
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
	default:
	    page = "adherentDetail";
	    break;
	}

	return "redirect:/" + page + "?idAdh=" + adhId;
    }

    @RequestMapping(value = "/edit/uploadFile", method = RequestMethod.POST)
    public String submitFile(@RequestParam(value = "adhId", defaultValue = "0") int adhId,
	    @RequestParam(value = "contactId", defaultValue = "0") int contactId,
	    @RequestParam("file") MultipartFile file, final ModelMap pModel, HttpServletRequest request)
	    throws Exception {

	String extension = file.getOriginalFilename().substring(file.getOriginalFilename().length() - 3);
	String fileName = "data:image/" + extension + ";base64," + Base64.encodeBase64String(file.getBytes());

	if (adhId != 0) {
	    service.setAdherentImage(adhId, fileName.getBytes());
	} else {
//	    service.setContactImage(contactId, fileName.getBytes());
	}

	return "redirect:/adherentDetail?idAdh=" + adhId;
    }

    @RequestMapping(value = "/edit/supprimeContact", method = RequestMethod.GET)
    public String supprimeAdherentContact(@RequestParam(value = "adhId") final Integer adhId,
	    @RequestParam(value = "ctId") final Integer contactId, final ModelMap pModel, HttpServletRequest request) {

	if (contactId != null) {
	    service.supprimeAdherentContact(contactId);
	}

	return editContact(adhId, pModel, request);
    }
}
