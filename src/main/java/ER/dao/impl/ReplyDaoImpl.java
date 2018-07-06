package ER.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import ER.basedao.impl.BaseDao;
import ER.dao.ReplyDao;
import ER.entity.Reply;


@Repository
public class ReplyDaoImpl extends BaseDao<Reply,Long> implements ReplyDao{
	
	//comment实体list admin
	public List<Reply> getAllReplyList(){
		List<Reply> replyList = getListByHQL("from Reply");
		return replyList;
	}
	
	//根据rstatus搜索comment实体list admin
	public List<Reply> getReplyListByRs(String rstatus){
		String hql="from Reply r where r.rstatus=?";
		List<Reply> replyList = getListByHQL(hql,new Object[]{rstatus});
		return replyList;
	}
	
	//根据name搜索comment实体list admin
	public List<Reply> getReplyListByN(String name){
		String hql="from Reply r where (r.from_user.name like ? )or (r.to_user.name like ?)";
		List<Reply> replyList = getListByHQL(hql,new Object[]{name,name});
		return replyList;
	}
	
	//根据vid搜索comment实体list 
	public List<Reply> getReplyListByV(String vid){
		String hql="from Reply r where r.comment.video.vid = ? and r.rstatus='0'";
		List<Reply> replyList = getListByHQL(hql,new Object[]{vid});
		return replyList;
	}
		
	//根据id返回实体
	public Reply getReplyByR(String rid) {
		String hql = "from Reply r where r.rid = ?"; 
		Reply reply = getByHQL(hql,new Object[]{rid}); 
		return reply;
	}
		
	//保存
	@Override
	public void addReply(Reply reply){
        save(reply);   
   }

	//更新
    @Override
	public void updateReply(Reply reply){
        update(reply);      
   }
	
}
