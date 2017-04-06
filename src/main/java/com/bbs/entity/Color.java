package com.bbs.entity;

import java.util.Set;

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
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.Cascade;

@Entity
@Table(name="color")
public class Color {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="coid")
	private int coid;
	@Column(name="coname",unique=true)
	private String coname;
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="phone_color",
	joinColumns={@JoinColumn(name="coid",referencedColumnName="coid")},
	inverseJoinColumns={@JoinColumn(name="pid",referencedColumnName="pid")})
	private Set<Phone> phones;
	public int getCoid() {
		return coid;
	}
	public void setCoid(int coid) {
		this.coid = coid;
	}
	public String getConame() {
		return coname;
	}
	public void setConame(String coname) {
		this.coname = coname;
	}
	public Set<Phone> getPhones() {
		return phones;
	}
	public void setPhones(Set<Phone> phones) {
		this.phones = phones;
	}
	@Override
	public String toString() {
		return "Color [coname=" + coname + "]";
	}

}
