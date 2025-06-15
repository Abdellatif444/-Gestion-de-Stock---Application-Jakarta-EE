package com.gestionstock.service;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import com.gestionstock.entity.Marque;
import com.gestionstock.entity.Produit;
import java.util.List;

@Stateless
public class ServiceMarque {
    
    @PersistenceContext
    private EntityManager em;
    
    public boolean creerMarque(String nom, String origine) {
        try {
            if (em.find(Marque.class, nom) != null) {
                return false;
            }
            Marque marque = new Marque(nom, origine);
            em.persist(marque);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    public boolean supprimerMarque(String nom) {
        try {
            Marque marque = em.find(Marque.class, nom);
            if (marque != null) {
                // Supprimer d'abord les entrées de stock pour tous les produits de la marque
                em.createQuery("DELETE FROM Stock s WHERE s.produit.marque.nom = :nomMarque")
                  .setParameter("nomMarque", nom)
                  .executeUpdate();
                
                // Supprimer tous les produits de la marque
                em.createQuery("DELETE FROM Produit p WHERE p.marque.nom = :nomMarque")
                  .setParameter("nomMarque", nom)
                  .executeUpdate();
                
                // Supprimer la marque
                em.remove(marque);
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace(); // Pour le débogage
            return false;
        }
    }
    
    public List<Marque> listerMarques() {
        return em.createQuery("SELECT m FROM Marque m", Marque.class)
                 .getResultList();
    }
    
    public boolean ajouterProduitAMarque(String nomMarque, Produit p) {
        try {
            Marque marque = em.find(Marque.class, nomMarque);
            if (marque != null) {
                marque.addProduit(p);
                em.merge(marque);
                return true;
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }
} 