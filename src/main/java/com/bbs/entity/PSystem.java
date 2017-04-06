package com.bbs.entity;

import java.util.Set;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
@Table(name="psystem")
public class PSystem {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="sid")
	private int sid;
	@Column(name="sname")
	private String sname;
	@OneToMany(fetch=FetchType.LAZY,mappedBy="psystem",orphanRemoval=true)
	private Set<Phone> phones;
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public Set<Phone> getPhones() {
		return phones;
	}
	public void setPhones(Set<Phone> phones) {
		this.phones = phones;
	}
	@Override
	public String toString() {
		return "PSystem [sname=" + sname + "]";
	}

}
