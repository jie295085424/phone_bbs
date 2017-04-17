package com.bbs.controller;

import java.io.IOException;
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

import com.bbs.entity.Comment;
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
		userService.save(u);
		return "login";		
	}
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpServletRequest request){
		request.getSession().removeAttribute("username");
		SecurityUtils.getSubject().getSession().removeAttribute("user");
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
	public String showAllUser(HttpServletRequest request){
		 List<User> users = userService.getAll();
		 request.setAttribute("users", users);
		return "backstage/showUser";		
	}

    @RequestMapping(value="/updUser",method=RequestMethod.POST)  
    public String upload(@RequestParam("img")MultipartFile file, HttpServletRequest request,String username) throws IOException {  
        String filePath = UploadImgUtils.uploadFile(file, request); 
        System.out.println("filePath:" + filePath);  
        int uid = Integer.valueOf(request.getParameter("uid"));
        User u = userService.findById(uid);
        u.setImg(filePath);
        u.setUsername(username);
        userService.update(u);

       return "user/updUser";
    }  
	@RequestMapping(value="/delUser",method=RequestMethod.GET)
	public String delUser(HttpServletRequest request){
		int uid = Integer.valueOf(request.getParameter("uid"));
		userService.delUser(uid);
		return "backstage/showUser";		
	}
    
}
