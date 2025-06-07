package com.gestionstock.entity;

import jakarta.persistence.*;

@Entity
public class Produit {
    @Id
    private String reference;
    
    @ManyToOne
    @JoinColumn(name = "marque_nom", nullable = false)
    private Marque marque;
    
    private String denomination;
    private double prix;
    private double poids;
    private double volume;
    
    // Constructeurs
    public Produit() {}
    
    public Produit(String reference, Marque marque, String denomination, double prix, double poids, double volume) {
        this.reference = reference;
        this.marque = marque;
        this.denomination = denomination;
        this.prix = prix;
        this.poids = poids;
        this.volume = volume;
    }
    
    // Getters et Setters
    public String getReference() {
        return reference;
    }
    
    public void setReference(String reference) {
        this.reference = reference;
    }
    
    public Marque getMarque() {
        return marque;
    }
    
    public void setMarque(Marque marque) {
        this.marque = marque;
    }
    
    public String getDenomination() {
        return denomination;
    }
    
    public void setDenomination(String denomination) {
        this.denomination = denomination;
    }
    
    public double getPrix() {
        return prix;
    }
    
    public void setPrix(double prix) {
        this.prix = prix;
    }
    
    public double getPoids() {
        return poids;
    }
    
    public void setPoids(double poids) {
        this.poids = poids;
    }
    
    public double getVolume() {
        return volume;
    }
    
    public void setVolume(double volume) {
        this.volume = volume;
    }
} 