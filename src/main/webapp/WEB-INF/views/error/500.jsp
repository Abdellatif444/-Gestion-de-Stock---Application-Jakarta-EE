<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Erreur serveur - 500</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center">
                <h1 class="display-1">500</h1>
                <h2>Erreur serveur</h2>
                <p class="lead">Une erreur inattendue s'est produite. Veuillez réessayer plus tard.</p>
                <a href="${pageContext.request.contextPath}/" class="btn btn-primary">Retour à l'accueil</a>
            </div>
        </div>
    </div>
</body>
</html> 