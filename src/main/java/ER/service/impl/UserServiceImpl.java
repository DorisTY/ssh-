package ER.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ER.annotation.Log;
import ER.dao.UserDao;
import ER.entity.User;
import ER.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;
	
	//user实体list
	public List<User> getAllUserList(){
		return userDao.getAllUserList();
	}
	
	//根据name查询用户
	public List<User> getUserListByN(String name){
		return userDao.getUserListByN(name);
	}
		
	//根据ustatus查询用户
	public List<User> getUserListByU(String ustatus){
		return userDao.getUserListByU(ustatus);
	}
		
	//登录验证
	public User getIdByMP(String mobile,String password){
		return userDao.getIdByMP(mobile, password);
	}
	
	//登录验证是否已注册
	public User getIdByM(String mobile ){
		return userDao.getIdByM(mobile);
	}
	
	//根据id返回实体
	public User getIdByUid(String uid){
		return userDao.getIdByUid(uid);
	}
	
	//保存
	@Log
	public void addUser(User user){
        userDao.addUser(user);
	}
	
	//更新
	public void updateUser(User user){
		userDao.updateUser(user);
	}
		
}
