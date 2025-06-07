<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestion des Marques</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2>Liste des Marques</h2>
        
        <!-- Formulaire d'ajout -->
        <div class="card mb-4">
            <div class="card-body">
                <h5 class="card-title">Ajouter une marque</h5>
                <form action="${pageContext.request.contextPath}/marques/ajouter" method="post" class="row g-3">
                    <div class="col-md-4">
                        <input type="text" name="nom" class="form-control" placeholder="Nom" required>
                    </div>
                    <div class="col-md-4">
                        <input type="text" name="origine" class="form-control" placeholder="Origine" required>
                    </div>
                    <div class="col-md-4">
                        <button type="submit" class="btn btn-primary">Ajouter</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Liste des marques -->
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Nom</th>
                        <th>Origine</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="marque" items="${marques}">
                        <tr>
                            <td>${marque.nom}</td>
                            <td>${marque.origine}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/marques/supprimer" method="post" style="display: inline;">
                                    <input type="hidden" name="nom" value="${marque.nom}">
                                    <button type="submit" class="btn btn-danger btn-sm">Supprimer</button>
                                </form>
                                <a href="${pageContext.request.contextPath}/produits?marque=${marque.nom}" 
                                   class="btn btn-info btn-sm">Voir les produits</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 