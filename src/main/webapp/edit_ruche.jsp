<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="DAO.CRUD_ruche" %>
<%@ page import="DAO.CRUD_site" %>
<%@ page import="DAO.CRUD_agent" %>
<%@ page import="DAO.CRUD_fermier" %>
<%@ page import="Model.Ruche" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Modifier une Ruche</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <%@ include file="header.jsp" %>

    <div class="container py-5">
        <h2 class="mb-4 text-primary">Modifier la Ruche</h2>

        <%
            int rucheId = Integer.parseInt(request.getParameter("id"));
            CRUD_ruche crudRuche = new CRUD_ruche();
            Ruche ruche = crudRuche.getRucheById(rucheId);

            if (ruche != null) {
        %>

        <form method="post" action="rucheservlet">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= ruche.getId() %>">

            <div class="row mb-3">
                <div class="col">
                    <label class="form-label">ID Site</label>
                    <select name="siteId" class="form-select" required>
                        <%
                            CRUD_site daoSite = new CRUD_site();
                            ResultSet rsSites = daoSite.afficherSites();
                            while (rsSites.next()) {
                                int siteId = rsSites.getInt("id");
                                String nomSite = rsSites.getString("nom");
                                boolean selected = (siteId == ruche.getSiteId());
                        %>
                            <option value="<%= siteId %>" <%= selected ? "selected" : "" %>>
                            <%= nomSite %>
                            </option>
                        <%
                            }
                        %>
                    </select>
                </div>

                <div class="col">
                    <label class="form-label">Propriétaire (Fermier)</label>
                    <select name="proprietaireId" class="form-select" required>
                        <%
                            CRUD_fermier daoFermier = new CRUD_fermier();
                            ResultSet rsFermiers = daoFermier.afficherfermier();
                            while (rsFermiers.next()) {
                                int fermierId = rsFermiers.getInt("id");
                                String nom = rsFermiers.getString("nom");
                                boolean selected = (fermierId == ruche.getId_fermier());
                        %>
                            <option value="<%= fermierId %>" <%= selected ? "selected" : "" %>>
                                <%= nom %>
                            </option>
                        <%
                            }
                        %>
                    </select>
                </div>

                <div class="col">
                    <label class="form-label">Agent Responsable</label>
                    <select name="agentResponsableId" class="form-select" required>
                        <%
                            CRUD_agent daoAgent = new CRUD_agent();
                            ResultSet rsAgents = daoAgent.afficheragent();
                            while (rsAgents.next()) {
                                int agentId = rsAgents.getInt("id");
                                String nom = rsAgents.getString("nom");
                                boolean selected = (agentId == ruche.getAgentResponsableId());
                        %>
                            <option value="<%= agentId %>" <%= selected ? "selected" : "" %>>
                                 <%= nom %>
                            </option>
                        <%
                            }
                        %>
                    </select>
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label">Code Identifiant</label>
                <input type="text" name="codeIdentifiant" class="form-control" value="<%= ruche.getCodeIdentifiant() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Date d'Installation</label>
                <input type="date" name="dateInstallation" class="form-control" value="<%= ruche.getDateInstallation().toLocalDate() %>" required>
            </div>

            <button type="submit" class="btn btn-success">Mettre à jour</button>
            <a href="rucheservlet?action=list" class="btn btn-secondary">Annuler</a>
        </form>

        <%
            } else {
        %>
            <div class="alert alert-danger">Ruche introuvable.</div>
        <%
            }
        %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
