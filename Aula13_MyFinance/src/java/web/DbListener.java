/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.*;
import model.Categoria;
import model.Transacao;
import model.Usuario;

/**
 * Web application lifecycle listener.
 *
 * @author rlarg
 */
public class DbListener implements ServletContextListener {
    public static final String CLASS_NAME = "org.sqlite.JDBC";
    public static final String URL = "jdbc:sqlite:my_finance.db";
    
    public static String exceptionMessage = null;
    public static String statusMessage = null;

    public static Connection getConnection() throws Exception{
        return DriverManager.getConnection(URL);
    }
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        Connection con = null;
        Statement stmt = null;
        try{
            Class.forName(CLASS_NAME);
            con = DriverManager.getConnection(URL);
            statusMessage = "Conectou em "+new java.util.Date()+"<br/>";
            stmt = con.createStatement();
            statusMessage += "Criando tabela 'usuarios' em "+new java.util.Date()+"...<br/>";
            //TABELA usuarios
            stmt.execute(Usuario.getCreateStatement());
            statusMessage += "Tabela 'usuarios' criada em "+new java.util.Date()+"<br/>";
            if(Usuario.getList().isEmpty()){
                statusMessage += "Tabela vazia, criando usuários em "+new java.util.Date()+"<br/>";
                stmt.execute("INSERT INTO usuarios "
                + "VALUES('admin', 'Administrador', 'ADMINISTRADOR', "+"1234".hashCode()+")");
                statusMessage += "; usuário 'admin' criado";
                stmt.execute("INSERT INTO usuarios "
                + "VALUES('fulano', 'Fulano da Silva', 'USUÁRIO', "+"1234".hashCode()+")");
                statusMessage += "; usuário 'fulano' criado";
            }
            //TABELA categorias
            statusMessage += "Criando tabela 'categorias' em "+new java.util.Date()+"...<br/>";
            stmt.execute(Categoria.getCreateStatement());
            statusMessage += "Tabela 'categorias' criada em "+new java.util.Date()+"<br/>";
            
            //TABELA transacoes
            statusMessage += "Criando tabela 'transacoes' em "+new java.util.Date()+"...<br/>";
            stmt.execute(Transacao.getCreateStatement());
            statusMessage += "Tabela 'transacoes' criada em "+new java.util.Date()+"<br/>";
            
            //TODO: criar as tabelas categorias e transações
            statusMessage += "Desconectou em "+new java.util.Date()+"<br/>";
        }catch(Exception ex){
            statusMessage += "Ocorreu exceção em "+new java.util.Date()+"<br/>";
            exceptionMessage = ex.getLocalizedMessage();
        }finally{
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
