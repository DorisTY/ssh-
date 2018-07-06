package ER.dao;

import java.util.List;

import ER.entity.History;

public interface HistoryDao {
	
	//根据用户uid获取所有收藏夹
	public List<History> getHistoryListByU(String uid);
		
	//根据hid查询视频
	public History getHistoryByH(String hid);
		
	//保存
	public void addHistory(History history);

	//更新
	public void updateHistory(History history);
}
