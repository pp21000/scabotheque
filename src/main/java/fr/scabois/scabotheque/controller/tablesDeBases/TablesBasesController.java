package fr.scabois.scabotheque.controller.tablesDeBases;

import fr.scabois.scabotheque.bean.HasIdPositionLibelle;
import fr.scabois.scabotheque.bean.adherent.Pole;
import fr.scabois.scabotheque.bean.adherent.Role;
import fr.scabois.scabotheque.bean.adherent.Secteur;
import fr.scabois.scabotheque.bean.commun.Activite;
import fr.scabois.scabotheque.bean.commun.Agence;
import fr.scabois.scabotheque.bean.commun.ContactFonction;
import fr.scabois.scabotheque.enums.PageType;
import fr.scabois.scabotheque.services.IServiceAdherent;
import fr.scabois.scabotheque.utils.IdLibelle;
import java.util.ArrayList;
import java.util.List;
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
public class TablesBasesController {

    private static final String ACTIVITE_CONST = "Activite";
    private static final String AGENCE_CONST = "Agence";
    private static final String CONTACT_FONCTION_CONST = "ContactFonction";
    private static final String POLE_CONST = "Pole";
    private static final String ROLE_CONST = "Role";
    private static final String SECTEUR_CONST = "Secteur";

    @Autowired
    private IServiceAdherent service;

    @RequestMapping(value = {"/parametrage/listActivites"}, method = RequestMethod.GET)
    public String afficheActivites(final ModelMap pModel) {

        List<Activite> listActivite = service.loadActivites();

        List<EditActiviteList> listToEdit = new ArrayList<>();
        listActivite.stream().forEach(i -> listToEdit.add(new EditActiviteList(i.getId(), i.getLibelle(), i.getPosition())));
//        listActivite.stream().forEach(i -> listToEdit.add(new EditActiviteList(i.getId(), i.getLibelle(), i.getFamillesListe(), i.getPosition())));

        EditActiviteForm listForm = new EditActiviteForm();
        listForm.setList(listToEdit);

        pModel.addAttribute("editList", listForm);
        if (pModel.get("creation") == null) {
            pModel.addAttribute("creation", new CreationForm());
        }

        pModel.addAttribute("pageType", PageType.TABLES_BASE);
        return "listeActivites";

    }

    @RequestMapping(value = {"/parametrage"}, method = RequestMethod.GET)
    public String afficher(@RequestParam(value = "type") final String typeList, final ModelMap pModel) {

        if (pModel.get("editList") == null) {

            // Tout affichage de table Id-Libelle passe par cette servlet
            List<HasIdPositionLibelle> listIdLibelle = new ArrayList<HasIdPositionLibelle>();

            switch (typeList) {
                case AGENCE_CONST:
                    listIdLibelle.addAll(service.loadAgences());
                    break;
                case ACTIVITE_CONST:
                    return afficheActivites(pModel);
                //listIdLibelle.addAll(service.loadActivites());
                //break;
                case POLE_CONST:
                    listIdLibelle.addAll(service.loadPoles());
                    break;
                case ROLE_CONST:
                    listIdLibelle.addAll(service.loadRoles());
                    break;
                case SECTEUR_CONST:
                    listIdLibelle.addAll(service.loadSecteurs());
                    break;
                case CONTACT_FONCTION_CONST:
                    listIdLibelle.addAll(service.loadContactFonctions());
                    break;
            }

            List<EditIdLibList> listToEdit = new ArrayList<>();
            listIdLibelle.stream().forEach(i -> listToEdit.add(new EditIdLibList(i.getId(), i.getLibelle(), i.getPosition())));

            EditIdLibListForm listForm = new EditIdLibListForm();
            listForm.setList(listToEdit);

            pModel.addAttribute("editList", listForm);
            if (pModel.get("creation") == null) {
                pModel.addAttribute("creation", new CreationForm());
            }
        }

        pModel.addAttribute("pageType", PageType.TABLES_BASE);
        pModel.addAttribute("pageLink", typeList);

        // Implique que le nom des Tiles soit correctement alimenté
        return "listIdLibelle";
    }

