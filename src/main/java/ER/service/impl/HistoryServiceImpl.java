package ER.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ER.dao.HistoryDao;
import ER.entity.History;
import ER.service.HistoryService;


@Service
public class HistoryServiceImpl implements HistoryService {

	@Autowired
	private HistoryDao historyDao;

	//根据用户uid获取所有收藏夹
	public List<History> getHistoryListByU(String uid){
		return historyDao.getHistoryListByU(uid);
	}
		
	//根据hid查询视频
	public History getHistoryByH(String hid){
		return historyDao.getHistoryByH(hid);
	}
		
	//保存
	public void addHistory(History history){
		historyDao.addHistory(history);
	}

	//更新
	public void updateHistory(History history){
		historyDao.updateHistory(history);
	}
		
}
