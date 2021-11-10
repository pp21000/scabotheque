package fr.scabois.scabotheque.dao;

import fr.scabois.scabotheque.bean.logistique.LogistiqueCamion;
import fr.scabois.scabotheque.bean.logistique.LogistiqueConducteur;
import fr.scabois.scabotheque.bean.logistique.LogistiqueTournee;
import fr.scabois.scabotheque.bean.logistique.LogistiqueTourneeCmd;
import fr.scabois.scabotheque.enums.LogistiqueJobType;
import fr.scabois.scabotheque.utils.AppProperties;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

@Repository
public class LogistiqueDAO implements ILogistiqueDAO {

  @PersistenceContext
  private EntityManager entityManager;

  @Override
  public void executeJob(LogistiqueJobType type, String user) {
    try {

      String fileName = type == LogistiqueJobType.COLLECT_JOB
              ? AppProperties.getPropertie("logistique.jobCollect.path")
              : AppProperties.getPropertie("logistique.jobSendMission.path");

      System.err.println("debug fileName :" + fileName + " " + user);

      Process p = Runtime.getRuntime().exec(fileName + " " + user);
      p.waitFor();

    } catch (IOException ex) {
      System.err.println("Access au fichier :" + ex.getMessage());
    } catch (InterruptedException ex) {
      System.err.println("Arret inatentdu :" + ex.getMessage());
    }
  }

  @Override
  public List<LogistiqueTournee> loadTournees(String codeAgence, String zone, Date dateLivraison, String user) {
//        List<LogistiqueTournee> list = entityManager.createQuery("from LogistiqueTournee lt where lt.zone = :zone and dateLivraison = :dateLiv", LogistiqueTournee.class)

    // Le but serait d'avoir une ligne par adherent
    List<LogistiqueTournee> list = entityManager.createQuery("from LogistiqueTournee lt "
            + "where lt.agence = :codeAgence and lt.zone = :zone and dateBonLiv = :dateLiv and user like :user", LogistiqueTournee.class)
            .setParameter("codeAgence", codeAgence)
            .setParameter("zone", zone)
            .setParameter("dateLiv", dateLivraison)
            .setParameter("user", user)
            .getResultList();

    list.stream().forEach(l -> l.getTourneeCommande().addAll(
            entityManager.createQuery("from LogistiqueTourneeCmd lt where lt.key = :key and lt.user = :user", LogistiqueTourneeCmd.class)
                    .setParameter("key", l.getKey())
                    .setParameter("user", l.getUser())
                    .getResultList()));
    return list;
  }

//    @Override
  public LogistiqueTournee loadTournee(int id) {
    return entityManager.find(LogistiqueTournee.class, id);
  }

  @Override
  public List<String> loadZonePrep(String codeAgence) {
    List<String> zonePrep = entityManager.createQuery("select distinct zone from LogistiqueTournee lt "
            + "where agence = :codeAgence order by zone", String.class)
            .setParameter("codeAgence", codeAgence)
            .getResultList();
    return zonePrep;
  }

  @Override
  @Transactional
  public void saveCamions(List<LogistiqueCamion> list) {
    list.stream().map((camion) -> {
      LogistiqueCamion bddCamion = entityManager.find(LogistiqueCamion.class, camion.getId());
      bddCamion.setNom(camion.getNom());
      bddCamion.setImmatriculation(camion.getImmatriculation());
      bddCamion.setChauffeurId(camion.getChauffeurId());
      return bddCamion;
    }).forEachOrdered((bddCamion) -> {
      entityManager.persist(bddCamion);
    });
  }

  @Override
  @Transactional
  public void saveConducteurs(List<LogistiqueConducteur> list) {
    list.stream().map((conducteur) -> {
      LogistiqueConducteur bddConducteur = entityManager.find(LogistiqueConducteur.class, conducteur.getId());
      bddConducteur.setNom(conducteur.getNom());
      bddConducteur.setPrenom(conducteur.getPrenom());
      bddConducteur.setPosition(conducteur.getPosition());
      return bddConducteur;
    }).forEachOrdered((bddConducteur) -> {
      entityManager.persist(bddConducteur);
    });
  }

  @Transactional
  @Override
  public void saveTournee(List<LogistiqueTournee> tournees) {

    // Pour toutes les agences de la liste
    tournees.stream().forEach(l -> {
      LogistiqueTournee tournee = entityManager.find(LogistiqueTournee.class, l.getId());
      tournee.setOrdre(l.getOrdre());
      tournee.setCommentaire(l.getCommentaire());
      tournee.setCamionId(l.getCamionId());
      tournee.setChauffeurId(l.getChauffeurId());
      tournee.setTournee(l.getTournee());
      tournee.setUser(l.getUser());
      tournee.setEnvoi(1);

      entityManager.persist(tournee);
    });
  }

  @Override
  public List<LogistiqueCamion> loadCamions() {
    return entityManager.createQuery("from LogistiqueCamion order by position", LogistiqueCamion.class).getResultList();
  }

  @Override
  public List<LogistiqueConducteur> loadChauffeurs() {
    return entityManager.createQuery("from LogistiqueConducteur order by position", LogistiqueConducteur.class).getResultList();
  }

}
