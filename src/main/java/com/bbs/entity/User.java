package com.bbs.entity;

import java.util.HashSet;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;


@Entity
@Table(name="t_user")
public class User {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="uid")
	private int uid;
	@Column(name="username")
	private String username;
	@Column(name="password")
	private String password;
	@Column(name="img")
	private String img;
	@OneToMany(fetch=FetchType.LAZY,mappedBy="user",orphanRemoval=true)
	private Set<Topic> topics;
	@OneToMany(fetch=FetchType.LAZY,mappedBy="user",orphanRemoval=true)
	private Set<Comment> comments;
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="user_role",
	joinColumns={@JoinColumn(name="uid",referencedColumnName="uid")},
	inverseJoinColumns={@JoinColumn(name="rid",referencedColumnName="rid")})
	private Set<Role> roles;
	
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Set<Topic> getTopics() {
		return topics;
	}
	public void setTopics(Set<Topic> topics) {
		this.topics = topics;
	}
	public Set<Comment> getComments() {
		return comments;
	}
	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	
	@Transient
	public Set<String>  getRolesName(){
		Set<Role> roles = this.getRoles();
		Set<String> set = new HashSet<String>();
		for(Role r:roles){
			set.add(r.getRname());
		}
		return set;
	}
	

}
