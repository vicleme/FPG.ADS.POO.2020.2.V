<%-- 
    Document   : date-with-scriplet
    Created on : 4 de set de 2020, 21:34:20
    Author     : Victor
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data com scriplet - JSP</title>
    </head>
    <body>
        <h3><a href="index.jsp">Voltar</a></h3>
        <h1>Java Server Page</h1>
        <h2>Data/hora do servidor com scriptlet</h2>
            <%
            Date agora = new Date();
            out.println("<h3>Agora no servidor: <u>"+agora+"</u></h3>");
            %>
    <%@include file="WEB-INF/jspf/rodape.jspf"%>
    </body>
</html>
