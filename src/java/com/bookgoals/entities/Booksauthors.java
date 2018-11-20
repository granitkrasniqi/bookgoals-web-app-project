/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Granit Krasniqi
 */
@Entity
@Table(name = "booksauthors")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Booksauthors.findAll", query = "SELECT b FROM Booksauthors b")
    , @NamedQuery(name = "Booksauthors.findById", query = "SELECT b FROM Booksauthors b WHERE b.id = :id")})
public class Booksauthors implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @JoinColumn(name = "Booksid", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Books booksid;
    @JoinColumn(name = "Authorsid", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Authors authorsid;

    public Booksauthors() {
    }

    public Booksauthors(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Books getBooksid() {
        return booksid;
    }

    public void setBooksid(Books booksid) {
        this.booksid = booksid;
    }

    public Authors getAuthorsid() {
        return authorsid;
    }

    public void setAuthorsid(Authors authorsid) {
        this.authorsid = authorsid;
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
        if (!(object instanceof Booksauthors)) {
            return false;
        }
        Booksauthors other = (Booksauthors) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.bookgoals.entities.Booksauthors[ id=" + id + " ]";
    }
    
}
