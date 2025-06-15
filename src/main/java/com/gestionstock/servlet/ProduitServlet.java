package com.gestionstock.servlet;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.gestionstock.service.ServiceProduit;
import com.gestionstock.service.ServiceMarque;
import java.io.IOException;

@WebServlet(urlPatterns = {"/produits", "/produits/*"})
public class ProduitServlet extends HttpServlet {
    
    @Inject
    private ServiceProduit serviceProduit;
    
    @Inject
    private ServiceMarque serviceMarque;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String marqueFilter = request.getParameter("marque");
        
        request.setAttribute("marques", serviceMarque.listerMarques());
        if (marqueFilter != null && !marqueFilter.isEmpty()) {
            request.setAttribute("produits", serviceProduit.listerProduitsParMarque(marqueFilter));
        } else {
            request.setAttribute("produits", serviceProduit.listerProduits());
        }
        
        request.getRequestDispatcher("/WEB-INF/views/produits/liste.jsp")
               .forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getRequestURI().substring(request.getContextPath().length());
        
        switch (action) {
            case "/produits/ajouter":
                ajouterProduit(request, response);
                break;
            case "/produits/modifier":
                modifierProduit(request, response);
                break;
            case "/produits/supprimer":
                supprimerProduit(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
    
    private void ajouterProduit(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        try {
            String reference = request.getParameter("reference");
            String nomMarque = request.getParameter("marque");
            String denomination = request.getParameter("denomination");
            double prix = Double.parseDouble(request.getParameter("prix"));
            double poids = Double.parseDouble(request.getParameter("poids"));
            double volume = Double.parseDouble(request.getParameter("volume"));
            
            if (serviceProduit.creerProduit(reference, nomMarque, denomination, prix, poids, volume)) {
                response.sendRedirect(request.getContextPath() + "/produits");
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Impossible de créer le produit");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Données invalides");
        }
    }
    
    private void modifierProduit(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        try {
            String reference = request.getParameter("reference");
            String denomination = request.getParameter("denomination");
            double prix = Double.parseDouble(request.getParameter("prix"));
            double poids = Double.parseDouble(request.getParameter("poids"));
            double volume = Double.parseDouble(request.getParameter("volume"));
            
            if (serviceProduit.modifierProduit(reference, denomination, prix, poids, volume)) {
                response.sendRedirect(request.getContextPath() + "/produits");
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Impossible de modifier le produit");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Données invalides");
        }
    }
    
    private void supprimerProduit(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        String reference = request.getParameter("reference");
        
        if (serviceProduit.supprimerProduit(reference)) {
            response.sendRedirect(request.getContextPath() + "/produits");
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Impossible de supprimer le produit");
        }
    }
} 