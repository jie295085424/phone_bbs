package com.bbs.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.bbs.dao.CPUDao;
import com.bbs.entity.CPU;

@Repository("cpuDao")
public class CPUDaoImpl implements CPUDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	@SuppressWarnings("unchecked")
	@Override
	public List<CPU> findByModel(String model) {
		
		return  sessionFactory.getCurrentSession()
				.createQuery("from CPU where cmodel='"+model+"'").list();
	}

}
