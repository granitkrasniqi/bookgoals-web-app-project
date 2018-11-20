/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.Authors.dao;

import com.bookgoals.entities.Authors;
import java.util.List;

/**
 *
 * @author Granit Krasniqi
 */
public interface AuthorsDAO {
    public void addAuthor(Authors author);
    public Authors getAuthor(Integer id);
    public void deleteAuthor(Integer id);
    public void deleteAuthor(Authors author);
    public void updateAuthor(Authors author);
    public List<Authors> getAllAuthors();
    public List<Authors> getAuthorByNameSurname(String name, String surname);
}