    @RequestMapping(value = {"/ajoutActivite"}, method = RequestMethod.POST)
    public String ajoutActivite(@Valid @ModelAttribute(value = "creation") final CreationForm creation,
            final BindingResult pBindingResult, final ModelMap pModel) {
        if (!pBindingResult.hasErrors()) {
            service.createActivite(creation.getLibelle());
        }

        return afficher(ACTIVITE_CONST, pModel);
    }

    @RequestMapping(value = {"/ajoutAgence"}, method = RequestMethod.POST)
    public String ajoutAgence(@Valid @ModelAttribute(value = "creation") final CreationForm creation,
            final BindingResult pBindingResult, final ModelMap pModel) {
        if (!pBindingResult.hasErrors()) {
            service.createAgence(creation.getLibelle());
        }

        return afficher(AGENCE_CONST, pModel);
    }

    @RequestMapping(value = {"/ajoutContactFonction"}, method = RequestMethod.POST)
    public String ajoutContactFonction(@Valid @ModelAttribute(value = "creation") final CreationForm creation,
            final BindingResult pBindingResult, final ModelMap pModel) {
        if (!pBindingResult.hasErrors()) {
            service.createContactFonction(creation.getLibelle());
        }

        return afficher(CONTACT_FONCTION_CONST, pModel);
    }

    @RequestMapping(value = {"/ajoutPole"}, method = RequestMethod.POST)
    public String ajoutPole(@Valid @ModelAttribute(value = "creation") final CreationForm creation,
            final BindingResult pBindingResult, final ModelMap pModel) {
        if (!pBindingResult.hasErrors()) {
            service.createPole(creation.getLibelle());
        }

        return afficher(POLE_CONST, pModel);
    }

    @RequestMapping(value = {"/ajoutRole"}, method = RequestMethod.POST)
    public String ajoutRole(@Valid @ModelAttribute(value = "creation") final CreationForm creation,
            final BindingResult pBindingResult, final ModelMap pModel) {
        if (!pBindingResult.hasErrors()) {
            service.createRole(creation.getLibelle());
        }

        return afficher(ROLE_CONST, pModel);
    }

    @RequestMapping(value = {"/ajoutSecteur"}, method = RequestMethod.POST)
    public String ajoutSecteur(@Valid @ModelAttribute(value = "creation") final CreationForm creation,
            final BindingResult pBindingResult, final ModelMap pModel) {
        if (!pBindingResult.hasErrors()) {
            service.createSecteur(creation.getLibelle());
        }

        return afficher(SECTEUR_CONST, pModel);
    }

    @RequestMapping(value = {"/parametrage/editActivite"}, method = RequestMethod.POST)
    public String modifierActivite(@Valid @ModelAttribute(value = "editList") final EditActiviteForm editForm,
            final BindingResult pBindingResult, final ModelMap pModel) {

        if (!pBindingResult.hasErrors()) {
            List<Activite> computeList = new ArrayList<>();
            editForm.getList().stream().forEach(a -> computeList.add(new Activite(a.getId(), a.getLibelle(), a.getPosition())));
//            editForm.getList().stream().forEach(a -> computeList.add(new Activite(a.getId(), a.getLibelle(), a.getFamillesListe(), a.getPosition())));
            service.saveActivites(computeList);
            return "redirect:/parametrage/listActivites";
        }

        return afficheActivites(pModel);
    }

    @RequestMapping(value = {"/editAgence"}, method = RequestMethod.POST)
    public String modifierAgence(@Valid @ModelAttribute(value = "editList") final EditIdLibListForm editForm,
            final BindingResult pBindingResult, final ModelMap pModel) {

        if (!pBindingResult.hasErrors()) {
            IdLibelle<Agence> computeList = new IdLibelle<>(Agence.class);
            service.saveAgences(computeList.setEditList(editForm.getList()));
            return "redirect:/parametrage?type=Agence";
        }

        return afficher(AGENCE_CONST, pModel);
    }

