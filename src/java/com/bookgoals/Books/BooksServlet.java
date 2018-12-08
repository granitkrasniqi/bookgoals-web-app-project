/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.Books;

import com.bookgoals.Authors.dao.AuthorsDAO;
import com.bookgoals.Books.dao.BooksDAO;
import com.bookgoals.Booksauthors.dao.BooksauthorsDAO;
import com.bookgoals.Bookscategory.dao.BookscategoryDAO;
import com.bookgoals.Languages.dao.LanguagesDAO;
import com.bookgoals.Users.dao.UsersDAO;
import com.bookgoals.entities.Authors;
import com.bookgoals.entities.Books;
import com.bookgoals.entities.Booksauthors;
import com.bookgoals.entities.Bookscategory;
import com.bookgoals.entities.Languages;
import com.bookgoals.entities.Users;
import com.bookgoals.utils.UrlUtils;
import com.mysql.jdbc.StringUtils;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.validator.GenericValidator;

/**
 *
 * @author Granit Krasniqi
 */
@WebServlet(name = "BooksServlet", urlPatterns = {"/books"})
public class BooksServlet extends HttpServlet {

    @Inject
    private LanguagesDAO languagesDAO;
    
    @Inject
    private AuthorsDAO authorsDAO;

    @Inject
    private BookscategoryDAO bookscategoryDAO;
    
    @Inject
    private UsersDAO usersDAO;

    @Inject
    private BooksDAO booksDAO;
    
    @Inject
    private BooksauthorsDAO booksAndAuthorsDAO;

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "add":
                addBookPage(request, response);
                break;
            case "edit":
                editBookPage(request, response);
                break;
            case "view":
                viewBookPage(request, response);
                break;
            default:
                listBooksPage(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("mainAction");

        if (action == null) {
            action = "mainList";
        }

        switch (action) {
            case "mainAdd":
                addBook(request, response);
                break;
            case "mainEdit":
                editBook(request, response);
                break;
            case "mainDelete":
                deleteBook(request, response);
                break;
        }
    }

