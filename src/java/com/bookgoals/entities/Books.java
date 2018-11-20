/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Granit Krasniqi
 */
@Entity
@Table(name = "books")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Books.findAll", query = "SELECT b FROM Books b")
    , @NamedQuery(name = "Books.findById", query = "SELECT b FROM Books b WHERE b.id = :id")
    , @NamedQuery(name = "Books.findByName", query = "SELECT b FROM Books b WHERE b.name = :name")
    , @NamedQuery(name = "Books.findByYear", query = "SELECT b FROM Books b WHERE b.year = :year")
    , @NamedQuery(name = "Books.findByPages", query = "SELECT b FROM Books b WHERE b.pages = :pages")
    , @NamedQuery(name = "Books.findByDescription", query = "SELECT b FROM Books b WHERE b.description = :description")})
public class Books implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "booksid")
    private Collection<Booksauthors> booksauthorsCollection;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 1000)
    @Column(name = "name")
    private String name;
    @Column(name = "year")
    private Integer year;
    @Column(name = "pages")
    private Integer pages;
    @Size(max = 2000)
    @Column(name = "description")
    private String description;
    @JoinTable(name = "booksauthors", joinColumns = {
        @JoinColumn(name = "Booksid", referencedColumnName = "id")}, inverseJoinColumns = {
        @JoinColumn(name = "Authorsid", referencedColumnName = "id")})
    @ManyToMany(fetch = FetchType.EAGER)
    private Collection<Authors> authorsCollection;
    @JoinColumn(name = "BooksCategoryid", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Bookscategory booksCategoryid;
    @JoinColumn(name = "Usersname", referencedColumnName = "name")
    @ManyToOne(optional = false)
    private Users usersname;
    @JoinColumn(name = "Languagesname", referencedColumnName = "name")
    @ManyToOne(optional = false)
    private Languages languagesname;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "booksid")
    private Collection<Goals> goalsCollection;

    public Books() {
    }

    public Books(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Integer getPages() {
        return pages;
    }

    public void setPages(Integer pages) {
        this.pages = pages;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @XmlTransient
    public Collection<Authors> getAuthorsCollection() {
        return authorsCollection;
    }

    public void setAuthorsCollection(Collection<Authors> authorsCollection) {
        this.authorsCollection = authorsCollection;
    }

    public Bookscategory getBooksCategoryid() {
        return booksCategoryid;
    }

    public void setBooksCategoryid(Bookscategory booksCategoryid) {
        this.booksCategoryid = booksCategoryid;
    }

    public Users getUsersname() {
        return usersname;
    }

    public void setUsersname(Users usersname) {
        this.usersname = usersname;
    }

    public Languages getLanguagesname() {
        return languagesname;
    }

    public void setLanguagesname(Languages languagesname) {
        this.languagesname = languagesname;
    }

    @XmlTransient
    public Collection<Goals> getGoalsCollection() {
        return goalsCollection;
    }

    public void setGoalsCollection(Collection<Goals> goalsCollection) {
        this.goalsCollection = goalsCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Books)) {
            return false;
        }
        Books other = (Books) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.bookgoals.entities.Books[ id=" + id + " ]";
    }

    @XmlTransient
    public Collection<Booksauthors> getBooksauthorsCollection() {
        return booksauthorsCollection;
    }

    public void setBooksauthorsCollection(Collection<Booksauthors> booksauthorsCollection) {
        this.booksauthorsCollection = booksauthorsCollection;
    }
    
}
