package ER.service;


import java.util.List;

import ER.entity.Save;

public interface SaveService {

	//根据用户uid获取所有收藏
	public List<Save> getSaveListByU(String uid);
		
	//根据用户uid,cid获取所有收藏
	public List<Save> getSaveListByUC(String uid,String cid);
	
	//根据id返回实体
	public Save getSaveByV(String vid,String cid);
		
	//根据sid返回实体
	public Save getSaveByS(String sid) ;
		
	//保存
	public void addSave(Save save);
	
	//更新
	public void updateSave(Save save);
		
}
