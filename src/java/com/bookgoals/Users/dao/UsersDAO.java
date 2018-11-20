/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.Users.dao;

import com.bookgoals.entities.Users;
import java.util.List;

/**
 *
 * @author Granit Krasniqi
 */
public interface UsersDAO {
    public Users getUsers(String username);
    public List<Users> getAllUsers();
}
