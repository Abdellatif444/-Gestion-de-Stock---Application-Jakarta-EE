<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="row mb-4">
    <div class="col-md-12">
        <h1 class="display-4 mb-4">
            <i class="bi bi-speedometer2 me-3"></i>Tableau de bord
        </h1>
    </div>
</div>

<!-- Statistiques -->
<div class="row mb-4">
    <div class="col-md-4">
        <div class="card text-white bg-primary">
            <div class="card-body">
                <h5 class="card-title">
                    <i class="bi bi-box me-2"></i>Produits
                </h5>
                <p class="card-text display-6">${totalProduits}</p>
                <a href="${pageContext.request.contextPath}/produits" class="btn btn-light">Gérer</a>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card text-white bg-success">
            <div class="card-body">
                <h5 class="card-title">
                    <i class="bi bi-tag me-2"></i>Marques
                </h5>
                <p class="card-text display-6">${totalMarques}</p>
                <a href="${pageContext.request.contextPath}/marques" class="btn btn-light">Gérer</a>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card text-white bg-info">
            <div class="card-body">
                <h5 class="card-title">
                    <i class="bi bi-boxes me-2"></i>Stocks
                </h5>
                <p class="card-text display-6">${totalStocks}</p>
                <a href="${pageContext.request.contextPath}/stocks" class="btn btn-light">Gérer</a>
            </div>
        </div>
    </div>
</div>

<!-- Actions rapides -->
<div class="row mb-4">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h5 class="card-title mb-0">
                    <i class="bi bi-lightning me-2"></i>Actions rapides
                </h5>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-3">
                        <a href="${pageContext.request.contextPath}/produits/nouveau" class="btn btn-outline-primary w-100 mb-2">
                            <i class="bi bi-plus-circle me-2"></i>Nouveau produit
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="${pageContext.request.contextPath}/marques/nouveau" class="btn btn-outline-success w-100 mb-2">
                            <i class="bi bi-plus-circle me-2"></i>Nouvelle marque
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="${pageContext.request.contextPath}/stocks/entree" class="btn btn-outline-info w-100 mb-2">
                            <i class="bi bi-box-arrow-in-down me-2"></i>Entrée stock
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="${pageContext.request.contextPath}/stocks/sortie" class="btn btn-outline-warning w-100 mb-2">
                            <i class="bi bi-box-arrow-up me-2"></i>Sortie stock
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Derniers mouvements -->
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h5 class="card-title mb-0">
                    <i class="bi bi-clock-history me-2"></i>Derniers mouvements
                </h5>
            </div>
            <div class="card-body">
                <c:choose>
                    <c:when test="${not empty derniersMouvements}">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>Date</th>
                                        <th>Type</th>
                                        <th>Produit</th>
                                        <th>Quantité</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${derniersMouvements}" var="mouvement">
                                        <tr>
                                            <td>${mouvement.date}</td>
                                            <td>
                                                <span class="badge bg-${mouvement.type eq 'ENTREE' ? 'success' : 'warning'}">
                                                    ${mouvement.type}
                                                </span>
                                            </td>
                                            <td>${mouvement.produit.denomination}</td>
                                            <td>${mouvement.quantite}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center text-muted">
                            <i class="bi bi-inbox display-1"></i>
                            <p class="mt-3">Aucun mouvement récent</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div> 