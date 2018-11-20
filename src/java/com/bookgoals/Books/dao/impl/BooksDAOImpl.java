/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.Books.dao.impl;

import com.bookgoals.Books.dao.BooksDAO;
import com.bookgoals.entities.Books;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

/**
 *
 * @author Granit Krasniqi
 */
@Stateless
public class BooksDAOImpl implements BooksDAO {
    
    @PersistenceContext(name = "BookGoalsPU")
    private EntityManager em;

    public BooksDAOImpl() {
    }
    
    @Override
    public void addBook(Books book) {
        em.persist(book);
    }

    @Override
    public Books getBook(Integer id) {
        Books book = em.find(Books.class, id);
        return book;
    }

    @Override
    public void deleteBook(Integer id) {
        Books book = em.find(Books.class, id);
        if(book != null) {
            em.remove(book);
        }
    }

    @Override
    public void deleteBook(Books book) {
        em.remove(em.merge(book));
    }

    @Override
    public void updateBook(Books book) {
        em.merge(book);
    }

    @Override
    public List<Books> getAllBooks() {
        return em.createNamedQuery("Books.findAll", Books.class).getResultList();
    }
    
}
