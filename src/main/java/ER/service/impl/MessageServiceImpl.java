package ER.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ER.dao.MessageDao;
import ER.entity.Message;
import ER.service.MessageService;


@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDao messageDao;

	//根据用户uid,flag获取消息
	public List<Message> getMessageListByUF(String uid,String flag){
		return messageDao.getMessageListByUF(uid, flag);
	}
			
	//公告
	public List<Message> getAllMessageList(){
		return messageDao.getAllMessageList();
	}
		
	//根据mid查询视频
	public Message getMessageByM(String mid){
		return messageDao.getMessageByM(mid);
	}
	
	//保存
	public void addMessage(Message message){
		messageDao.addMessage(message);
	}

	//更新
	public void updateMessage(Message message){
		messageDao.updateMessage(message);
	}

}
