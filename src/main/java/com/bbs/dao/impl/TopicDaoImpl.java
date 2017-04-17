package com.bbs.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bbs.dao.TopicDao;
import com.bbs.entity.Topic;

@Repository
public class TopicDaoImpl implements TopicDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<Topic> findByPid(int pid) {		
		return (List<Topic>)sessionFactory.getCurrentSession().createCriteria(Topic.class)
				.createAlias("phone", "phone").add(Restrictions.eq("phone.pid", pid)).list();
	}
	@Override
	public Topic findById(int tid) {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().load(Topic.class, tid);
	}
	@Override
	public void save(Topic topic) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(topic);
	}
	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<Topic> findByUid(int uid) {
		// TODO Auto-generated method stub
		return (List<Topic>) sessionFactory.getCurrentSession().createCriteria(Topic.class)
		.createAlias("user", "user").add(Restrictions.eq("user.uid", uid)).list();

	}
	@Override
	public void delTopic(Topic topic) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().delete(topic);;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Topic> findAll() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from Topic").list();
	}
	@Override
	public void update(Topic topic) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(topic);
	}
	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<Topic> findByTitle(String context) {
		System.out.println(context);
		return sessionFactory.getCurrentSession().createCriteria(Topic.class).add(Restrictions.like("title", "%"+context+"%")).list();
		
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Topic> findJingPinTopic() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from Topic where isBoutique=true").list();
	}
	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<Topic> findHotTopic() {
		// TODO Auto-generated method stub
		
		return sessionFactory.getCurrentSession().createQuery("from Topic where countNum>4 order by countNum desc")
				.setFirstResult(0).setMaxResults(19).list();
	}

}
