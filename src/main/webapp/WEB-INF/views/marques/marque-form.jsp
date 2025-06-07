<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${empty marque.nom ? 'Nouvelle Marque' : 'Modifier Marque'} - Gestion Stock</title>
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
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/marques">Marques</a></li>
                        <li class="breadcrumb-item active">${empty marque.nom ? 'Nouvelle Marque' : 'Modifier Marque'}</li>
                    </ol>
                </nav>

                <div class="card shadow-sm">
                    <div class="card-header">
                        <h4 class="card-title mb-0">
                            <i class="bi bi-tag-fill me-2"></i>
                            ${empty marque.nom ? 'Nouvelle Marque' : 'Modifier Marque'}
                        </h4>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/marques/${empty marque.nom ? 'ajouter' : 'modifier'}" 
                              method="post" 
                              class="needs-validation" 
                              novalidate>
                            
                            <div class="mb-3">
                                <label for="nom" class="form-label">Nom de la marque *</label>
                                <input type="text" 
                                       class="form-control" 
                                       id="nom" 
                                       name="nom" 
                                       value="${marque.nom}"
                                       required
                                       pattern="[A-Za-z0-9\s-]+"
                                       ${not empty marque.nom ? 'readonly' : ''}
                                >
                                <div class="invalid-feedback">
                                    Le nom est obligatoire et ne doit contenir que des lettres, chiffres, espaces et tirets
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="origine" class="form-label">Pays d'origine *</label>
                                <select class="form-select" id="origine" name="origine" required>
                                    <option value="">Sélectionnez un pays</option>
                                    <c:forEach items="${pays}" var="p">
                                        <option value="${p}" ${marque.origine eq p ? 'selected' : ''}>
                                            ${p}
                                        </option>
                                    </c:forEach>
                                </select>
                                <div class="invalid-feedback">
                                    Veuillez sélectionner un pays d'origine
                                </div>
                            </div>

                            <div class="d-flex justify-content-end gap-2">
                                <a href="${pageContext.request.contextPath}/marques" class="btn btn-secondary">
                                    <i class="bi bi-x-circle me-1"></i> Annuler
                                </a>
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi bi-check2-circle me-1"></i>
                                    ${empty marque.nom ? 'Créer' : 'Modifier'}
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