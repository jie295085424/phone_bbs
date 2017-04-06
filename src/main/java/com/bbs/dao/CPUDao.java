package com.bbs.dao;

import java.util.List;

import com.bbs.entity.CPU;

public interface CPUDao {
	
	public List<CPU> findByModel(String model);

}
