package com.bbs.service;

import java.util.List;

import com.bbs.entity.Phone;

public interface PhoneService {
	public void delPhone(int pid);

	public List<Phone> findByBid(int bid);

	public Phone findById(int pid);

	public void add(Phone phone);
	
	public List<Phone> findByModel(String model);

	public void update(Phone phone);

}