    private void addBookPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Languages> languages = languagesDAO.getAllLanguages();
        List<Bookscategory> bookscategories = bookscategoryDAO.getAllBookscategories();
        List<Authors> authors = authorsDAO.getAllAuthors();
        request.setAttribute("languages", languages);
        request.setAttribute("bookscategories", bookscategories);
        request.setAttribute("authors", authors);
        request.getRequestDispatcher(response.encodeURL(UrlUtils.ADD_BOOK_URL)).forward(request, response);
    }

    private void editBookPage(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        // Get book id from form parameter
        String bookId = request.getParameter("bookId");
        Integer bookIdInt = Integer.parseInt(bookId);
        
        // Fetch languages, bookcategories, authors from db and set as attribute on request
        List<Languages> languages = languagesDAO.getAllLanguages();
        List<Bookscategory> bookscategories = bookscategoryDAO.getAllBookscategories();
        List<Authors> authors = authorsDAO.getAllAuthors();
        request.setAttribute("languages", languages);
        request.setAttribute("bookscategories", bookscategories);
        request.setAttribute("authors", authors);
    }
    
    /*
        This method should delete a book from database 
        when request from post method, given the book id
    */
    private void deleteBook(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get book id from form parameter
        String bookId = request.getParameter("bookId");
        Integer bookIdInt = Integer.parseInt(bookId);
        Books book = booksDAO.getBook(bookIdInt);
        
        // Delete book from all rows in Booksauthors table
        List<Booksauthors> booksAuthors = booksAndAuthorsDAO.getBooksAuthorsByBookId(book);
        for(Booksauthors author: booksAuthors) {
            booksAndAuthorsDAO.deleteBooksAuthors(author);
        }
        
        request.setAttribute("bookName", book.getName());
        // Delete book entity from database (Books table)
        booksDAO.deleteBook(bookIdInt);
        
        request.setAttribute("sucessDelete", true);
        
        // Dispatch to List Books Page
        listBooksPage(request, response);
    }
    
    /*
        This method should show a page with information fetched from database
        with selected book id
    */
    private void viewBookPage(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        // Assign id to a variable 
        String id = request.getParameter("id");
        Integer idInt = Integer.parseInt(id);
        
        // Fetch Book from database with selected id
        Books book = booksDAO.getBook(idInt);
        
        // Assign book to request attribute
        request.setAttribute("book", book);
        
        // Dispatch to View Book Page
        request.getRequestDispatcher(response.encodeURL(UrlUtils.VIEW_BOOK_URL)).forward(request, response);
        
    }
    
    /*
        This method should list to the user all books that are saved in the database
    */
    private void listBooksPage(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Fetch all books from database
        List<Books> booksList = booksDAO.getAllBooks();
        // set as attribute on request
        request.setAttribute("booksList", booksList);
        // Redirect Request to List_BOOKS_URL on url parammeter books?action=list
        request.getRequestDispatcher(response.encodeURL(UrlUtils.LIST_BOOKS_URL)).forward(request, response);
    }

    
    /*
        This method should add a book when requested from a form (POST)
    */
    private void addBook(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        // List of errors that should be showed to the user
        ArrayList<String> errors = new ArrayList<>();
        
        // Getting parameters from post request to create a book
        String bookName = request.getParameter("book-name");
        String bookYear = request.getParameter("book-year");
        String bookPages = request.getParameter("book-pages");
        String bookDescription = request.getParameter("book-description");
        String bookCategoryId = request.getParameter("book-category");
        String bookLanguage = request.getParameter("book-language");
        String[] bookAuthors = request.getParameterValues("book-authors"); // multivalued
        
        boolean bookNameError  = false;
        boolean bookYearError  = false;
        boolean bookPagesError = false;
        boolean bookCategoryError = false;
        boolean bookLanguageError = false;
        boolean bookAuthorsError  = false;
        
        // Validating input
        if (StringUtils.isNullOrEmpty(bookName)) {
            errors.add("Book name field can't be empty");
            bookNameError = true;
        }

        if (!GenericValidator.matchRegexp(bookYear, "[0-9]+")) {
            errors.add("Book year field must have only numbers");
            bookYearError = true;
        }

        if (!GenericValidator.matchRegexp(bookPages, "[0-9]+")) {
            errors.add("Book pages field must have only numbers");
        }
        
        if (bookCategoryId == null || bookCategoryId.equalsIgnoreCase("-1")) {
            errors.add("No book category is selected");
            bookCategoryError = true;
        }
        
        if(bookLanguage == null || bookLanguage.equalsIgnoreCase("-1")) {
            errors.add("No book language is selected");
            bookLanguageError = true;
        }
        
        if (bookAuthors == null) {
            errors.add("There is no authors associated with the book");
            bookAuthorsError = true;
        }
        
        
        // If any errors occurred redirect to add book page showing errors
        try {
            if (!errors.isEmpty()) {
                throw new BooksException();
            }
        } catch (BooksException ex) {
            if(!bookNameError) {
                request.setAttribute("bookName", bookName);
            }
            if(!bookYearError) {
                request.setAttribute("bookYear", bookYear);
            }
            if(!bookPagesError) {
                request.setAttribute("bookPages", bookPages);
            }
            
            List<Languages> languages = languagesDAO.getAllLanguages();
            List<Bookscategory> bookscategories = bookscategoryDAO.getAllBookscategories();
            List<Authors> authors = authorsDAO.getAllAuthors();
            request.setAttribute("languages", languages);
            request.setAttribute("bookscategories", bookscategories);
            request.setAttribute("authors", authors);
            request.setAttribute("errors", errors);
            request.getRequestDispatcher(response.encodeURL(UrlUtils.ADD_BOOK_URL)).forward(request, response);
        }
        
        // this block should add the book, and associate every author with the book added.
        if (errors.isEmpty()) {
            
            // Debugging
            for(String author: bookAuthors) {
                System.out.println("BookAUTHORS: ");
                System.out.println(author);
            }
            
            
            Integer BookYearInt = Integer.parseInt(bookYear);
            Integer bookPagesInt = Integer.parseInt(bookPages);
            Integer bookCategoryIdInt = Integer.parseInt(bookCategoryId);
            
            Bookscategory bookscategory
                    = bookscategoryDAO.getBookcategory(bookCategoryIdInt);
            
            Languages language
                    = languagesDAO.getLanguage(bookLanguage);
            
            Users user = usersDAO.getUsers("admin");
            
            ArrayList<Authors> authors = new ArrayList();
            
            // Add all authors selected to the authors list.
            for(String author: bookAuthors) {
                Authors a = authorsDAO.getAuthor(Integer.parseInt(author));
                authors.add(a);
            }
            
            // Add the book
            Books book = new Books();
            book.setName(bookName);
            book.setYear(BookYearInt);
            book.setPages(bookPagesInt);
            book.setDescription(bookDescription);
            book.setBooksCategoryid(bookscategory);
            book.setLanguagesname(language);
            book.setUsersname(user);
            book.setAuthorsCollection(authors);
            booksDAO.addBook(book);
            
            // Associate the book to all authors.
            for(Authors author: authors) {
                author.getBooksCollection().add(book);
            }
            
            request.setAttribute("success", true);
            request.setAttribute("bookId", book.getId());
            request.setAttribute("book", book);
            request.setAttribute("authors", authors);
            request.getRequestDispatcher(response.encodeURL(UrlUtils.ADD_BOOK_URL)).forward(request, response);
        }
    }

    private void editBook(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
