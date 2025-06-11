<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Erreur</title>
</head>
<body>
    <h2>Une erreur est survenue</h2>
    <p><strong>Détail :</strong> <%= exception != null ? exception.getMessage() : "Erreur inconnue" %></p>
    <p><a href="ReservationController?action=view">Retour à la liste des réservations</a></p>
</body>
</html>
