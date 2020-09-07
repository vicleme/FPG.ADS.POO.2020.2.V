<%-- 
    Document   : index
    Created on : 4 de set de 2020, 21:00:57
    Author     : Victor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index - JSP</title>
    </head>
    <body>
        <h1>Java Server Pages</h1>
        <h2>Index</h2>
        <h3><a href="date-with-scriptlet.jsp">Data/hora do servidor com scriplet</a></h3>
        <h3><a href="date-with-expression.jsp">Data/hora do servidor com expression</a></h3>
        <h3><a href="date-with-scriptlet-and-expression.jsp">Data/hora do servidor com scriplet e expression</a></h3>
        <h3><a href="minha-idade.jsp">Minha idade</a></h3>
        <h3><a href="numeros-aleatorios.jsp">Numeros aleatórios</a></h3>
        <h3><a href="numeros-aleatorios-parametrizado.jsp">Numeros aleatórios parametrizado</a></h3>
        <h3><a href="tabuada.jsp">Tabuada</a></h3>
        <%@include file="WEB-INF/jspf/rodape.jspf"%>
    </body>
</html>
