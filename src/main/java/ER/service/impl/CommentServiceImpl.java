package ER.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ER.annotation.Log;
import ER.dao.CommentDao;
import ER.entity.Comment;
import ER.service.CommentService;


@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDao commentDao;

	//comment实体list
	public List<Comment> getAllCommentList(){
		return commentDao.getAllCommentList();
	}
		
	//根据istatus搜索comment实体list
	public List<Comment> getCommentListByIs(String istatus){
		return commentDao.getCommentListByIs(istatus);
	}
	//根据name搜索comment实体list admin
	public List<Comment> getCommentListByN(String name){
		return commentDao.getCommentListByN(name);
	}
	
	//根据vid搜索comment实体list 
	public List<Comment> getCommentListByV(String vid){
		return commentDao.getCommentListByV(vid);
	}
		
	//根据id返回实体
	public Comment getCommentByI(String iid){
		return commentDao.getCommentByI(iid);
	}
		
	//保存
	@Log
	public void addComment(Comment comment) {
		commentDao.addComment(comment);
	}

	//更新
	public void updateComment(Comment comment){
		commentDao.updateComment(comment);
	}
}
