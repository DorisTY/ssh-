package ER.dao;

import ER.entity.Watch;

public interface WatchDao {
	
	//根据wid返回实体
	public Watch getWatchByW(String wid) ;
		
	//保存
	public void addWatch(Watch watch);
	
	//更新
	public void updateWatch(Watch watch);
}
