package ER.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import ER.basedao.impl.BaseDao;
import ER.dao.UserDao;
import ER.entity.User;


@Repository
public class UserDaoImpl extends BaseDao<User,Long> implements UserDao{

	//user实体list  admin
	public List<User> getAllUserList(){
		List<User> userList = getListByHQL("from User");
		return userList;
	}
	
	//根据name查询用户 admin
	public List<User> getUserListByN(String name){
		String hql = "from User u where u.name like ?"; 
        List<User> userList = getListByHQL(hql,new Object[]{name}); 
		return userList;
	}
	
	//根据ustatus查询用户 admin
	public List<User> getUserListByU(String ustatus){
		String hql = "from User u where u.ustatus = ?"; 
        List<User> userList = getListByHQL(hql,new Object[]{ustatus}); 
		return userList;
	}
	
	//登录验证
	public User getIdByMP(String mobile,String password) {
		String hql = "from User u where u.mobile = ? and u.password = ?"; 
        User user = getByHQL(hql,new Object[]{mobile, password}); 
		return user;
	}
	
	//登录验证是否已注册
	public User getIdByM(String mobile ) {
		String hql = "from User u where u.mobile = ?"; 
        User user = getByHQL(hql,new Object[]{mobile}); 
		return user;
	}
	
	//根据id返回实体
	public User getIdByUid(String uid) {
		String hql = "from User u where u.uid = ?"; 
        User user = getByHQL(hql,new Object[]{uid}); 
		return user;
	}
	
	//保存
	@Override
	public void addUser(User user){
        save(user);
	}
	
    //更新
    @Override
	public void updateUser(User user){
        update(user);      
   }
    
}
