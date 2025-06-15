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
                afficherListeStocks(request, response);
                break;
            case "/stocks/entree":
                afficherFormulaireEntree(request, response);
                break;
            case "/stocks/sortie":
                afficherFormulaireSortie(request, response);
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
            case "/stocks/creer":
                creerStock(request, response);
                break;
            case "/stocks/entree":
                entreeStock(request, response);
                break;
            case "/stocks/sortie":
                sortieStock(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
    
    private void afficherListeStocks(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setAttribute("stocks", serviceStock.tousLesStocks());
        request.setAttribute("stockGlobal", serviceStock.consulterStockGlobal());
        request.getRequestDispatcher("/WEB-INF/views/stocks/liste.jsp")
               .forward(request, response);
    }
    
    private void afficherFormulaireEntree(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setAttribute("stocks", serviceStock.tousLesStocks());
        request.setAttribute("produits", serviceProduit.listerProduits());
        request.getRequestDispatcher("/WEB-INF/views/stocks/entree.jsp")
               .forward(request, response);
    }
    
    private void afficherFormulaireSortie(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setAttribute("stocks", serviceStock.tousLesStocks());
        request.setAttribute("produits", serviceProduit.listerProduits());
        request.getRequestDispatcher("/WEB-INF/views/stocks/sortie.jsp")
               .forward(request, response);
    }
    
    private void creerStock(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        String nom = request.getParameter("nom");
        
        if (serviceStock.creerStock(nom)) {
            response.sendRedirect(request.getContextPath() + "/stocks");
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Impossible de créer le stock");
        }
    }
    
    private void entreeStock(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        String nomStock = request.getParameter("stock");
        String refProduit = request.getParameter("produit");
        int quantite = Integer.parseInt(request.getParameter("quantite"));
        
        if (serviceStock.entreeStock(nomStock, refProduit, quantite)) {
            response.sendRedirect(request.getContextPath() + "/stocks");
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Impossible d'effectuer l'entrée en stock");
        }
    }
    
    private void sortieStock(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        String nomStock = request.getParameter("stock");
        String refProduit = request.getParameter("produit");
        int quantite = Integer.parseInt(request.getParameter("quantite"));
        
        if (serviceStock.sortieStock(nomStock, refProduit, quantite)) {
            response.sendRedirect(request.getContextPath() + "/stocks");
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Impossible d'effectuer la sortie de stock");
        }
    }
} 