package com.bbs.service;

import java.util.List;

import com.bbs.entity.Topic;

public interface TopicService {

	List<Topic> findByPid(int pid);

	Topic findById(int tid);

	void save(String username, int pid, Topic topic);

	List<Topic> findByUid(int uid);

	void delTopic(int tid);

	List<Topic> findAll();

	void update(Topic topic);

}
