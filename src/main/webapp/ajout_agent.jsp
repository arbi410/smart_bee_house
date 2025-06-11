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

<div class="container py-5">
    <h2 class="mb-4 text-primary">Ajouter un Agent</h2>
 
    <form method="post" action="agentservlet">
    <input type="hidden" name="action" value="add">
    
    <div class="mb-3">
        <label class="form-label">Nom</label>
        <input type="text" name="Nom" class="form-control" required>
    </div>
    
    <div class="mb-3">
        <label class="form-label">Rôle</label>
        <input type="text" name="role" class="form-control">
    </div>
    
    <div class="mb-3">
        <label class="form-label">Certificat X509</label>
        <textarea name="certificatX509" class="form-control" rows="3"></textarea>
    </div>
    
    <div class="mb-3">
        <label class="form-label">Email Google</label>
        <input type="email" name="emailGoogle" class="form-control">
    </div>
    
    <div class="mb-3">
        <label class="form-label">Téléphone</label>
        <input type="text" name="telephone" class="form-control">
    </div>
    
    <button type="submit" class="btn btn-success">Ajouter l'agent</button>
</form>

 

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
