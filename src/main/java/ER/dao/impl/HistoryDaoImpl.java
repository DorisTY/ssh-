package ER.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import ER.basedao.impl.BaseDao;
import ER.dao.HistoryDao;
import ER.entity.History;

@Repository
public class HistoryDaoImpl extends BaseDao<History,Long> implements HistoryDao{
	
	//根据用户uid获取所有收藏夹
	public List<History> getHistoryListByU(String uid){
		String hql = "from History h where h.user.uid=? and h.hstatus='0' order by h.view_time desc"; 
		List<History> historyList = getListByHQL(hql,new Object[]{uid});
		return historyList;
	}
		
	//根据hid查询视频
	public History getHistoryByH(String hid) {
		String hql = "from History h where h.hid = ?"; 
		History history = getByHQL(hql,new Object[]{hid}); 
		return history;
	}
		
	//保存
	@Override
	public void addHistory(History history){
        save(history);   
   }

	//更新
	@Override
	public void updateHistory(History history){
        update(history);   
   }
}
