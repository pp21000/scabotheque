package fr.scabois.scabotheque.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import fr.scabois.scabotheque.bean.fournisseur.Fournisseur;

@Repository
public class FournisseurDAO implements IFournisseurDAO {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Fournisseur loadFournisseur(int idFournisseur) {
	try {
	    return entityManager.find(Fournisseur.class, idFournisseur);
	} catch (NoResultException e) {
	    return null;
	}
    }

    /**
     * Chargement de tous les fournisseurs
     * @return 
     * Liste de tous les fourniseurs
     */
    @Override
    public List<Fournisseur> loadFournisseurs() {
	return entityManager.createQuery("from Fournisseur", Fournisseur.class).getResultList();
    }

}