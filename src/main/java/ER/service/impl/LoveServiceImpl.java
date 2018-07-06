package ER.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ER.annotation.Log;
import ER.dao.LoveDao;
import ER.entity.Love;
import ER.service.LoveService;


@Service
public class LoveServiceImpl implements LoveService {

	@Autowired
	private LoveDao loveDao;
	
	//根据user video返回实体
	public Love getLoveByUV(String uid,String vid){
		return loveDao.getLoveByUV(uid, vid);
	}
		
	//根据user comment返回实体
	public Love getLoveByUI(String uid,String iid){
		return loveDao.getLoveByUI(uid, iid);
	}
		
	//保存
	@Log
	public void addLove(Love love) {
		loveDao.addLove(love);
	}
	
	//更新
	public void updateLove(Love love){
		loveDao.updateLove(love);
	}

}
