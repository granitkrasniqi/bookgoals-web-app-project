/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookgoals.entities;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import javax.persistence.PostLoad;
import javax.persistence.PostPersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Granit Krasniqi
 */
@Entity
@Table(name = "goals")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Goals.findAll", query = "SELECT g FROM Goals g")
    , @NamedQuery(name = "Goals.findById", query = "SELECT g FROM Goals g WHERE g.id = :id")
    , @NamedQuery(name = "Goals.findByName", query = "SELECT g FROM Goals g WHERE g.name = :name")
    , @NamedQuery(name = "Goals.findByPriority", query = "SELECT g FROM Goals g WHERE g.priority = :priority")
    , @NamedQuery(name = "Goals.findByStartdate", query = "SELECT g FROM Goals g WHERE g.startdate = :startdate")
    , @NamedQuery(name = "Goals.findByDuedate", query = "SELECT g FROM Goals g WHERE g.duedate = :duedate")
    , @NamedQuery(name = "Goals.findByGoaldescription", query = "SELECT g FROM Goals g WHERE g.goaldescription = :goaldescription")})
public class Goals implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 300)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "priority")
    private String priority;
    @Basic(optional = false)
    @NotNull
    @Column(name = "startdate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date startdate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "duedate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date duedate;
    @Size(max = 2000)
    @Column(name = "goaldescription")
    private String goaldescription;
    @JoinColumn(name = "Booksid", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Books booksid;
    @JoinColumn(name = "Usersname", referencedColumnName = "name")
    @ManyToOne(optional = false)
    private Users usersname;
    @JoinColumn(name = "GoalsCategoryid", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Goalscategory goalsCategoryid;
    @Transient
    private String startDateFormatted;
    @Transient
    private String dueDateFormatted;

    public Goals() {
    }

    public Goals(Integer id) {
        this.id = id;
    }

    public Goals(Integer id, String name, String priority, Date startdate, Date duedate) {
        this.id = id;
        this.name = name;
        this.priority = priority;
        this.startdate = startdate;
        this.duedate = duedate;
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

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public Date getDuedate() {
        return duedate;
    }

    public void setDuedate(Date duedate) {
        this.duedate = duedate;
    }

    public String getGoaldescription() {
        return goaldescription;
    }

    public void setGoaldescription(String goaldescription) {
        this.goaldescription = goaldescription;
    }

    public Books getBooksid() {
        return booksid;
    }

    public void setBooksid(Books booksid) {
        this.booksid = booksid;
    }

    public Users getUsersname() {
        return usersname;
    }

    public void setUsersname(Users usersname) {
        this.usersname = usersname;
    }

    public Goalscategory getGoalsCategoryid() {
        return goalsCategoryid;
    }

    public void setGoalsCategoryid(Goalscategory goalsCategoryid) {
        this.goalsCategoryid = goalsCategoryid;
    }

    public String getStartDateFormatted() {
        return startDateFormatted;
    }

    public void setStartDateFormatted(String startDateFormatted) {
        this.startDateFormatted = startDateFormatted;
    }

    public String getDueDateFormatted() {
        return dueDateFormatted;
    }

    public void setDueDateFormatted(String dueDateFormatted) {
        this.dueDateFormatted = dueDateFormatted;
    }
    
    
    /*
        This method should format start and due dates 
        in format "MM/dd/yyyy"
    */
    @PostPersist
    @PostLoad
    public void formattedDates() {
        SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
        startDateFormatted = formatter.format(startdate);
        dueDateFormatted = formatter.format(duedate);
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
        if (!(object instanceof Goals)) {
            return false;
        }
        Goals other = (Goals) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.bookgoals.entities.Goals[ id=" + id + " ]";
    }
    
}
