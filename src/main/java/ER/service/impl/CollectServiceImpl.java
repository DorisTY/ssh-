package ER.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ER.annotation.Log;
import ER.dao.CollectDao;
import ER.entity.Collect;
import ER.service.CollectService;


@Service
public class CollectServiceImpl implements CollectService {

	@Autowired
	private CollectDao collectDao;

	//根据用户uid获取所有收藏夹
	public List<Collect> getCollectListByU(String uid){
		return collectDao.getCollectListByU(uid);
	}
		
	//根据cid查询视频
	public Collect getCollectByC(String cid) {
		return collectDao.getCollectByC(cid);
	}
		
	//保存
	@Log
	public void addCollect(Collect collect) {
		collectDao.addCollect(collect);
	}

	//更新
	public void updateCollect(Collect collect){
		collectDao.updateCollect(collect);
	}
		
}
