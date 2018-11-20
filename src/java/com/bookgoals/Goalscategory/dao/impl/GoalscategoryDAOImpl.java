/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.Goalscategory.dao.impl;

import com.bookgoals.Goalscategory.dao.GoalscategoryDAO;
import com.bookgoals.entities.Goalscategory;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Granit Krasniqi
 */
@Stateless
public class GoalscategoryDAOImpl implements GoalscategoryDAO {
    
    @PersistenceContext(name = "BookGoalsPU")
    private EntityManager em;

    @Override
    public void addGoalscategory(Goalscategory goalcategory) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Goalscategory getGoalscategory(Integer id) {
        return em.find(Goalscategory.class, id);
    }

    @Override
    public void deleteGoalscategory(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void deleteGoalscategory(Goalscategory goalcategory) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void updateGoalscategory(Goalscategory goalcategory) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    /*
        This method should retrieve all Goalscategories from database
    */
    @Override
    public List<Goalscategory> getAllGoalscategories() {
        return em.createNamedQuery("Goalscategory.findAll", Goalscategory.class).getResultList();
    }
    
}
