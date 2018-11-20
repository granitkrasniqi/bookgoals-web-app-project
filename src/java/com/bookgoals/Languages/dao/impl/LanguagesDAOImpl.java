/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.Languages.dao.impl;

import com.bookgoals.Languages.dao.LanguagesDAO;
import com.bookgoals.entities.Languages;
import java.util.List;
import javax.persistence.EntityManager;

/**
 *
 * @author Granit Krasniqi
 */
public class LanguagesDAOImpl implements LanguagesDAO {
    
    private final EntityManager em;
    
    public LanguagesDAOImpl(EntityManager em) {
        this.em = em;
    }

    @Override
    public Languages getLanguage(String name) {
        return em.find(Languages.class, name);
    }

    @Override
    public List<Languages> getAllLanguages() {
        return em.createNamedQuery("Languages.findAll", Languages.class).getResultList();
    }
    
}
