package com.gestionstock.service;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import com.gestionstock.entity.Marque;
import com.gestionstock.entity.Produit;
import java.util.List;

@Stateless
public class ServiceProduit {
    
    @PersistenceContext
    private EntityManager em;
    
    public boolean creerProduit(String reference, String nomMarque, String denomination, 
                              double prix, double poids, double volume) {
        try {
            if (em.find(Produit.class, reference) != null) {
                return false;
            }
            
            Marque marque = em.find(Marque.class, nomMarque);
            if (marque == null) {
                return false;
            }
            
            Produit produit = new Produit(reference, marque, denomination, prix, poids, volume);
            em.persist(produit);
            marque.addProduit(produit);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    public boolean supprimerProduit(String reference) {
        try {
            Produit produit = em.find(Produit.class, reference);
            if (produit != null) {
                em.remove(produit);
                return true;
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }
    
    public boolean modifierProduit(String reference, String denomination, 
                                 double prix, double poids, double volume) {
        try {
            Produit produit = em.find(Produit.class, reference);
            if (produit != null) {
                produit.setDenomination(denomination);
                produit.setPrix(prix);
                produit.setPoids(poids);
                produit.setVolume(volume);
                em.merge(produit);
                return true;
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }
    
    public List<Produit> listerProduits() {
        return em.createQuery("SELECT p FROM Produit p", Produit.class)
                 .getResultList();
    }
    
    public List<Produit> listerProduitsParMarque(String nomMarque) {
        return em.createQuery("SELECT p FROM Produit p WHERE p.marque.nom = :nomMarque", Produit.class)
                 .setParameter("nomMarque", nomMarque)
                 .getResultList();
    }
} 