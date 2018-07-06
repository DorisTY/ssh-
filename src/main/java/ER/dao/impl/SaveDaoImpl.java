package ER.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import ER.basedao.impl.BaseDao;
import ER.dao.SaveDao;
import ER.entity.Save;

@Repository
public class SaveDaoImpl extends BaseDao<Save,Long> implements SaveDao{
	
	//根据用户uid获取所有收藏
	public List<Save> getSaveListByU(String uid){
		String hql = "from Save s where s.collect.user.uid=? and s.collect.cstatus='0' and s.sstatus='0' order by s.save_time desc"; 
		List<Save> save = getListByHQL(hql,new Object[]{uid});
		return save;
	}
		
	//根据用户uid,cid获取所有收藏
	public List<Save> getSaveListByUC(String uid,String cid){
		String hql = "from Save s where s.collect.user.uid=? and s.collect.cid=? and s.collect.cstatus='0' and s.sstatus='0' order by s.save_time desc"; 
		List<Save> save = getListByHQL(hql,new Object[]{uid,cid});
		return save;
	}
		
	//根据id返回实体
	public Save getSaveByV(String vid,String cid) {
		String hql = "from Save s where s.video.vid = ? and s.collect.cid=?"; 
		Save save = getByHQL(hql,new Object[]{vid,cid}); 
		return save;
	}
	
	//根据sid返回实体
	public Save getSaveByS(String sid) {
		String hql = "from Save s where s.sid = ?"; 
		Save save = getByHQL(hql,new Object[]{sid}); 
		return save;
	}
	
	//保存
	@Override
	public void addSave(Save save){
        save(save);   
   }

	//更新
	@Override
	public void updateSave(Save save){
        update(save);   
   }
	
}
