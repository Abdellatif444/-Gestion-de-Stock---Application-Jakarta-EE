package com.gestionstock.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.gestionstock.service.ServiceAuthentification;
import com.gestionstock.entity.Utilisateur;
import java.io.IOException;

@WebServlet(urlPatterns = {"/login", "/logout"})
public class AuthServlet extends HttpServlet {
    
    @EJB
    private ServiceAuthentification serviceAuth;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getServletPath();
        
        if ("/logout".equals(action)) {
            request.getSession().invalidate();
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String login = request.getParameter("login");
        String motDePasse = request.getParameter("motDePasse");
        
        Utilisateur utilisateur = serviceAuth.authentifier(login, motDePasse);
        
        if (utilisateur != null) {
            HttpSession session = request.getSession();
            session.setAttribute("utilisateur", utilisateur);
            response.sendRedirect(request.getContextPath() + "/");
        } else {
            request.setAttribute("error", "Login ou mot de passe incorrect");
            request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
        }
    }
} 