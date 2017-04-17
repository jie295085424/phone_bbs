package com.bbs.entity;

import java.util.Set;

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

@Entity
@Table(name="role")
public class Role {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="rid")
	private int id;
	@Column(name="model")
	private String rname;
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="user_role",
	joinColumns={@JoinColumn(name="rid",referencedColumnName="rid")},
	inverseJoinColumns={@JoinColumn(name="uid",referencedColumnName="uid")})
	private Set<User> users;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public Set<User> getUser() {
		return users;
	}
	public void setUser(Set<User> users) {
		this.users = users;
	}
	

}
