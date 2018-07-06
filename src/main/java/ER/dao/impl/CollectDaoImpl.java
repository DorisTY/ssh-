package ER.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import ER.basedao.impl.BaseDao;
import ER.dao.CollectDao;
import ER.entity.Collect;

@Repository
public class CollectDaoImpl extends BaseDao<Collect,Long> implements CollectDao{
	
	//根据用户uid获取所有收藏夹
	public List<Collect> getCollectListByU(String uid){
		String hql = "from Collect c where c.user.uid=? and c.cstatus='0'"; 
		List<Collect> collectList = getListByHQL(hql,new Object[]{uid});
		return collectList;
	}
		
	//根据cid查询视频
	public Collect getCollectByC(String cid) {
		String hql = "from Collect c where c.cid = ?"; 
		Collect collect = getByHQL(hql,new Object[]{cid}); 
		return collect;
	}
		
	//保存
	@Override
	public void addCollect(Collect collect){
        save(collect);   
   }

	//更新
	@Override
	public void updateCollect(Collect collect){
        update(collect);   
   }
}
