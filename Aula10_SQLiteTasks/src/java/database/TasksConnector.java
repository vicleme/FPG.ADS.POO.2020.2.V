/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author rlarg
 */
public class TasksConnector {
    public static final String URL = "jdbc:sqlite:C:\\Users\\rlarg\\Desktop\\tasks.db";
    
    public static ArrayList<String> getTasks() throws Exception{
        ArrayList<String> list = new ArrayList<>();
        Class.forName("org.sqlite.JDBC");
        Connection con = DriverManager.getConnection(URL);
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM Tasks");
        while(rs.next()){
            list.add(rs.getString("name"));
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    public static void insertTask(String name) throws Exception{
        Class.forName("org.sqlite.JDBC");
        Connection con = DriverManager.getConnection(URL);
        Statement stmt = con.createStatement();
        stmt.execute("INSERT INTO Tasks VALUES('"+name+"')");
        stmt.close();
        con.close();
    }
    public static void deleteTask(String name) throws Exception{
        Class.forName("org.sqlite.JDBC");
        Connection con = DriverManager.getConnection(URL);
        Statement stmt = con.createStatement();
        stmt.execute("DELETE FROM Tasks WHERE name = '"+name+"'");
        stmt.close();
        con.close();
    }
}