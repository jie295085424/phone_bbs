package com.bbs.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.bbs.dao.BrandDao;
import com.bbs.entity.Brand;
@Repository("brandDao")
@Transactional
public class BrandDaoImpl implements BrandDao{
	@Autowired
	private SessionFactory sessionFactory;
	@SuppressWarnings("unchecked")
	@Override
	public List<Brand> findAll() {
		// TODO Auto-generated method stub
		return (List<Brand>) sessionFactory.getCurrentSession().createQuery("from Brand").list();
	}
	@Override
	public void addBrand(Brand brand) {
		
		sessionFactory.getCurrentSession().saveOrUpdate(brand);;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Brand> findHot() {
		
		return sessionFactory.getCurrentSession().createQuery("from Brand order by countTopic desc").setFirstResult(0).setMaxResults(9).list();
	}
	@Override
	public void update(Brand brand) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(brand);
	}
	@Override
	public Brand findById(int bid) {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().get(Brand.class, bid);
	}

}
