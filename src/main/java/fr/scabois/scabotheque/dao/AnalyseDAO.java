package fr.scabois.scabotheque.dao;

import fr.scabois.scabotheque.bean.analyse.ChiffresActivite;
import fr.scabois.scabotheque.bean.analyse.ChiffresSemaine;
import fr.scabois.scabotheque.bean.commun.Activite;
import fr.scabois.scabotheque.bean.commun.ActiviteFamille;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import static java.time.temporal.TemporalAdjusters.firstDayOfMonth;
import static java.time.temporal.TemporalAdjusters.firstDayOfYear;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class AnalyseDAO implements IAnalyseDAO {

  @PersistenceContext
  private EntityManager entityManager;

  private enum TypeExercice {
    ANNEE_N, ANNEE_N1, ANNEE_N2
  };

  @Override
  public ChiffresSemaine ChiffresDeLaSemaine(List<Activite> activites) {
    ChiffresSemaine chiffreSemaine = new ChiffresSemaine();

    LocalDate aujourdhui = LocalDate.now();
    LocalDate dateLundi = LocalDate.now().with(DayOfWeek.MONDAY);
    LocalDate debutMois = LocalDate.now().with(firstDayOfMonth());
    LocalDate debutAnnee = LocalDate.now().with(firstDayOfYear());

    chiffreSemaine.setDateDebut(Date.from(dateLundi.atStartOfDay(ZoneId.systemDefault()).toInstant()));
    chiffreSemaine.setDateFin(Date.from(aujourdhui.atStartOfDay(ZoneId.systemDefault()).toInstant()));

    chiffreSemaine.setChiffresActivite(new ArrayList<>());

    activites.stream().forEach(a -> {
      ChiffresActivite chiffre = new ChiffresActivite();
      chiffre.setActivite(a);

      chiffre.setNbCommandesSemaine(nombreCommande(dateLundi, aujourdhui, a.getFamille()));

      chiffre.setCumulSemaine(computeMontant(dateLundi, aujourdhui, a.getFamille(), TypeExercice.ANNEE_N));
      chiffre.setCumulSemaineN1(computeMontant(dateLundi, aujourdhui, a.getFamille(), TypeExercice.ANNEE_N1));
      chiffre.setCumulSemaineN2(computeMontant(dateLundi, aujourdhui, a.getFamille(), TypeExercice.ANNEE_N2));

      chiffre.setCumulMois(computeMontant(debutMois, aujourdhui, a.getFamille(), TypeExercice.ANNEE_N));
      chiffre.setCumulMoisN1(computeMontant(debutMois, aujourdhui, a.getFamille(), TypeExercice.ANNEE_N1));
      chiffre.setCumulMoisN2(computeMontant(debutMois, aujourdhui, a.getFamille(), TypeExercice.ANNEE_N2));

      chiffre.setCumulAnnee(computeMontant(debutAnnee, aujourdhui, a.getFamille(), TypeExercice.ANNEE_N));
      chiffre.setCumulAnneeN1(computeMontant(debutAnnee, aujourdhui, a.getFamille(), TypeExercice.ANNEE_N1));
      chiffre.setCumulAnneeN2(computeMontant(debutAnnee, aujourdhui, a.getFamille(), TypeExercice.ANNEE_N2));

      chiffreSemaine.getChiffresActivite().add(chiffre);
    });

    // Ajout des totaux
//        ChiffresActivite totaux = new ChiffresActivite();
//    totaux.setNbCommandesSemaine(chiffreSemaine.getChiffresActivite().stream().mapToInt(m -> m.getNbCommandesSemaine()).sum());
    chiffreSemaine.setTotalNbCommande(chiffreSemaine.getChiffresActivite().stream().mapToInt(m -> m.getNbCommandesSemaine()).sum());

//        totaux.setCumulSemaine(chiffreSemaine.getChiffresActivite().stream().mapToDouble(m -> m.getCumulSemaine()).sum());
    chiffreSemaine.setTotalSemaine(chiffreSemaine.getChiffresActivite().stream().mapToDouble(m -> m.getCumulSemaine()).sum());
    chiffreSemaine.setTotalSemaineN1(chiffreSemaine.getChiffresActivite().stream().mapToDouble(m -> m.getCumulSemaineN1()).sum());
    chiffreSemaine.setTotalSemaineN2(chiffreSemaine.getChiffresActivite().stream().mapToDouble(m -> m.getCumulSemaineN2()).sum());

    chiffreSemaine.setTotalMois(chiffreSemaine.getChiffresActivite().stream().mapToDouble(m -> m.getCumulMois()).sum());
    chiffreSemaine.setTotalMoisN1(chiffreSemaine.getChiffresActivite().stream().mapToDouble(m -> m.getCumulMoisN1()).sum());
    chiffreSemaine.setTotalMoisN2(chiffreSemaine.getChiffresActivite().stream().mapToDouble(m -> m.getCumulMoisN2()).sum());

    chiffreSemaine.setTotalAnnee(chiffreSemaine.getChiffresActivite().stream().mapToDouble(m -> m.getCumulAnnee()).sum());
    chiffreSemaine.setTotalAnneeN1(chiffreSemaine.getChiffresActivite().stream().mapToDouble(m -> m.getCumulAnneeN1()).sum());
    chiffreSemaine.setTotalAnneeN2(chiffreSemaine.getChiffresActivite().stream().mapToDouble(m -> m.getCumulAnneeN2()).sum());

//        chiffreSemaine.getChiffresActivite().add(totaux);
    return chiffreSemaine;
  }

  private double computeMontant(LocalDate dateDebut, LocalDate dateFin, List<ActiviteFamille> familleListe, TypeExercice exercice) {

    DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    String query = "select COALESCE(SUM(montant) , 0) ";

    LocalDate dDebut = dateDebut;
    LocalDate dFin = dateFin;

    switch (exercice) {
      case ANNEE_N:
        query += "from adherent_achat_N ";
        break;
      case ANNEE_N1:
        query += "from adherent_achat_N1 ";
        dDebut = dateDebut.minusYears(1);
        dFin = dateFin.minusYears(1);
        break;
      case ANNEE_N2:
        query += "from adherent_achat_N2 ";
        dDebut = dateDebut.minusYears(2);
        dFin = dateFin.minusYears(2);
        break;
    }

    query += "where date_commande between '" + dDebut.format(dateFormat).toString() + "' and '" + dFin.format(dateFormat).toString() + "' and(";

    for (int i = 0; i < familleListe.size(); i++) {
      query += i == 0 ? "" : " or ";
      query += "(famille = " + familleListe.get(i).getFamille();
      if (familleListe.get(i).getSousFamille() == null) {
        query += ")";
      } else {
        query += " and sous_famille = " + familleListe.get(i).getSousFamille() + ")";
      }
      query += (i == (familleListe.size() - 1)) ? ")" : "";
    }

    Double num = ((java.math.BigDecimal) entityManager.createNativeQuery(query).getSingleResult()).doubleValue();

    return num;

  }

  private int nombreCommande(LocalDate dateDebut, LocalDate dateFin, List<ActiviteFamille> familleListe) {

    DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    String query = "select count(distinct num_bon) "
            + "from adherent_achat_N aan "
            + "where date_commande between '" + dateDebut.format(dateFormat).toString() + "' and '" + dateFin.format(dateFormat).toString() + "' "
            + " and(";

    for (int i = 0; i < familleListe.size(); i++) {
      query += i == 0 ? "" : " or ";
      query += "(famille = " + familleListe.get(i).getFamille();
      if (familleListe.get(i).getSousFamille() == null) {
        query += ")";
      } else {
        query += " and sous_famille = " + familleListe.get(i).getSousFamille() + ")";
      }
      query += (i == (familleListe.size() - 1)) ? ")" : "";
    }
    return ((java.math.BigInteger) entityManager.createNativeQuery(query).getSingleResult()).intValue();

  }
}
