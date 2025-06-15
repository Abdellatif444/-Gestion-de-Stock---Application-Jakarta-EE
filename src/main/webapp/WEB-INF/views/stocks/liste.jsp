<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="fade-in">
    <h2 class="mb-4">Gestion des Stocks</h2>
    
    <!-- Formulaire de création de stock -->
    <div class="card mb-4">
        <div class="card-body">
            <h5 class="card-title">Créer un nouveau stock</h5>
            <form action="${pageContext.request.contextPath}/stocks/creer" method="post" class="row g-3">
                <div class="col-md-6">
                    <input type="text" name="nom" class="form-control" placeholder="Nom du stock" required>
                </div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-plus-circle me-2"></i>Créer
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- Stock global -->
    <div class="card mb-4">
        <div class="card-header">
            <h5 class="card-title mb-0">Stock Global</h5>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Référence Produit</th>
                            <th>Quantité Totale</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${stockGlobal}" var="element">
                            <tr>
                                <td>${element.refProduit}</td>
                                <td>${element.quantite}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Liste des stocks -->
    <div class="card">
        <div class="card-header">
            <h5 class="card-title mb-0">Stocks par Site</h5>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Nom du Stock</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${stocks}" var="stock">
                            <tr>
                                <td>${stock.nom}</td>
                                <td>
                                    <div class="btn-group">
                                        <a href="${pageContext.request.contextPath}/stocks/entree" 
                                           class="btn btn-sm btn-outline-success">
                                            <i class="bi bi-plus-circle me-1"></i>Entrée
                                        </a>
                                        <a href="${pageContext.request.contextPath}/stocks/sortie" 
                                           class="btn btn-sm btn-outline-warning">
                                            <i class="bi bi-dash-circle me-1"></i>Sortie
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