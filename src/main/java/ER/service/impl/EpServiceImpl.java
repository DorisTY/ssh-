package ER.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ER.annotation.Log;
import ER.dao.EpDao;
import ER.entity.Ep;
import ER.service.EpService;


@Service
public class EpServiceImpl implements EpService {

	@Autowired
	private EpDao epDao;

	//ep实体list
	public List<Ep> getAllEpList(){
		return epDao.getAllEpList();
	}
	
	//根据子集状态查询子集
	public List<Ep> getEpListByE(String estatus){
		return epDao.getEpListByE(estatus);
	}

	//根据title查询子集
	public List<Ep> getEpListByT(String title){
		return epDao.getEpListByT(title);
	}
		
	//根据vid查询视频
	public List<Ep> getEpListByV(String vid) {
		return epDao.getEpListByV(vid);
	}
	
	//根据filename查询视频
	public Ep getEpByF(String filename,String vid) {
		return epDao.getEpByF(filename,vid);
	}
	
	//根据eid查询视频
	public Ep getEpByE(String eid){
		return epDao.getEpByE(eid);
	}
		
	//保存
	@Log
	public void addEp(Ep ep) {
		epDao.addEp(ep);
	}
	
	//更新
	public void updateEp(Ep ep){
		epDao.updateEp(ep);
	}

}
