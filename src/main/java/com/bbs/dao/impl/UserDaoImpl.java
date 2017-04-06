package com.bbs.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bbs.dao.UserDao;
import com.bbs.entity.User;

@Repository("userDao")
public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public void save(User u) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(u);
	}


	@Override
	public User findById(int uid) {
		
		return sessionFactory.getCurrentSession().load(User.class, uid);
	}
	@SuppressWarnings("deprecation")
	@Override
	public User findByName(String username) {
		// TODO Auto-generated method stub
		String hql = "from User u where u.username=:username";		
		return (User) sessionFactory.getCurrentSession().createQuery(hql).setString("username", username).uniqueResult();
	}


	@Override
	public void update(User u) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(u);
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAll() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from User").list();
	}


	@Override
	public void delUser(int uid) {
		// TODO Auto-generated method stub		
		sessionFactory.getCurrentSession().delete(findById(uid));
	}

}
