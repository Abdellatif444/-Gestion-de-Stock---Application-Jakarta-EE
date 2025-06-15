<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
    .navbar {
        background: linear-gradient(135deg, #2c3e50 0%, #3498db 100%);
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        padding: 1rem 0;
    }
    
    .navbar-brand {
        color: white !important;
        font-weight: 700;
        font-size: 1.5rem;
        padding: 0.5rem 1rem;
        border-radius: 10px;
        transition: all 0.3s ease;
    }
    
    .navbar-brand:hover {
        background: rgba(255,255,255,0.1);
        transform: translateY(-2px);
    }
    
    .nav-link {
        color: rgba(255,255,255,0.9) !important;
        font-weight: 500;
        padding: 0.5rem 1rem !important;
        margin: 0 0.2rem;
        border-radius: 8px;
        transition: all 0.3s ease;
    }
    
    .nav-link:hover {
        color: white !important;
        background: rgba(255,255,255,0.1);
        transform: translateY(-2px);
    }
    
    .nav-link.active {
        background: rgba(255,255,255,0.2);
        color: white !important;
    }
    
    .nav-link i {
        margin-right: 0.5rem;
    }
    
    .navbar-toggler {
        border: none;
        padding: 0.5rem;
    }
    
    .navbar-toggler:focus {
        box-shadow: none;
    }
    
    .navbar-toggler-icon {
        background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3e%3cpath stroke='rgba%28255, 255, 255, 0.9%29' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
    }
</style>

<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            <i class="bi bi-box-seam-fill me-2"></i>
            Gestion Stock
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link ${currentPage eq 'accueil' ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/">
                        <i class="bi bi-house-door"></i>
                        Accueil
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${currentPage eq 'produits' ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/produits">
                        <i class="bi bi-box"></i>
                        Produits
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${currentPage eq 'marques' ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/marques">
                        <i class="bi bi-tags"></i>
                        Marques
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${currentPage eq 'stocks' ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/stocks">
                        <i class="bi bi-box-seam"></i>
                        Stocks
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav> 