package com.bookgoals.entities;

import com.bookgoals.entities.Authors;
import com.bookgoals.entities.Bookscategory;
import com.bookgoals.entities.Goals;
import com.bookgoals.entities.Languages;
import com.bookgoals.entities.Users;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-28T14:49:39")
@StaticMetamodel(Books.class)
public class Books_ { 

    public static volatile SingularAttribute<Books, Users> usersname;
    public static volatile SingularAttribute<Books, Integer> pages;
    public static volatile CollectionAttribute<Books, Goals> goalsCollection;
    public static volatile SingularAttribute<Books, Integer> year;
    public static volatile SingularAttribute<Books, Languages> languagesname;
    public static volatile SingularAttribute<Books, String> name;
    public static volatile SingularAttribute<Books, String> description;
    public static volatile CollectionAttribute<Books, Authors> authorsCollection;
    public static volatile SingularAttribute<Books, Integer> id;
    public static volatile SingularAttribute<Books, Bookscategory> booksCategoryid;

}