<%-- 
    Document   : contato
    Created on : 24 de set de 2020, 13:50:07
    Author     : Victor
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.fatecpg.poo.Contato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Contato> contatosList = (ArrayList) application.getAttribute("contatosList");
    if(contatosList==null){
        contatosList = new ArrayList<>();
        contatosList.add(new Contato("admin1","admin1@domain.com","11900000000"));
        contatosList.add(new Contato("admin2","admin2@domain.com","11900000000"));
        contatosList.add(new Contato("admin3","admin3@domain.com","11900000000"));
        contatosList.add(new Contato("admin4","admin4@domain.com","1100000000"));
        application.setAttribute("contatosList", contatosList);
    }
    if(request.getParameter("add")!=null){
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        contatosList.add(new Contato(name,email,telefone));
        response.sendRedirect(request.getRequestURI());
    }
    if(request.getParameter("remove")!=null){
        int i = Integer.parseInt(request.getParameter("i"));
        contatosList.remove(i);
        response.sendRedirect(request.getRequestURI());
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>POO - Contatos</title>
    </head>
    <body>
        <h2><a href="index.jsp">Voltar</a></h2>
        <h1>POO</h1>
        <h2>Contatos</h2>
        <form>
            Nome: <input type="text" name="name"/>
            E-mail: <input type="text" name="email"/>
            Telefone: <input type="text" name="telefone"/>
            <input type="submit" value="Adicionar" name="add"/>
        </form>
        <hr>
        <table border="1">
            <tr>
                <th>Índice</th>
                <th>Nome</th>
                <th>Email</th>
                <th>Telefone</th>
                <th>Comandos</th>
            </tr>
            <%for(int i=0; i<contatosList.size();i++) {%>
            <tr>
                <td><%= i %></td>
                <% Contato c= contatosList.get(i); %>
                <td><%= c.getName() %></td>
                <td><%= c.getEmail() %></td>
                <td><%= c.getTelefone() %></td>
                <td><form><input type="hidden" name="i" value="<%=i%>"/>
                <input type="submit" name="remove" value="Remover"/></form></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>