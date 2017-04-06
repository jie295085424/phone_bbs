package com.bbs.service;

import java.util.List;

import com.bbs.entity.Comment;

public interface CommentService {
	
	List<Comment> findByTid(int tid);

	void save(String username, int tid, Comment comment);

	List<Comment> findByUid(int uid);

	void delComment(int cid);
}
