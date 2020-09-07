<%-- 
    Document   : amortizacao-constante
    Created on : 5 de set de 2020, 22:23:22
    Author     : Victor
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String erro = null;
    double vf;
    double tj;
    int nm;
    int pt;
    try {
        vf = Double.parseDouble(request.getParameter("vf"));
        tj = Double.parseDouble(request.getParameter("tj"));
        nm = Integer.parseInt(request.getParameter("nm"));
        pt = Integer.parseInt(request.getParameter("pt"));
    } catch (Exception ex) {
        vf = 0;
        tj = 0;
        nm = 0;
        pt = 1;
        if (request.getParameter("vf") != null || request.getParameter("tj") != null || request.getParameter("nm") != null || request.getParameter("pt") != null) {
            erro = "Valor(es) inválido(s) como parâmetro.";
        }
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">    
        <%@include file="WEB-INF/jspf/head-references.jspf" %>
        <title>Tabela Price</title>
    </head>

    <%@include file="WEB-INF/jspf/menu.jspf" %>

    <h1>Tabela Price</h1>
    <br>

    <div class="calculadora">
        <form class="calculadora">
            <div class="calculadora-campos">
                <div class="coluna" style="padding-bottom:5px">
                    <label for="vf" id="vfl">Valor financiado:</label>
                    <input id="vf" type="number" step="0.01" name="vf">
                    <label for="tj" id="tj1">Taxa de juros (%):</label>
                    <input id="tj" type="number" step="0.01" name="tj">
                    <br>
                </div>
                <div class="coluna" style="padding-bottom:5px"> <!-- aqui a coluna 2 -->
                    <label for="nm" id="nml">Número de meses:</label>
                    <input id="nm" type="number" name="nm">
                    <label for="pt" id="ptl">Periodicidade da taxa:</label>
                    <select id="pt" name="pt">
                        <option value="1">Mensal</option>
                        <option value="2">Anual</option>
                    </select>
                </div>
            </div>
            <div align="center" style="padding-bottom:10px">
                <input type="submit" value="Calcular" name="Calular" style="background-color:#017269;color:white;"/>
            </div>
        </form>
    </div>

    <%if (request.getParameter("vf") == null) {%>
    <div><br>Entre com os valores para gerar a tabela.</div>
        <%} else if (erro != null) {%>
    <div><br><%=erro%></div>
        <%} else {%>
        <%double amort = 0;%>
        <%Locale localeBR = new Locale("pt", "BR");%>
        <%NumberFormat dinheiro = NumberFormat.getCurrencyInstance(localeBR);%>
        <%double salddev = vf;%>
        <%double tjc = tj / 100;%>
        <%double contparc = 0;%>
        <%double contjuros = 0;%>
        <%double contamort = 0;%>
    <hr/>

    <table align="center" border="1">
        <th>Valor financiado</th>
        <th>Taxa de juros</th>
        <th>Número de meses</th>
        <th>Periodicidade da taxa</th>
        <tr>
            <td align="right" style="padding-right:10px"><%=dinheiro.format(vf)%></td>
            <td align="right" style="padding-right:10px"><%=tj%>%</td>
            <td align="right" style="padding-right:10px"><%=nm%></td>
            <td align="right" style="padding-right:10px">
                <%if (pt == 1) {
                %>Mensal<%
                } else if (pt == 2) {
                %>Anual<%
                        double tjac = tjc;
                        tjc = Math.pow((1 + tjac), 1.0 / 12) - 1;
                }%>
            </td>
        </tr>
    </table><br>
    
    <table align="center" border="1">
        <th>   #</th>
        <th>Parcelas</th>
        <th>Amortizações</th>
        <th>Juros</th>
        <th>Saldos devedores</th>

        <%for (int i = 1; i <= nm; i++) {%>
        <%double juros = salddev * tjc;%>
        <%double parc =vf*(((Math.pow((1+tjc),nm)*tjc))/((Math.pow((1+tjc),nm))-1));%>
        <%amort=parc-juros;%>
        <%salddev = salddev - amort;%>
        <%contparc = contparc + parc;%>
        <%contamort = contamort + amort;%>
        <%contjuros = contjuros + juros;%>
        <tr>
            <td align="center"><%=i%></td>
            <td align="right" style="padding-right:10px"><%=dinheiro.format(parc)%></td>
            <td align="right" style="padding-right:10px"><%=dinheiro.format(amort)%></td>
            <td align="right" style="padding-right:10px"><%=dinheiro.format(juros)%></td>
            <td align="right" style="padding-right:10px"><%=dinheiro.format(salddev)%></td>
        </tr>
        <%}%>
        <td style="padding-left:15px;padding-right:15px"><strong>Total</strong></td>
        <td align="right" style="padding-right:10px"><%=dinheiro.format(contparc)%></td>
        <td align="right" style="padding-right:10px"><%=dinheiro.format(contamort)%></td>
        <td align="right" style="padding-right:10px"><%=dinheiro.format(contjuros)%></td>
        <td align="center">---</td>
    </table>
    <%}%>

    <%@include file="WEB-INF/jspf/body-references.jspf" %>
    <%@include file="WEB-INF/jspf/rodape.jspf" %>
</html>