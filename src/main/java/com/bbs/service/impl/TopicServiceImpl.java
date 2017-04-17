package com.bbs.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.dao.BrandDao;
import com.bbs.dao.PhoneDao;
import com.bbs.dao.TopicDao;
import com.bbs.dao.UserDao;
import com.bbs.entity.Brand;
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
	@Autowired
	private BrandDao brandDao;
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
		Brand brand = brandDao.findById(phone.getBrand().getBid());
		Date time = new Date();
		User u = userDao.findByName(username);
		topic.setTime(time);
		phone.setCountTopic(phone.getCountTopic()+1);
		phoneDao.update(phone);
		topic.setPhone(phone);
		topic.setUser(u);
		topicDao.save(topic);
		brand.setCountTopic(brand.getCountTopic()+1);
//		brand.setPhones(brand.getPhones());
		brandDao.update(brand);
		 
		
	}
	@Override
	public List<Topic> findByUid(int uid) {
		// TODO Auto-generated method stub
		return topicDao.findByUid(uid);
	}
	@Override
	public void delTopic(int tid) {
		// TODO Auto-generated method stub
		Brand brand = brandDao.findById(topicDao.findById(tid).getPhone().getBrand().getBid());
		brand.setCountTopic(brand.getCountTopic()-1);
		Phone phone = topicDao.findById(tid).getPhone();
		phone.setCountTopic(phone.getCountTopic()-1);
		phoneDao.update(phone);
		topicDao.delTopic(topicDao.findById(tid));
		brandDao.update(brand);
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
	@Override
	public List<Topic> findByTitle(String context) {
		
		return topicDao.findByTitle(context);	
	}
	@Override
	public List<Topic> findJingPinTopic() {
		// TODO Auto-generated method stub
		return topicDao.findJingPinTopic();
	}
	@Override
	public List<Topic> findHotTopic() {
		// TODO Auto-generated method stub
		return topicDao.findHotTopic();
	}

}
