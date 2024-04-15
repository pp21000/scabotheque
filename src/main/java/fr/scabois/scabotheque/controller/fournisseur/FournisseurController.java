package fr.scabois.scabotheque.controller.fournisseur;

import fr.scabois.scabotheque.bean.fournisseur.Fournisseur;
import fr.scabois.scabotheque.controller.adherent.*;
import fr.scabois.scabotheque.enums.PageType;
import fr.scabois.scabotheque.services.IServiceFournisseur;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FournisseurController {

//    @Autowired
//    private IServiceAdherent serviceAdh;
    @Autowired
    private IServiceFournisseur service;

    @RequestMapping(value = {"/listeFournisseur"}, method = RequestMethod.GET)
    public String afficherFournisseur(@CookieValue(value = "criteriaFour", defaultValue = "") String cookie, ModelMap pModel) {
        CriteriaFournisseur criteria = null;
        try {
            if (cookie.length() != 0) {
                criteria = deserialise(cookie);
            }
        } catch (IOException ex) {
            Logger.getLogger("1" + ListeAdherentsController.class.getName()).log(Level.SEVERE, "lenght:" + cookie.length(), "1" + cookie);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger("2" + ListeAdherentsController.class.getName()).log(Level.SEVERE, "lenght:" + cookie.length(), "2" + cookie);
        }
        return chargementListe(criteria, pModel);
    }

    @RequestMapping(value = "/fournisseurDetail", method = RequestMethod.GET)
    public String afficher(@RequestParam(value = "idFournisseur") final int idFournisseur, final ModelMap pModel,
            HttpServletRequest request) {

        pModel.addAttribute("pageType", PageType.LISTE_FOURNISSEURS);

        pModel.addAttribute("commentaire", "Commentaire de crotte");
        pModel.addAttribute("adherent", null);

        return "fournisseurDetail";
    }

    @RequestMapping(value = "/listeFournisseur", method = RequestMethod.POST)
    public String rechercheFourniseur(@ModelAttribute(value = "criteria") final CriteriaFournisseur criteria,
            final BindingResult pBindingResult, final ModelMap pModel, HttpServletResponse response) {

        try {
            Cookie cookie = new Cookie("criteriaFour", serialise(criteria));
            cookie.setMaxAge(7 * 24 * 60 * 60);
            response.addCookie(cookie);
        } catch (IOException ex) {
            Logger.getLogger(ListeAdherentsController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return chargementListe(criteria, pModel);
    }

    private String chargementListe(CriteriaFournisseur criteria, ModelMap pModel) {

        if (criteria == null) {
            criteria = new CriteriaFournisseur();
        }
        List<Fournisseur> listeFournisseur = service.LoadFournisseurs();
        pModel.addAttribute("listeFournisseur", listeFournisseur);
        pModel.addAttribute("criteria", criteria);
        pModel.addAttribute("pageType", PageType.LISTE_FOURNISSEURS);

        return "listeFournisseur";
    }

    /**
     * Déserialise Base64 string.
     */
    private static CriteriaFournisseur deserialise(String s) throws IOException, ClassNotFoundException {
        byte[] data = Base64.getDecoder().decode(s);
        ObjectInputStream ois = new ObjectInputStream(
                new ByteArrayInputStream(data));
        Object cookie = ois.readObject();
        ois.close();
        return (CriteriaFournisseur) cookie;
    }

    /**
     * Write the object to a Base64 string.
     */
    private static String serialise(CriteriaFournisseur o) throws IOException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ObjectOutputStream oos = new ObjectOutputStream(baos);
        oos.writeObject(o);
        oos.close();
        return Base64.getEncoder().encodeToString(baos.toByteArray());
    }
}
