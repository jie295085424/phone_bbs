package com.bbs.dao;

import java.util.List;

import com.bbs.entity.Comment;
import com.bbs.entity.Topic;

public interface CommentDao {
	
	List<Comment> findByTid(int tid);

	void save(Comment comment);

	List<Comment> findByUid(int uid);

	void delComment(Comment comm);
}
