package ER.service;


import ER.entity.Love;

public interface LoveService {

	//根据user video返回实体
	public Love getLoveByUV(String uid,String vid);
			
	//根据user comment返回实体
	public Love getLoveByUI(String uid,String iid);
		
	//保存
	public void addLove(Love love);
	
	//更新
	public void updateLove(Love love);
}
