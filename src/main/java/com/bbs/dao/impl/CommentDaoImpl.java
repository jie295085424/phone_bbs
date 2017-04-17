package com.bbs.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bbs.dao.CommentDao;
import com.bbs.entity.Comment;
import com.bbs.entity.Topic;
@Repository("commentDao")
public class CommentDaoImpl implements CommentDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<Comment> findByTid(int tid) {
		// TODO Auto-generated method stub		
		return (List<Comment>) sessionFactory.getCurrentSession().createCriteria(Comment.class)
				.createAlias("topic", "topic").add(Restrictions.eq("topic.id", tid)).list();
	}
	@Override
	public void save(Comment comment) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(comment);
	}
	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<Comment> findByUid(int uid) {
		// TODO Auto-generated method stub
		return (List<Comment>) sessionFactory.getCurrentSession().createCriteria(Comment.class)
				.createAlias("user", "user").add(Restrictions.eq("user.uid", uid)).list();				
	}
	@Override
	public void delComment(Comment comm) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().delete(comm);
	}
}

