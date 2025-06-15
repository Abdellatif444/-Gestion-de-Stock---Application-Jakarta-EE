package com.gestionstock.entity;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "stocks")
public class Stock {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne
    @JoinColumn(name = "produit_reference", nullable = false)
    private Produit produit;
    
    @Column(nullable = false)
    private int quantite;
    
    @Column(nullable = false)
    private String type;
    
    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false)
    private Date date;
    
    // Constructeurs
    public Stock() {}
    
    // Getters et Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public Produit getProduit() {
        return produit;
    }
    
    public void setProduit(Produit produit) {
        this.produit = produit;
    }
    
    public int getQuantite() {
        return quantite;
    }
    
    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }
    
    public String getType() {
        return type;
    }
    
    public void setType(String type) {
        this.type = type;
    }
    
    public Date getDate() {
        return date;
    }
    
    public void setDate(Date date) {
        this.date = date;
    }
} 