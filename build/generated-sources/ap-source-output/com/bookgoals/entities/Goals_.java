package com.bookgoals.entities;

import com.bookgoals.entities.Books;
import com.bookgoals.entities.Goalscategory;
import com.bookgoals.entities.Users;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-28T14:49:39")
@StaticMetamodel(Goals.class)
public class Goals_ { 

    public static volatile SingularAttribute<Goals, Users> usersname;
    public static volatile SingularAttribute<Goals, Date> duedate;
    public static volatile SingularAttribute<Goals, Goalscategory> goalsCategoryid;
    public static volatile SingularAttribute<Goals, String> goaldescription;
    public static volatile SingularAttribute<Goals, String> name;
    public static volatile SingularAttribute<Goals, Integer> id;
    public static volatile SingularAttribute<Goals, String> priority;
    public static volatile SingularAttribute<Goals, Date> startdate;
    public static volatile SingularAttribute<Goals, Books> booksid;

}