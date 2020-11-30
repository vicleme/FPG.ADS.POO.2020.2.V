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
public class Transacao {
    private long rowId;
    private String datahora;
    private String descricao;
    private String categoria;
    private double valor;
    private String origem;
    
    public static ArrayList<Transacao> getList() throws Exception{
        ArrayList<Transacao> list = new ArrayList<>();
        Connection con = DbListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT rowid, * FROM transacoes");
        while(rs.next()){
            list.add(new Transacao(
                    rs.getLong("rowId"),
                    rs.getString("datahora"),
                    rs.getString("descricao"),
                    rs.getString("categoria"),
                    rs.getDouble("valor"),
                    rs.getString("origem")
            ));
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    
    public static Transacao getTransacao(long rowId) throws Exception{
        Transacao t = null;
        Connection con = DbListener.getConnection();
        PreparedStatement stmt = con.prepareStatement
        ("SELECT rowid, * FROM transacoes WHERE rowid=?");
        stmt.setLong(1, rowId);
        ResultSet rs = stmt.executeQuery();
        if(rs.next()){
            t = new Transacao(
                    rs.getLong("rowId"),
                    rs.getString("datahora"),
                    rs.getString("descricao"),
                    rs.getString("categoria"),
                    rs.getDouble("valor"),
                    rs.getString("origem")
            );
        }
        rs.close();
        stmt.close();
        con.close();
        return t;
    }
    
    public static void inserirTransacao(String datahora, String descricao, String categoria, double valor, String origem) throws Exception{
        Connection con = DbListener.getConnection();
        PreparedStatement stmt = con.prepareStatement
        ("INSERT INTO transacoes(datahora, descricao, categoria, valor, origem) VALUES(?,?,?,?,?)");
        stmt.setString(1, datahora);
        stmt.setString(2, descricao);
        stmt.setString(3, categoria);
        stmt.setDouble(4, valor);
        stmt.setString(5, origem);
        stmt.execute();
        stmt.close();
        con.close();
    }
    
    public static void alterarTransacao(long rowId, String datahora, String descricao, String categoria, double valor, String origem) throws Exception{
        Connection con = DbListener.getConnection();
        PreparedStatement stmt = con.prepareStatement
        ("UPDATE transacoes "
                + "SET datahora=?, descricao=?, categoria=?, valor=?, origem=? "
                + "WHERE rowid = ?");
        stmt.setString(1, datahora);
        stmt.setString(2, descricao);
        stmt.setString(3, categoria);
        stmt.setDouble(4, valor);
        stmt.setString(5, origem);
        stmt.setLong(6, rowId);
        stmt.execute();
        stmt.close();
        con.close();
    }
    
    public static void excluirTransacao(long rowId) throws Exception{
        Connection con = DbListener.getConnection();
        PreparedStatement stmt = con.prepareStatement
        ("DELETE FROM transacoes WHERE rowid= ?");
        stmt.setLong(1, rowId);
        stmt.execute();
        stmt.close();
        con.close();
    }

    public Transacao(long rowId, String datahora, String descricao, String categoria, double valor, String origem) {
        this.rowId = rowId;
        this.datahora = datahora;
        this.descricao = descricao;
        this.categoria = categoria;
        this.valor = valor;
        this.origem = origem;
    }

    public String getOrigem() {
        return origem;
    }

    public void setOrigem(String origem) {
        this.origem = origem;
    }

    public long getRowId() {
        return rowId;
    }

    public void setRowId(long rowId) {
        this.rowId = rowId;
    }

    public String getDatahora() {
        return datahora;
    }

    public void setDatahora(String datahora) {
        this.datahora = datahora;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }
    
    public static String getCreateStatement(){
        return "CREATE TABLE IF NOT EXISTS transacoes("
                + "datahora VARCHAR(25) NOT NULL,"
                + "descricao VARCHAR(200) NOT NULL,"
                + "categoria VARCHAR(50) NOT NULL,"
                + "valor numeric(10,2) NOT NULL,"
                + "origem VARCHAR(200) NOT NULL,"
                + "FOREIGN KEY (categoria) REFERENCES categorias(nome)"
                + ")";
    }
}