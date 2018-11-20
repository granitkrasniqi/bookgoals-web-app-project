/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.Books;

/**
 *
 * @author Granit Krasniqi
 */
public class BooksException extends Exception {

    /**
     * Creates a new instance of <code>BooksException</code> without detail
     * message.
     */
    public BooksException() {
    }

    /**
     * Constructs an instance of <code>BooksException</code> with the specified
     * detail message.
     *
     * @param msg the detail message.
     */
    public BooksException(String msg) {
        super(msg);
    }
}
