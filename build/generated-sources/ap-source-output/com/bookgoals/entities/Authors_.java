package com.bookgoals.entities;

import com.bookgoals.entities.Books;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-28T14:49:39")
@StaticMetamodel(Authors.class)
public class Authors_ { 

    public static volatile CollectionAttribute<Authors, Books> booksCollection;
    public static volatile SingularAttribute<Authors, String> surname;
    public static volatile SingularAttribute<Authors, String> name;
    public static volatile SingularAttribute<Authors, Integer> id;

}