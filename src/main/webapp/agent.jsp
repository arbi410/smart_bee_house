<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DAO.CRUD_agent" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des Agents</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

     <%@ include file="header.jsp" %>
 

    <hr class="my-5">
<form action="ajout_agent.jsp" method="get">
    <button type="submit" class="btn btn-primary mb-3">Ajouter un Agent</button>
</form>
    <h3 class="text-secondary">Liste des Agents</h3>
    <div class="table-responsive bg-white p-3 rounded shadow-sm">
        <table class="table table-striped table-hover">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Rôle</th>
               
                  <th>telephone</th>
                      <th>****</th>
            </tr>
            </thead>
            <tbody>
             <%
             CRUD_agent crud = new CRUD_agent();
            ResultSet rs = crud.afficheragent();
            int i = 1;

            while (rs != null && rs.next()) {
        %>
        <tr>
          
          
            <td><%= i++ %></td>
            <td><%= rs.getString("nom") %>  </td>
                     <td><%= rs.getString("rôle") %>  </td>
                      
          
                                                                                 <td><%= rs.getString("telephone") %>  </td>
                                              
                <td>  
<a href="agentservlet?action=delete&id=<%= rs.getInt("id") %>" 
   class="btn btn-danger btn-sm"
   onclick="return confirm('Voulez-vous vraiment supprimer cet agent ?');">
   <i class="bi bi-trash"></i> Supprimer
</a>

<a href="agentservlet?action=editForm&id=<%= rs.getInt("id") %>" 
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
