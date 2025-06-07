package com.gestionstock.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.gestionstock.service.ServiceAuthentification;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    
    @EJB
    private ServiceAuthentification serviceAuth;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String login = request.getParameter("login");
        String motDePasse = request.getParameter("motDePasse");
        String confirmMotDePasse = request.getParameter("confirmMotDePasse");
        String nom = request.getParameter("nom");
        
        // Validation côté serveur
        if (login == null || !login.matches("[a-zA-Z0-9]{3,20}")) {
            request.setAttribute("error", "Le login doit contenir entre 3 et 20 caractères alphanumériques");
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
            return;
        }
        
        if (motDePasse == null || motDePasse.length() < 6) {
            request.setAttribute("error", "Le mot de passe doit contenir au moins 6 caractères");
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
            return;
        }
        
        if (!motDePasse.equals(confirmMotDePasse)) {
            request.setAttribute("error", "Les mots de passe ne correspondent pas");
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
            return;
        }
        
        if (nom == null || nom.trim().isEmpty()) {
            request.setAttribute("error", "Le nom est requis");
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
            return;
        }
        
        // Tentative de création de l'utilisateur
        if (serviceAuth.creerUtilisateur(login, motDePasse, nom, "USER")) {
            request.getSession().setAttribute("success", "Inscription réussie ! Vous pouvez maintenant vous connecter.");
            response.sendRedirect(request.getContextPath() + "/login");
        } else {
            request.setAttribute("error", "Ce login est déjà utilisé ou une erreur est survenue");
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
        }
    }
} 