package ER.service;


import java.util.List;

import ER.entity.Collect;

public interface CollectService {

	//根据用户uid获取所有收藏夹
	public List<Collect> getCollectListByU(String uid);
		
	//根据cid查询视频
	public Collect getCollectByC(String cid) ;
		
	//保存
	public void addCollect(Collect collect);
	
	//更新
	public void updateCollect(Collect collect);
		
}
