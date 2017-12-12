/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.pizzadelo.web;

import java.sql.PreparedStatement;

/**
 *
 * @author vitor
 */
public class BancoUsuarios {

    public static Usuario usuario;

    public static Usuario getUsuario() {
        if (usuario == null) {
            Usuario usuario = new Usuario();
        }
        return usuario;
    }

    public static void setUsuarios(String nm_usuario, String nm_email_usuario, String cd_password_usuario, char nm_tipo_usuario, char ic_sexo_M_F, double cd_cpf_usuario) throws Exception {
        usuario = new Usuario(nm_usuario, nm_email_usuario, cd_password_usuario, nm_tipo_usuario, ic_sexo_M_F, cd_cpf_usuario);
        BancoUsuarios.criarUsuario(usuario);
    }

    public static void inserirXablocs() {
        getUsuario();
        usuario = new Usuario("Fabio Araujo", "fabio_araujo11@hotmail.com", "123", 'A', 'M', 1);
    }

    public static void criarUsuario(Usuario usuario)
            throws Exception {
        String SQL = "INSERT INTO usuario VALUES(?,?,?,?,?,?)";
        try (PreparedStatement s = Database.getConnection().prepareStatement(SQL)) {
            s.setDouble(1,usuario.getCd_cpf_usuario());
            s.setString(2, usuario.getNm_email_usuario());
            s.setString(3, usuario.getNm_usuario());
            s.setString(4, usuario.getCd_password_usuario());
            s.setString(5, String.valueOf(usuario.getNm_tipo_usuario()));
            s.setString(6, String.valueOf(usuario.getIc_sexo_M_F()));
            s.execute();
            s.close();
        }
    }
    
    public static void limparUsuario(){
        usuario = null;
    }
}
