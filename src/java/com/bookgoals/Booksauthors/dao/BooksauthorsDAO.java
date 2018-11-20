/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.Booksauthors.dao;

import com.bookgoals.entities.Books;
import com.bookgoals.entities.Booksauthors;
import java.util.List;

/**
 *
 * @author Granit Krasniqi
 */
public interface BooksauthorsDAO {
    void addBooksauthors(Booksauthors bookAndAuthors);
    void deleteBooksAuthors(Booksauthors bookAndAuthors);
    List<Booksauthors> getBooksAuthorsByBookId(Books book);
}
