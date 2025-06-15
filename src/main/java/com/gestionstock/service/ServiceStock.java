package com.gestionstock.service;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import com.gestionstock.entity.Stock;
import com.gestionstock.entity.Produit;
import java.util.List;
import java.util.Date;
import java.util.ArrayList;

@Stateless
public class ServiceStock {
    
    private static final int SEUIL_ALERTE_STOCK = 5;
    
    @PersistenceContext
    private EntityManager em;
    
    public List<Stock> listerStocks() {
        return em.createQuery("SELECT s FROM Stock s ORDER BY s.date DESC", Stock.class)
                 .getResultList();
    }
    
    public List<Stock> getDerniersMouvements(int limit) {
        return em.createQuery("SELECT s FROM Stock s ORDER BY s.date DESC", Stock.class)
                 .setMaxResults(limit)
                 .getResultList();
    }
    
    public boolean entreeStock(String referenceProduit, int quantite) {
        try {
            Produit produit = em.find(Produit.class, referenceProduit);
            if (produit == null) {
                return false;
            }
            
            Stock stock = new Stock();
            stock.setProduit(produit);
            stock.setQuantite(quantite);
            stock.setType("ENTREE");
            stock.setDate(new Date());
            
            em.persist(stock);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    public boolean sortieStock(String referenceProduit, int quantite) {
        try {
            Produit produit = em.find(Produit.class, referenceProduit);
            if (produit == null) {
                return false;
            }
            
            // Vérifier si le stock est suffisant
            int stockActuel = getStockProduit(referenceProduit);
            if (stockActuel < quantite) {
                return false;
            }
            
            Stock stock = new Stock();
            stock.setProduit(produit);
            stock.setQuantite(-quantite); // Négatif pour une sortie
            stock.setType("SORTIE");
            stock.setDate(new Date());
            
            em.persist(stock);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    public int getStockProduit(String referenceProduit) {
        try {
            return em.createQuery(
                "SELECT COALESCE(SUM(s.quantite), 0) FROM Stock s WHERE s.produit.reference = :ref", 
                Long.class)
                .setParameter("ref", referenceProduit)
                .getSingleResult()
                .intValue();
        } catch (Exception e) {
            return 0;
        }
    }
    
    public List<Produit> getProduitsStockBas() {
        List<Produit> produitsStockBas = new ArrayList<>();
        List<Produit> tousProduits = em.createQuery("SELECT p FROM Produit p", Produit.class)
                                     .getResultList();
        
        for (Produit produit : tousProduits) {
            int stockActuel = getStockProduit(produit.getReference());
            if (stockActuel <= SEUIL_ALERTE_STOCK) {
                produitsStockBas.add(produit);
            }
        }
        
        return produitsStockBas;
    }
    
    public boolean isStockBas(String referenceProduit) {
        return getStockProduit(referenceProduit) <= SEUIL_ALERTE_STOCK;
    }
    
    public long getNombreTotalProduits() {
        return em.createQuery("SELECT COUNT(p) FROM Produit p", Long.class)
                 .getSingleResult();
    }
    
    public long getNombreProduitsEnStock() {
        return em.createQuery(
            "SELECT COUNT(DISTINCT s.produit) FROM Stock s WHERE s.quantite > 0", 
            Long.class)
            .getSingleResult();
    }
    
    public long getNombreProduitsStockBas() {
        return getProduitsStockBas().size();
    }
    
    public double getValeurTotaleStock() {
        return em.createQuery(
            "SELECT COALESCE(SUM(s.quantite * p.prix), 0) FROM Stock s JOIN s.produit p", 
            Double.class)
            .getSingleResult();
    }
} 