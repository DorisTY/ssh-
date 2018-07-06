package ER.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ER.dao.FollowDao;
import ER.entity.Follow;
import ER.service.FollowService;


@Service
public class FollowServiceImpl implements FollowService {

	@Autowired
	private FollowDao followDao;

	//查询我的关注
	public List<Follow> getFollowListByUf(String uid){
		return followDao.getFollowListByUf(uid);
	}
	
	//查询我的粉丝
	public List<Follow> getFollowListByUt(String uid){
		return followDao.getFollowListByUt(uid);
	}
	
	//查询我的互粉
	public List<Follow> getFollowListByUt2(String uid){
		return followDao.getFollowListByUt2(uid);
	}
		
	//根据fid返回实体
	public Follow getFollowByF(String fid){
		return followDao.getFollowByF(fid);
	}
	
	//根据用户返回实体
	public Follow getFollowByFT(String uid0,String uid1) {
		return followDao.getFollowByFT(uid0, uid1);
	}
		
	//保存
	public void addFollow(Follow follow){
		followDao.addFollow(follow);
	}

	//更新
	public void updateFollow(Follow follow){
		followDao.updateFollow(follow);
	}

}
