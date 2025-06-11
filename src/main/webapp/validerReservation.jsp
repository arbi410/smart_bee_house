<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirmation</title>

     <style>
  
    
        .confirmation-box {
            background-color: #ffffff;
            padding: 40px 50px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            text-align: center;
            width: 100%;
            max-width: 500px;
        }

        .confirmation-box h2 {
            color: #2c3e50;
            font-size: 28px;
            margin-bottom: 20px;
            text-align: center;
        }

        .confirmation-box p {
            font-size: 18px;
            color: #34495e;
            text-align: center;
        }

        .icon {
            font-size: 50px;
            color: #2ecc71;
            margin-bottom: 20px;
        }</style>
</head>
    <%@ include file="header.jsp" %>

<body>
<div class="confirmation-box">
    <div class="icon">✅</div>
    <h2>Merci pour votre réservation, <%= request.getParameter("nom") %> !</h2>
    <p>Votre réservation pour le <strong><%= request.getParameter("date") %></strong> à <strong><%= request.getParameter("heure") %></strong> a été prise en compte.</p>
</div>
</body>
</html>
