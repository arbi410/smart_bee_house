<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="DAO.CRUD_site" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des Sites</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

      <%@ include file="header.jsp" %>
   
    <hr class="my-5">
  <form action="ajouter_site.jsp" method="get">
    <button type="submit" class="btn btn-primary mb-3">Ajouter un site</button>
    <h3 class="text-secondary">Liste des Sites</h3>
    <div class="table-responsive bg-white p-3 rounded shadow-sm">
        <table class="table table-striped table-hover">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>ID Ferme</th>
                    <th>Latitude</th>
                    <th>Longitude</th>
                    <th>Altitude</th>
                    <th>Date Début</th>
                    <th>Date Fin</th>
                </tr>
            </thead>
           <tbody>
             <%
             CRUD_site crud = new CRUD_site();
            ResultSet rs = crud.afficherSites();
            int i = 1;

            while (rs != null && rs.next()) {
        %>
        <tr>
          
          
 
   <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("nom") %></td>
    <td><%= rs.getString("nom_ferme") %></td> <!-- nom de la ferme (JOIN) -->
    <td><%= rs.getDouble("latitude") %></td>
    <td><%= rs.getDouble("longitude") %></td>
    <td><%= rs.getDouble("altitude") %></td>
    <td><%= rs.getDate("date_debut") %></td>
    <td><%= rs.getDate("date_fin") %></td>
                <td>  
<a href="siteservlet?action=delete&id=<%= rs.getInt("id") %>" 
   class="btn btn-danger btn-sm"
   onclick="return confirm('Voulez-vous vraiment supprimer cet site ?');">
   <i class="bi bi-trash"></i> Supprimer
</a>

<a href="siteservlet?action=editForm&id=<%= rs.getInt("id") %>" 
   class="btn btn-primary btn-sm ms-2">
   <i class="bi bi-pencil-square"></i> Modifier
</a>



            </td>
        </tr>
        <%
            }
        %>
    </table>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
