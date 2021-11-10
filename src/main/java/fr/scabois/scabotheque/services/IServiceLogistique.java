package fr.scabois.scabotheque.services;

import fr.scabois.scabotheque.bean.logistique.LogistiqueCamion;
import fr.scabois.scabotheque.bean.logistique.LogistiqueConducteur;
import fr.scabois.scabotheque.bean.logistique.LogistiqueTournee;
import fr.scabois.scabotheque.enums.LogistiqueJobType;
import java.util.Date;
import java.util.List;

public interface IServiceLogistique {

//    void ChiffresDeLaSemaine(List<Activite> activites);
  void executeJob(LogistiqueJobType type, String user);

  List<LogistiqueTournee> loadTournees(String codeAgence, String zone, Date dateLivraison, String user);

  void saveTounree(List<LogistiqueTournee> list);

  List<LogistiqueCamion> loadCamions();

  List<LogistiqueConducteur> loadChauffeurs();

  void saveCamions(List<LogistiqueCamion> list);

  void saveConducteurs(List<LogistiqueConducteur> list);

  public List<String> loadZonePrep(String codeAgence);

}
