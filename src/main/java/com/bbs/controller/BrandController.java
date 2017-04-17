package com.bbs.controller;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.bbs.dao.BrandDao;
import com.bbs.dao.PhoneDao;
import com.bbs.dao.TopicDao;
import com.bbs.entity.Brand;
import com.bbs.entity.Phone;
import com.bbs.entity.Topic;


@Controller
@RequestMapping
public class BrandController {

	@Autowired
	private BrandDao brandDao;
	@Autowired
	private PhoneDao phoneDao;
	@Autowired
	private TopicDao topicDao;
	@RequestMapping(value="getBrand",method=RequestMethod.GET)
	public String brand(HttpServletRequest request){
		List<Brand> brands = brandDao.findAll();
		request.setAttribute("brands", brands);
		return "backstage/showPhone";		
	}

	@RequestMapping(value="addBrand",method=RequestMethod.POST)
	public void addBrand(HttpServletRequest request,HttpServletResponse response) throws IOException{
		Brand brand = new Brand();
		brand.setBname(request.getParameter("bname"));
		System.out.println(brand.toString());
		brandDao.addBrand(brand);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write("success");
	}
	@RequestMapping(value="indexAction",method=RequestMethod.GET)
	public String indexAction(HttpServletRequest request){
		List<Brand> brands = brandDao.findHot();
		request.setAttribute("brands", brands);
		List<Phone> phones = phoneDao.findHot();
		request.setAttribute("phones", phones);
		List<Topic> topics = topicDao.findHotTopic();
		request.setAttribute("topics", topics);
		return "index";
		
		
	}
}
