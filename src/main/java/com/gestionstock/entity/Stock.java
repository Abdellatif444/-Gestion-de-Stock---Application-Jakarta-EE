package com.gestionstock.entity;

import jakarta.persistence.*;
import java.io.Serializable;

@Entity
public class Stock implements Serializable {
    @Id
    private String nom;
    
    @Convert(converter = ListeDeStockConverter.class)
    @Column(columnDefinition = "TEXT")
    private ListeDeStock listeDeStock;
    
    public Stock() {
        this.listeDeStock = new ListeDeStock();
    }
    
    public Stock(String nom) {
        this.nom = nom;
        this.listeDeStock = new ListeDeStock();
    }
    
    // Getters et Setters
    public String getNom() {
        return nom;
    }
    
    public void setNom(String nom) {
        this.nom = nom;
    }
    
    public ListeDeStock getListeDeStock() {
        return listeDeStock;
    }
    
    public void setListeDeStock(ListeDeStock listeDeStock) {
        this.listeDeStock = listeDeStock;
    }
} 