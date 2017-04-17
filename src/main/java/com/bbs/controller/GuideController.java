package com.bbs.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bbs.dao.BrandDao;
import com.bbs.dao.ColorDao;
import com.bbs.dao.PhoneDao;
import com.bbs.entity.Brand;
import com.bbs.entity.Color;
import com.bbs.entity.Phone;
import com.bbs.service.GuideService;

@Controller
@RequestMapping
public class GuideController {
	@Autowired
	private GuideService phoneService;
	@Autowired
	private BrandDao brandDao;
	@Autowired
	private ColorDao colorDao;
	
	@RequestMapping(value="/guide",method=RequestMethod.GET)
	public String guide(HttpServletRequest request){
		List<Brand> brands =  brandDao.findAll();
		List<Color> colors =  colorDao.findAll();	
		request.setAttribute("brands", brands);
		request.setAttribute("colors", colors);
		return "guide";		
	}




	@RequestMapping(value="/search",method=RequestMethod.POST)
	public void search(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int bid = Integer.valueOf(request.getParameter("bid"));
		int price = Integer.valueOf(request.getParameter("price"));
		int sid = Integer.valueOf(request.getParameter("sid"));
		int ram = Integer.valueOf(request.getParameter("ram"));
		int rom = Integer.valueOf(request.getParameter("rom"));
		int battery = Integer.valueOf(request.getParameter("battery"));
		int pre_camera = Integer.valueOf(request.getParameter("pre_camera"));
		int pos_camera = Integer.valueOf(request.getParameter("pos_camera"));
		int net = Integer.valueOf(request.getParameter("net"));
		int coid = Integer.valueOf(request.getParameter("coid"));
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("bid", bid);map.put("price", price);
		map.put("sid", sid);map.put("ram", ram);
		map.put("rom", rom);map.put("battery", battery);
		map.put("pre_camera", pre_camera);
		map.put("pos_camera", pos_camera);
		map.put("net", net);map.put("coid", coid);
		
		List<Phone> list = phoneService.find(map);
		JSONArray json = new JSONArray();
		for(Phone p : list){
			JSONObject jo = new JSONObject();
			jo.put("pid", p.getPid());
			jo.put("brand", p.getBrand().getBname());
			jo.put("model", p.getModel());
			jo.put("img", p.getImg());			
			jo.put("price", p.getPrice());
			json.add(jo);
		}
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(json.toString());
		

	}
}
