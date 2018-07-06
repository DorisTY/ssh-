package ER.dao.impl;

import org.springframework.stereotype.Repository;

import ER.basedao.impl.BaseDao;
import ER.dao.LoveDao;
import ER.entity.Love;

@Repository
public class LoveDaoImpl extends BaseDao<Love,Long> implements LoveDao{
	
	//根据user video返回实体
	public Love getLoveByUV(String uid,String vid) {
		String hql = "from Love l where l.user.uid = ? and l.video.vid = ?"; 
		Love love = getByHQL(hql,new Object[]{uid,vid}); 
		return love;
	}
	
	//根据user comment返回实体
	public Love getLoveByUI(String uid,String iid) {
		String hql = "from Love l where l.user.uid = ? and l.comment.iid = ?"; 
		Love love = getByHQL(hql,new Object[]{uid,iid}); 
		return love;
	}
		
	//保存
	@Override
	public void addLove(Love love){
        save(love);   
   }

	//更新
	@Override
	public void updateLove(Love love){
		update(love);   
   }
}
