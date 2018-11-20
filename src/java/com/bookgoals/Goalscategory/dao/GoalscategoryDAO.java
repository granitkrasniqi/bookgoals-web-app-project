/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.Goalscategory.dao;

import com.bookgoals.entities.Goalscategory;
import java.util.List;

/**
 *
 * @author Granit Krasniqi
 */
public interface GoalscategoryDAO {
    public void addGoalscategory(Goalscategory goalcategory);
    public Goalscategory getGoalscategory(Integer id);
    public void deleteGoalscategory(Integer id);
    public void deleteGoalscategory(Goalscategory goalcategory);
    public void updateGoalscategory(Goalscategory goalcategory);
    public List<Goalscategory> getAllGoalscategories();
}
