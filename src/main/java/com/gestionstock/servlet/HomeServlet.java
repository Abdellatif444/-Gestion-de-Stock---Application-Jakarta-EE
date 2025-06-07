package com.gestionstock.servlet;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.gestionstock.service.ServiceProduit;
import com.gestionstock.service.ServiceMarque;
import com.gestionstock.service.ServiceStock;
import java.io.IOException;

@WebServlet("")
public class HomeServlet extends HttpServlet {
    
    @Inject
    private ServiceProduit serviceProduit;
    
    @Inject
    private ServiceMarque serviceMarque;
    
    @Inject
    private ServiceStock serviceStock;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Récupération des statistiques
        request.setAttribute("totalProduits", serviceProduit.listerProduits().size());
        request.setAttribute("totalMarques", serviceMarque.listerMarques().size());
        request.setAttribute("totalStocks", serviceStock.listerStocks().size());
        
        // Récupération des derniers mouvements
        request.setAttribute("derniersMouvements", serviceStock.getDerniersMouvements(5));
        
        // Affichage de la page d'accueil
        request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
    }
} 