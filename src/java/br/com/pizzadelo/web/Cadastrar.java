/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.pizzadelo.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class Cadastrar extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String nmCliente = request.getParameter("nome");
        String cdCPFCliente = request.getParameter("cpf");
        String nmEmail = request.getParameter("email");
        String cdSenha = request.getParameter("senha");
        String icSexoMF = request.getParameter("sexo");
        char icSexoMFCHAR =  icSexoMF.charAt(0);
        
        
        try {
           Usuario.setUsuarios(nmCliente, nmEmail,cdSenha,'U',icSexoMFCHAR,cdCPFCliente);
        } catch (Exception ex) {
            Logger.getLogger(Cadastrar.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("cadastro.jsp");
        out.println("<script>alert('Cadastro Finalizado!')</script>");
        rd.include(request, response);

    }

}
