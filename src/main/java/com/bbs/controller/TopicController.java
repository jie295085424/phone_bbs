package com.bbs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbs.dao.PhoneDao;
import com.bbs.entity.Comment;
import com.bbs.entity.Phone;
import com.bbs.entity.Topic;
import com.bbs.service.CommentService;
import com.bbs.service.PhoneService;
import com.bbs.service.TopicService;
import com.bbs.service.UserService;

@Controller
@RequestMapping
public class TopicController {
	@Autowired
	private TopicService topicService;
	@Autowired
	private PhoneService phoneService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private UserService userService;
	@RequestMapping(value="/phoneTopic",method=RequestMethod.GET)
	public String topicPhone(HttpServletRequest request){
		int pid = Integer.valueOf(request.getParameter("pid"));
		List<Topic> list =  topicService.findByPid(pid);
		Phone phone =  phoneService.findById(pid);
		request.setAttribute("list", list);
		request.setAttribute("phone", phone);
		return "topic";
		
	}
	@RequestMapping(value="/topicDetail",method=RequestMethod.GET)
	public String topicDetail(HttpServletRequest request){
		int tid = Integer.valueOf(request.getParameter("tid"));
		Topic topic = topicService.findById(tid);
		List<Comment> list = commentService.findByTid(tid);		
		request.setAttribute("topic", topic);
		request.setAttribute("list", list);
		return "topicDetail";
		
	}
	@RequestMapping(value="/newTopic",method=RequestMethod.POST)
	public String newTopic(HttpServletRequest requser,Topic topic){

		int pid = Integer.valueOf(requser.getParameter("pid"));	
		String username = requser.getParameter("username");
		topicService.save(username,pid,topic);
		return "success";
	}
	
	@RequestMapping(value="/showMyTopic",method=RequestMethod.GET)
	public String showMyTopic(HttpServletRequest request){

		int uid = userService.findByName((String)request.getSession().getAttribute("username")).getUid();
		List<Topic> topics = topicService.findByUid(uid);
		request.setAttribute("topics", topics);
		return "user/delTopic";
		
	}
	@RequestMapping(value="/delMyTopic",method=RequestMethod.GET)
	public String delMyTopic(HttpServletRequest request){
		int tid = Integer.valueOf(request.getParameter("tid"));
		topicService.delTopic(tid);
		return "user/delTopic";
	}
	@RequestMapping(value="/delTopic",method=RequestMethod.GET)
	public void delTopic(HttpServletRequest request){
		int tid = Integer.valueOf(request.getParameter("tid"));
		topicService.delTopic(tid);
	}
	
	@RequestMapping(value="/showTopics",method=RequestMethod.GET)
	public String showTopics(HttpServletRequest request){
		List<Topic> topics = topicService.findAll();
		request.setAttribute("topics", topics);
		return "/backstage/showTopic";
		
	}
	
	
	@RequestMapping(value="/updTopic",method=RequestMethod.POST)
	public void updTopic(HttpServletRequest request,HttpServletResponse response,Topic topic){
		int id = Integer.valueOf(request.getParameter("tid"));
		Topic topic1 = topicService.findById(id);
		topic1.setBoutique(!topic1.isBoutique());
		topicService.update(topic1);

	}
	
	

}
