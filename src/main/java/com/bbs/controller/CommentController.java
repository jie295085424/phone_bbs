package com.bbs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbs.dao.UserDao;
import com.bbs.entity.Comment;
import com.bbs.service.CommentService;
import com.bbs.service.TopicService;
import com.bbs.service.UserService;

@Controller
@RequestMapping
public class CommentController {
	@Autowired
	private CommentService commentService;
	@Autowired
	private UserService userService;
	@Autowired
	private TopicService topicService;
	
	@RequestMapping(value="/newComment",method=RequestMethod.POST)
	public String newTopic(HttpServletRequest requser,Comment comment){
		int tid = Integer.valueOf(requser.getParameter("tid"));
		String username = requser.getParameter("username");
		
		commentService.save(username,tid,comment);
		return "success";
			
	}
	
	@RequestMapping(value="/showMyComment",method=RequestMethod.GET)
	public String showMyComment(HttpServletRequest request){
		int uid = userService.findByName((String)request.getSession().getAttribute("username")).getUid();
		List<Comment> comments = commentService.findByUid(uid);
		request.setAttribute("comments", comments);
		System.out.println(comments);
		return "user/delComment";
		
	}
	@RequestMapping(value="/delMyComment",method=RequestMethod.GET)
	public String delMyComment(HttpServletRequest request){
		int cid = Integer.valueOf(request.getParameter("cid"));
		commentService.delComment(cid);
		return "user/delComment";
		
	}

}
