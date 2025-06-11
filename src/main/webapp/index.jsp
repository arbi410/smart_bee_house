<%@ page import="java.sql.*, java.util.*, BD.BDI" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Tableau de bord - Accueil</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        canvas {
            max-width: 100%;
            height: 400px !important;
        }
    </style>
</head>
<body class="bg-light">
<%@ include file="header.jsp" %>

<div class="container py-4">
    <h2 class="text-primary mb-4">📊 Tableau de bord global</h2>

<%
Connection conn = null;
PreparedStatement ps = null;
ResultSet rs = null;

Map<String, Integer> siteCountMap = new HashMap<>();
Map<String, Integer> agentCountMap = new HashMap<>();
Map<String, Integer> fermierCountMap = new HashMap<>();
Map<String, Integer> fermeSiteCountMap = new HashMap<>();

try {
    BDI bdi = new BDI();
    conn = bdi.getConnection();

    // =================== RUCHES ===================
    String sqlRuches = "SELECT r.*, s.nom AS nom_site, a.nom AS nom_agent, f.nom AS nom_fermier FROM ruche r " +
                       "JOIN site s ON r.site_id = s.id " +
                       "JOIN agent a ON r.agent_responsable_id = a.id " +
                       "JOIN fermier f ON r.id_fermier = f.id";

    ps = conn.prepareStatement(sqlRuches);
    rs = ps.executeQuery();
%>

<!-- Tableau Ruches -->
<h4 class="text-secondary mt-5">📋 Ruches</h4>
<div class="table-responsive bg-white p-3 rounded shadow-sm mb-4">
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>Code</th>
                <th>Date Installation</th>
                <th>Site</th>
                <th>Agent</th>
                <th>Fermier</th>
            </tr>
        </thead>
        <tbody>
<%
    while (rs.next()) {
        String site = rs.getString("nom_site");
        String agent = rs.getString("nom_agent");
        String fermier = rs.getString("nom_fermier");

        siteCountMap.put(site, siteCountMap.getOrDefault(site, 0) + 1);
        agentCountMap.put(agent, agentCountMap.getOrDefault(agent, 0) + 1);
%>
            <tr>
                <td><%= rs.getString("code_identifiant") %></td>
                <td><%= rs.getDate("date_installation") %></td>
                <td><%= site %></td>
                <td><%= agent %></td>
                <td><%= fermier %></td>
            </tr>
<%
    }
    rs.close();
    ps.close();

    // =================== FERMES ===================
    String sqlFermes = "SELECT f.*, fr.nom AS nom_fermier, fr.email, fr.adresse FROM ferme f JOIN fermier fr ON f.fermier_id = fr.id";
    ps = conn.prepareStatement(sqlFermes);
    rs = ps.executeQuery();
%>
        </tbody>
    </table>
</div>

<!-- Graphiques Ruches -->
<div class="row mb-5">
    <div class="col-md-6">
        <h5>🟦 Nombre de ruches par site</h5>
        <canvas id="chartRuchesParSite"></canvas>
    </div>
    <div class="col-md-6">
        <h5>🟨 Nombre de ruches par agent</h5>
        <canvas id="chartRuchesParAgent"></canvas>
    </div>
</div>

<!-- Tableau Fermes -->
<h4 class="text-secondary mt-5">📋 Fermes</h4>
<div class="table-responsive bg-white p-3 rounded shadow-sm mb-4">
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID Ferme</th>
                <th>Nom Ferme</th>
                <th>Fermier</th>
                <th>Adresse</th>
                <th>Email</th>
            </tr>
        </thead>
        <tbody>
<%
    while (rs.next()) {
        String nomFermier = rs.getString("nom_fermier");
        fermierCountMap.put(nomFermier, fermierCountMap.getOrDefault(nomFermier, 0) + 1);
%>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("nom") %></td>
                <td><%= nomFermier %></td>
                <td><%= rs.getString("adresse") %></td>
                <td><%= rs.getString("email") %></td>
            </tr>
<%
    }
    rs.close();
    ps.close();

    // =================== SITES ===================
    String sqlSites = "SELECT s.*, f.localisation,f.nom AS nom_ferme FROM site s JOIN ferme f ON s.ferme_id = f.id";
    ps = conn.prepareStatement(sqlSites);
    rs = ps.executeQuery();
%>
        </tbody>
    </table>
</div>

<!-- Graphique Fermes -->
<div class="mb-5">
    <h5>🟩 Nombre de fermes par fermier</h5>
    <canvas id="chartFermesParFermier"></canvas>
</div>

<!-- Tableau Sites -->
<h4 class="text-secondary mt-5">📋 Sites</h4>
<div class="table-responsive bg-white p-3 rounded shadow-sm mb-4">
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                 <th>Nom Site</th>
             
                <th>Ferme</th>
                   <th>Localisation</th>
            </tr>
        </thead>
        <tbody>
<%
    while (rs.next()) {
        String nomFerme = rs.getString("nom_ferme");
        fermeSiteCountMap.put(nomFerme, fermeSiteCountMap.getOrDefault(nomFerme, 0) + 1);
%>
            <tr>
                 <td><%= rs.getString("nom") %></td>
              
                <td><%= nomFerme %></td>
                  <td><%= rs.getString("localisation") %></td>
            </tr>
<%
    }
    rs.close();
    ps.close();
%>
        </tbody>
    </table>
</div>

<!-- Graphique Sites par Ferme -->
<div class="mb-5">
    <h5>🟪 Nombre de sites par ferme</h5>
    <canvas id="chartSitesParFerme"></canvas>
</div>

<%
} catch (Exception e) {
    out.println("<div class='alert alert-danger'>Erreur : " + e.getMessage() + "</div>");
} finally {
    if (rs != null) try { rs.close(); } catch (Exception ignore) {}
    if (ps != null) try { ps.close(); } catch (Exception ignore) {}
    if (conn != null) try { conn.close(); } catch (Exception ignore) {}
}
%>

