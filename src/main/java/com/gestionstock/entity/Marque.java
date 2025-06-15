package com.gestionstock.entity;

import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Marque {
    @Id
    private String nom;
    
    private String origine;
    
    @OneToMany(mappedBy = "marque", cascade = CascadeType.ALL)
    private List<Produit> listeProduits = new ArrayList<>();
    
    // Constructeurs
    public Marque() {}
    
    public Marque(String nom, String origine) {
        this.nom = nom;
        this.origine = origine;
    }
    
    // Getters et Setters
    public String getNom() {
        return nom;
    }
    
    public void setNom(String nom) {
        this.nom = nom;
    }
    
    public String getOrigine() {
        return origine;
    }
    
    public void setOrigine(String origine) {
        this.origine = origine;
    }
    
    public List<Produit> getListeProduits() {
        return listeProduits;
    }
    
    public void setListeProduits(List<Produit> listeProduits) {
        this.listeProduits = listeProduits;
    }
    
    // Méthode utilitaire pour ajouter un produit
    public void addProduit(Produit produit) {
        listeProduits.add(produit);
        produit.setMarque(this);
    }
} 