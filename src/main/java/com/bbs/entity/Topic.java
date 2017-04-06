package com.bbs.entity;

import java.util.Date;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;



@Entity
@Table(name="t_topic")
public class Topic {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	@Column(name="title")
	private String title;
	@Column(name="content")
	private String content;
	@Column(name="time")
	private Date time;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="uid")
	private User user;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="pid")
	private Phone phone;
	@OneToMany(fetch=FetchType.LAZY,mappedBy="topic",orphanRemoval=true)
	private Set<Comment> comments;
	
	@Column(name="bootique",nullable=false,columnDefinition="boolean default false")
	private boolean isBoutique;


	public boolean isBoutique() {
		return isBoutique;
	}
	public void setBoutique(boolean isBoutique) {
		this.isBoutique = isBoutique;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Phone getPhone() {
		return phone;
	}
	public void setPhone(Phone phone) {
		this.phone = phone;
	}
	public Set<Comment> getComments() {
		return comments;
	}
	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	
}
