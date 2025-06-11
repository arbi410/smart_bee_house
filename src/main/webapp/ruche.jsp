<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="DAO.CRUD_ruche" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des Ruches</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

 
 
     <%@ include file="header.jsp" %>
   
    <hr class="my-5">
  <form action="ajouter_rcuhe.jsp" method="get">
    <button type="submit" class="btn btn-primary mb-3">Ajouter un ruche</button>

    <h3 class="text-secondary">Liste des Ruches</h3>
    <div class="table-responsive bg-white p-3 rounded shadow-sm">
        <table class="table table-striped table-hover">
            <thead class="table-dark">
                <tr>
  
 
    
      <th>nom site</th>
      <th>nom agent</th>
      <th>nom fermier</th>
       <th>Code Identifiant</th>
      <th>Date Installation</th>
     <th> ***</th>
   
 
                </tr>
            </thead>
                 <tbody>
             <%
             CRUD_ruche crud = new CRUD_ruche();
            ResultSet rs = crud.afficherRuches();
            int i = 1;

            while (rs != null && rs.next()) {
        %>
        <tr>
          
        
      <td><%= rs.getString("nom_site") %></td>
<td><%= rs.getString("nom_agent") %></td>
<td><%= rs.getString("nom_fermier") %></td>     
  <td><%= rs.getString("code_identifiant") %></td>
<td><%= rs.getDate("date_installation") %></td>

 
          
                                               
                <td>  
<a href="rucheservlet?action=delete&id=<%= rs.getInt("id") %>" 
   class="btn btn-danger btn-sm"
   onclick="return confirm('Voulez-vous vraiment supprimer cet ruche ?');">
   <i class="bi bi-trash"></i> Supprimer
</a>

<a href="rucheservlet?action=editForm&id=<%= rs.getInt("id") %>" 
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
