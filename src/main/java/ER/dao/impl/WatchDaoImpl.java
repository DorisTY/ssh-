package ER.dao.impl;

import org.springframework.stereotype.Repository;

import ER.basedao.impl.BaseDao;
import ER.dao.WatchDao;
import ER.entity.Watch;

@Repository
public class WatchDaoImpl extends BaseDao<Watch,Long> implements WatchDao{
	
	//根据wid返回实体
	public Watch getWatchByW(String wid) {
		String hql = "from Watch w where w.wid = ?"; 
		Watch watch = getByHQL(hql,new Object[]{wid}); 
		return watch;
	}
	
	//保存
	@Override
	public void addWatch(Watch watch){
        save(watch);   
   }

	//更新
	@Override
	public void updateWatch(Watch watch){
		update(watch);   
   }
}
