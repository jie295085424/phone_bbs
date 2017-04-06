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
@Table(name="cpu",uniqueConstraints = {@UniqueConstraint(columnNames="cmodel")})
public class CPU {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="cid")
	private int cid;
	@Column(name="cmodel")
	private String cmodel;
	@Column(name="cperformance")
	private String cperformance;//性能
	@OneToMany(fetch=FetchType.LAZY,mappedBy="cpu",orphanRemoval=true)
	private Set<Phone> phones;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCmodel() {
		return cmodel;
	}
	public void setCmodel(String cmodel) {
		this.cmodel = cmodel;
	}
	public String getCperformance() {
		return cperformance;
	}
	public void setCperformance(String cperformance) {
		this.cperformance = cperformance;
	}
	public Set<Phone> getPhones() {
		return phones;
	}
	public void setPhones(Set<Phone> phones) {
		this.phones = phones;
	}
	@Override
	public String toString() {
		return "CPU [cmodel=" + cmodel + ", cperformance=" + cperformance + "]";
	}
}
