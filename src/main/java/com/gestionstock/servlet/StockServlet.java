package com.gestionstock.servlet;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.gestionstock.service.ServiceStock;
import com.gestionstock.service.ServiceProduit;
import java.io.IOException;

@WebServlet(urlPatterns = {"/stocks", "/stocks/*"})
public class StockServlet extends HttpServlet {
    
    @Inject
    private ServiceStock serviceStock;
    
    @Inject
    private ServiceProduit serviceProduit;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getRequestURI().substring(request.getContextPath().length());
        
        switch (action) {
            case "/stocks":
                afficherStocks(request, response);
                break;
            case "/stocks/entree":
                afficherFormEntree(request, response);
                break;
            case "/stocks/sortie":
                afficherFormSortie(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getRequestURI().substring(request.getContextPath().length());
        
        switch (action) {
            case "/stocks/entree":
                traiterEntreeStock(request, response);
                break;
            case "/stocks/sortie":
                traiterSortieStock(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
    
    private void afficherStocks(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setAttribute("stocks", serviceStock.listerStocks());
        request.setAttribute("produits", serviceProduit.listerProduits());
        request.getRequestDispatcher("/WEB-INF/views/stocks/liste.jsp").forward(request, response);
    }
    
    private void afficherFormEntree(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setAttribute("produits", serviceProduit.listerProduits());
        request.getRequestDispatcher("/WEB-INF/views/stocks/entree.jsp").forward(request, response);
    }
    
    private void afficherFormSortie(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setAttribute("produits", serviceProduit.listerProduits());
        request.getRequestDispatcher("/WEB-INF/views/stocks/sortie.jsp").forward(request, response);
    }
    
    private void traiterEntreeStock(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String reference = request.getParameter("produit");
        int quantite = Integer.parseInt(request.getParameter("quantite"));
        
        if (serviceStock.entreeStock(reference, quantite)) {
            request.getSession().setAttribute("successMessage", "Entrée en stock effectuée avec succès");
        } else {
            request.getSession().setAttribute("errorMessage", "Erreur lors de l'entrée en stock");
        }
        
        response.sendRedirect(request.getContextPath() + "/stocks");
    }
    
    private void traiterSortieStock(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String reference = request.getParameter("produit");
        int quantite = Integer.parseInt(request.getParameter("quantite"));
        
        if (serviceStock.sortieStock(reference, quantite)) {
            request.getSession().setAttribute("successMessage", "Sortie de stock effectuée avec succès");
        } else {
            request.getSession().setAttribute("errorMessage", "Stock insuffisant ou erreur lors de la sortie");
        }
        
        response.sendRedirect(request.getContextPath() + "/stocks");
    }
} 