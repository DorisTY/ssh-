package ER.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import ER.basedao.impl.BaseDao;
import ER.dao.FollowDao;
import ER.entity.Follow;

@Repository
public class FollowDaoImpl extends BaseDao<Follow,Long> implements FollowDao{
	
	//查询我的关注
	public List<Follow> getFollowListByUf(String uid){
		String hql = "from Follow f where f.from_user.uid = ? and f.fstatus='1'"; 
        List<Follow> followList = getListByHQL(hql,new Object[]{uid}); 
		return followList;
	}
	
	//查询我的粉丝
	public List<Follow> getFollowListByUt(String uid){
		String hql = "from Follow f where f.to_user.uid = ? and f.fstatus='1'"; 
        List<Follow> followList = getListByHQL(hql,new Object[]{uid}); 
		return followList;
	}
	
	//查询我的互粉
	public List<Follow> getFollowListByUt2(String uid){
		String hql = "from Follow f where f.to_user.uid = ? and f.fstatus='2'"; 
        List<Follow> followList = getListByHQL(hql,new Object[]{uid}); 
		return followList;
	}
		
	//根据fid返回实体
	public Follow getFollowByF(String fid) {
		String hql = "from Follow f where f.fid = ?"; 
		Follow follow = getByHQL(hql,new Object[]{fid}); 
		return follow;
	}
	
	//根据用户返回实体
	public Follow getFollowByFT(String uid0,String uid1) {
		String hql = "from Follow f where f.from_user.uid = ? and f.to_user.uid = ?"; 
		Follow follow = getByHQL(hql,new Object[]{uid0,uid1}); 
		return follow;
	}
	
	//保存
	@Override
	public void addFollow(Follow follow){
        save(follow);   
   }

	//更新
	@Override
	public void updateFollow(Follow follow){
		update(follow);   
   }
}
