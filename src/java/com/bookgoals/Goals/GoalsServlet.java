/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.Goals;

import com.bookgoals.Books.dao.BooksDAO;
import com.bookgoals.Goals.dao.GoalsDAO;
import com.bookgoals.Goalscategory.dao.GoalscategoryDAO;
import com.bookgoals.Users.dao.UsersDAO;
import com.bookgoals.entities.Books;
import com.bookgoals.entities.Goals;
import com.bookgoals.entities.Goalscategory;
import com.bookgoals.utils.DefaultUtil;
import com.bookgoals.utils.UrlUtils;
import com.bookgoals.utils.Utils;
import com.mysql.jdbc.StringUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Granit Krasniqi
 */
@WebServlet(name = "GoalsServlet", urlPatterns = {"/goals"})
public class GoalsServlet extends HttpServlet {
    
    
    @Inject
    private GoalscategoryDAO goalsCategoryDAO;
    
    @Inject
    private BooksDAO booksDAO;
    
    @Inject
    private GoalsDAO goalsDAO;
    
    @Inject
    private UsersDAO usersDAO;
 
    @Inject @DefaultUtil
    private Utils utils;
    

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
                addGoalPage(request, response);
                break;
            case "edit":
                editGoalPage(request, response);
                break;
            case "view":
                viewGoalPage(request, response);
                break;
            default:
                listGoalsPage(request, response);
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
                addGoal(request, response);
                break;
            case "mainEdit":
                editGoal(request, response);
                break;
            case "mainDelete":
                deleteGoal(request, response);
                break;
        }
    }
    
    /*
        This method should dispatch url "/goals?action=add" to add goal page 
    */
    private void addGoalPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get needed records
        List<Goalscategory> goalsCategories = goalsCategoryDAO.getAllGoalscategories();
        List<Books> books = booksDAO.getAllBooks();
        
        // set records as attributes
        request.setAttribute("goalscategories", goalsCategories);
        request.setAttribute("books", books);
        
        // Dispatch request to ADD_GOAL_URL
        request.getRequestDispatcher(response.encodeURL(UrlUtils.ADD_GOAL_URL)).forward(request, response);
    }

    private void editGoalPage(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void viewGoalPage(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void listGoalsPage(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {
        // Retrieve Goals from Database
        List<Goals> goalsList = goalsDAO.getAllGoals();
        
        // Set Goals List as Attribute in request
        request.setAttribute("goalsList", goalsList);
        
        // Dispatch the request to LIST_GOALS_URL
        request.getRequestDispatcher(response.encodeURL(UrlUtils.LIST_GOALS_URL)).forward(request, response);
    }
    
    private void addGoal(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {
        
        // List of errors that should be showed to the user
        ArrayList<String> errors = new ArrayList<>();
        
        // Get All Parameters from Form
        String goalName     = request.getParameter("goal-name");
        String goalPriority = request.getParameter("goal-priority");
        String startDate    = request.getParameter("start-date");
        System.out.println("startDate str = " + startDate);
        String dueDate      = request.getParameter("due-date");
        System.out.println("due-date str = " + dueDate);
        String goalDescription = request.getParameter("goal-description");
        String goalCategoryId  = request.getParameter("goal-category");
        String goalBookId      = request.getParameter("goal-book");
        
        // Test parameters
        if(StringUtils.isNullOrEmpty(goalName)) {
            errors.add("Goal name is empty");
        }
        
        if(goalPriority == null || goalPriority.equals("-1")) {
            errors.add("Goal priority is not selected.");
        }
        
        if(StringUtils.isNullOrEmpty(startDate)) {
            errors.add("Start date is not chosen");
        }
        
        if(StringUtils.isNullOrEmpty(dueDate)) {
            errors.add("Due date is not chosen");
        }
        
        if(goalCategoryId == null || goalCategoryId.equals("-1")) {
            errors.add("Goal category is not selected");
        }
        
        if(goalBookId == null || goalBookId.equals("-1")) {
            errors.add("Goal book is not selected");
        }
        
        Date todayDate   = new Date();
        Date startDateDT = null;
        Date dueDateDT   = null;
        
        try {
            startDateDT = utils.dateFromString(startDate);
            dueDateDT   = utils.dateFromString(dueDate);
        } catch (ParseException e) {
            errors.add("Dates are in wrong format");
        }
        
        
        System.out.println("startDateDT = " + startDateDT);
        System.out.println("dueDateDT = " + dueDateDT);
        
        if (startDateDT != null && dueDateDT != null) {
            if (dueDateDT.compareTo(startDateDT) < 0) {
                errors.add("You can't set due date before start date");
            }
        }
        
        
        try {
            if (errors.isEmpty()) {
                
                // Parse needed Strings to Integer
                Integer goalBookIdInt = Integer.parseInt(goalBookId);
                Integer goalCategoryIdInt = Integer.parseInt(goalCategoryId);
                
                // Create goal object and set all needed attributes
                Goals goal = new Goals();
                goal.setName(goalName);
                goal.setPriority(goalPriority);
                goal.setStartdate(startDateDT);
                goal.setDuedate(dueDateDT);
                goal.setGoaldescription(goalDescription);
                goal.setBooksid(booksDAO.getBook(goalBookIdInt));
                goal.setGoalsCategoryid(goalsCategoryDAO.getGoalscategory((goalCategoryIdInt)));
                goal.setUsersname(usersDAO.getUsers("admin"));
                
                // set status of goal to "In progress" is start date and today date are the same
                
                if(todayDate.compareTo(todayDate) == 0) {
                    goal.setStatus(GoalsStatus.IN_PROGRESS);
                } else {
                    goal.setStatus(GoalsStatus.PENDING);
                }
                
                // Persist Goal to Database
                goalsDAO.addGoal(goal);
                
                request.setAttribute("success", true);
                request.setAttribute("goal", goal);
                request.getRequestDispatcher(response.encodeURL(UrlUtils.ADD_GOAL_URL)).forward(request, response);
            } else {
                throw new GoalsException();
            }
        } catch (GoalsException e) {
            request.setAttribute("errors", errors);
            request.setAttribute("sucess", false);
            request.getRequestDispatcher(response.encodeURL(UrlUtils.ADD_GOAL_URL)).forward(request, response);
        }
    }

    private void editGoal(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void deleteGoal(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        // Get goal id from form parameter
        String goalId = request.getParameter("goalId");
        Integer goalIdInt = Integer.parseInt(goalId);
        // Retrieve goal entity
        Goals goal = goalsDAO.getGoal(goalIdInt);
        
        // Delete goal entity from database (Goals table)
        goalsDAO.deleteGoal(goal);
        
        
        request.setAttribute("goalName", goal.getName());
        request.setAttribute("sucessDelete", true);
        
        // Dispatch to List Goals Page
        listGoalsPage(request, response);
    }


}
