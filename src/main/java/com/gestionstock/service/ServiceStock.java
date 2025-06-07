package com.gestionstock.service;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import com.gestionstock.entity.Stock;
import com.gestionstock.entity.Produit;
import java.util.List;
import java.util.Date;

@Stateless
public class ServiceStock {
    
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
} 