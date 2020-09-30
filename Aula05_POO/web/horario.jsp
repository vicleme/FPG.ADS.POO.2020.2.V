<%-- 
    Document   : data
    Created on : 21 de set de 2020, 22:28:37
    Author     : Victor
--%>
<%@page import="br.edu.fatecpg.poo.Horario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Horario atual = new Horario();
    atual.hora = 16;
    atual.minuto = 10;
    Horario intervalo = new Horario();
    intervalo.hora = 16;
    intervalo.minuto = 50;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>POO - Horário</title>
    </head>
    <body>
        <h2><a href="index.jsp">Voltar</a></h2>
        <h1>POO</h1>
        <h2>Horário</h2>
        <h3>Horário atual: <%= atual.hora+":"+atual.minuto %></h3>
        <h3>Horário do intervalo: <%= intervalo.hora+":"+intervalo.minuto %></h3>
    </body>
</html>
