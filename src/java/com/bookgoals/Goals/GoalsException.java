/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.Goals;

/**
 *
 * @author Granit Krasniqi
 */
public class GoalsException extends Exception {

    /**
     * Creates a new instance of <code>GoalsException</code> without detail
     * message.
     */
    public GoalsException() {
    }

    /**
     * Constructs an instance of <code>GoalsException</code> with the specified
     * detail message.
     *
     * @param msg the detail message.
     */
    public GoalsException(String msg) {
        super(msg);
    }
}
