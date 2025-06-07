package com.gestionstock.entity;

import jakarta.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "utilisateurs")
public class Utilisateur implements Serializable {
    
    @Id
    private String login;
    
    @Column(nullable = false)
    private String motDePasse;
    
    @Column(nullable = false)
    private String nom;
    
    @Column(nullable = false)
    private String role;
    
    public Utilisateur() {}
    
    public Utilisateur(String login, String motDePasse, String nom, String role) {
        this.login = login;
        this.motDePasse = motDePasse;
        this.nom = nom;
        this.role = role;
    }
    
    // Getters et Setters
    public String getLogin() {
        return login;
    }
    
    public void setLogin(String login) {
        this.login = login;
    }
    
    public String getMotDePasse() {
        return motDePasse;
    }
    
    public void setMotDePasse(String motDePasse) {
        this.motDePasse = motDePasse;
    }
    
    public String getNom() {
        return nom;
    }
    
    public void setNom(String nom) {
        this.nom = nom;
    }
    
    public String getRole() {
        return role;
    }
    
    public void setRole(String role) {
        this.role = role;
    }
} 