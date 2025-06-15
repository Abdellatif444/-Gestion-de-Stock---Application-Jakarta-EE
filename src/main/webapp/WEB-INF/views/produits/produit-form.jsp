<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${empty produit.reference ? 'Nouveau Produit' : 'Modifier Produit'} - Gestion Stock</title>
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
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/produits">Produits</a></li>
                        <li class="breadcrumb-item active">${empty produit.reference ? 'Nouveau Produit' : 'Modifier Produit'}</li>
                    </ol>
                </nav>

                <div class="card shadow-sm">
                    <div class="card-header">
                        <h4 class="card-title mb-0">
                            <i class="bi bi-box-fill me-2"></i>
                            ${empty produit.reference ? 'Nouveau Produit' : 'Modifier Produit'}
                        </h4>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/produits/${empty produit.reference ? 'ajouter' : 'modifier'}" 
                              method="post" 
                              class="needs-validation" 
                              novalidate>
                            
                            <div class="mb-3">
                                <label for="reference" class="form-label">Référence *</label>
                                <input type="text" 
                                       class="form-control" 
                                       id="reference" 
                                       name="reference" 
                                       value="${produit.reference}"
                                       required
                                       pattern="[A-Za-z0-9-]+"
                                       ${not empty produit.reference ? 'readonly' : ''}
                                >
                                <div class="invalid-feedback">
                                    La référence est obligatoire et ne doit contenir que des lettres, chiffres et tirets
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="marque" class="form-label">Marque *</label>
                                <select class="form-select" id="marque" name="marque" required>
                                    <option value="">Sélectionnez une marque</option>
                                    <c:forEach items="${marques}" var="m">
                                        <option value="${m.nom}" ${produit.marque.nom eq m.nom ? 'selected' : ''}>
                                            ${m.nom} (${m.origine})
                                        </option>
                                    </c:forEach>
                                </select>
                                <div class="invalid-feedback">
                                    Veuillez sélectionner une marque
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="denomination" class="form-label">Dénomination *</label>
                                <input type="text" 
                                       class="form-control" 
                                       id="denomination" 
                                       name="denomination" 
                                       value="${produit.denomination}"
                                       required
                                >
                                <div class="invalid-feedback">
                                    La dénomination est obligatoire
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="prix" class="form-label">Prix *</label>
                                <div class="input-group">
                                    <input type="number" 
                                           class="form-control" 
                                           id="prix" 
                                           name="prix" 
                                           value="${produit.prix}"
                                           required
                                           min="0"
                                           step="0.01"
                                    >
                                    <span class="input-group-text">€</span>
                                </div>
                                <div class="invalid-feedback">
                                    Le prix est obligatoire et doit être positif
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="poids" class="form-label">Poids (kg)</label>
                                        <input type="number" 
                                               class="form-control" 
                                               id="poids" 
                                               name="poids" 
                                               value="${produit.poids}"
                                               min="0"
                                               step="0.01"
                                        >
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="volume" class="form-label">Volume (m³)</label>
                                        <input type="number" 
                                               class="form-control" 
                                               id="volume" 
                                               name="volume" 
                                               value="${produit.volume}"
                                               min="0"
                                               step="0.01"
                                        >
                                    </div>
                                </div>
                            </div>

                            <div class="d-flex justify-content-end gap-2">
                                <a href="${pageContext.request.contextPath}/produits" class="btn btn-secondary">
                                    <i class="bi bi-x-circle me-1"></i> Annuler
                                </a>
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi bi-check2-circle me-1"></i>
                                    ${empty produit.reference ? 'Créer' : 'Modifier'}
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
    </script>
</body>
</html> 