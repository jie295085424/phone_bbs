package com.bbs.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bbs.entity.Comment;
import com.bbs.entity.Role;
import com.bbs.entity.Topic;
import com.bbs.entity.User;
import com.bbs.service.CommentService;
import com.bbs.service.TopicService;
import com.bbs.service.UserService;
import com.bbs.utils.UploadImgUtils;
import com.mysql.jdbc.Security;

@Controller
@RequestMapping
public class UserController {
	@Autowired
	private UserService userService;
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login(HttpServletRequest request,User u){

		Subject subject = SecurityUtils.getSubject();
		try{			
			subject.login(new UsernamePasswordToken(u.getUsername(),u.getPassword()));						
		}catch (Exception e) {
			 return "error";
		}
		User user = userService.findByName(u.getUsername());
        subject.getSession().setAttribute("user", user);
        request.getSession().setAttribute("user", user);
        return "start";
	}
	
	@RequestMapping(value="/regist",method=RequestMethod.GET)
	public String regist(User u){
		u.setImg("img/portrait/portrait.jpg");
		u.setRegTime(new Date());
		userService.save(u);
		return "login";		
	}
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpServletRequest request){
		
		request.getSession().removeAttribute("user");
		SecurityUtils.getSubject().logout();
		return "index";	
	}
	@RequestMapping(value="/showUser",method=RequestMethod.GET)
	public String userDetail(HttpServletRequest request){
		User u = (User) request.getSession().getAttribute("user");
		 User u2 = userService.findByName(u.getUsername());
		 request.setAttribute("user", u2);
		return "user/updUser";		
	}
	@RequestMapping(value="/showAllUser",method=RequestMethod.GET)
	public void showAllUser(HttpServletRequest request,HttpServletResponse response) throws IOException{
		 List<User> users = userService.getAll();
		 User u = (User) request.getSession().getAttribute("user");
		 for(int i=0;i<users.size();i++){
			 if(users.get(i).getUid()==u.getUid()){
				 users.remove(i);
			 }
		 }
		 JSONArray json = new JSONArray();
			for(User user:users){
				JSONObject jo = new JSONObject();
				jo.put("id", user.getUid());
				jo.put("username", user.getUsername());
				jo.put("sex", user.getSex());
				StringBuffer role = new StringBuffer();
				for(Role r:user.getRoles()){
					role.append(r.getRname()+" ");
				}
				jo.put("role",role.toString());
				jo.put("email", user.getEmail());
				jo.put("time", user.getRegTime());
				StringBuffer action = new StringBuffer();
				action.append("<a href='javascript:void(0)' onclick='delUser("+user.getUid()+")'>删除&nbsp;&nbsp;</a>");
				jo.put("action", action.toString());
				json.add(jo);
			}
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("data", json);
			jsonObject.put("total", users.size()-1);
			System.out.println(jsonObject.toJSONString());
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write(jsonObject.toString());
			
	}

    @RequestMapping(value="/updUser",method=RequestMethod.POST)  
    public String upload(@RequestParam("img")MultipartFile file, HttpServletRequest request,String username) throws IOException {  
        String filePath = UploadImgUtils.uploadFile(file, request); 
        System.out.println("filePath:" + filePath);  
        int uid = Integer.valueOf(request.getParameter("uid"));
        User u = userService.findById(uid);
        if(""!=filePath&&null!=filePath){
        u.setImg(filePath);
        }
        u.setUsername(username);
        userService.update(u);
       return "user/updUser";
    }  
	@RequestMapping(value="/delUser",method=RequestMethod.GET)
	public void delUser(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int uid = Integer.valueOf(request.getParameter("uid"));
		userService.delUser(uid);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write("success");
				
	}
	@RequestMapping(value="/updPassword",method=RequestMethod.GET)
	public void updPassword(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String newpw = request.getParameter("newpw").trim();
		User user = (User) request.getSession().getAttribute("user");
		user.setPassword(newpw);
		userService.update(user);
		Subject subject = SecurityUtils.getSubject();
		subject.getSession().removeAttribute("user");
		subject.getSession().setAttribute("user", user);
		request.getSession().removeAttribute("user");
		request.getSession().setAttribute("user", user);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write("success");		
	}
    
}
