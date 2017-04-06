package com.bbs.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bbs.dao.ColorDao;
import com.bbs.entity.Color;
@Repository("colorDao")
public class ColorDapImpl implements ColorDao {
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Color> findAll() {
		// TODO Auto-generated method stub
		return (List<Color>)sessionFactory.getCurrentSession().createQuery("from Color").list();
	}

}
