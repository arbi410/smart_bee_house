<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.Ferme" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.*" %>
<%@ page import="DAO.*" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Modifier Ferme</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <%@ include file="header.jsp" %>

<%
    Ferme ferme = (Ferme) request.getAttribute("ferme");

    if (ferme == null) {
%>
    <div class="container py-5 text-center">
        <h2 class="text-danger">Ferme introuvable.</h2>
    </div>
<%
    } else {
        String nom = ferme.getNom() != null ? ferme.getNom() : "";
        int fermierId = ferme.getFermierId();
        String localisation = ferme.getLocalisation() != null ? ferme.getLocalisation() : "";
        double superficie = ferme.getSuperficie();
        Date dateCreation = ferme.getDateCreation();
        String dateCreationStr = (dateCreation != null) ? dateCreation.toString() : "";
%>

<div class="container py-5">
    <div class="card shadow">
        <div class="card-header bg-primary text-white text-center">
            <h3>Modifier les informations de la ferme</h3>
        </div>
        <div class="card-body">
            <form method="post" action="fermeservlet">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="<%= ferme.getId() %>">

                <div class="mb-3">
                    <label class="form-label">Nom *</label>
                    <input type="text" name="nom" class="form-control" value="<%= nom %>" required>
                </div>

            <div class="mb-3">
    <label for="fermierId">Nom du fermier</label>
    <select name="fermierId" id="fermierId" class="form-select" required>
        <option value="">-- Sélectionner un fermier --</option>
        <%
            try {
                DAO.CRUD_fermier dao = new DAO.CRUD_fermier();
                ResultSet rs = dao.afficherfermier(); // récupère tous les fermiers
                
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String nomFermier = rs.getString("nom");
        %>
            <option value="<%= id %>"><%= nomFermier %></option>
        <%
                }
            } catch (Exception e) {
                out.println("<option disabled>Erreur lors du chargement des fermiers</option>");
            }
        %>
    </select>
</div>

                <div class="mb-3">
                    <label class="form-label">Localisation</label>
                    <input type="text" name="localisation" class="form-control" value="<%= localisation %>">
                </div>

                <div class="mb-3">
                    <label class="form-label">Superficie (en hectares)</label>
                    <input type="number" step="0.01" name="superficie" class="form-control" value="<%= superficie %>">
                </div>

                <div class="mb-3">
                    <label class="form-label">Date de création</label>
                    <input type="date" name="date_creation" class="form-control" value="<%= dateCreationStr %>">
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-success">Enregistrer les modifications</button>
                    <a href="fermeservlet?action=view" class="btn btn-secondary">Annuler</a>
                </div>
            </form>
        </div>
    </div>
</div>

<%
    }
%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
