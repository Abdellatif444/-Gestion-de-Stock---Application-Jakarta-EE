package com.gestionstock.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class ListeDeStock implements Serializable {
    private List<ElementDeStock> liste;
    
    public ListeDeStock() {
        this.liste = new ArrayList<>();
    }
    
    public List<ElementDeStock> getListe() {
        return liste;
    }
    
    public void setListe(List<ElementDeStock> liste) {
        this.liste = liste;
    }
    
    public ElementDeStock trouverElement(String refProduit) {
        return liste.stream()
                   .filter(e -> e.getRefProduit().equals(refProduit))
                   .findFirst()
                   .orElse(null);
    }
    
    public void ajouterOuMettreAJour(ElementDeStock element) {
        ElementDeStock existant = trouverElement(element.getRefProduit());
        if (existant != null) {
            existant.ajouterQuantite(element.getQuantite());
        } else {
            liste.add(element);
        }
    }
    
    public boolean retirerQuantite(String refProduit, int quantite) {
        ElementDeStock element = trouverElement(refProduit);
        if (element != null) {
            return element.retirerQuantite(quantite);
        }
        return false;
    }
} 