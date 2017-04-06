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
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
@Entity
@Table(name="brand",uniqueConstraints = {@UniqueConstraint(columnNames="bname")})
public class Brand {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="bid")
	private int bid;
	@Column(name="bname")
	private String bname;
	@OneToMany(mappedBy="brand",fetch=FetchType.LAZY,orphanRemoval=true)
	private Set<Phone> phones;
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public Set<Phone> getPhones() {
		return phones;
	}
	public void setPhones(Set<Phone> phones) {
		this.phones = phones;
	}
	@Override
	public String toString() {
		return "Brand [bname=" + bname + "]";
	}
	
}
