package ER.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import ER.basedao.impl.BaseDao;
import ER.dao.MessageDao;
import ER.entity.Message;

@Repository
public class MessageDaoImpl extends BaseDao<Message,Long> implements MessageDao{
	
	//根据用户uid,flag获取消息
	public List<Message> getMessageListByUF(String uid,String flag){
		String hql = "from Message m where m.to_user.uid=? and m.from_user.flag=? and m.mstatus='0' order by m.message_time desc"; 
		List<Message> messageList = getListByHQL(hql,new Object[]{uid,flag});
		return messageList;
	}
		
	//公告
	public List<Message> getAllMessageList(){
		String hql = "from Message m where m.mstatus='2' order by m.message_time desc"; 
		List<Message> messageList = getListByHQL(hql);
		return messageList;
	}
	
	//根据mid查询视频
	public Message getMessageByM(String mid) {
		String hql = "from Message m where m.mid = ?"; 
		Message message = getByHQL(hql,new Object[]{mid}); 
		return message;
	}
	
	//保存
	@Override
	public void addMessage(Message message){
        save(message);   
   }

	//更新
	@Override
	public void updateMessage(Message message){
		update(message);   
   }
	
}
