package ER.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import ER.basedao.impl.BaseDao;
import ER.dao.EpDao;
import ER.entity.Ep;

@Repository
public class EpDaoImpl extends BaseDao<Ep,Long> implements EpDao{
	
	//ep实体list admin
	public List<Ep> getAllEpList(){
		List<Ep> epList = getListByHQL("from Ep");
		return epList;
	}
	
	//根据子集状态查询子集 admin
	public List<Ep> getEpListByE(String estatus){
		String hql = "from Ep e where e.estatus = ? "; 
		List<Ep> ep = getListByHQL(hql,new Object[]{estatus}); 
		return ep;
	}
	
	//根据title查询子集 admin
	public List<Ep> getEpListByT(String title){
		String hql = "from Ep e where e.video.title like ? "; 
		List<Ep> ep = getListByHQL(hql,new Object[]{title}); 
		return ep;
	}
		
	//根据vid查询视频
	public List<Ep> getEpListByV(String vid) {
		String hql = "from Ep e where e.video.vid = ? and e.estatus='2' and e.video.vstatus = '2'"; 
		List<Ep> ep = getListByHQL(hql,new Object[]{vid}); 
		return ep;
	}
	
	//根据filename查询视频
	public Ep getEpByF(String filename,String vid) {
		String hql = "from Ep e where e.filename = ? and e.video.vid=?"; 
		Ep ep = getByHQL(hql,new Object[]{filename,vid}); 
		return ep;
	}
	
	//根据eid查询视频
	public Ep getEpByE(String eid){
		String hql = "from Ep e where e.eid = ?"; 
		Ep ep = getByHQL(hql,new Object[]{eid});
		return ep;
	}
		
	//保存
	@Override
	public void addEp(Ep ep){
        save(ep);   
   }

	//更新
    @Override
	public void updateEp(Ep ep){
        update(ep);      
   }
}
