package com.bookgoals.entities;

import com.bookgoals.entities.Books;
import com.bookgoals.entities.Goals;
import com.bookgoals.entities.UsersRoles;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-28T14:49:39")
@StaticMetamodel(Users.class)
public class Users_ { 

    public static volatile SingularAttribute<Users, String> password;
    public static volatile SingularAttribute<Users, String> salt;
    public static volatile CollectionAttribute<Users, Goals> goalsCollection;
    public static volatile CollectionAttribute<Users, Books> booksCollection;
    public static volatile SingularAttribute<Users, String> name;
    public static volatile CollectionAttribute<Users, UsersRoles> usersRolesCollection;

}