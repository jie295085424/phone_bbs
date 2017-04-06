package com.bbs.service;

import java.util.List;

import com.bbs.entity.User;

public interface UserService {

	void save(User u);

	boolean contain(User u);

	User findByName(String username);

	User findById(int uid);

	void update(User u);

	List<User> getAll();

	void delUser(int uid);
	
}
