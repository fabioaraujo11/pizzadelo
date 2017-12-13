/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.pizzadelo.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String usuario = request.getParameter("email");
        String senha = request.getParameter("senha");
        String page = "cadastro.jsp";
        String msg = null;

        try {
            Usuario u = Usuario.getUser(usuario, senha);
            if (u == null) {
                msg = "<script>alert('Nenhum usuário cadastrado.')</script>";
            } else {
                msg = "<script>alert('Usuário e/ou senha incorretos.')</script>";
                if (usuario.equals(u.getNm_email_usuario()) && senha.equals(u.getCd_password_usuario())) {

                    HttpSession session = request.getSession(true);
                    session.setAttribute("me.nm_usuario", u.getNm_usuario());
                    session.setAttribute("me.nm_email_usuario", u.getNm_email_usuario());
                    session.setAttribute("me.nm_tipo_usuario", u.getNm_tipo_usuario());
                    session.setAttribute("me.cpf_usuario", u.getCd_cpf_usuario());
                    session.setAttribute("me.password_user", u.getCd_password_usuario());
                    session.setAttribute("me.ic_sexo_m_f", u.getIc_sexo_M_F());
                    page = "home.jsp";
                    msg = "<script>alert('Usuário Conectado.')</script>";
                }

            }

            out.println(msg);
            RequestDispatcher rd = request.getRequestDispatcher(page);
            rd.include(request, response);
        } catch (NullPointerException e) {
            out.println("<script>alert('" + e + "')</script>");

        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
