/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.Bookscategory.dao;

import com.bookgoals.entities.Bookscategory;
import java.util.List;

/**
 *
 * @author Granit Krasniqi
 */
public interface BookscategoryDAO {
    public void addBookcategory(Bookscategory bookcategory);
    public Bookscategory getBookcategory(Integer id);
    public void deleteBookcategory(Integer id);
    public void deleteBookcategory(Bookscategory bookcategory);
    public void updateBookcategory(Bookscategory bookcategory);
    public List<Bookscategory> getAllBookscategories();
}
