package ER.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ER.annotation.Log;
import ER.dao.SaveDao;
import ER.entity.Save;
import ER.service.SaveService;


@Service
public class SaveServiceImpl implements SaveService {

	@Autowired
	private SaveDao saveDao;

	//根据用户uid获取所有收藏
	public List<Save> getSaveListByU(String uid){
		return saveDao.getSaveListByU(uid);
	}
	
	//根据用户uid,cid获取所有收藏
	public List<Save> getSaveListByUC(String uid,String cid){
		return saveDao.getSaveListByUC(uid, cid);
	}
	
	//根据id返回实体
	public Save getSaveByV(String vid,String cid){
		return saveDao.getSaveByV(vid,cid);
	}
	
	//根据sid返回实体
	public Save getSaveByS(String sid) {
		return saveDao.getSaveByS(sid);
	}
		
	//保存
	@Log
	public void addSave(Save save) {
		saveDao.addSave(save);
	}

	//更新
	public void updateSave(Save save){
		saveDao.updateSave(save);
	}
		
}
