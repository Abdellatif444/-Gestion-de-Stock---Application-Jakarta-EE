<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestion des Stocks - Gestion Stock</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Accueil</a></li>
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/stocks">Stocks</a></li>
                        <li class="breadcrumb-item active">Mouvement de Stock</li>
                    </ol>
                </nav>

                <div class="card shadow-sm">
                    <div class="card-header">
                        <h4 class="card-title mb-0">
                            <i class="bi bi-box-seam-fill me-2"></i>
                            Mouvement de Stock
                        </h4>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/stocks/mouvement" 
                              method="post" 
                              class="needs-validation" 
                              novalidate>
                            
                            <div class="mb-3">
                                <label for="type" class="form-label">Type de mouvement *</label>
                                <select class="form-select" id="type" name="type" required>
                                    <option value="">Sélectionnez le type</option>
                                    <option value="ENTREE">Entrée en stock</option>
                                    <option value="SORTIE">Sortie de stock</option>
                                </select>
                                <div class="invalid-feedback">
                                    Veuillez sélectionner le type de mouvement
                                </div>
                            </div>

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
                                <input type="number" 
                                       class="form-control" 
                                       id="quantite" 
                                       name="quantite" 
                                       required
                                       min="1"
                                       step="1"
                                >
                                <div class="invalid-feedback">
                                    La quantité est obligatoire et doit être supérieure à 0
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="commentaire" class="form-label">Commentaire</label>
                                <textarea class="form-control" 
                                          id="commentaire" 
                                          name="commentaire" 
                                          rows="3"
                                ></textarea>
                            </div>

                            <div class="d-flex justify-content-end gap-2">
                                <a href="${pageContext.request.contextPath}/stocks" class="btn btn-secondary">
                                    <i class="bi bi-x-circle me-1"></i> Annuler
                                </a>
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi bi-check2-circle me-1"></i>
                                    Valider le mouvement
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Activation de la validation Bootstrap
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

        // Gestion dynamique du stock disponible
        document.getElementById('produit').addEventListener('change', function() {
            const produitId = this.value;
            const stockId = document.getElementById('stock').value;
            if (produitId && stockId) {
                fetch(`${pageContext.request.contextPath}/api/stocks/${stockId}/produits/${produitId}`)
                    .then(response => response.json())
                    .then(data => {
                        const quantiteInput = document.getElementById('quantite');
                        const type = document.getElementById('type').value;
                        if (type === 'SORTIE') {
                            quantiteInput.max = data.quantite;
                            quantiteInput.title = `Stock disponible: ${data.quantite}`;
                        } else {
                            quantiteInput.removeAttribute('max');
                            quantiteInput.removeAttribute('title');
                        }
                    });
            }
        });

        // Mise à jour des contraintes lors du changement de type
        document.getElementById('type').addEventListener('change', function() {
            const produitId = document.getElementById('produit').value;
            if (this.value === 'SORTIE' && produitId) {
                document.getElementById('produit').dispatchEvent(new Event('change'));
            } else {
                const quantiteInput = document.getElementById('quantite');
                quantiteInput.removeAttribute('max');
                quantiteInput.removeAttribute('title');
            }
        });
    </script>
</body>
</html> 