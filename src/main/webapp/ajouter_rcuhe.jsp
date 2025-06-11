<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="DAO.CRUD_ruche" %>
<%@ page import="DAO.*" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des Ruches</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
     <%@ include file="header.jsp" %>
  
<div class="container py-5">
    <h2 class="mb-4 text-primary">Ajouter une Ruche</h2>

           <form method="post" action="rucheservlet">
    <input type="hidden" name="action" value="add">
        <div class="row mb-3">
            <div class="col">
                <label class="form-label">Nom Site</label>
               <select name="siteId" id="siteId" class="form-select" required>
                    <option value="">-- Sélectionner un site --</option>
                    <%
                        try {
                            DAO.CRUD_site dao = new DAO.CRUD_site();
                            ResultSet rs = dao.afficherSites(); // SELECT * FROM fermier

                            while (rs.next()) {
                                int id = rs.getInt("id");
                                String nomsite = rs.getString("nom");
                    %>
                        <option value="<%= id %>"><%= nomsite %></option>
                    <%
                            }
                        } catch (Exception e) {
                            out.println("<option disabled>Erreur lors du chargement des fermiers</option>");
                        }
                    %>
                </select>
            </div>
            <div class="col">
                   <label for="id_fermier">Nom du fermier</label>
<select name="id_fermier" id="id_fermier" class="form-select" required>
                    <option value="">-- Sélectionner un fermier --</option>
                    <%
                        try {
                            DAO.CRUD_fermier dao = new DAO.CRUD_fermier();
                            ResultSet rs = dao.afficherfermier(); // SELECT * FROM fermier

                            while (rs.next()) {
                                int id = rs.getInt("id");
                                String nomfermier = rs.getString("nom");
                    %>
                        <option value="<%= id %>"><%= nomfermier %></option>
                    <%
                            }
                        } catch (Exception e) {
                            out.println("<option disabled>Erreur lors du chargement des fermiers</option>");
                        }
                    %>
                </select>
            </div>
            <div class="col">
                <label class="form-label">Nom Agent Responsable</label>
               <select name="agentResponsableId" id="agentResponsableId" class="form-select" required>
                    <option value="">-- Sélectionner un agent --</option>
                    <%
                        try {
                            DAO.CRUD_agent dao = new DAO.CRUD_agent();
                            ResultSet rs = dao.afficheragent(); // SELECT * FROM fermier

                            while (rs.next()) {
                                int id = rs.getInt("id");
                                String nomagent = rs.getString("nom");
                    %>
                        <option value="<%= id %>"><%= nomagent %></option>
                    <%
                            }
                        } catch (Exception e) {
                            out.println("<option disabled>Erreur lors du chargement des fermiers</option>");
                        }
                    %>
                </select>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col">
                <label class="form-label">Code Identifiant</label>
                <input type="text" name="code_identifiant" class="form-control" required>
            </div>
            <div class="col">
                <label class="form-label">Date Installation</label>
                <input type="date" name="date_installation" class="form-control" required>
            </div>
        </div>
        <button type="submit" class="btn btn-success">Ajouter la ruche</button>
    </form>

    
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
