/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.Books.dao;

import com.bookgoals.entities.Books;
import java.util.List;

/**
 *
 * @author Granit Krasniqi
 */
public interface BooksDAO {
    public void addBook(Books book);
    public Books getBook(Integer id);
    public void deleteBook(Integer id);
    public void deleteBook(Books book);
    public void updateBook(Books book);
    public List<Books> getAllBooks();
}
