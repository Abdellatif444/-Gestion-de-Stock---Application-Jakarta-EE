<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="row mb-4">
    <div class="col-md-12">
        <h1 class="display-4 mb-4">
            <i class="bi bi-boxes me-3"></i>Gestion des Stocks
        </h1>
    </div>
</div>

<!-- Actions rapides -->
<div class="row mb-4">
    <div class="col-md-6">
        <a href="${pageContext.request.contextPath}/stocks/entree" class="btn btn-success w-100">
            <i class="bi bi-box-arrow-in-down me-2"></i>Entrée en stock
        </a>
    </div>
    <div class="col-md-6">
        <a href="${pageContext.request.contextPath}/stocks/sortie" class="btn btn-warning w-100">
            <i class="bi bi-box-arrow-up me-2"></i>Sortie de stock
        </a>
    </div>
</div>

<!-- État des stocks -->
<div class="row mb-4">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h5 class="card-title mb-0">
                    <i class="bi bi-list-check me-2"></i>État des stocks
                </h5>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Produit</th>
                                <th>Marque</th>
                                <th>Stock actuel</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${produits}" var="produit">
                                <tr>
                                    <td>${produit.denomination}</td>
                                    <td>${produit.marque.nom}</td>
                                    <td>
                                        <c:set var="stockActuel" value="${serviceStock.getStockProduit(produit.reference)}"/>
                                        <span class="badge bg-${stockActuel > 0 ? 'success' : 'danger'} fs-6">
                                            ${stockActuel}
                                        </span>
                                    </td>
                                    <td>
                                        <div class="btn-group">
                                            <a href="${pageContext.request.contextPath}/stocks/entree?produit=${produit.reference}" 
                                               class="btn btn-sm btn-outline-success">
                                                <i class="bi bi-plus-circle"></i>
                                            </a>
                                            <a href="${pageContext.request.contextPath}/stocks/sortie?produit=${produit.reference}" 
                                               class="btn btn-sm btn-outline-warning">
                                                <i class="bi bi-dash-circle"></i>
                                            </a>
                                        </div>
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

<!-- Historique des mouvements -->
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h5 class="card-title mb-0">
                    <i class="bi bi-clock-history me-2"></i>Historique des mouvements
                </h5>
            </div>
            <div class="card-body">
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
                            <c:forEach items="${stocks}" var="stock">
                                <tr>
                                    <td>
                                        <fmt:formatDate value="${stock.date}" pattern="dd/MM/yyyy HH:mm"/>
                                    </td>
                                    <td>
                                        <span class="badge bg-${stock.type eq 'ENTREE' ? 'success' : 'warning'}">
                                            ${stock.type}
                                        </span>
                                    </td>
                                    <td>${stock.produit.denomination}</td>
                                    <td>${stock.quantite}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div> 