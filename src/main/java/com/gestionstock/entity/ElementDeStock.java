package com.gestionstock.entity;

import java.io.Serializable;

public class ElementDeStock implements Serializable {
    private String refProduit;
    private int quantite;

    public ElementDeStock() {}

    public ElementDeStock(String refProduit, int quantite) {
        this.refProduit = refProduit;
        this.quantite = quantite;
    }

    public String getRefProduit() {
        return refProduit;
    }

    public void setRefProduit(String refProduit) {
        this.refProduit = refProduit;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    public void ajouterQuantite(int quantite) {
        this.quantite += quantite;
    }
    
    public boolean retirerQuantite(int quantite) {
        if (this.quantite >= quantite) {
            this.quantite -= quantite;
            return true;
        }
        return false;
    }
} 