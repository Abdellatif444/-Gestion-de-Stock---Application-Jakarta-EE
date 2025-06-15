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

    public void ajouterElement(ElementDeStock element) {
        liste.add(element);
    }

    public void retirerElement(ElementDeStock element) {
        liste.remove(element);
    }

    public ElementDeStock trouverElement(String refProduit) {
        return liste.stream()
                .filter(e -> e.getRefProduit().equals(refProduit))
                .findFirst()
                .orElse(null);
    }
} 