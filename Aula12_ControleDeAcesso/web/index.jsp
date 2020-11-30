<%-- 
    Document   : index
    Created on : 26 de out de 2020, 15:22:26
    Author     : rlarg
--%>

<%@page import="listeners.DbListener"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Início - Controle de Acesso</title>
    </head>
    <body>
        <%
            String loginErrorMessage = null;
            if(request.getParameter("login")!=null){
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String name = DbListener.getLoginName(email, password);
                if(name!=null){
                    session.setAttribute("email", email);
                    session.setAttribute("name", name);
                    response.sendRedirect(request.getRequestURI());
                }else{
                    loginErrorMessage = "Usuário ou senha inválidos!";
                }
            }
            if(request.getParameter("logout")!=null){
                session.removeAttribute("email");
                response.sendRedirect(request.getRequestURI());
            }
        %>
        <%if(session.getAttribute("email")==null){%>
        <%if(loginErrorMessage!=null){%>
        <div style="color: red"><%= loginErrorMessage %></div>
        <%}%>
        <form method="post">
            Email:<input type="text" name="email"/>
            Senha:<input type="password" name="password"/>
            <input type="submit" value="Entrar" name="login"/>
        </form>
        <%}else{%>
        <form method="post">
            Bem vindo, <%= session.getAttribute("name") %>
            <input type="submit" value="Sair" name="logout"/>
        </form>
        <%}%>
        <h1>Controle de acesso</h1>
        <%if(DbListener.exception!=null){%>
            <hr/>
            <div style="color: red"><%= DbListener.exception.getMessage() %></div>
            <hr/>
        <%}%>
        <h2>Usuários:</h2>
        <%for(String email: DbListener.getUsersEmails()){%>
        <div><%= email %></div>
        <%}%>
        <h2>Log:</h2>
        <%for(String email: DbListener.getLog()){%>
        <div><%= email %></div>
        <%}%>
    </body>
</html>
