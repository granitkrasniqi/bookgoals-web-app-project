/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.Languages.dao.impl;

import com.bookgoals.Languages.dao.LanguagesDAO;
import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.inject.Produces;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Granit Krasniqi
 */
@ApplicationScoped
public class LanguagesDAOFactory {
    
    @PersistenceContext(name = "BookGoalsPU")
    private EntityManager em;
    
    @Produces
    public LanguagesDAO createBooksDAO() {
        return new LanguagesDAOImpl(em);
    }
}
