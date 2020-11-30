/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.*;
import java.util.ArrayList;
import web.DbListener;

/**
 *
 * @author rlarg
 */
public class Categoria {
    private String nome;
    private String descrição;
    
    public static ArrayList<Categoria> getList() throws Exception{
        ArrayList<Categoria> list = new ArrayList<>();
        Connection con = DbListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM categorias");
        while(rs.next()){
            list.add(new Categoria(
                    rs.getString("nome"),
                    rs.getString("descricao")
            ));
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    
    public static void inserirCategoria(String nome, String descricao) throws Exception{
        Connection con = DbListener.getConnection();
        PreparedStatement stmt = con.prepareStatement
        ("INSERT INTO categorias(nome, descricao) VALUES(?,?)");
        stmt.setString(1, nome);
        stmt.setString(2, descricao);
        stmt.execute();
        stmt.close();
        con.close();
    }
    
    public static void alterarCategoria(String nome, String novoNome, String descricao) throws Exception{
        Connection con = DbListener.getConnection();
        PreparedStatement stmt = con.prepareStatement
        ("UPDATE categorias SET nome=?, descricao=? WHERE nome=?");
        stmt.setString(1, novoNome);
        stmt.setString(2, descricao);
        stmt.setString(3, nome);
        stmt.execute();
        stmt.close();
        con.close();
    }
    
    public static void excluirCategoria(String nome) throws Exception{
        Connection con = DbListener.getConnection();
        PreparedStatement stmt = con.prepareStatement
        ("DELETE FROM categorias WHERE nome= ?");
        stmt.setString(1, nome);
        stmt.execute();
        stmt.close();
        con.close();
    }

    public Categoria(String nome, String descrição) {
        this.nome = nome;
        this.descrição = descrição;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescrição() {
        return descrição;
    }

    public void setDescrição(String descrição) {
        this.descrição = descrição;
    }
    
    public static String getCreateStatement(){
        return "CREATE TABLE IF NOT EXISTS categorias("
                + "nome VARCHAR(50) PRIMARY KEY,"
                + "descricao VARCHAR(200) NOT NULL"
                + ")";
    }
}