<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="row mb-4">
    <div class="col-md-12">
        <h1 class="display-4 mb-4">
            <i class="bi bi-box-arrow-in-down me-3"></i>Entrée en stock
        </h1>
    </div>
</div>

<div class="row">
    <div class="col-md-8 mx-auto">
        <div class="card">
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/stocks/entree" method="post" class="needs-validation" novalidate>
                    <div class="mb-4">
                        <label for="produit" class="form-label">Produit</label>
                        <select name="produit" id="produit" class="form-select" required>
                            <option value="">Sélectionner un produit</option>
                            <c:forEach items="${produits}" var="produit">
                                <option value="${produit.reference}" ${param.produit eq produit.reference ? 'selected' : ''}>
                                    ${produit.denomination} (${produit.marque.nom})
                                </option>
                            </c:forEach>
                        </select>
                        <div class="invalid-feedback">
                            Veuillez sélectionner un produit
                        </div>
                    </div>
                    
                    <div class="mb-4">
                        <label for="quantite" class="form-label">Quantité</label>
                        <input type="number" name="quantite" id="quantite" class="form-control" min="1" required>
                        <div class="invalid-feedback">
                            Veuillez entrer une quantité valide (minimum 1)
                        </div>
                    </div>
                    
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-success">
                            <i class="bi bi-check-circle me-2"></i>Valider l'entrée
                        </button>
                        <a href="${pageContext.request.contextPath}/stocks" class="btn btn-outline-secondary">
                            <i class="bi bi-arrow-left me-2"></i>Retour à la liste
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div> 