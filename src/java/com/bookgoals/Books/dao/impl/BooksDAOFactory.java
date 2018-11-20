/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.Books.dao.impl;

import com.bookgoals.Books.dao.BooksDAO;
import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.inject.Produces;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Granit Krasniqi
 */
@ApplicationScoped
public class BooksDAOFactory {
    
//    @PersistenceContext(name = "BookGoalsPU")
//    private EntityManager em;
//    
//    @Produces
//    public BooksDAO createBooksDAO() {
//        return new BooksDAOImpl(em);
//    }
}
