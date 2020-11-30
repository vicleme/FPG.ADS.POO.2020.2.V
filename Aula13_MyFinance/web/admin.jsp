<%-- 
    Document   : index
    Created on : 9 de nov de 2020, 15:11:23
    Author     : rlarg
--%>

<%@page import="model.Usuario"%>
<%@page import="web.DbListener"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Início - FINANCY$</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h2>Administração da base de dados</h2>
        <%if(session.getAttribute("session.login")==null){%>
            <div>É preciso estar logado e ser administrador para visualizar essa página</div>
        <%}else if(!session.getAttribute("session.papel").equals("ADMINISTRADOR")){%>
            <div>É preciso ser administrador para visualizar essa página</div>
        <%}else{%>
            <h3>Status do DbListener:</h3>
            <div><%= DbListener.statusMessage %></div>
            <hr/>
            <h3>Usuários cadastrados</h3>
            <%for(Usuario u: Usuario.getList()){%>
            <div><%= u.getNome() %></div>
            <%}%>
        <%}%>
    </body>
</html>
