package com.bbs.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bbs.dao.CPUDao;
import com.bbs.entity.Brand;
import com.bbs.entity.CPU;
import com.bbs.entity.Color;
import com.bbs.entity.NetSupport;
import com.bbs.entity.PSystem;
import com.bbs.entity.Phone;
import com.bbs.service.PhoneService;
import com.bbs.utils.UploadImgUtils;

@Controller
@RequestMapping
public class PhoneController {
	
	@Autowired
	private PhoneService phoneService;	
	@Autowired
	private CPUDao cpuDao;
	@RequestMapping(value="getPhone",method=RequestMethod.POST)
	public void getPhone(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int bid = Integer.valueOf(request.getParameter("bid"));
		List<Phone> list = phoneService.findByBid(bid);
		JSONArray json = new JSONArray();
		for(Phone p: list){
			JSONObject jo = new JSONObject();
			jo.put("pid", p.getPid());
			jo.put("pbrand", p.getBrand().getBname());
			jo.put("pmodel", p.getModel());
			jo.put("system", p.getPsystem().getSname());
			json.add(jo);
		}
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(json.toString());
		request.setAttribute("bid", bid);
	}
	
	@RequestMapping(value="delPhone",method=RequestMethod.GET)
	public void delPhone(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int pid = Integer.valueOf(request.getParameter("pid"));
		response.setContentType("text/html;charset=UTF-8");
		phoneService.delPhone(pid);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write("success");
	}
	
	@RequestMapping(value="updPhone",method=RequestMethod.GET)
	public String updPhone(HttpServletRequest request){
		Phone phone = phoneService.findById(Integer.valueOf(request.getParameter("pid")));
		request.setAttribute("phone", phone);
		return "backstage/updPhone";
		
	}
	
	
	@RequestMapping(value="addPhone",method=RequestMethod.POST)
	public void addPhone(@RequestParam("image")MultipartFile file,HttpServletRequest request,Phone phone) throws IOException{
		int bid = Integer.valueOf(request.getParameter("bid"));
		Brand brand = new Brand();brand.setBid(bid);
		phone.setBrand(brand);
		
		String cmodel = request.getParameter("cmodel");
		String cperformance = request.getParameter("cperformance");
		List<CPU> cpus = cpuDao.findByModel(cmodel);
		CPU	cpu;
		if(cpus.size()>0){
			cpu = cpus.get(0);
		}else{
			cpu = new CPU();
			cpu.setCmodel(cmodel);
			cpu.setCperformance(cperformance);
		}		
		phone.setCpu(cpu);
		
		int nid = Integer.valueOf(request.getParameter("nid"));
		NetSupport net = new NetSupport();net.setNid(nid);
		phone.setNetSupport(net);
		
		int sid = Integer.valueOf(request.getParameter("sid"));
		PSystem sys = new PSystem();sys.setSid(sid);
		phone.setPsystem(sys);
		
		
		String[] ss = request.getParameterValues("color");
		Set<Color> colors = new HashSet<Color>();
		for(String coid:ss){
			Color color = new Color();
			color.setCoid(Integer.valueOf(coid));
			colors.add(color);
		}
		phone.setColors(colors);
		
		String filePath = UploadImgUtils.uploadFile(file, request);
		if(""!=filePath&&null!=filePath){
		phone.setImg(filePath);
		}
		System.out.println(phone.toString());
		List<Phone> phones = phoneService.findByModel(phone.getModel());
		if(phones.size()>0){	
			phone.setTopics(phones.get(0).getTopics());
			phone.setPid(phones.get(0).getPid());
			System.out.println(phone.getPid());
			phoneService.update(phone);
		}else{
		phoneService.add(phone);
		}
		

	}
	
	

}
