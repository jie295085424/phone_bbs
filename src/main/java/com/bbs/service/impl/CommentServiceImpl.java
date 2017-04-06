package com.bbs.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.dao.CommentDao;
import com.bbs.dao.TopicDao;
import com.bbs.dao.UserDao;
import com.bbs.entity.Comment;
import com.bbs.entity.Topic;
import com.bbs.entity.User;
import com.bbs.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	private CommentDao commentDao;
	@Autowired
	private TopicDao topicDao;
	@Autowired
	private UserDao userDao;
	@Override
	public List<Comment> findByTid(int tid) {
		// TODO Auto-generated method stub
		return commentDao.findByTid(tid);
	}
	@Override
	public void save(String username, int tid, Comment comment) {
		// TODO Auto-generated method stub
		Topic topic = topicDao.findById(tid);
		User u = userDao.findByName(username);
		Date time = new Date();
		comment.setTime(time);
		comment.setTopic(topic);
		comment.setUser(u);
		commentDao.save(comment);
	}
	@Override
	public List<Comment> findByUid(int uid) {
		// TODO Auto-generated method stub
		return commentDao.findByUid(uid);
	}
	@Override
	public void delComment(int cid) {
		// TODO Auto-generated method stub
		Comment comm = new Comment();
		comm.setId(cid);
		commentDao.delComment(comm);
	}

}
