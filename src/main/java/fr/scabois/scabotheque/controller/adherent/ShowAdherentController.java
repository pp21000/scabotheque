package fr.scabois.scabotheque.controller.adherent;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.adherent.AdherentContactRole;
import fr.scabois.scabotheque.bean.adherent.AdherentInformatique;
import fr.scabois.scabotheque.bean.adherent.AdherentLogistique;
import fr.scabois.scabotheque.bean.adherent.AdherentSpecialite;
import fr.scabois.scabotheque.bean.artisansArtipole.Actualite;
import fr.scabois.scabotheque.bean.artisansArtipole.Specialite;
import fr.scabois.scabotheque.controller.adherent.edit.EditAdherentSuiviVisite;
import fr.scabois.scabotheque.controller.adherent.edit.EditAdherentSuiviVisiteForm;
import fr.scabois.scabotheque.enums.NavType;
import fr.scabois.scabotheque.enums.PageType;
import fr.scabois.scabotheque.services.IServiceAdherent;
import fr.scabois.scabotheque.services.IServiceArtipole;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ShowAdherentController {

  @Autowired
  private IServiceAdherent service;

  @Autowired
  private IServiceArtipole serviceArtipole;

  @RequestMapping(value = "/adherentProfil", method = RequestMethod.GET)
  public String profile(@RequestParam(value = "idAdh") final int idAdh, final ModelMap pModel, HttpServletRequest request) {
    PageType pageType = PageType.LISTE_ADHERENTS;
    String commentaire = "";
    commentaire = this.service.loadAdherentCommentaire(idAdh, pageType);
    Adherent adherent = this.service.loadAdherent(idAdh);
    List contacts = this.service.loadAdherentContact(idAdh);
    List infoSuiviVisite = this.service.loadAdherentSuivisVisites(idAdh);
    EditAdherentSuiviVisite newSuivi = new EditAdherentSuiviVisite(idAdh);
    EditAdherentSuiviVisiteForm newSuiviForm = new EditAdherentSuiviVisiteForm();
    newSuiviForm.setSuiviVisiteAdh(newSuivi);
    pModel.addAttribute("suiviToAdd", newSuiviForm);
    List adhActivites = this.service.loadActivitesAdherent(idAdh);
    AdherentLogistique infoExploitation = this.service.loadAdherentLogistique(idAdh);
    AdherentContactRole contactReception = this.service.loadContact(infoExploitation.getContactReceptionId());
    List adherentMetiersId = this.service.loadAdherentMetiers(idAdh).stream().map(am -> am.getMetierId()).collect(Collectors.toList());
    List adherentCertificationsId = this.service.loadAdherentCertifications(idAdh).stream().map(am -> am.getCertificationId()).collect(Collectors.toList());
    AdherentInformatique informatique = service.loadAdherentInformatique(idAdh);

    List<Specialite> specialitesOfAdherent = this.service.loadAdherentSpecialites(idAdh).stream()
            .sorted(Comparator.comparing(AdherentSpecialite::getNiveau))
            .map(
                    as -> serviceArtipole.loadSpecialites().stream()
                            .filter(s -> Objects.equals(s.getId(), as.getSpecialiteId()))
                            .findFirst().orElse(null)
            ).collect(Collectors.toList());

    List<Actualite> actualites = this.serviceArtipole.loadActualites().stream().filter(actu -> actu.getAdherent() != null && actu.getAdherent().getId() == idAdh).collect(Collectors.toList());

    pModel.addAttribute("contacts", contacts);
    pModel.addAttribute("infoSuiviVisite", infoSuiviVisite);
    pModel.addAttribute("informatique", informatique);
    pModel.addAttribute("criteria", new CriteriaAdherent());
    pModel.addAttribute("commentaire", commentaire);
    pModel.addAttribute("contactComptable", this.service.loadAdherentContactComptable(idAdh));
    pModel.addAttribute("adhActivites", adhActivites);
    pModel.addAttribute("infoExploitation", infoExploitation);
    pModel.addAttribute("contactReception", contactReception);
    pModel.addAttribute("adherent", adherent);
    pModel.addAttribute("metiers", this.serviceArtipole.loadMetiers());
    pModel.addAttribute("certifications", this.serviceArtipole.loadCertifications());
    pModel.addAttribute("metiersAdherentId", adherentMetiersId);
    pModel.addAttribute("certificationsAdherentId", adherentCertificationsId);
    pModel.addAttribute("specialitesOfAdherent", specialitesOfAdherent);
    pModel.addAttribute("actualites", actualites);
    pModel.addAttribute("navType", NavType.ADHERENTS);
    pModel.addAttribute("pageType", pageType.ADHERENT_PROFIL);
    return "adherentProfil";
  }
}
