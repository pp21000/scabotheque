package fr.scabois.scabotheque.controller.analyse;

import fr.scabois.scabotheque.bean.analyse.ChiffresSemaine;
import fr.scabois.scabotheque.bean.commun.Activite;
import fr.scabois.scabotheque.enums.PageType;
import fr.scabois.scabotheque.services.IServiceAdherent;
import fr.scabois.scabotheque.services.IServiceAnalyse;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AnalyseController {

    @Autowired
    private IServiceAnalyse analyseService;

    @Autowired
    private IServiceAdherent adherentService;

    @RequestMapping(value = "/analyse", method = RequestMethod.GET)
    public String afficher(final ModelMap pModel,
            HttpServletRequest request) {

        List<Activite> listActivite = adherentService.loadActivites();
        ChiffresSemaine chiffres = analyseService.ChiffresDeLaSemaine(listActivite);
        chiffres.setNumSemaine(Calendar.getInstance().get(Calendar.WEEK_OF_YEAR));

        pModel.addAttribute("chiffresSemaine", chiffres);
        pModel.addAttribute("pageType", PageType.ANALYSE);

        // premier element
        // chiffre de commandes de la semaine passé et/ou encour
        // total des commandes puis facturé et non facturé en fonction des activitées
        // Idem pour la semaine en cour ...
        return "analyse";
    }

}
