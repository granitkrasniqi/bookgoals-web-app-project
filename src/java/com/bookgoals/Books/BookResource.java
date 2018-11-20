/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.Books;

import com.bookgoals.Books.dao.BooksDAO;
import com.bookgoals.entities.Books;
import java.util.List;
import javax.inject.Inject;
import javax.persistence.PersistenceContext;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

/**
 *
 * @author Granit Krasniqi
 */
@Path("booksService")
public class BookResource {
    
    @Inject
    private BooksDAO booksDAO;
    
    @GET
    @Produces({"application/xml", "application/json"})
    public List<Books> getAllBooks() {
        return booksDAO.getAllBooks();
    }
}
