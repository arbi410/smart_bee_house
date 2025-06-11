<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mettre à jour la réservation</title>
    <style>
      <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ecf0f1;
        }


        .container {
            max-width: 500px;
            margin: auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin-top: 15px;
            color: #555;
        }

        input[type="text"],
        input[type="email"],
        input[type="telephone"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .buttons {
            margin-top: 25px;
            display: flex;
            justify-content: space-between;
        }

        input[type="submit"],
        .back-button {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
        }

        input[type="submit"] {
            background-color: #28a745;
        }

        .back-button {
            background-color: #007bff;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        .back-button:hover {
            background-color: #0069d9;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>

 

<%
    String id = request.getParameter("id");
    String nom = request.getParameter("nom");
    String prenom = request.getParameter("prenom");
    String email = request.getParameter("email");
    String telephone = request.getParameter("telephone");
%>

<div class="container">
    <h1>Mettre à jour la réservation de client </h1>

    <form action="traitement_update.jsp" method="post">
        <input type="hidden" name="id" value="<%= id %>">
        
        <label>Nom :</label>
        <input type="text" name="nom" value="<%= nom %>">

        <label>Prénom :</label>
        <input type="text" name="prenom" value="<%= prenom %>">

        <label>Email :</label>
        <input type="email" name="email" value="<%= email %>">

        <label>Téléphone :</label>
        <input type="telephone" name="telephone" value="<%= telephone %>">

        <div class="buttons">
            <input type="submit" value="Mettre à jour">
            <a href="listeClient.jsp" class="back-button">Retour</a>
        </div>
    </form>
</div>

</body>
</html>
