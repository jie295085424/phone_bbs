package com.bbs.dao;

import java.util.List;
import org.hibernate.criterion.DetachedCriteria;
import com.bbs.entity.Phone;


public interface PhoneDao {

	public List<Phone> findAll();
	public List<Phone> findByCriteria(DetachedCriteria  dCriteria);
	public List<Phone> findByBid(int bid);
	public Phone findById(int pid);
	public void delPhone(int pid);
	public void add(Phone phone);
	public List<Phone> findByModel(String model);
	public void update(Phone phone);
}
