/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.pizzadelo.web;

import java.util.ArrayList;

/**
 *
 * @author vitor
 */
public class BancoUsuarios {

    public static ArrayList<Usuario> usuarios;
    //victor.burghi@gmail.com

    public static ArrayList<Usuario> getUsuarios() {
        if (usuarios == null) {
            usuarios = new ArrayList<>();
        }
        return usuarios;
    }

    public static ArrayList<Usuario> setUsuarios(String nm_usuario, String nm_email_usuario, String cd_password_usuario, char nm_tipo_usuario, double cd_cpf_usuario) {
        Usuario newUser = new Usuario(nm_usuario, nm_email_usuario, cd_password_usuario, nm_tipo_usuario, cd_cpf_usuario);
        usuarios.add(newUser);
        return usuarios;
    }

    public static Usuario getUser(int i) {
        return BancoUsuarios.getUsuarios().get(i);
    }

    public static void inserirXablocs() {
        getUsuarios();
        Usuario newUser = new Usuario("Fabio Araujo", "fabio_araujo11@hotmail.com", "123", 'A', 1);
        usuarios.add(newUser);
    }
}
