/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.Bookscategory.dao.impl;

import com.bookgoals.Bookscategory.dao.BookscategoryDAO;
import com.bookgoals.entities.Bookscategory;
import java.util.List;
import javax.persistence.EntityManager;

/**
 *
 * @author Granit Krasniqi
 */
public class BookscategoryDAOImpl implements BookscategoryDAO {
    
    private EntityManager em;
    
    public BookscategoryDAOImpl(EntityManager em) {
        this.em = em;
    }

    @Override
    public void addBookcategory(Bookscategory bookcategory) {
        em.persist(bookcategory);
    }

    @Override
    public Bookscategory getBookcategory(Integer id) {
        return em.find(Bookscategory.class, id);
    }

    @Override
    public void deleteBookcategory(Integer id) {
        Bookscategory bookscategory = getBookcategory(id);
        if(bookscategory != null) {
            em.remove(bookscategory);
        }
    }

    @Override
    public void deleteBookcategory(Bookscategory bookcategory) {
        em.remove(em.merge(bookcategory));
    }

    @Override
    public void updateBookcategory(Bookscategory bookcategory) {
        em.merge(bookcategory);
    }

    @Override
    public List<Bookscategory> getAllBookscategories() {
        return em.createNamedQuery("Bookscategory.findAll", Bookscategory.class).getResultList();
    }
    
}
