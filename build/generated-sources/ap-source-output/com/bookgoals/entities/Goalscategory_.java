package com.bookgoals.entities;

import com.bookgoals.entities.Goals;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-08-28T14:49:39")
@StaticMetamodel(Goalscategory.class)
public class Goalscategory_ { 

    public static volatile CollectionAttribute<Goalscategory, Goals> goalsCollection;
    public static volatile SingularAttribute<Goalscategory, String> name;
    public static volatile SingularAttribute<Goalscategory, Integer> id;

}