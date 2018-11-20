/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.Languages.dao;

import com.bookgoals.entities.Languages;
import java.util.List;

/**
 *
 * @author Granit Krasniqi
 */
public interface LanguagesDAO {
    public Languages getLanguage(String name);
    public List<Languages> getAllLanguages();
}
