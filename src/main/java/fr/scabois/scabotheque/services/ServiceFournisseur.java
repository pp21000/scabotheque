package fr.scabois.scabotheque.services;

import fr.scabois.scabotheque.bean.fournisseur.Fournisseur;
import fr.scabois.scabotheque.dao.IFournisseurDAO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author dslowensky
 */
@Service
public class ServiceFournisseur implements IServiceFournisseur {

    @Autowired
    private IFournisseurDAO dao;

    @Override
    public Fournisseur LoadFournisseur(int idFournisseur) {
        return dao.loadFournisseur(idFournisseur);
    }

    @Override
    public List<Fournisseur> LoadFournisseurs() {
        return dao.loadFournisseurs();
    }
}
