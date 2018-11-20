/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.utils;

/**
 *
 * @author Granit Krasniqi
 */
public class UrlUtils {
    private static final String prefix = "/WEB-INF/jsp/view/";
    public static final String DASHBOARD_URL  = "/WEB-INF/jsp/view/dashboard.jsp";
    
    // BOOKS
    public static final String ADD_BOOK_URL =  prefix + "books/addBook.jsp";
    public static final String LIST_BOOKS_URL = prefix + "books/listBooks.jsp";
    public static final String VIEW_BOOK_URL = prefix + "books/viewBook.jsp";
    public static final String EDIT_BOOK_URL = prefix + "books/editBook.jsp";
    
    // GOALS
    public static final String ADD_GOAL_URL = prefix + "goals/addGoal.jsp";
    public static final String LIST_GOALS_URL = prefix + "goals/listGoals.jsp";
    
    // AJAX
    public static final String AJAX_ADD_AUTHOR = prefix + "authors/ajaxOnAdd.jsp";
//    public static final String LISTO_KLIENTIN_URL = "/WEB-INF/jsp/view/klientet/listoKlientet.jsp";
}
