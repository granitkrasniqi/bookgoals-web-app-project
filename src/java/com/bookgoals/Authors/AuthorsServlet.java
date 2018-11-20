/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.Authors;

import com.bookgoals.Authors.dao.AuthorsDAO;
import com.bookgoals.entities.Authors;
import com.bookgoals.utils.UrlUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Granit Krasniqi
 */
@WebServlet(name = "AuthorsServlet", urlPatterns = {"/author"})
public class AuthorsServlet extends HttpServlet {

    @Inject
    private AuthorsDAO authorsDAO;
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

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
        String action = request.getParameter("mainAction");

        if (action == null) {
            action = "mainList";
        }

        switch (action) {
            case "mainAdd":
                addAuthor(request, response);
                break;
            case "mainEdit":
                editAuthor(request, response);
                break;
            case "mainDelete":
                deleteAuthor(request, response);
                break;
        }
    }

    private void addAuthor(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {
        String name = request.getParameter("authorName");
        String surname = request.getParameter("authorSurname");
        
        name = name.trim();
        surname = surname.trim();
        
        List<Authors> authorsWithThisNameSurname 
                = authorsDAO.getAuthorByNameSurname(name, surname);
        
        if(authorsWithThisNameSurname.isEmpty()) {
            Authors author = new Authors();
            author.setName(name);
            author.setSurname(surname);
            authorsDAO.addAuthor(author);
            request.setAttribute("author", author);
        }
        
        request.getRequestDispatcher(UrlUtils.AJAX_ADD_AUTHOR).forward(request, response);
    }

    private void editAuthor(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void deleteAuthor(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


}
