package ER.service;

import java.util.List;

import ER.entity.User;

public interface UserService {

	//user实体list
	public List<User> getAllUserList();
	
	//根据name查询用户
	public List<User> getUserListByN(String name);
		
	//根据ustatus查询用户
	public List<User> getUserListByU(String ustatus);
		
	//登录验证
	public User getIdByMP(String mobile,String password);
	
	//登录验证是否已注册
	public User getIdByM(String mobile );
		
	//根据id返回实体
	public User getIdByUid(String uid); 
		
	//保存
	public void addUser(User user);
	
	//更新
	public void updateUser(User user);
	
}
