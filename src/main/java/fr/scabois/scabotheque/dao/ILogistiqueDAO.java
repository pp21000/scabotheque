package fr.scabois.scabotheque.dao;

import fr.scabois.scabotheque.bean.logistique.LogistiqueCamion;
import fr.scabois.scabotheque.bean.logistique.LogistiqueConducteur;
import fr.scabois.scabotheque.bean.logistique.LogistiqueTournee;
import fr.scabois.scabotheque.enums.LogistiqueJobType;
import java.util.Date;
import java.util.List;

public interface ILogistiqueDAO {

//    ChiffresSemaine ChiffresDeLaSemaine(List<Activite> activites);
  void executeJob(LogistiqueJobType type, String user);

  public List<LogistiqueTournee> loadTournees(String codeAgence, String zone, Date dateLivraison, String user);

  public List<String> loadZonePrep(String codeAgence);

  public void saveCamions(List<LogistiqueCamion> list);

  public void saveConducteurs(List<LogistiqueConducteur> list);

  public void saveTournee(List<LogistiqueTournee> list);

  public List<LogistiqueCamion> loadCamions();

  public List<LogistiqueConducteur> loadChauffeurs();

}
