package fr.scabois.scabotheque.controller;

import fr.scabois.scabotheque.enums.PageType;
import fr.scabois.scabotheque.services.IServiceAdherent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DefaultController {

  @Autowired
  private IServiceAdherent service;

  @RequestMapping(value = "/enCours", method = RequestMethod.GET)
  public String afficherBonjour(final ModelMap pModel) {
//	pModel.addAttribute("pageType", PageType.GESTION_FOURNISSEUR);
    pModel.addAttribute("pageType", PageType.GESTION_PRODUIT);
    return "enCours";
  }

  @RequestMapping(value = {"/--", "/dashboard"}, method = RequestMethod.GET)
  public String dashboard(final ModelMap pModel) {

    pModel.addAttribute("pageType", PageType.DASHBOARD);

    pModel.addAttribute("nbAdherents", service.countAdherents());
    pModel.addAttribute("adhSansEOLAS", service.countAdherentsSansEOLAS());
    pModel.addAttribute("adherentInactif", service.countAdherentsInactif());

    pModel.addAttribute("dataChartAnnee", service.chartDataAnnee());
    pModel.addAttribute("dataCahrtActif", service.chartDataActif());
    pModel.addAttribute("dataChartInactif", service.chartDataInactif());

    return "dashboard";
  }

}
