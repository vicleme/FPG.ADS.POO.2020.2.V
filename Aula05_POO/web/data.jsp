<%-- 
    Document   : data
    Created on : 21 de set de 2020, 22:28:37
    Author     : Victor
--%>
<%@page import="br.edu.fatecpg.poo.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Data hoje = new Data();
    hoje.dia = 21;
    hoje.mês = 9;
    hoje.ano = 2020;
    Data nasc = new Data();
    nasc.dia = 18;
    nasc.mês = 3;
    nasc.ano = 2001;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>POO - Data</title>
    </head>
    <body>
        <h2><a href="index.jsp">Voltar</a></h2>
        <h1>POO</h1>
        <h2>Data</h2>
        <h3>Hoje: <%= hoje.dia+"/"+hoje.mês+"/"+hoje.ano %></h3>
        <h3>Nascimento: <%= nasc.dia+"/"+nasc.mês+"/"+nasc.ano %></h3>
    </body>
</html>
