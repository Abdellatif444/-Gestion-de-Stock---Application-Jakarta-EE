<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Inscription - Gestion Stock</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-header">
                        <h4 class="card-title mb-0">Inscription</h4>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger" role="alert">
                                ${error}
                            </div>
                        </c:if>
                        
                        <form action="${pageContext.request.contextPath}/register" method="post" class="needs-validation" novalidate>
                            <div class="mb-3">
                                <label for="login" class="form-label">Login *</label>
                                <input type="text" class="form-control" id="login" name="login" required
                                       pattern="[a-zA-Z0-9]{3,20}" title="3 à 20 caractères alphanumériques">
                                <div class="invalid-feedback">
                                    Le login doit contenir entre 3 et 20 caractères alphanumériques
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="nom" class="form-label">Nom complet *</label>
                                <input type="text" class="form-control" id="nom" name="nom" required>
                                <div class="invalid-feedback">
                                    Le nom est requis
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="motDePasse" class="form-label">Mot de passe *</label>
                                <input type="password" class="form-control" id="motDePasse" name="motDePasse" 
                                       required pattern=".{6,}" title="6 caractères minimum">
                                <div class="invalid-feedback">
                                    Le mot de passe doit contenir au moins 6 caractères
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="confirmMotDePasse" class="form-label">Confirmer le mot de passe *</label>
                                <input type="password" class="form-control" id="confirmMotDePasse" name="confirmMotDePasse" required>
                                <div class="invalid-feedback">
                                    Les mots de passe ne correspondent pas
                                </div>
                            </div>
                            
                            <button type="submit" class="btn btn-primary w-100">S'inscrire</button>
                        </form>
                        
                        <div class="mt-3 text-center">
                            <a href="${pageContext.request.contextPath}/login">Déjà inscrit ? Se connecter</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Validation des mots de passe
        document.querySelector('form').addEventListener('submit', function(event) {
            var password = document.getElementById('motDePasse');
            var confirm = document.getElementById('confirmMotDePasse');
            
            if (password.value !== confirm.value) {
                confirm.setCustomValidity('Les mots de passe ne correspondent pas');
                event.preventDefault();
            } else {
                confirm.setCustomValidity('');
            }
        });
    </script>
</body>
</html> 