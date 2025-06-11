<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="DAO.*" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des Sites</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
      <%@ include file="header.jsp" %>

<div class="container py-5">
    <h2 class="text-primary mb-4">Ajouter un Site</h2>
 
           <form method="post" action="siteservlet">
    <input type="hidden" name="action" value="add">
       
        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">Nom</label>
                <input type="text" name="nom" class="form-control" required>
            </div>
            <div class="col-md-6 mb-3">
             
                <label for="fermeId">Nom du ferme</label>
              <select name="fermeId" id="fermeId" class="form-select" required>
                    <option value="">-- Sélectionner un ferme --</option>
                    <%
                        try {
                            DAO.CRUD_ferme dao = new DAO.CRUD_ferme();
                            ResultSet rs = dao.afficherFermes(); // SELECT * FROM fermier

                            while (rs.next()) {
                                int id = rs.getInt("id");
                                String nomFerme = rs.getString("nom");
                    %>
                        <option value="<%= id %>"><%= nomFerme %></option>
                    <%
                            }
                        } catch (Exception e) {
                            out.println("<option disabled>Erreur lors du chargement des fermiers</option>");
                        }
                    %>
                </select>
            </div>
            <div class="col-md-4 mb-3">
                <label class="form-label">Latitude</label>
                <input type="text" name="latitude" class="form-control" required>
            </div>
            <div class="col-md-4 mb-3">
                <label class="form-label">Longitude</label>
                <input type="text" name="longitude" class="form-control" required>
            </div>
            <div class="col-md-4 mb-3">
                <label class="form-label">Altitude</label>
                <input type="text" name="altitude" class="form-control">
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">Date Début</label>
                <input type="date" name="date_debut" class="form-control" required>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">Date Fin</label>
                <input type="date" name="date_fin" class="form-control">
            </div>
        </div>
        <button type="submit" class="btn btn-success">Ajouter le Site</button>
    </form>

     
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
