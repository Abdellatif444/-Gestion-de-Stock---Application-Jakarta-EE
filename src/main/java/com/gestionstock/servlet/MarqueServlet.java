package com.gestionstock.servlet;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.gestionstock.service.ServiceMarque;
import java.io.IOException;

@WebServlet(urlPatterns = {"/marques", "/marques/*"})
public class MarqueServlet extends HttpServlet {
    
    @Inject
    private ServiceMarque serviceMarque;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setAttribute("marques", serviceMarque.listerMarques());
        request.getRequestDispatcher("/WEB-INF/views/marques/liste.jsp")
               .forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getRequestURI().substring(request.getContextPath().length());
        
        switch (action) {
            case "/marques/ajouter":
                ajouterMarque(request, response);
                break;
            case "/marques/supprimer":
                supprimerMarque(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
    
    private void ajouterMarque(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        String nom = request.getParameter("nom");
        String origine = request.getParameter("origine");
        
        if (serviceMarque.creerMarque(nom, origine)) {
            response.sendRedirect(request.getContextPath() + "/marques");
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Impossible de créer la marque");
        }
    }
    
    private void supprimerMarque(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        String nom = request.getParameter("nom");
        
        if (serviceMarque.supprimerMarque(nom)) {
            response.sendRedirect(request.getContextPath() + "/marques");
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Impossible de supprimer la marque");
        }
    }
} 