    @RequestMapping(value = {"/editContactFonction"}, method = RequestMethod.POST)
    public String modifierContact(@Valid @ModelAttribute(value = "editList") final EditIdLibListForm editForm,
            final BindingResult pBindingResult, final ModelMap pModel) {

        if (!pBindingResult.hasErrors()) {
            IdLibelle<ContactFonction> computeList = new IdLibelle<>(ContactFonction.class);
            service.saveContactFonctions(computeList.setEditList(editForm.getList()));
            return "redirect:/parametrage?type=ContactFonction";
        }

        return afficher(CONTACT_FONCTION_CONST, pModel);
    }

    @RequestMapping(value = {"/editPole"}, method = RequestMethod.POST)
    public String modifierPole(@Valid @ModelAttribute(value = "editList") final EditIdLibListForm editForm,
            final BindingResult pBindingResult, final ModelMap pModel) {

        if (!pBindingResult.hasErrors()) {
            IdLibelle<Pole> computeList = new IdLibelle<>(Pole.class);
            service.savePoles(computeList.setEditList(editForm.getList()));
            return "redirect:/parametrage?type=Pole";
        }

        return afficher(POLE_CONST, pModel);
    }

    @RequestMapping(value = {"/editRole"}, method = RequestMethod.POST)
    public String modifierRole(@Valid @ModelAttribute(value = "editList") final EditIdLibListForm editForm,
            final BindingResult pBindingResult, final ModelMap pModel) {

        if (!pBindingResult.hasErrors()) {
            IdLibelle<Role> computeList = new IdLibelle<>(Role.class);
            service.saveRoles(computeList.setEditList(editForm.getList()));
            return "redirect:/parametrage?type=Role";
        }

        return afficher(ROLE_CONST, pModel);
    }

    @RequestMapping(value = {"/editSecteur"}, method = RequestMethod.POST)
    public String modifierSecteur(@Valid @ModelAttribute(value = "editList") final EditIdLibListForm editForm,
            final BindingResult pBindingResult, final ModelMap pModel) {

        if (!pBindingResult.hasErrors()) {
            IdLibelle<Secteur> computeList = new IdLibelle<>(Secteur.class);
            service.saveSecteurs(computeList.setEditList(editForm.getList()));
            return "redirect:/parametrage?type=Secteur";
        }

        return afficher(SECTEUR_CONST, pModel);
    }

    @RequestMapping(value = "/supprimeActivite", method = RequestMethod.GET)
    public String supprimeActivite(@RequestParam(value = "id") final Integer id, final ModelMap pModel) {
        service.supprimeActivite(id);
        return afficheActivites(pModel);
    }

    @RequestMapping(value = "/supprimeAgence", method = RequestMethod.GET)
    public String supprimeAgence(@RequestParam(value = "id") final Integer id, final ModelMap pModel) {
        service.supprimeAgence(id);
        return afficher(AGENCE_CONST, pModel);
    }

    @RequestMapping(value = "/supprimeContactFonction", method = RequestMethod.GET)
    public String supprimeContactFonction(@RequestParam(value = "id") final Integer id, final ModelMap pModel) {
        try {
            service.supprimeContactFonction(id);
            return afficher(CONTACT_FONCTION_CONST, pModel);
        } catch (Exception e) {
            pModel.addAttribute("erreur", "Impossible de terminer la demande <br>" + e.getMessage());
            return afficher(CONTACT_FONCTION_CONST, pModel);
        }
    }

    @RequestMapping(value = "/supprimePole", method = RequestMethod.GET)
    public String supprimePole(@RequestParam(value = "id") final Integer id, final ModelMap pModel) {
        service.supprimePole(id);
        return afficher(POLE_CONST, pModel);
    }

    @RequestMapping(value = "/supprimeRole", method = RequestMethod.GET)
    public String supprimeRole(@RequestParam(value = "id") final Integer id, final ModelMap pModel) {
        service.supprimeRole(id);
        return afficher(ROLE_CONST, pModel);
    }

    @RequestMapping(value = "/supprimeSecteur", method = RequestMethod.GET)
    public String supprimeSecteur(@RequestParam(value = "id") final Integer id, final ModelMap pModel) {
        service.supprimeSecteur(id);
        return afficher(SECTEUR_CONST, pModel);
    }
}
