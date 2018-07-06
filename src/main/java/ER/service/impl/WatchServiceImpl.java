package ER.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ER.annotation.Log;
import ER.dao.WatchDao;
import ER.entity.Watch;
import ER.service.WatchService;


@Service
public class WatchServiceImpl implements WatchService {

	@Autowired
	private WatchDao watchDao;

	//根据wid返回实体
		public Watch getWatchByW(String wid) {
		return watchDao.getWatchByW(wid);
	}
	
	//保存
	@Log
	public void addWatch(Watch watch) {
		watchDao.addWatch(watch);
	}
	
	//更新
	public void updateWatch(Watch watch){
		watchDao.updateWatch(watch);
	}

}
