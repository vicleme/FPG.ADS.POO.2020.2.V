/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package listeners;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.*;
import java.util.ArrayList;

/**
 * Web application lifecycle listener.
 *
 * @author rlarg
 */
public class DbListener implements ServletContextListener {
    public static final String CLASS_NAME = "org.sqlite.JDBC";
    public static final String URL = "jdbc:sqlite:aula12V.db";
    public static Exception exception = null;
    
    public static Connection getConnection() throws Exception{
        return DriverManager.getConnection(URL);
    }
    
    @Override
    @SuppressWarnings("ConvertToTryWithResources")
    public void contextInitialized(ServletContextEvent sce) {
        try{
            Class.forName(CLASS_NAME);
            Connection con = getConnection();
            Statement stmt = con.createStatement();
            stmt.execute("CREATE TABLE IF NOT EXISTS users("
                    + "name VARCHAR(200) NOT NULL,"
                    + "email VARCHAR(200) NOT NULL PRIMARY KEY,"
                    + "password integer NOT NULL"
                    + ")");
            if(getUsersEmails().isEmpty()){
                stmt.execute("INSERT INTO users VALUES("
                        + "'Administrador do Sistema',"
                        + "'admin@domain.com',"
                        + "1234".hashCode()
                        + ")");
                stmt.execute("INSERT INTO users VALUES("
                        + "'Fulano da Silva',"
                        + "'fulano@domain.com',"
                        + "1234".hashCode()
                        + ")");
                stmt.execute("INSERT INTO users VALUES("
                        + "'Beltrano da Silva',"
                        + "'beltrano@domain.com',"
                        + "1234".hashCode()
                        + ")");
                stmt.execute("INSERT INTO users VALUES("
                        + "'Cicrano da Silva',"
                        + "'cicrano@domain.com',"
                        + "1234".hashCode()
                        + ")");
            }
            stmt.execute("CREATE TABLE IF NOT EXISTS log("
                    + "email VARCHAR(200) NOT NULL,"
                    + "moment VARCHAR(25) NOT NULL,"
                    + "message VARCHAR(200) NOT NULL"
                    + ")");
            stmt.close();
            con.close();
        }catch(Exception ex){
            exception = ex;
        }
    }
    
    public static ArrayList<String> getUsersEmails() throws Exception{
        ArrayList<String> list = new ArrayList<>();
        Connection con = getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT email FROM users");
        while(rs.next()){
            list.add(rs.getString("email"));
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    
    public static ArrayList<String> getLog() throws Exception{
        ArrayList<String> list = new ArrayList<>();
        Connection con = getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM log");
        while(rs.next()){
            list.add(rs.getString("email")+"->"+rs.getString("moment"));
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    
    public static String getLoginName(String email, String password) throws Exception{
        String name = null;
        Connection con = getConnection();
        Statement stmt = con.createStatement();
        String SQL = "SELECT name FROM users "
                + "WHERE email = '"+email+"'"
                + "  AND password = "+password.hashCode();
        ResultSet rs = stmt.executeQuery(SQL);
        if(rs.next()){
            name = rs.getString("name");
        }
        rs.close();
        stmt.close();
        con.close();
        if(name!=null) addLog(email);
        return name;
    }
    
    public static String addLog(String email) throws Exception{
        String name = null;
        Connection con = getConnection();
        Statement stmt = con.createStatement();
        stmt.execute("INSERT INTO log "
                    + "VALUES('"+email+"', '"+new java.util.Date()+"', 'Login')");
        stmt.close();
        con.close();
        return name;
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
