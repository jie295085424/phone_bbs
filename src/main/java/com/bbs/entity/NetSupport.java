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
@Table(name="netsupport")
public class NetSupport {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="nid")
	private int nid;
	@Column(name="net")
	private String net;
	@OneToMany(fetch=FetchType.LAZY,mappedBy="netSupport",orphanRemoval=true)
	private Set<Phone> phones;
	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	public String getNet() {
		return net;
	}
	public void setNet(String net) {
		this.net = net;
	}
	public Set<Phone> getPhones() {
		return phones;
	}
	public void setPhones(Set<Phone> phones) {
		this.phones = phones;
	}	
	@Override
	public String toString() {
		return "NetSupport [net=" + net + "]";
	}
	
}
