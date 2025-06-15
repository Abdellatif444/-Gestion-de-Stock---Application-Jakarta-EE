<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stock-forms.css">

<div class="container py-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="fade-in">
                <div class="stock-form-card">
                    <div class="stock-form-header">
                        <h4><i class="fas fa-minus-circle"></i> Sortie de Stock</h4>
                    </div>
                    <div class="stock-form-body">
                        <form action="${pageContext.request.contextPath}/stocks/sortie" method="post" class="needs-validation" novalidate>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="produit" class="form-label">Produit</label>
                                        <select class="form-select" id="produit" name="produit" required>
                                            <option value="">Sélectionner un produit</option>
                                            <c:forEach items="${produits}" var="produit">
                                                <option value="${produit.reference}">
                                                    ${produit.denomination} - ${produit.marque.nom} (Stock: ${serviceStock.getStockProduit(produit.reference)})
                                                </option>
                                            </c:forEach>
                                        </select>
                                        <div class="invalid-feedback">
                                            <i class="fas fa-exclamation-circle"></i> Veuillez sélectionner un produit
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="quantite" class="form-label">Quantité</label>
                                        <input type="number" class="form-control" id="quantite" name="quantite" min="1" required>
                                        <div class="invalid-feedback">
                                            <i class="fas fa-exclamation-circle"></i> Veuillez entrer une quantité valide
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="stock-info">
                                <i class="fas fa-box"></i>
                                <span id="stockActuel">Stock actuel: --</span>
                            </div>
                            
                            <div class="mt-4 d-flex gap-2">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-save"></i> Enregistrer la sortie
                                </button>
                                <a href="${pageContext.request.contextPath}/stocks" class="btn btn-outline-secondary">
                                    <i class="fas fa-arrow-left"></i> Retour
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
function updateStockActuel() {
    const produitSelect = document.getElementById('produit');
    const stockInfo = document.getElementById('stockActuel');
    
    if (produitSelect.value) {
        fetch(`${pageContext.request.contextPath}/api/stocks/produit/${produitSelect.value}`)
            .then(response => response.json())
            .then(data => {
                stockInfo.textContent = `Stock actuel: ${data.quantite}`;
            })
            .catch(error => {
                console.error('Erreur lors de la récupération du stock:', error);
                stockInfo.textContent = 'Erreur lors de la récupération du stock';
            });
    } else {
        stockInfo.textContent = 'Stock actuel: --';
    }
}

document.getElementById('produit').addEventListener('change', updateStockActuel);

// Validation du formulaire
(function () {
    'use strict'
    var forms = document.querySelectorAll('.needs-validation')
    Array.prototype.slice.call(forms).forEach(function (form) {
        form.addEventListener('submit', function (event) {
            if (!form.checkValidity()) {
                event.preventDefault()
                event.stopPropagation()
            }
            form.classList.add('was-validated')
        }, false)
    })
})()
</script> 