<%-- 
    Document   : index
    Created on : 9 de nov de 2020, 15:11:23
    Author     : rlarg
--%>

<%@page import="model.Categoria"%>
<%@page import="model.Usuario"%>
<%@page import="web.DbListener"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
    String exceptionMessage = null;
    if(request.getParameter("Cancelar")!=null){
        response.sendRedirect(request.getRequestURI());
    }
    if(request.getParameter("FormInserir")!=null){
        try{
            String nome = request.getParameter("nome");
            String descricao = request.getParameter("descricao");
            Categoria.inserirCategoria(nome, descricao);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
        }
    }
    if(request.getParameter("FormAlterar")!=null){
        try{
            String nome = request.getParameter("nome");
            String novoNome = request.getParameter("novoNome");
            String descricao = request.getParameter("descricao");
            Categoria.alterarCategoria(nome, novoNome, descricao);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
        }
    }
    if(request.getParameter("FormExcluir")!=null){
        try{
            String nome = request.getParameter("nome");
            Categoria.excluirCategoria(nome);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categorias - FINANCY$</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h2>Categorias</h2>
        <%if(session.getAttribute("session.login")==null){%>
            <div>É preciso estar logado para acessar esta página</div>
        <%}else{%>
            <%if(exceptionMessage!=null){%>
            <div style="color: red"><%= exceptionMessage %></div>
            <%}%>
            <%if(request.getParameter("prepararDelete")!=null){%>
                <fieldset>
                    <legend>Excluir categoria</legend>
                    <% String nome = request.getParameter("nome"); %>
                    <form method="post">
                        Excluir a categoria <b><%= nome %></b>?
                        <hr/>
                        <input type="hidden" name="nome" value="<%= nome %>"/>
                        <input type="submit" name="FormExcluir" value="Excluir"/>
                        <input type="submit" name="Cancelar" value="Cancelar"/>
                    </form>
                </fieldset>
            <%}else if(request.getParameter("prepararUpdate")!=null){%>
                <fieldset>
                    <legend>Alterar categoria</legend>
                    <% String nome = request.getParameter("nome"); %>
                    <% String descricao = request.getParameter("descricao"); %>
                    <form method="post">
                        <input type="hidden" name="nome" value="<%= nome %>"/>
                        <div>Nome:</div>
                        <div><input type="text" name="novoNome" value="<%= nome %>"/></div>
                        <div>Descrição:</div>
                        <div><input type="text" name="descricao" value="<%= descricao %>"/></div>
                        <hr/>
                        <input type="submit" name="FormAlterar" value="Alterar"/>
                        <input type="submit" name="Cancelar" value="Cancelar"/>
                    </form>
                </fieldset>
            <%}else if(request.getParameter("prepararInsert")!=null){%>
                <fieldset>
                    <legend>Inserir categoria</legend>
                    <form method="post">
                        <div>Nome:</div>
                        <div><input type="text" name="nome"/></div>
                        <div>Descrição:</div>
                        <div><input type="text" name="descricao"/></div>
                        <hr/>
                        <input type="submit" name="FormInserir" value="Inserir"/>
                        <input type="submit" name="Cancelar" value="Cancelar"/>
                    </form>
                </fieldset>
            <%}else{%>
                <form method="post">
                    <input type="submit" name="prepararInsert" value="Inserir"/>
                </form>
            <%}%>
            <hr/>
            <h3>Lista de categorias</h3>
            <table border="1">
                <tr>
                    <th>Nome</th>
                    <th>Descrição</th>
                    <th>Comandos</th>
                </tr>
                <%for(Categoria c: Categoria.getList()){%>
                <tr>
                    <td><%= c.getNome()%></td>
                    <td><%= c.getDescrição()%></td>
                    <td>
                        <form method="post">
                            <input type="hidden" name="nome" value="<%= c.getNome() %>"/>
                            <input type="hidden" name="descricao" value="<%= c.getDescrição() %>"/>
                            <input type="submit" name="prepararUpdate" value="Alterar"/>
                            <input type="submit" name="prepararDelete" value="Excluir"/>
                        </form>
                    </td>
                </tr>
                <%}%>
            </table>
        <%}%>
    </body>
</html>
