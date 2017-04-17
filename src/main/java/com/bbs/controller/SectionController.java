package com.bbs.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbs.dao.BrandDao;
import com.bbs.entity.Brand;
import com.bbs.entity.Phone;
import com.bbs.service.GuideService;
@Controller
@RequestMapping
public class SectionController {
	@Autowired
	private BrandDao brandDao;
	@Autowired
	private GuideService phoneService;
	@RequestMapping(value="/sectionBrand",method=RequestMethod.GET)
	public String sectionBrand(HttpServletRequest request){
		int bid = Integer.valueOf(request.getParameter("bid"));
		Brand brand = brandDao.findById(bid);
		List<Brand> list = new ArrayList<>();
		list.add(brand);
		request.setAttribute("list", list);
		return "section";	
	}
	
	@RequestMapping(value="/sectionBrands",method=RequestMethod.GET)
	public String sectionBrands(HttpServletRequest request){
		List<Brand> list = brandDao.findAll();
		request.setAttribute("list", list);
		return "section";	
	}
	@RequestMapping(value="/sectionPhone",method=RequestMethod.GET)
	public String sectionPhone(HttpServletRequest request){
		int bid = Integer.valueOf(request.getParameter("bid"));
		List<Phone> list = phoneService.findByBid(bid);
		request.setAttribute("list", list);
		return "sectionpname";
	}

}
