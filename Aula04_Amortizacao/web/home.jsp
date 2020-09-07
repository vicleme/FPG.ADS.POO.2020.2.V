<%-- 
    Document   : index
    Created on : 5 de set de 2020, 15:47:41
    Author     : Victor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <%@include file="WEB-INF/jspf/head-references.jspf" %>
        <title>Calculadoras de Amortização</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <div id="container">
            <h1>Calculadoras de Amortização</h1>
            <hr/>
            <img alt="banner" src="images/banner.jpg"><br><br>
            <p>Estas calculadoras de amortização permitem estimar pagamentos periódicos de empréstimos e financiamentos, exibindo os valores das parcelas, das amortizações, dos juros e dos saldos devedores a partir dos valores dos empréstimos, das taxas de juros, da periodicidade dos juros e dos prazos.</p>
            <br>
            <table align="center" border="0">
                <tr>
                    <td><h4>Empréstimo</h4></td>
                    <td rowspan="4"><h1 style="color:#017269" align="center"><pre>    </pre><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-right-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-11.5.5a.5.5 0 0 1 0-1h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5z"/>
                            </svg><pre>    </pre></h1></td>
                    <td><h4>Parcelas</h4></td>
                </tr>
                <tr>
                    <td><h4>Taxa de juros</h4></td>

                    <td><h4>Amortizações</h4></td>
                </tr>
                <tr>
                    <td><h4>Periodicidade dos juros</h4></td>

                    <td><h4>Juros</h4></td>
                </tr>
                <tr>
                    <td><h4>Prazo</h4></td>

                    <td><h4>Saldos devedores</h4></td>
                </tr>
            </table>    
        </div>
        <br>
        <%@include file="WEB-INF/jspf/body-references.jspf" %>
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
