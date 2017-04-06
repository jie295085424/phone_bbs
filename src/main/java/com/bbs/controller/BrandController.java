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
import com.bbs.entity.Brand;


@Controller
@RequestMapping
public class BrandController {

	@Autowired
	private BrandDao brandDao;

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
}
