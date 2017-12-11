/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.pizzadelo.web;


import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author vlf
 */
public class DatabaseCreatorListener implements ServletContextListener {
    
    private void createUsuarioTable(Statement s){
        try{
            s.execute(  "CREATE TABLE usuario("
            		+ "cpf_usuario INTEGER PRIMARY KEY"
           		+ ", nm_email_usuario VARCHAR(255) NOT NULL"
                        + ", nm_usuario VARCHAR(255) NOT NULL"
          		+ ", nm_login_usuario VARCHAR(30) NOT NULL" 
           		+ ", password_user varchar(255) NOT NULL"
          		+ ", nm_tipo_usuario CHAR(1) NOT NULL"         
                   	+ ")");
            
          

                 
            System.out.println("Criada tabela USUARIO.");	
           
      
        }catch(Exception ex2){
            System.out.println("Erro ao criar a tabela USUARIO: "+ex2.getMessage());
        }
    }

 
    private void createItemTable(Statement s){
        try{
            s.execute("CREATE TABLE item ("
          		+ " cd_item INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)"
	   		+ ", vl_item numeric(10,2) NOT NULL "
	   		+ ", ds_item VARCHAR(255) NOT NULL"	 	         
           		+ ", nm_item VARCHAR(30) NOT NULL"
                        + ", tipo_item INTEGER NOT NULL"
                   	+ ")");
            
            System.out.println("Criada tabela item.");            
        }catch(Exception ex2){
            System.out.println("Erro ao criar a tabela item: "+ex2.getMessage());
        }
    }
    
    private void createTipoItemTable(Statement s){
        try{
            s.execute("CREATE TABLE tipo_item("
          		+ "cd_tipo_item INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)"
	   		+ ", nm_item VARCHAR(30) NOT NULL"
                        + ")");
            s.execute("INSERT INTO tipo_item VALUES("
                + "default"
                + ", 'Pizza'"
                + ")");
            s.execute("INSERT INTO tipo_item VALUES("
                + "default"
                + ", 'Bebida'"
                + ")");
            System.out.println("Criada tabela tipo_item.");            
        }catch(Exception ex2){
            System.out.println("Erro ao criar a tabela tipo_item: "+ex2.getMessage());
        }
    }
    private void createPedidoTable(Statement s){
        try{
            s.execute("CREATE TABLE pedido("
           		+ "cd_pedido INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)"
           		+ ", cpf_user INTEGER"           
           		+ ", vl_total_pedido numeric(10,2)"           
           		+ ", dt_pedido DATE"
           		+ ", nm_estado_pedido VARCHAR(30)"
           		+ ", CONSTRAINT pedido_fk1 FOREIGN KEY (cpf_user) REFERENCES usuario(cpf_usuario)"
                   	+ ")");
            System.out.println("Criada tabela pedido.");
        }catch(Exception ex2){
            System.out.println("Erro ao criar a tabela pedido: "+ex2.getMessage());
        }
    }

    private void createPedidoItemTable(Statement s){
        try{
            s.execute(  "CREATE TABLE pedido_item("
          		+ "cd_pedido INTEGER"
	  		+ ", cd_item INTEGER"
                        + ", vl_item numeric(10,2)"
           		+ ", CONSTRAINT pedidoitem_fk1 FOREIGN KEY (cd_pedido) REFERENCES PEDIDO(cd_pedido)"
           		+ ", CONSTRAINT pedidoitem_fk2 FOREIGN KEY (cd_item) REFERENCES ITEM(cd_item)"
                        + ", CONSTRAINT pedidoitem_fk3 FOREIGN KEY (vl_item) REFERENCES ITEM(vl_item)"
                   	+ ")");
            System.out.println("Criada tabela pedido_item.");
        }catch(Exception ex2){
            System.out.println("Erro ao criar a tabela pedido_item: "+ex2.getMessage());
        }
    }

    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try{
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            String url = "jdbc:derby:c:/derby/ProjetoPizza;create=true";
            Connection c = DriverManager.getConnection(url);
            Statement s = c.createStatement();
            System.out.println("Iniciando a criação do BD.");
            createUsuarioTable(s);
            createItemTable(s);
            createPedidoTable(s);
	    createPedidoItemTable(s);
            createTipoItemTable(s);
    
            s.close();
            c.close();
            DriverManager.getConnection
            ("jdbc:derby:c:/derby/ProjetoPizza;shutdown=true");
        }catch(Exception ex){
            System.out.println("Erro: "+ex.getMessage());
        }
    }
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }
}
