package fr.scabois.scabotheque.dao;

import fr.scabois.scabotheque.bean.analyse.ChiffresSemaine;
import fr.scabois.scabotheque.bean.commun.Activite;
import java.util.List;

public interface IAnalyseDAO {

    ChiffresSemaine ChiffresDeLaSemaine(List<Activite> activites);

}
