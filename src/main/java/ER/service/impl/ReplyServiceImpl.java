package ER.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ER.annotation.Log;
import ER.dao.ReplyDao;
import ER.entity.Reply;
import ER.service.ReplyService;


@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDao replyDao;

	//comment实体list
	public List<Reply> getAllReplyList(){
		return replyDao.getAllReplyList();
	}
	
	//根据rstatus搜索comment实体list admin
	public List<Reply> getReplyListByRs(String rstatus){
		return replyDao.getReplyListByRs(rstatus);
	}
	
	//根据name搜索comment实体list admin
	public List<Reply> getReplyListByN(String name){
		return replyDao.getReplyListByN(name);
	}
		
	//根据vid搜索comment实体list 
	public List<Reply> getReplyListByV(String vid){
		return replyDao.getReplyListByV(vid);
	}
		
	//根据id返回实体
	public Reply getReplyByR(String rid){
		return replyDao.getReplyByR(rid);
	}
		
	//保存
	@Log
	public void addReply(Reply reply) {
		replyDao.addReply(reply);
	}

	//更新
	public void updateReply(Reply reply){
		replyDao.updateReply(reply);
	}
		
}
