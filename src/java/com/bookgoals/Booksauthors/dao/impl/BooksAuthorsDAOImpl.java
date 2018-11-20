/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.Booksauthors.dao.impl;

import com.bookgoals.Booksauthors.dao.BooksauthorsDAO;
import com.bookgoals.entities.Books;
import com.bookgoals.entities.Booksauthors;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

/**
 *
 * @author Granit Krasniqi
 */
@Stateless
public class BooksAuthorsDAOImpl implements BooksauthorsDAO {
    
    @PersistenceContext(name = "BookGoalsPU")
    private EntityManager em;

    @Override
    public void addBooksauthors(Booksauthors bookAndAuthors) {
        em.persist(bookAndAuthors);
    }
    
    
    /*
        This method should delete an entity in
        BooksAuthors Table (Many to Many)
    */
    @Override
    public void deleteBooksAuthors(Booksauthors bookAndAuthors) {
        Booksauthors booksAuthors = em.find(Booksauthors.class, bookAndAuthors.getId());
        if(booksAuthors != null) {
            em.remove(booksAuthors);
        }
    }
    
    /*
        This method should give a list of entities (Booksauthors)
        matching book which is received as an argument
    */
    @Override
    public List<Booksauthors> getBooksAuthorsByBookId(Books book) {
        // Create query to get booksauthors entites matching booksid
        TypedQuery<Booksauthors> booksAuthorsByBookIdQuery = 
                em.createQuery("SELECT b FROM Booksauthors b WHERE b.booksid = :bookId",
                        Booksauthors.class);
        
        // setting named parameter of query 
        booksAuthorsByBookIdQuery.setParameter("bookId", book);
        
        return booksAuthorsByBookIdQuery.getResultList();
    }
    
}
