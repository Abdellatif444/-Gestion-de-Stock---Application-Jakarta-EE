package com.gestionstock.service;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.NoResultException;
import com.gestionstock.entity.Utilisateur;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

@Stateless
public class ServiceAuthentification {
    
    @PersistenceContext
    private EntityManager em;
    
    public Utilisateur authentifier(String login, String motDePasse) {
        try {
            String motDePasseHash = hashMotDePasse(motDePasse);
            return em.createQuery(
                "SELECT u FROM Utilisateur u WHERE u.login = :login AND u.motDePasse = :mdp",
                Utilisateur.class)
                .setParameter("login", login)
                .setParameter("mdp", motDePasseHash)
                .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
    
    public boolean creerUtilisateur(String login, String motDePasse, String nom, String role) {
        try {
            // Vérification si le login existe déjà
            if (em.find(Utilisateur.class, login) != null) {
                return false;
            }
            
            // Validation des données
            if (!validerDonnees(login, motDePasse, nom)) {
                return false;
            }
            
            // Hashage du mot de passe
            String motDePasseHash = hashMotDePasse(motDePasse);
            
            // Création de l'utilisateur
            Utilisateur utilisateur = new Utilisateur(login, motDePasseHash, nom, role);
            em.persist(utilisateur);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    private boolean validerDonnees(String login, String motDePasse, String nom) {
        return login != null && login.matches("[a-zA-Z0-9]{3,20}") &&
               motDePasse != null && motDePasse.length() >= 6 &&
               nom != null && !nom.trim().isEmpty();
    }
    
    private String hashMotDePasse(String motDePasse) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(motDePasse.getBytes(StandardCharsets.UTF_8));
            return Base64.getEncoder().encodeToString(hash);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Erreur lors du hashage du mot de passe", e);
        }
    }
} 