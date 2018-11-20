/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.Goals.dao;

import com.bookgoals.entities.Goals;
import java.util.List;

/**
 *
 * @author Granit Krasniqi
 */
public interface GoalsDAO {
    public void addGoal(Goals goal);
    public Goals getGoal(Integer id);
    public void deleteGoal(Integer id);
    public void deleteGoal(Goals goal);
    public void updateGoal(Goals goal);
    public List<Goals> getAllGoals();
}
