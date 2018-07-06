package ER.dao;

import java.util.List;

import ER.entity.Comment;

public interface CommentDao {
	
	//comment实体list
	public List<Comment> getAllCommentList();
		
	//根据istatus搜索comment实体list
	public List<Comment> getCommentListByIs(String istatus);
		
	//根据name搜索comment实体list admin
	public List<Comment> getCommentListByN(String name);
		
	//根据vid搜索comment实体list 
	public List<Comment> getCommentListByV(String vid);
		
	//根据id返回实体
	public Comment getCommentByI(String iid);
		
	//保存
	public void addComment(Comment comment);
	
	//更新
	public void updateComment(Comment comment);
}
