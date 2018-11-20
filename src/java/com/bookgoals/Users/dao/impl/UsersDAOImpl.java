/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.Users.dao.impl;

import com.bookgoals.Users.dao.UsersDAO;
import com.bookgoals.entities.Users;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Granit Krasniqi
 */
@Stateless
public class UsersDAOImpl implements UsersDAO {
    
    @PersistenceContext(name = "BookGoalsPU")
    private EntityManager em;

    public UsersDAOImpl() {
    }

    @Override
    public Users getUsers(String username) {
        return em.find(Users.class, username);
    }

    @Override
    public List<Users> getAllUsers() {
        return em.createNamedQuery("Users.findAll",Users.class).getResultList();
    }
    
}
