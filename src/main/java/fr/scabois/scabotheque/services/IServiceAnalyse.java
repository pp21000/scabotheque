package fr.scabois.scabotheque.services;

import fr.scabois.scabotheque.bean.analyse.ChiffresSemaine;
import fr.scabois.scabotheque.bean.commun.Activite;
import java.util.List;

public interface IServiceAnalyse {

    ChiffresSemaine ChiffresDeLaSemaine(List<Activite> activites);

}
