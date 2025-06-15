package com.gestionstock.service;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import com.gestionstock.entity.Stock;
import com.gestionstock.entity.ElementDeStock;
import com.gestionstock.entity.ListeDeStock;
import java.util.List;
import java.util.ArrayList;

@Stateless
public class ServiceStock {
    
    @PersistenceContext
    private EntityManager em;
    
    public boolean creerStock(String nom) {
        try {
            if (em.find(Stock.class, nom) != null) {
                return false;
            }
            Stock stock = new Stock(nom);
            em.persist(stock);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    public boolean entreeStock(String nomStock, String refProduit, int quantite) {
        try {
            Stock stock = em.find(Stock.class, nomStock);
            if (stock == null) {
                return false;
            }
            
            ListeDeStock liste = stock.getListeDeStock();
            ElementDeStock element = liste.trouverElement(refProduit);
            
            if (element == null) {
                element = new ElementDeStock(refProduit, quantite);
                liste.ajouterElement(element);
            } else {
                element.ajouterQuantite(quantite);
            }
            
            em.merge(stock);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    public boolean sortieStock(String nomStock, String refProduit, int quantite) {
        try {
            Stock stock = em.find(Stock.class, nomStock);
            if (stock == null) {
                return false;
            }
            
            ListeDeStock liste = stock.getListeDeStock();
            ElementDeStock element = liste.trouverElement(refProduit);
            
            if (element == null || !element.retirerQuantite(quantite)) {
                return false;
            }
            
            em.merge(stock);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    public boolean modifierQuantite(String nomStock, String refProduit, int nouvelleQuantite) {
        try {
            Stock stock = em.find(Stock.class, nomStock);
            if (stock == null) {
                return false;
            }
            
            ListeDeStock liste = stock.getListeDeStock();
            ElementDeStock element = liste.trouverElement(refProduit);
            
            if (element == null) {
                element = new ElementDeStock(refProduit, nouvelleQuantite);
                liste.ajouterElement(element);
            } else {
                element.setQuantite(nouvelleQuantite);
            }
            
            em.merge(stock);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    public List<ElementDeStock> consulterStock(String nomStock) {
        try {
            Stock stock = em.find(Stock.class, nomStock);
            if (stock == null) {
                return new ArrayList<>();
            }
            return stock.getListeDeStock().getListe();
        } catch (Exception e) {
            return new ArrayList<>();
        }
    }
    
    public List<ElementDeStock> consulterStockGlobal() {
        try {
            List<Stock> stocks = em.createQuery("SELECT s FROM Stock s", Stock.class)
                                 .getResultList();
            
            List<ElementDeStock> stockGlobal = new ArrayList<>();
            for (Stock stock : stocks) {
                for (ElementDeStock element : stock.getListeDeStock().getListe()) {
                    ElementDeStock elementGlobal = stockGlobal.stream()
                            .filter(e -> e.getRefProduit().equals(element.getRefProduit()))
                            .findFirst()
                            .orElse(new ElementDeStock(element.getRefProduit(), 0));
                    
                    if (!stockGlobal.contains(elementGlobal)) {
                        stockGlobal.add(elementGlobal);
                    }
                    elementGlobal.ajouterQuantite(element.getQuantite());
                }
            }
            return stockGlobal;
        } catch (Exception e) {
            return new ArrayList<>();
        }
    }
    
    public List<Stock> tousLesStocks() {
        return em.createQuery("SELECT s FROM Stock s", Stock.class)
                 .getResultList();
    }
} 