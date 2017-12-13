

package br.com.pizzadelo.web;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class Item {
    private int cd_item;
    private double vl_item;
    private String ds_item;
    private String nm_item;
    private String tipo_item;

    
    public static  Item getItemPizza(int cd_item) throws Exception{
         Item item = null;
         String SQL = "SELECT * FROM item WHERE cd_item =?";
         PreparedStatement s = Database.getConnection().prepareStatement(SQL);
         s.setInt(1,cd_item);
         ResultSet rs = s.executeQuery();
         while(rs.next()){
            item = new Item(
                     rs.getInt("cd_item"),
                     rs.getDouble("vl_item"),
                     rs.getString("ds_item"),
                     rs.getString("nm_item"),
                     rs.getString("tipo_item")
             );             
         }
         rs.close();
         s.close();
         return item;
     }
    
    public static ArrayList<Item> getPizzaList() throws Exception{
        ArrayList<Item> list = new ArrayList<>();
        Statement s = Database.getConnection().createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM item where tipo_item = 'PIZZA'");
        while(rs.next()){
            Item vs = new Item(
                     rs.getInt("cd_item"),
                     rs.getDouble("vl_item"),
                     rs.getString("ds_item"),
                     rs.getString("nm_item"),
                     rs.getString("tipo_item")
            );
            list.add(vs);
        }
        rs.close();
        s.close();
        return list;
    }
    
    public static ArrayList<Item> getBebidaList() throws Exception{
        ArrayList<Item> list = new ArrayList<>();
        Statement s = Database.getConnection().createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM item where tipo_item = 'BEBIDA'");
        while(rs.next()){
            Item vs = new Item(
                     rs.getInt("cd_item"),
                     rs.getDouble("vl_item"),
                     rs.getString("ds_item"),
                     rs.getString("nm_item"),
                     rs.getString("tipo_item")
            );
            list.add(vs);
        }
        rs.close();
        s.close();
        return list;
    }

    public static void inserirPizza(double vl_item , String ds_item, String nm_item) throws Exception{
        String SQL = "INSERT INTO item VALUES(default,?,?,?,?)";
        PreparedStatement s = Database.getConnection().prepareStatement(SQL);        
        s.setDouble(1, vl_item);
        s.setString(2, ds_item);
        s.setString(3, nm_item);
        s.setString(4, "PIZZA");        
        s.execute();
        s.close();
    }
    public static void inserirBebida( double vl_item , String ds_item, String nm_item) throws Exception{
        String SQL = "INSERT INTO item VALUES(default,?,?,?,?)";
        PreparedStatement s = Database.getConnection().prepareStatement(SQL);
        s.setDouble(1, vl_item);
        s.setString(2, ds_item);
        s.setString(3, nm_item);
        s.setString(4, "BEBIDA");        
        s.execute();
        s.close();
    }
    public static void editaItem(int cd_item,double vl_item , String ds_item, String nm_item, String tipo_item) throws Exception{
           
            String SQL = "UPDATE item SET vl_item=?,ds_item=?,nm_item=?,tipo_item=? WHERE cd_item=?";
            PreparedStatement s = Database.getConnection().prepareStatement(SQL);
            s.setDouble(1, vl_item);
            s.setString(2, ds_item);
            s.setString(3, nm_item);
            s.setString(4, tipo_item);
            s.setInt(5, cd_item);
            s.execute();
            s.close();
            
     }
    
    public static void deletaItem(int cd_item) throws Exception{
        String SQL ="DELETE FROM item WHERE cd_item =?";
        PreparedStatement s = Database.getConnection().prepareStatement(SQL);
        s.setInt(1,cd_item);
        s.execute();
        s.close();        
    }
    
    public Item(int cd_item, double vl_item, String ds_item, String nm_item, String tipo_item) {
        this.cd_item = cd_item;
        this.vl_item = vl_item;
        this.ds_item = ds_item;
        this.nm_item = nm_item;
        this.tipo_item = tipo_item;
    }
    
    
    
    
    public int getCd_item() {
        return cd_item;
    }

    public void setCd_item(int cd_item) {
        this.cd_item = cd_item;
    }

    public double getVl_item() {
        return vl_item;
    }

    public void setVl_item(double vl_item) {
        this.vl_item = vl_item;
    }

    public String getDs_item() {
        return ds_item;
    }

    public void setDs_item(String ds_item) {
        this.ds_item = ds_item;
    }

    public String getNm_item() {
        return nm_item;
    }

    public void setNm_item(String nm_item) {
        this.nm_item = nm_item;
    }

    public String getTipo_item() {
        return tipo_item;
    }

    public void setTipo_item(String tipo_item) {
        this.tipo_item = tipo_item;
    }
    
    public static Item getItemByName(String name) throws Exception{
        Item item = null;
        String SQL = "SELECT * FROM item WHERE nm_item =?";
        PreparedStatement s = Database.getConnection().prepareStatement(SQL);
        s.setString(1, name);
        ResultSet rs = s.executeQuery();
        while(rs.next()){
           item = new Item(
                    rs.getInt("cd_item"),
                    rs.getDouble("vl_item"),
                    rs.getString("ds_item"),
                    rs.getString("nm_item"),
                    rs.getString("tipo_item")
            );             
        }
        rs.close();
        s.close();
        return item;
    }
}
