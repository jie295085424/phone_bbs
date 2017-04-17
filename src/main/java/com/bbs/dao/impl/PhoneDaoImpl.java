package com.bbs.dao.impl;


import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import com.bbs.dao.PhoneDao;
import com.bbs.entity.Phone;



@Repository("phoneDao")
public class PhoneDaoImpl implements PhoneDao {
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private HibernateTemplate hibernateTemplate;
	@Override
	@SuppressWarnings("unchecked")
	public List<Phone> findAll() {
		
		return sessionFactory.getCurrentSession().createQuery("from Phone").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Phone> findByCriteria(DetachedCriteria  dCriteria) {
		
		return (List<Phone>) hibernateTemplate.findByCriteria(dCriteria);		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Phone> findByBid(int bid) {
		@SuppressWarnings("deprecation")
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Phone.class);
		criteria.createAlias("brand", "brand").add(Restrictions.eq("brand.bid", bid));		
		return criteria.list();	}

	@Override
	public Phone findById(int pid) {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().load(Phone.class, pid);
	}

	@Override
	public void delPhone(int pid) {
		sessionFactory.getCurrentSession().delete(findById(pid));


	}
	
	@SuppressWarnings({ "unchecked", "deprecation" })
	public List<Phone> findByModel(String model){
		return sessionFactory.getCurrentSession()
				.createQuery("from Phone where model=?").setString(0, model).list();
	}

	@Override
	public void add(Phone phone) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(phone);
	}

	@Override
	public void update(Phone phone) {
		// TODO Auto-generated method stub
		
		sessionFactory.getCurrentSession().merge(phone);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Phone> findHot() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from Phone order by countTopic desc").setFirstResult(0).setMaxResults(8).list();
	}
}


