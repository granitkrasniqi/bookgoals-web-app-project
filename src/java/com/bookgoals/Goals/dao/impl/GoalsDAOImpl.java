/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.Goals.dao.impl;

import com.bookgoals.Goals.dao.GoalsDAO;
import com.bookgoals.entities.Goals;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Granit Krasniqi
 */
@Stateless
public class GoalsDAOImpl implements GoalsDAO {
    
    @PersistenceContext(name = "BookGoalsPU")
    private EntityManager em;
    
    @Override
    public void addGoal(Goals goal) {
        em.persist(goal);
    }

    @Override
    public Goals getGoal(Integer id) {
        return em.find(Goals.class, id);
    }

    @Override
    public void deleteGoal(Integer id) {
        Goals goal = getGoal(id);
        if(goal != null) {
            em.remove(goal);
        }
    }

    @Override
    public void deleteGoal(Goals goal) {
        em.remove(goal);
    }

    @Override
    public void updateGoal(Goals goal) {
        em.merge(goal);
    }

    @Override
    public List<Goals> getAllGoals() {
        return em.createNamedQuery("Goals.findAll", Goals.class).getResultList();
    }
    
}
