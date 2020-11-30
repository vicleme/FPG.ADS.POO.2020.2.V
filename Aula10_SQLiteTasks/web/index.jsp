<%-- 
    Document   : index
    Created on : 19 de out de 2020, 16:15:18
    Author     : rlarg
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="database.TasksConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String errorMessage = null;
    try{
        if(request.getParameter("insert")!=null){
            String name = request.getParameter("name");
            TasksConnector.insertTask(name);
            response.sendRedirect(request.getRequestURI());
        }
    }catch(Exception ex){
        errorMessage = "Erro ao inserir nova tarefa"+ex.getMessage();
    }
    try{
        if(request.getParameter("delete")!=null){
            String name = request.getParameter("name");
            TasksConnector.deleteTask(name);
            response.sendRedirect(request.getRequestURI());
        }
    }catch(Exception ex){
        errorMessage = "Erro ao excluir tarefa"+ex.getMessage();
    }
    ArrayList<String> tasks = new ArrayList<>();
    try{
        tasks = TasksConnector.getTasks();
    }catch(Exception ex){
        errorMessage = "Erro ao excluir tarefa"+ex.getMessage();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tarefas - SQLite</title>
    </head>
    <body>
        <h1>SQLite</h1>
        <h2>Tarefas</h2>
        <form>
            <input type="text" name="name" />
            <input type="submit" name="insert" value="Inserir tarefa" />
        </form>
        <hr/>
        <%if(errorMessage!=null){%>
            <div style="color: red"><%= errorMessage %></div>
            <hr/>
        <%}%>
        <table border="1">
            <tr>
                <th>Nome</th>
                <th>Comandos</th>
            </tr>
            <%for(String name: tasks){%>
            <tr>
                <td><%= name %></td>
                <td>
                    <form>
                        <input type="hidden" name="name" value="<%=name%>"/>
                        <input type="submit" name="delete" value="Excluir"/>
                    </form>
                </td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
