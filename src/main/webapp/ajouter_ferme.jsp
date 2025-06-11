<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="DAO.*" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des Fermes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <%@ include file="header.jsp" %>

    <div class="container py-5">
        <h2 class="mb-4 text-primary">Ajouter une Ferme</h2>

     <form method="post" action="fermeservlet">
    <input type="hidden" name="action" value="add">
     
            <div class="mb-3">
                <label class="form-label">Nom de la ferme</label>
                <input type="text" name="nom" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="fermierId">Nom du fermier</label>
                <select name="fermierId" id="fermierId" class="form-select" required>
                    <option value="">-- Sélectionner un fermier --</option>
                    <%
                        try {
                            DAO.CRUD_fermier dao = new DAO.CRUD_fermier();
                            ResultSet rs = dao.afficherfermier(); // SELECT * FROM fermier

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
                <input type="text" name="localisation" class="form-control" placeholder="Adresse ou lieu" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Superficie (en hectares)</label>
                <input type="number" name="superficie" class="form-control" step="0.01" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Date de création</label>
                <input type="date" name="date_creation" class="form-control" required>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-success">Ajouter la ferme</button>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>