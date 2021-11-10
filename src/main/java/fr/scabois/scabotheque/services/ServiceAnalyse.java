package fr.scabois.scabotheque.services;

import fr.scabois.scabotheque.bean.analyse.ChiffresSemaine;
import fr.scabois.scabotheque.bean.commun.Activite;
import fr.scabois.scabotheque.dao.IAnalyseDAO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author dslowensky
 */
@Service
public class ServiceAnalyse implements IServiceAnalyse {

    @Autowired
    private IAnalyseDAO dao;

    @Override
    public ChiffresSemaine ChiffresDeLaSemaine(List<Activite> activites) {
        return dao.ChiffresDeLaSemaine(activites);
    }
}
