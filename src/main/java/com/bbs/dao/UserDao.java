package com.bbs.dao;


import java.util.List;

import com.bbs.entity.User;

public interface UserDao {

	void save(User u);


	User findById(int uid);

	User findByName(String username);


	void update(User u);


	List<User> getAll();


	void delUser(int uid);

}
