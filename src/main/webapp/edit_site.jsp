<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Model.Site, java.sql.*, DAO.CRUD_ferme" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Modifier un site</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<%@ include file="header.jsp" %>

<%
    Site site = (Site) request.getAttribute("site");

    if (site == null) {
%>
    <div class="container py-5 text-center">
        <h2 class="text-danger">Site introuvable.</h2>
    </div>
<%
    } else {
%>
<div class="container py-5">
    <div class="card shadow">
        <div class="card-header bg-primary text-white text-center">
            <h3>Modifier les informations du site</h3>
        </div>
        <div class="card-body">
            <form method="post" action="siteservlet">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="<%= site.getId() %>">

                <div class="mb-3">
                    <label class="form-label">Nom du site</label>
                    <input type="text" name="nom" class="form-control" value="<%= site.getNom() %>" required>
                </div>

                <div class="mb-3">
                    <label for="fermeId">Ferme</label>
                    <select name="fermeId" id="fermeId" class="form-select" required>
                        <option value="">-- Sélectionner une ferme --</option>
                        <%
                            try {
                                CRUD_ferme dao = new CRUD_ferme();
                                ResultSet rs = dao.afficherFermes();
                                while (rs.next()) {
                                    int id = rs.getInt("id");
                                    String nomFerme = rs.getString("nom");
                                    String selected = (id == site.getFermeId()) ? "selected" : "";
                        %>
                            <option value="<%= id %>" <%= selected %>><%= nomFerme %></option>
                        <%
                                }
                            } catch (Exception e) {
                                out.println("<option disabled>Erreur de chargement</option>");
                            }
                        %>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label">Latitude</label>
                    <input type="number" step="any" name="latitude" class="form-control" value="<%= site.getLatitude() %>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Longitude</label>
                    <input type="number" step="any" name="longitude" class="form-control" value="<%= site.getLongitude() %>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Altitude (mètres)</label>
                    <input type="number" step="any" name="altitude" class="form-control" value="<%= site.getAltitude() %>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Date début</label>
                    <input type="date" name="date_debut" class="form-control" value="<%= site.getDateDebut() %>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Date fin</label>
                    <input type="date" name="date_fin" class="form-control" value="<%= site.getDateFin() %>" required>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-success">Enregistrer les modifications</button>
                    <a href="siteservlet?action=view" class="btn btn-secondary">Annuler</a>
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
