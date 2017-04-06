package com.bbs.service;

import java.util.List;
import java.util.Map;

import com.bbs.entity.Phone;


public interface GuideService {

	public List<Phone> find(Map<String, Integer> map);

	public List<Phone> findAll();

	public List<Phone> findByBid(int bid);

}
