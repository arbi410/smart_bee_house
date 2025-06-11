<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.Fermier" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Modifier Fermier</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <%@ include file="header.jsp" %>

<%
    Fermier fermier = (Fermier) request.getAttribute("fermier");

    String nom = fermier != null ? fermier.getNom() : "";
    String email = fermier != null ? fermier.getEmail() : "";
    String telephone = fermier != null ? fermier.getTelephone() : "";
    String adresse = fermier != null ? fermier.getAdresse() : "";

    if (fermier == null) {
%>
    <div class="container py-5 text-center">
        <h2 class="text-danger">Fermier introuvable.</h2>
    </div>
<%
    } else {
%>
<div class="container py-5">
    <div class="card shadow">
        <div class="card-header bg-primary text-white text-center">
            <h3>Modifier les informations du fermier</h3>
        </div>
        <div class="card-body">
            <form method="post" action="fermierservlet">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="<%= fermier.getId() %>">

                <div class="mb-3">
                    <label class="form-label">Nom *</label>
                    <input type="text" name="nom" class="form-control" value="<%= nom %>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" value="<%= email %>">
                </div>

                <div class="mb-3">
                    <label class="form-label">Téléphone</label>
                    <input type="text" name="telephone" class="form-control" value="<%= telephone %>">
                </div>

                <div class="mb-3">
                    <label class="form-label">Adresse</label>
                    <textarea name="adresse" class="form-control" rows="3"><%= adresse %></textarea>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-success">Enregistrer les modifications</button>
                    <a href="listeFermiers.jsp" class="btn btn-secondary">Annuler</a>
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
