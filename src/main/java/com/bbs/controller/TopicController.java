package com.bbs.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bbs.dao.TopicDao;
import com.bbs.entity.Comment;
import com.bbs.entity.CommentTree;

import com.bbs.entity.Phone;
import com.bbs.entity.Topic;
import com.bbs.entity.User;
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
		int countNum=0;
		for(Topic topic:list){
			 countNum += topic.getCountNum();
		}
		request.setAttribute("countNum", countNum);
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
	public String newTopic(HttpServletRequest request,Topic topic){

		int pid = Integer.valueOf(request.getParameter("pid"));	
		String username = ((User)request.getSession().getAttribute("user")).getUsername();
		topicService.save(username,pid,topic);
		return "success";
	}
	
	@RequestMapping(value="/showMyTopic",method=RequestMethod.GET)
	public String showMyTopic(HttpServletRequest request){

		int uid = userService.findByName(((User)request.getSession().getAttribute("user")).getUsername()).getUid();
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
	@RequestMapping(value="/delTopic",method=RequestMethod.POST)
	public void delTopic(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int tid = Integer.valueOf(request.getParameter("tid"));
		topicService.delTopic(tid);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write("success");
	}

	@RequestMapping(value="/showTopics",method=RequestMethod.GET)
	public void showTopics(HttpServletRequest request,HttpServletResponse response) throws IOException{
		List<Topic> topics = topicService.findAll();
		request.setAttribute("topics", topics);
		JSONArray json = new JSONArray();
		for(Topic topic:topics){
			JSONObject jo = new JSONObject();
			jo.put("id", topic.getId());
			jo.put("title", topic.getTitle());
			jo.put("countNum", topic.getCountNum());
			jo.put("boutique", topic.isBoutique());
			jo.put("time", topic.getTime().toString());
			StringBuffer action = new StringBuffer();
			if(topic.isBoutique()==false){
				action.append("<a href='javascript:void(0)' onclick='updTopic("+topic.getId()+")'>加精&nbsp;&nbsp;</a>");
			}else{
				action.append("<a href='javascript:void(0)' onclick='updTopic("+topic.getId()+")'>取消加精&nbsp;&nbsp;</a>");
			}
			action.append("<a href='javascript:void(0)' onclick='topicDetail("+topic.getId()+")'>详情&nbsp;&nbsp;</a>"+
					"<a href='javascript:void(0)' onclick='delTopic("+topic.getId()+")'>删除&nbsp;&nbsp;</a>");
			jo.put("action", action.toString());
			json.add(jo);
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("data", json);
		jsonObject.put("total", topics.size());
		System.out.println(jsonObject.toJSONString());
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(jsonObject.toString());
		
	}
	
	@RequestMapping(value="/updTopic",method=RequestMethod.POST)
	public void updTopic(HttpServletRequest request,HttpServletResponse response,Topic topic){
		int id = Integer.valueOf(request.getParameter("tid"));
		Topic topic1 = topicService.findById(id);
		topic1.setBoutique(!topic1.isBoutique());
		topicService.update(topic1);

	}
	@RequestMapping(value="/searchTopic",method=RequestMethod.GET)
	public String search(HttpServletRequest request){
		String content = ((String) request.getParameter("content")).trim();
		List<Topic> list = topicService.findByTitle(content);
		request.setAttribute("list", list);
		  return "/topic"; 		
	}
	
//	@RequestMapping(value="/topicDetail2",method=RequestMethod.GET)
//	public String topicDetail2(HttpServletRequest request){
//		int tid = Integer.valueOf(request.getParameter("tid"));
//		Topic topic = topicService.findById(tid);
//		List<Comment> nodes = commentService.findByTid(tid);		
//		CommentTree tree = new CommentTree(nodes);
//		String comments = tree.buildTree();
//		request.setAttribute("topic", topic);
//		request.setAttribute("comments", comments);
//
//		return "topicDetail";
//	
//	}
	@RequestMapping(value="/jingPinTopic",method=RequestMethod.GET)
	public String jingPinTopic(HttpServletRequest request){
		List<Topic> list = topicService.findJingPinTopic();
		request.setAttribute("list", list);
		return "/topic";
		
	}
	@RequestMapping(value="/hotTopic",method=RequestMethod.GET)
	public String hotTopic(HttpServletRequest request){
		List<Topic> list = topicService.findHotTopic();
		request.setAttribute("list", list);
		System.out.println(list.toString());
		return "/topic";
	}
	

}
