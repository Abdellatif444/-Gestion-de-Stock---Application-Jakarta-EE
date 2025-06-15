<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="fade-in">
    <h2 class="mb-4">Gestion des Produits</h2>
    
    <!-- Formulaire d'ajout -->
    <div class="card mb-4">
        <div class="card-body">
            <h5 class="card-title">Ajouter un produit</h5>
            <form action="${pageContext.request.contextPath}/produits/ajouter" method="post" class="row g-3">
                <div class="col-md-3">
                    <input type="text" name="reference" class="form-control" placeholder="Référence" required>
                </div>
                <div class="col-md-3">
                    <select name="marque" class="form-control" required>
                        <option value="">Sélectionner une marque</option>
                        <c:forEach var="marque" items="${marques}">
                            <option value="${marque.nom}">${marque.nom}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-3">
                    <input type="text" name="denomination" class="form-control" placeholder="Dénomination" required>
                </div>
                <div class="col-md-3">
                    <input type="number" name="prix" class="form-control" placeholder="Prix" step="0.01" required>
                </div>
                <div class="col-md-3">
                    <input type="number" name="poids" class="form-control" placeholder="Poids" step="0.001" required>
                </div>
                <div class="col-md-3">
                    <input type="number" name="volume" class="form-control" placeholder="Volume" step="0.001" required>
                </div>
                <div class="col-md-3">
                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-plus-circle me-2"></i>Ajouter
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- Filtre par marque -->
    <div class="mb-4">
        <form action="${pageContext.request.contextPath}/produits" method="get" class="row g-3">
            <div class="col-md-4">
                <select name="marque" class="form-control" onchange="this.form.submit()">
                    <option value="">Toutes les marques</option>
                    <c:forEach var="marque" items="${marques}">
                        <option value="${marque.nom}" ${param.marque eq marque.nom ? 'selected' : ''}>
                            ${marque.nom}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </form>
    </div>

    <!-- Liste des produits -->
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Référence</th>
                    <th>Marque</th>
                    <th>Dénomination</th>
                    <th>Prix</th>
                    <th>Poids</th>
                    <th>Volume</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="produit" items="${produits}">
                    <tr>
                        <td>${produit.reference}</td>
                        <td>${produit.marque.nom}</td>
                        <td>${produit.denomination}</td>
                        <td>${produit.prix}</td>
                        <td>${produit.poids}</td>
                        <td>${produit.volume}</td>
                        <td>
                            <button type="button" class="btn btn-warning btn-sm" 
                                    onclick="editProduit('${produit.reference}')">
                                <i class="bi bi-pencil me-1"></i>Modifier
                            </button>
                            <form action="${pageContext.request.contextPath}/produits/supprimer" 
                                  method="post" style="display: inline;">
                                <input type="hidden" name="reference" value="${produit.reference}">
                                <button type="submit" class="btn btn-danger btn-sm">
                                    <i class="bi bi-trash me-1"></i>Supprimer
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Modal d'édition -->
<div class="modal fade" id="editModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modifier le produit</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form id="editForm" action="${pageContext.request.contextPath}/produits/modifier" method="post">
                    <input type="hidden" id="editReference" name="reference">
                    <div class="mb-3">
                        <label class="form-label">Dénomination</label>
                        <input type="text" name="denomination" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Prix</label>
                        <input type="number" name="prix" class="form-control" step="0.01" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Poids</label>
                        <input type="number" name="poids" class="form-control" step="0.001" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Volume</label>
                        <input type="number" name="volume" class="form-control" step="0.001" required>
                    </div>
                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-save me-2"></i>Enregistrer
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function editProduit(reference) {
        document.getElementById('editReference').value = reference;
        new bootstrap.Modal(document.getElementById('editModal')).show();
    }
</script> 