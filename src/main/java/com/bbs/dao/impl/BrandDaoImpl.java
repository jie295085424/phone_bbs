package com.bbs.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
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

}
