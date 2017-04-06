package com.bbs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.dao.PhoneDao;
import com.bbs.entity.Phone;
import com.bbs.service.PhoneService;
@Service("phoneService")
public class PhoneServiceImpl implements PhoneService {

	@Autowired
	private PhoneDao phoneDao;
		
	@Override
	public void delPhone(int pid) {
		phoneDao.delPhone(pid);
		
	}

	@Override
	public List<Phone> findByBid(int bid) {
		
		return phoneDao.findByBid(bid);
	}

	@Override
	public Phone findById(int pid) {
		// TODO Auto-generated method stub
		return phoneDao.findById(pid);
	}

	@Override
	public void add(Phone phone) {
		// TODO Auto-generated method stub
		phoneDao.add(phone);
	}

	@Override
	public List<Phone> findByModel(String model) {
		// TODO Auto-generated method stub
		return phoneDao.findByModel(model);
	}

	@Override
	public void update(Phone phone) {
		// TODO Auto-generated method stub
		 phoneDao.update(phone);
	}

}
