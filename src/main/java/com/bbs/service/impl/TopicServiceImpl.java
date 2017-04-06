package com.bbs.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.dao.PhoneDao;
import com.bbs.dao.TopicDao;
import com.bbs.dao.UserDao;
import com.bbs.entity.Phone;
import com.bbs.entity.Topic;
import com.bbs.entity.User;
import com.bbs.service.TopicService;

@Service
public class TopicServiceImpl implements TopicService {
	
	@Autowired
	private TopicDao topicDao;
	@Autowired
	private PhoneDao phoneDao;
	@Autowired
	private UserDao userDao;
	@Override
	public List<Topic> findByPid(int pid) {
		return topicDao.findByPid(pid);
	}
	@Override
	public Topic findById(int tid) {
		// TODO Auto-generated method stub
		return topicDao.findById(tid);
	}
	@Override
	public void save(String username, int pid, Topic topic) {
		Phone phone = phoneDao.findById(pid);
		Date time = new Date();
		User u = userDao.findByName(username);
		topic.setTime(time);
		topic.setPhone(phone);
		topic.setUser(u);
		topicDao.save(topic);

		
	}
	@Override
	public List<Topic> findByUid(int uid) {
		// TODO Auto-generated method stub
		return topicDao.findByUid(uid);
	}
	@Override
	public void delTopic(int tid) {
		// TODO Auto-generated method stub
		topicDao.delTopic(topicDao.findById(tid));
	}
	@Override
	public List<Topic> findAll() {
		// TODO Auto-generated method stub
		return topicDao.findAll();
	}
	@Override
	public void update(Topic topic) {
		// TODO Auto-generated method stub
		topicDao.update(topic);
	}

}
