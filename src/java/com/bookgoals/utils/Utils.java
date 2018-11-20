/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.utils;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 *
 * @author Granit Krasniqi
 */
public class Utils {
    
    public Date dateFromString(String dateStr) {
        String[] dateSplited = dateStr.split("/");
        Integer month = Integer.parseInt(dateSplited[0]);
        Integer day = Integer.parseInt(dateSplited[1]);
        Integer year = Integer.parseInt(dateSplited[2]);
        Date date = new Calendar.Builder()
                .setDate(year, month, day)
                .build().getTime();
        return date;
    }
}
