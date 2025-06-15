<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="fade-in">
    <div class="card">
        <div class="card-header">
            <h5 class="card-title mb-0">Sortie de Stock</h5>
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/stocks/sortie" method="post" class="needs-validation" novalidate>
                <div class="mb-3">
                    <label for="stock" class="form-label">Stock *</label>
                    <select class="form-select" id="stock" name="stock" required>
                        <option value="">Sélectionnez un stock</option>
                        <c:forEach items="${stocks}" var="s">
                            <option value="${s.nom}">${s.nom}</option>
                        </c:forEach>
                    </select>
                    <div class="invalid-feedback">
                        Veuillez sélectionner un stock
                    </div>
                </div>

                <div class="mb-3">
                    <label for="produit" class="form-label">Produit *</label>
                    <select class="form-select" id="produit" name="produit" required>
                        <option value="">Sélectionnez un produit</option>
                        <c:forEach items="${produits}" var="p">
                            <option value="${p.reference}">
                                ${p.reference} - ${p.denomination} (${p.marque.nom})
                            </option>
                        </c:forEach>
                    </select>
                    <div class="invalid-feedback">
                        Veuillez sélectionner un produit
                    </div>
                </div>

                <div class="mb-3">
                    <label for="quantite" class="form-label">Quantité *</label>
                    <input type="number" class="form-control" id="quantite" name="quantite" 
                           min="1" required>
                    <div class="invalid-feedback">
                        La quantité doit être supérieure à 0
                    </div>
                </div>

                <div class="d-flex justify-content-end gap-2">
                    <a href="${pageContext.request.contextPath}/stocks" class="btn btn-secondary">
                        Annuler
                    </a>
                    <button type="submit" class="btn btn-primary">
                        Valider la sortie
                    </button>
                </div>
            </form>
        </div>
    </div>
</div> 