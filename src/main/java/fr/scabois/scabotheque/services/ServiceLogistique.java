package fr.scabois.scabotheque.services;

import fr.scabois.scabotheque.bean.logistique.LogistiqueCamion;
import fr.scabois.scabotheque.bean.logistique.LogistiqueConducteur;
import fr.scabois.scabotheque.bean.logistique.LogistiqueTournee;
import fr.scabois.scabotheque.dao.ILogistiqueDAO;
import fr.scabois.scabotheque.enums.LogistiqueJobType;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author dslowensky
 */
@Service
public class ServiceLogistique implements IServiceLogistique {

  @Autowired
  private ILogistiqueDAO dao;

  @Override
  public void executeJob(LogistiqueJobType type, String user) {
    dao.executeJob(type, user);
  }

  @Override
  public List<LogistiqueTournee> loadTournees(String codeAgence, String zone, Date dateLivraison, String user) {
    return dao.loadTournees(codeAgence, zone, dateLivraison, user);
  }

  @Override
  public List<String> loadZonePrep(String codeAgence) {
    return dao.loadZonePrep(codeAgence);
  }

  @Override
  public void saveTounree(List<LogistiqueTournee> list) {
    dao.saveTournee(list);
  }

  @Override
  public List<LogistiqueCamion> loadCamions() {
    return dao.loadCamions();
  }

  @Override
  public List<LogistiqueConducteur> loadChauffeurs() {
    return dao.loadChauffeurs();
  }

  @Override
  public void saveCamions(List<LogistiqueCamion> list) {
    dao.saveCamions(list);
  }

  @Override
  public void saveConducteurs(List<LogistiqueConducteur> list) {
    dao.saveConducteurs(list);
  }
}
