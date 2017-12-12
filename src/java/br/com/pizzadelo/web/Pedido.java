/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.pizzadelo.web;

import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author adalberto
 */
public class Pedido {
    private int cd_pedido;
    private int cpf_user;
    private double vl_total_pedido;
    private Date dt_pedido;
    private String nm_estado_pedido;
    private ArrayList<Item> itens;
    
    public static  Pedido getPedido(int cd_pedido) throws Exception{
         Pedido pedido = null;
         String SQL = "SELECT * FROM pedido WHERE cd_pedido = ?";
         PreparedStatement s = Database.getConnection().prepareStatement(SQL);
         s.setInt(1,cd_pedido);
         ResultSet rs = s.executeQuery();
         while(rs.next()){
            pedido = new Pedido(
                     rs.getInt("cd_pedido"),
                     rs.getInt("cpf_user"),
                     rs.getDouble("vl_total_pedido"),
                     rs.getDate("dt_pedido"),
                     rs.getString("nm_estado_pedido"),
                    null
             );             
         }
         rs.close();
         s.close();
         return pedido;
     }
    
    public static ArrayList<Pedido> getPedidoList() throws Exception{
        ArrayList<Pedido> list = new ArrayList<>();
        Statement s = Database.getConnection().createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM pedido");
        while(rs.next()){
            int cd = rs.getInt("cd_pedido");
            Pedido vs = new Pedido(
                     cd,
                     rs.getInt("cpf_user"),
                     rs.getDouble("vl_total_pedido"),
                     rs.getDate("dt_pedido"),
                     rs.getString("nm_estado_pedido"),
                     getItensFromPedido(cd)
            );
            list.add(vs);
        }
        rs.close();
        s.close();
        return list;
    }
    
    public static ArrayList<Item> getItensFromPedido(int cd_pedido) throws Exception{
        ArrayList<Item> list = new ArrayList<>();
        Item item = null;
        String SQL = "SELECT * FROM item WHERE cd_pedido = ?";
        PreparedStatement s = Database.getConnection().prepareStatement(SQL);
        s.setInt(1, cd_pedido);
        ResultSet rs = s.executeQuery();
        while(rs.next()){
            item = new Item(
                     rs.getInt("cd_item"),
                     rs.getDouble("vl_item"),
                     rs.getString("ds_item"),
                     rs.getString("nm_item"),
                     rs.getString("tipo_item")
             );
            list.add(item);
         }
         rs.close();
         s.close();
        return list;
    }

    public Pedido(int cd_pedido, int cpf_user, double vl_total_pedido, Date dt_pedido, String nm_estado_pedido, ArrayList<Item> itens) {
        this.cd_pedido = cd_pedido;
        this.cpf_user = cpf_user;
        this.vl_total_pedido = vl_total_pedido;
        this.dt_pedido = dt_pedido;
        this.nm_estado_pedido = nm_estado_pedido;
        this.itens = itens;
    }
    
    public void SalvarPedido() throws Exception{
        String SQL = "INSERT INTO pedido VALUES(default, ?, ?, ?, ?)";
        PreparedStatement s = Database.getConnection().prepareStatement(SQL);        
        s.setInt(1, this.cpf_user);
        s.setDouble(2, this.vl_total_pedido);
        s.setDate(3, new java.sql.Date(this.dt_pedido.getTime()));
        s.setString(4, this.getNm_estado_pedido());        
        s.execute();
        s.close();
        for(int i = 0; i < this.itens.size(); i++) {
            SQL = "INSERT INTO pedido_item VALUES(?, ?)";
            PreparedStatement x = Database.getConnection().prepareStatement(SQL);
            x.setInt(1, this.cd_pedido);
            x.setInt(2, this.itens.get(i).getCd_item());
        }
    }
    

    public String getNm_estado_pedido() {
        return nm_estado_pedido;
    }

    public void setNm_estado_pedido(String nm_estado_pedido) {
        this.nm_estado_pedido = nm_estado_pedido;
    }

    public int getCd_pedido() {
        return cd_pedido;
    }

    public void setCd_pedido(int cd_pedido) {
        this.cd_pedido = cd_pedido;
    }

    public int getCpf_user() {
        return cpf_user;
    }

    public void setCpf_user(int cpf_user) {
        this.cpf_user = cpf_user;
    }

    public double getVl_total_pedido() {
        return vl_total_pedido;
    }

    public void setVl_total_pedido(double vl_total_pedido) {
        this.vl_total_pedido = vl_total_pedido;
    }

    public Date getDt_pedido() {
        return dt_pedido;
    }

    public void setDt_pedido(Date dt_pedido) {
        this.dt_pedido = dt_pedido;
    }
    
    
    
}
