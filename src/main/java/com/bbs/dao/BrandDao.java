package com.bbs.dao;

import java.util.List;

import com.bbs.entity.Brand;

public interface BrandDao {
	List<Brand> findAll();
	void addBrand(Brand brand);
	List<Brand> findHot();
	void update(Brand brand);
	Brand findById(int bid);
	
}
