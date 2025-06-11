<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="DAO.CRUD_ferme" %>
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
   
    <hr class="my-5">
  <form action="ajouter_ferme.jsp" method="get">
    <button type="submit" class="btn btn-primary mb-3">Ajouter un ferme</button>

     

    <h3 class="text-secondary">Liste des Fermes</h3>
    <div class="table-responsive bg-white p-3 rounded shadow-sm">
        <table class="table table-striped table-hover">
            <thead class="table-dark">
                <tr>
                <th>ID Ferme</th>
<th>Nom de la Ferme</th>
<th>Nom du Fermier</th>
<th>Localisation</th>
<th>Superficie (ha)</th>
<th>Date de Création</th>
<th></th>
                </tr>
            </thead>
             <tbody>
             <%
             CRUD_ferme crud = new CRUD_ferme();
            ResultSet rs = crud.afficherFermes();
            int i = 1;

            while (rs != null && rs.next()) {
        %>
        <tr>
          
          
    
            <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("nom") %></td>
       <td><%= rs.getString("nom_fermier") %></td>
    <td><%= rs.getString("localisation") %></td>
    <td><%= rs.getDouble("superficie") %></td>
    <td><%= rs.getDate("date_creation") %></td>
 
                      
          
                                               
                <td>  
<a href="fermeservlet?action=delete&id=<%= rs.getInt("id") %>"
   class="btn btn-danger btn-sm"
   onclick="return confirm('Voulez-vous vraiment supprimer cette ferme ?');">
   <i class="bi bi-trash"></i> Supprimer
</a>

<a href="fermeservlet?action=editForm&id=<%= rs.getInt("id") %>"
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