<!-- Scripts Chart.js -->
<script>
    // Données JS extraites des Maps Java
    const siteLabels = [<% for (String s : siteCountMap.keySet()) { %>"<%= s %>",<% } %>];
    const siteData = [<% for (int c : siteCountMap.values()) { %><%= c %>,<% } %>];

    const agentLabels = [<% for (String a : agentCountMap.keySet()) { %>"<%= a %>",<% } %>];
    const agentData = [<% for (int c : agentCountMap.values()) { %><%= c %>,<% } %>];

    const fermierLabels = [<% for (String f : fermierCountMap.keySet()) { %>"<%= f %>",<% } %>];
    const fermierData = [<% for (int c : fermierCountMap.values()) { %><%= c %>,<% } %>];

    const fermeSiteLabels = [<% for (String f : fermeSiteCountMap.keySet()) { %>"<%= f %>",<% } %>];
    const fermeSiteData = [<% for (int c : fermeSiteCountMap.values()) { %><%= c %>,<% } %>];

    new Chart(document.getElementById('chartRuchesParSite'), {
        type: 'bar',
        data: {
            labels: siteLabels,
            datasets: [{
                label: 'Ruches par site',
                data: siteData,
                backgroundColor: '#0d6efd'
            }]
        },
        options: { responsive: true, scales: { y: { beginAtZero: true } } }
    });

    new Chart(document.getElementById('chartRuchesParAgent'), {
        type: 'doughnut',
        data: {
            labels: agentLabels,
            datasets: [{
                label: 'Ruches par agent',
                data: agentData,
                backgroundColor: ['#ffc107', '#198754', '#dc3545', '#0dcaf0', '#6f42c1', '#fd7e14']
            }]
        },
        options: { responsive: true }
    });

    new Chart(document.getElementById('chartFermesParFermier'), {
        type: 'bar',
        data: {
            labels: fermierLabels,
            datasets: [{
                label: 'Fermes par fermier',
                data: fermierData,
                backgroundColor: '#198754'
            }]
        },
        options: { responsive: true, scales: { y: { beginAtZero: true } } }
    });

    new Chart(document.getElementById('chartSitesParFerme'), {
        type: 'bar',
        data: {
            labels: fermeSiteLabels,
            datasets: [{
                label: 'Sites par ferme',
                data: fermeSiteData,
                backgroundColor: '#6f42c1'
            }]
        },
        options: { responsive: true, scales: { y: { beginAtZero: true } } }
    });
</script>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
