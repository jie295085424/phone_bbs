package com.bbs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.dao.UserDao;
import com.bbs.entity.User;
import com.bbs.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	@Override
	public void save(User u) {
		// TODO Auto-generated method stub
		userDao.save(u);
	}
	@Override
	public boolean contain(User u) {
		// TODO Auto-generated method stub
		if(userDao.findByName(u.getUsername())==null){
			return false;
		}else if(!userDao.findByName(u.getUsername()).getPassword().equals(u.getPassword())){
			return false;
		}
		return true;
	}
	@Override
	public User findByName(String username) {
		// TODO Auto-generated method stub
		return userDao.findByName(username);
	}
	@Override
	public User findById(int uid) {
		// TODO Auto-generated method stub
		return userDao.findById(uid);
	}
	@Override
	public void update(User u) {
		// TODO Auto-generated method stub
		userDao.update(u);
	}
	@Override
	public List<User> getAll() {
		// TODO Auto-generated method stub
		return userDao.getAll();
	}
	@Override
	public void delUser(int uid) {
		// TODO Auto-generated method stub

		userDao.delUser(uid);
	}
}
