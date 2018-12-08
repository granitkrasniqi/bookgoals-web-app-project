/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Month;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 *
 * @author Granit Krasniqi
 */
public class Utils {
    
    public Date dateFromString(String dateStr) throws ParseException {
        Date date = new SimpleDateFormat("MM/dd/yyyy").parse(dateStr);
        return date;
    }
}
