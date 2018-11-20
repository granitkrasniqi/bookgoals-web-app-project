/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.Authors.dao.impl;

import com.bookgoals.Authors.dao.AuthorsDAO;
import com.bookgoals.entities.Authors;
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
public class AuthorsDAOImpl implements AuthorsDAO {
    
    @PersistenceContext(name = "BookGoalsPU")
    private EntityManager em;
    
    public AuthorsDAOImpl() {
    }
    

    @Override
    public void addAuthor(Authors author) {
        em.persist(author);
    }

    @Override
    public Authors getAuthor(Integer id) {
        return em.find(Authors.class, id);
    }

    @Override
    public void deleteAuthor(Integer id) {
        Authors author = getAuthor(id);
        if(author != null) {
            em.remove(author);
        }
    }

    @Override
    public void deleteAuthor(Authors author) {
        em.remove(em.merge(author));
    }

    @Override
    public void updateAuthor(Authors author) {
        em.merge(author);
    }

    @Override
    public List<Authors> getAllAuthors() {
        return em.createNamedQuery("Authors.findAll", Authors.class).getResultList();
    }

    @Override
    public List<Authors> getAuthorByNameSurname(String name, String surname) {
        TypedQuery<Authors> authorByNameSurnameQuery = em.createQuery("SELECT a FROM Authors a WHERE a.name = :name "
                + "AND a.surname = :surname", Authors.class);
        authorByNameSurnameQuery.setParameter("name", name.trim());
        authorByNameSurnameQuery.setParameter("surname", surname.trim());
        return authorByNameSurnameQuery.getResultList();
    }
    
}
