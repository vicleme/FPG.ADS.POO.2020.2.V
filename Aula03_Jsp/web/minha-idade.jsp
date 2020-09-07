<%-- 
    Document   : minha-idade
    Created on : 31 de ago de 2020, 16:27:35
    Author     : Victor
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha idade - JSP</title>
    </head>
    <body>
        <h3><a href=index.jsp>Voltar</a></h3>
        <h1>Java Server Page</h1>
        <h2>Minha idade</h2>
        <%
            int anoAtual = Calendar.getInstance().get(Calendar.YEAR);
            int anoDoMeuNascimento = 2001;
            int idade = anoAtual - anoDoMeuNascimento;
        %>
        <h3>Meu nome: <u>VICTOR GABRIEL LEME DA SILVA</u></h3>
        <h3>Minha idade: <u><%=idade%> anos</ul></h3>
    <%@include file="WEB-INF/jspf/rodape.jspf"%>
    </body>
</html>
