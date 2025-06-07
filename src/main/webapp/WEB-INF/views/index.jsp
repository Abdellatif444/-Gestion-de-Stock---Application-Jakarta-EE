<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tableau de Bord - Gestion Stock</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .stat-card {
            transition: transform 0.2s;
        }
        .stat-card:hover {
            transform: translateY(-5px);
        }
        .action-card {
            transition: all 0.2s;
            text-decoration: none;
            color: inherit;
        }
        .action-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .icon-lg {
            font-size: 2.5rem;
        }
        .chart-container {
            height: 300px;
            position: relative;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <!-- En-tête -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="h3">Tableau de Bord</h1>
            <div class="btn-group">
                <button type="button" class="btn btn-outline-primary" onclick="refreshData()">
                    <i class="bi bi-arrow-clockwise"></i> Actualiser
                </button>
            </div>
        </div>

        <!-- Statistiques -->
        <div class="row g-4 mb-4">
            <!-- Total Marques -->
            <div class="col-md-6 col-lg-3">
                <div class="card stat-card h-100">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="flex-shrink-0 me-3">
                                <div class="p-3 rounded-circle bg-primary bg-opacity-10">
                                    <i class="bi bi-tags text-primary icon-lg"></i>
                                </div>
                            </div>
                            <div>
                                <h6 class="text-muted mb-1">Total Marques</h6>
                                <h3 class="mb-0">${totalMarques}</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Total Produits -->
            <div class="col-md-6 col-lg-3">
                <div class="card stat-card h-100">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="flex-shrink-0 me-3">
                                <div class="p-3 rounded-circle bg-success bg-opacity-10">
                                    <i class="bi bi-box-seam text-success icon-lg"></i>
                                </div>
                            </div>
                            <div>
                                <h6 class="text-muted mb-1">Total Produits</h6>
                                <h3 class="mb-0">${totalProduits}</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Valeur Stock -->
            <div class="col-md-6 col-lg-3">
                <div class="card stat-card h-100">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="flex-shrink-0 me-3">
                                <div class="p-3 rounded-circle bg-warning bg-opacity-10">
                                    <i class="bi bi-currency-euro text-warning icon-lg"></i>
                                </div>
                            </div>
                            <div>
                                <h6 class="text-muted mb-1">Valeur Stock</h6>
                                <h3 class="mb-0">
                                    <fmt:formatNumber value="${valeurStock}" type="currency" currencySymbol="€"/>
                                </h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Mouvements du Jour -->
            <div class="col-md-6 col-lg-3">
                <div class="card stat-card h-100">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="flex-shrink-0 me-3">
                                <div class="p-3 rounded-circle bg-info bg-opacity-10">
                                    <i class="bi bi-arrow-left-right text-info icon-lg"></i>
                                </div>
                            </div>
                            <div>
                                <h6 class="text-muted mb-1">Mouvements du Jour</h6>
                                <h3 class="mb-0">${mouvementsJour}</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Actions Rapides -->
        <div class="row g-4 mb-4">
            <div class="col-12">
                <h2 class="h5 mb-3">Actions Rapides</h2>
            </div>
            <div class="col-md-6 col-lg-3">
                <a href="${pageContext.request.contextPath}/marques/ajouter" class="card action-card h-100">
                    <div class="card-body text-center">
                        <i class="bi bi-plus-circle text-primary mb-3" style="font-size: 2rem;"></i>
                        <h5 class="card-title">Nouvelle Marque</h5>
                        <p class="card-text text-muted">Ajouter une nouvelle marque au catalogue</p>
                    </div>
                </a>
            </div>
            <div class="col-md-6 col-lg-3">
                <a href="${pageContext.request.contextPath}/produits/ajouter" class="card action-card h-100">
                    <div class="card-body text-center">
                        <i class="bi bi-box-seam text-success mb-3" style="font-size: 2rem;"></i>
                        <h5 class="card-title">Nouveau Produit</h5>
                        <p class="card-text text-muted">Ajouter un nouveau produit au catalogue</p>
                    </div>
                </a>
            </div>
            <div class="col-md-6 col-lg-3">
                <a href="${pageContext.request.contextPath}/stocks/entree" class="card action-card h-100">
                    <div class="card-body text-center">
                        <i class="bi bi-box-arrow-in-down text-warning mb-3" style="font-size: 2rem;"></i>
                        <h5 class="card-title">Entrée Stock</h5>
                        <p class="card-text text-muted">Enregistrer une entrée en stock</p>
                    </div>
                </a>
            </div>
            <div class="col-md-6 col-lg-3">
                <a href="${pageContext.request.contextPath}/stocks/sortie" class="card action-card h-100">
                    <div class="card-body text-center">
                        <i class="bi bi-box-arrow-up text-danger mb-3" style="font-size: 2rem;"></i>
                        <h5 class="card-title">Sortie Stock</h5>
                        <p class="card-text text-muted">Enregistrer une sortie de stock</p>
                    </div>
                </a>
            </div>
        </div>

        <!-- Derniers Mouvements -->
        <div class="row mb-4">
            <div class="col-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="card-title mb-0">Derniers Mouvements</h5>
                        <a href="${pageContext.request.contextPath}/stocks" class="btn btn-sm btn-outline-primary">
                            Voir tout
                        </a>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Date</th>
                                        <th>Type</th>
                                        <th>Produit</th>
                                        <th>Quantité</th>
                                        <th>Stock</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${derniersMouvements}" var="mouvement">
                                        <tr>
                                            <td>
                                                <fmt:formatDate value="${mouvement.date}" pattern="dd/MM/yyyy HH:mm"/>
                                            </td>
                                            <td>
                                                <span class="badge ${mouvement.type == 'ENTREE' ? 'bg-success' : 'bg-danger'}">
                                                    ${mouvement.type}
                                                </span>
                                            </td>
                                            <td>${mouvement.produit.reference} - ${mouvement.produit.denomination}</td>
                                            <td>${mouvement.quantite}</td>
                                            <td>${mouvement.stock.nom}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Produits en Rupture -->
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="card-title mb-0">Alertes Stock</h5>
                        <button type="button" class="btn btn-sm btn-outline-danger" onclick="exporterAlertes()">
                            <i class="bi bi-download"></i> Exporter
                        </button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Produit</th>
                                        <th>Stock</th>
                                        <th>Quantité</th>
                                        <th>Seuil</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${alertesStock}" var="alerte">
                                        <tr>
                                            <td>${alerte.produit.reference} - ${alerte.produit.denomination}</td>
                                            <td>${alerte.stock.nom}</td>
                                            <td>
                                                <span class="text-danger fw-bold">${alerte.quantite}</span>
                                            </td>
                                            <td>${alerte.seuil}</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/stocks/entree?produit=${alerte.produit.reference}&stock=${alerte.stock.nom}" 
                                                   class="btn btn-sm btn-outline-primary">
                                                    <i class="bi bi-plus-circle"></i> Réapprovisionner
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function refreshData() {
            location.reload();
        }

        function exporterAlertes() {
            window.location.href = '${pageContext.request.contextPath}/stocks/alertes/export';
        }
    </script>
</body>
</html> 