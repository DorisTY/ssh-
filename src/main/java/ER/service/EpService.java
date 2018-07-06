package ER.service;


import java.util.List;

import ER.entity.Ep;

public interface EpService {

	//ep实体list
	public List<Ep> getAllEpList();
		
	//根据子集状态查询子集
	public List<Ep> getEpListByE(String estatus);
		
	//根据title查询子集
	public List<Ep> getEpListByT(String title);
		
	//根据vid查询视频
	public List<Ep> getEpListByV(String vid) ;
	
	//根据filename查询视频
	public Ep getEpByF(String filename,String vid) ;
		
	//根据eid查询视频
	public Ep getEpByE(String eid);
		
	//保存
	public void addEp(Ep ep);
	
	//更新
	public void updateEp(Ep ep);
}
