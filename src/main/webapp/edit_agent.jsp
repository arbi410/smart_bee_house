<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.Agent" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Modifier Agent</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
     <%@ include file="header.jsp" %>

<%
    Agent agent = (Agent) request.getAttribute("agent");

    String nom = agent != null ? agent.getNom() : "";
    String role = agent != null ? agent.getRole() : "";
    String certificatX509 = agent != null ? agent.getCertificatX509() : "";
    String emailGoogle = agent != null ? agent.getEmailGoogle() : "";
    String telephone = agent != null ? agent.getTelephone() : "";

    if (agent == null) {
%>
    <div class="container py-5 text-center">
        <h2 class="text-danger">Agent introuvable.</h2>
    </div>
<%
    } else {
%>
<div class="container py-5">
    <div class="card shadow">
        <div class="card-header bg-primary text-white text-center">
            <h3>Modifier les informations de l'agent</h3>
        </div>
        <div class="card-body">
            <form method="post" action="agentservlet">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="<%= agent.getId() %>">

                <div class="mb-3">
                    <label class="form-label">Nom</label>
                    <input type="text" name="nom" class="form-control" value="<%= nom %>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Rôle</label>
                    <input type="text" name="role" class="form-control" value="<%= role %>">
                </div>

                <div class="mb-3">
                    <label class="form-label">Certificat X509</label>
                    <textarea name="certificatx509" class="form-control" rows="3"><%= certificatX509 %></textarea>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email Google</label>
                    <input type="email" name="emailgoogle" class="form-control" value="<%= emailGoogle %>">
                </div>

                <div class="mb-3">
                    <label class="form-label">Téléphone</label>
                    <input type="text" name="telephone" class="form-control" value="<%= telephone %>">
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-success">Enregistrer les modifications</button>
                    <a href="agentservlet?action=view" class="btn btn-secondary">Annuler</a>
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
