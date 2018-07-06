package ER.service;


import java.util.List;

import ER.entity.Follow;

public interface FollowService {

	//查询我的关注
	public List<Follow> getFollowListByUf(String uid);
	
	//查询我的粉丝
	public List<Follow> getFollowListByUt(String uid);
		
	//根据fid返回实体
	public Follow getFollowByF(String fid);
	
	//查询我的互粉
	public List<Follow> getFollowListByUt2(String uid);
		
	//根据用户返回实体
	public Follow getFollowByFT(String uid0,String uid1) ;
		
	//保存
	public void addFollow(Follow follow);

	//更新
	public void updateFollow(Follow follow);
}
