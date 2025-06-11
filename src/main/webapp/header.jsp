 <%@ page import="util.XMLLangLoader" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
    // Récupérer la langue depuis le paramètre URL ou la session
    String lang = request.getParameter("lang");
    if (lang == null) lang = (String) session.getAttribute("lang");
    if (lang == null) lang = "fr"; // langue par défaut
    else session.setAttribute("lang", lang);

    // Charger le fichier XML de traduction
    InputStream input = application.getResourceAsStream("/WEB-INF/source/lang.xml");
    XMLLangLoader loader = new XMLLangLoader(input);
%>

<header class="custom-header">
    <div class="header-left">
     <div style="font-size: 24px; font-weight: bold;">
    <%= loader.getText("app_title", lang) %>
</div>

    </div>
    <nav class="nav-links">
        <a href="accueil.jsp?lang=<%= lang %>" class="nav-link"><%= loader.getText("accueil", lang) %></a>
        <a href="agent.jsp?lang=<%= lang %>" class="nav-link"><%= loader.getText("liste_agent", lang) %></a>
        <a href="ruche.jsp?lang=<%= lang %>" class="nav-link"><%= loader.getText("liste_ruche", lang) %></a>
        <a href="site.jsp?lang=<%= lang %>" class="nav-link"><%= loader.getText("liste_site", lang) %></a>
        <a href="ferme.jsp?lang=<%= lang %>" class="nav-link"><%= loader.getText("liste_ferme", lang) %></a>
        <a href="fermier.jsp?lang=<%= lang %>" class="nav-link"><%= loader.getText("liste_fermier", lang) %></a>
        <a href="lougout.jsp?lang=<%= lang %>" class="nav-link logout"><%= loader.getText("deconnexion", lang) %></a>
    </nav>

     <div class="language-switcher" style="font-weight: bold;">
        <a href="?lang=fr" style="color: white; margin: 0 8px; text-decoration: none;">FR</a> |
        <a href="?lang=en" style="color: white; margin: 0 8px; text-decoration: none;">EN</a> |
        <a href="?lang=ar" style="color: white; margin: 0 8px; text-decoration: none;">AR</a>
    </div>

</header>

<style>
    .custom-header {
        background: linear-gradient(90deg, #cddc39, #afb42b);
        padding: 15px 15px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-radius: 0 0 10px 10px;
        font-family: 'Segoe UI', sans-serif;
        box-shadow: 0 3px 10px rgba(0, 0, 0, 0.15);
    }

    .header-left {
        display: flex;
        align-items: center;
        gap: 20px;
    }

    .bee-logo {
        width: 120px;
        height:120px;
        border-radius: 50%;
        border: 2px solid #ffffff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        object-fit: cover;
    }

    .brand {
        font-size: 32px;
        font-weight: bold;
        color: #1b5e20;
        letter-spacing: 1.5px;
    }

    .nav-links {
        display: flex;
        gap: 14px;
        flex-wrap: wrap;
    }

    .nav-link {
        color: white;
        background-color: #33691e;
        text-decoration: none;
        font-weight: 600;
        padding: 10px 16px;
        border-radius: 25px;
        transition: background-color 0.3s ease, transform 0.3s ease;
        box-shadow: 0 2px 6px rgba(0,0,0,0.2);
    }

    .nav-link:hover {
        background-color: #558b2f;
        transform: translateY(-2px);
    }

    .logout {
        background-color: #ef5350 !important;
        color: #fff !important;
    }

    .logout:hover {
        background-color: #e53935 !important;
    }

    
</style>