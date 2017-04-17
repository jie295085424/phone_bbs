package com.bbs.dao;


import java.util.List;

import com.bbs.entity.Topic;

public interface TopicDao {

	List<Topic> findByPid(int pid);

	Topic findById(int tid);

	void save( Topic topic);

	List<Topic> findByUid(int uid);

	void delTopic(Topic topic);

	List<Topic> findAll();

	void update(Topic topic);

	List<Topic> findByTitle(String context);

	List<Topic> findJingPinTopic();

	List<Topic> findHotTopic();

}
