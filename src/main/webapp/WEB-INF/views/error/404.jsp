<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Page non trouvée - 404</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center">
                <h1 class="display-1">404</h1>
                <h2>Page non trouvée</h2>
                <p class="lead">La page que vous recherchez n'existe pas ou a été déplacée.</p>
                <a href="${pageContext.request.contextPath}/" class="btn btn-primary">Retour à l'accueil</a>
            </div>
        </div>
    </div>
</body>
</html> 