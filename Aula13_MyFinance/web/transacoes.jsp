<%-- 
    Document   : index
    Created on : 9 de nov de 2020, 15:11:23
    Author     : rlarg
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Transacao"%>
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
            String datahora = request.getParameter("datahora");
            String descricao = request.getParameter("descricao");
            String categoria = request.getParameter("categoria");
            double valor = Double.parseDouble(request.getParameter("valor"));
            String origem = request.getParameter("origem");
            Transacao.inserirTransacao(datahora, descricao, categoria, valor, origem);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
        }
    }
    if(request.getParameter("FormAlterar")!=null){
        try{
            long rowId = Long.parseLong(request.getParameter("rowId"));
            String datahora = request.getParameter("datahora");
            String descricao = request.getParameter("descricao");
            String categoria = request.getParameter("categoria");
            double valor = Double.parseDouble(request.getParameter("valor"));
            String origem = request.getParameter("origem");
            Transacao.alterarTransacao(rowId, datahora, descricao, categoria, valor, origem);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
        }
    }
    if(request.getParameter("FormExcluir")!=null){
        try{
            long rowId = Long.parseLong(request.getParameter("rowId"));
            Transacao.excluirTransacao(rowId);
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
        <h2>Transações</h2>
        <%if(session.getAttribute("session.login")==null){%>
            <div>É preciso estar logado para acessar esta página</div>
        <%}else{%>
            <%if(exceptionMessage!=null){%>
            <div style="color: red"><%= exceptionMessage %></div>
            <%}%>
            <%if(request.getParameter("prepararDelete")!=null){%>
                <fieldset>
                    <legend>Excluir transação</legend>
                    <% String rowId = request.getParameter("rowId"); %>
                    <form method="post">
                        Excluir a transação <b><%= rowId %></b>?
                        <hr/>
                        <input type="hidden" name="rowId" value="<%= rowId %>"/>
                        <input type="submit" name="FormExcluir" value="Excluir"/>
                        <input type="submit" name="Cancelar" value="Cancelar"/>
                    </form>
                </fieldset>
            <%}else if(request.getParameter("prepararUpdate")!=null){%>
                <fieldset>
                    <legend>Alterar transação</legend>
                    <%
                        String transacaoExceptionMessage = null;
                        Transacao t = null;
                        try{
                            long rowId = Long.parseLong(request.getParameter("rowId")); 
                            t = Transacao.getTransacao(rowId);
                        }catch(Exception ex){
                            transacaoExceptionMessage = ex.getLocalizedMessage();
                        }
                    %>
                    <%if(transacaoExceptionMessage!=null){%>
                        <div style="color:red"><%= transacaoExceptionMessage %></div>
                    <%}else if(t==null){%>
                        <div>Transação não encontrada, provavelmente porque foi excluída por outro usuário</div>
                    <%}else{%>
                        <form method="post">
                            <div>ID:</div>
                            <div><b><%= t.getRowId() %></b></div>
                            <input type="hidden" name="rowId" value="<%= t.getRowId() %>"/>
                            <div>Data/hora</div>
                            <div>
                                <input type="datetime-local" 
                                       name="datahora"
                                       value="<%= t.getDatahora() %>"
                                       />
                            </div>
                            <div>Descrição:</div>
                            <div><input type="text" name="descricao" value="<%= t.getDescricao() %>"/></div>
                            <div>Categoria:</div>
                            <div>
                                <select name="categoria">
                                    <option value=""></option>
                                    <%for(Categoria c: Categoria.getList()){%>
                                    <option value="<%= c.getNome() %>" <%= c.getNome().equals(t.getCategoria())?"selected": "" %>>
                                        <%= c.getNome() %>
                                    </option>
                                    <%}%>
                                </select>
                            </div>
                            <div>Valor:</div>
                            <div><input type="number" name="valor" step="0.01" value="<%= t.getValor()%>"/></div>
                            <div>Origem:</div>
                            <div><input type="text" name="origem" value="<%= t.getOrigem()%>"/></div>
                            <hr/>
                            <input type="submit" name="FormAlterar" value="Alterar"/>
                            <input type="submit" name="Cancelar" value="Cancelar"/>
                        </form>
                    <%}%>
                </fieldset>
            <%}else if(request.getParameter("prepararInsert")!=null){%>
                <fieldset>
                    <legend>Inserir transação</legend>
                    <form method="post">
                        <div>Data/hora</div>
                        <div>
                            <input type="datetime-local" 
                                   name="datahora"
                                   value="<%= new SimpleDateFormat("yyyy-MM-dd'T'hh:mm").format(new Date()) %>"
                                   />
                        </div>
                        <div>Descrição:</div>
                        <div><input type="text" name="descricao"/></div>
                        <div>Categoria:</div>
                        <div>
                            <select name="categoria">
                                <option value=""></option>
                                <%for(Categoria c: Categoria.getList()){%>
                                <option value="<%= c.getNome() %>"><%= c.getNome() %></option>
                                <%}%>
                            </select>
                        </div>
                        <div>Valor:</div>
                        <div><input type="number" step="0.01" name="valor"/></div>
                        <div>Origem:</div>
                        <div><input type="text" name="origem"/></div>
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
            <h3>Lista de transações</h3>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Data/hora</th>
                    <th>Descrição</th>
                    <th>Categoria</th>
                    <th>Valor</th>
                    <th>Origem</th>
                    <th>Comandos</th>
                </tr>
                <%for(Transacao t: Transacao.getList()){%>
                <tr>
                    <td><%= t.getRowId() %></td>
                    <td><%= t.getDatahora()%></td>
                    <td><%= t.getDescricao()%></td>
                    <td><%= t.getCategoria()%></td>
                    <% String cor = t.getValor()<0? "red": "green"; %>
                    <td style="color: <%= cor %>; text-align: right">
                        <%= new DecimalFormat("#,###,###.00").format(t.getValor()) %>
                    </td>
                    <td><%= t.getOrigem() %></td>
                    <td>
                        <form method="post">
                            <input type="hidden" name="rowId" value="<%= t.getRowId() %>"/>
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
