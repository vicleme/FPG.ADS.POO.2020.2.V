<%-- 
    Document   : users
    Created on : 22 de set de 2020, 00:52:09
    Author     : Victor
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.fatecpg.poo.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<User> usersList = (ArrayList) application.getAttribute("usersList");
    if(usersList==null){
        usersList = new ArrayList<>();
        usersList.add(new User("admin1","admin1@domain.com","1234"));
        usersList.add(new User("admin2","admin2@domain.com","1234"));
        usersList.add(new User("admin3","admin3@domain.com","1234"));
        usersList.add(new User("admin4","admin4@domain.com","1234"));
        application.setAttribute("usersList", usersList);
    }
    if(request.getParameter("add")!=null){
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        usersList.add(new User(name,email,password));
        response.sendRedirect(request.getRequestURI());
    }
    if(request.getParameter("remove")!=null){
        int i = Integer.parseInt(request.getParameter("i"));
        usersList.remove(i);
        response.sendRedirect(request.getRequestURI());
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>POO - Usuários</title>
    </head>
    <body>
        <h2><a href="index.jsp">Voltar</a></h2>
        <h1>POO</h1>
        <h2>Usuários</h2>
        <form>
            Nome: <input type="text" name="name"/>
            E-mail: <input type="text" name="email"/>
            Senha: <input type="password" name="password"/>
            <input type="submit" value="Adicionar" name="add"/>
        </form>
        <hr>
        <table border="1">
            <tr>
                <th>Índice</th>
                <th>Nome</th>
                <th>Email</th>
                <th>Password</th>
                <th>Comandos</th>
            </tr>
            <%for(int i=0; i<usersList.size();i++) {%>
            <tr>
                <td><%= i %></td>
                <% User u= usersList.get(i); %>
                <td><%= u.getName() %></td>
                <td><%= u.getEmail() %></td>
                <td><%= u.getPassword() %></td>
                <td><form><input type="hidden" name="i" value="<%=i%>"/>
                <input type="submit" name="remove" value="Remover"/></form></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
