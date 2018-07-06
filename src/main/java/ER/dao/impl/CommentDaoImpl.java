package ER.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import ER.basedao.impl.BaseDao;
import ER.dao.CommentDao;
import ER.entity.Comment;


@Repository
public class CommentDaoImpl extends BaseDao<Comment,Long> implements CommentDao{
	
	//comment实体list admin
	public List<Comment> getAllCommentList(){
		List<Comment> commentList = getListByHQL("from Comment");
		return commentList;
	}
	
	//根据istatus搜索comment实体list admin
	public List<Comment> getCommentListByIs(String istatus){
		String hql = "from Comment c where c.istatus=? "; 
		List<Comment> commentList = getListByHQL(hql,new Object[]{istatus});
		return commentList;
	}
	
	//根据name搜索comment实体list admin
	public List<Comment> getCommentListByN(String name){
		String hql = "from Comment c where c.user.name like ? "; 
		List<Comment> commentList = getListByHQL(hql,new Object[]{name});
		return commentList;
	}
	
	//根据vid搜索comment实体list 
	public List<Comment> getCommentListByV(String vid){
		String hql = "from Comment c where c.video.vid = ? and c.istatus = '0'"; 
		List<Comment> commentList = getListByHQL(hql,new Object[]{vid});
		return commentList;
	}
	
	//根据id返回实体
	public Comment getCommentByI(String iid) {
		String hql = "from Comment c where c.iid = ?"; 
		Comment comment = getByHQL(hql,new Object[]{iid}); 
		return comment;
	}
		
	//保存
	@Override
	public void addComment(Comment comment){
        save(comment);   
   }

	//更新
    @Override
	public void updateComment(Comment comment){
        update(comment);      
   }
	
}
