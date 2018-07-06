package ER.dao;

import java.util.List;

import ER.entity.Reply;

public interface ReplyDao {
	
	//Reply实体list
	public List<Reply> getAllReplyList();
	
	//根据rstatus搜索comment实体list admin
	public List<Reply> getReplyListByRs(String rstatus);
		
	//根据name搜索comment实体list admin
	public List<Reply> getReplyListByN(String name);
		
	//根据vid搜索comment实体list 
	public List<Reply> getReplyListByV(String vid);
		
	//根据id返回实体
	public Reply getReplyByR(String rid);
	
	//保存
	public void addReply(Reply reply);
	
	//更新
	public void updateReply(Reply reply);
}
