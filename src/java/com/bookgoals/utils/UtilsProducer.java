/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.utils;

import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.inject.Default;
import javax.enterprise.inject.Produces;

/**
 *
 * @author Granit Krasniqi
 */
@ApplicationScoped
public class UtilsProducer {
    
    @Produces @DefaultUtil
    public Utils produceUtils() {
        return new Utils();
    }
}
