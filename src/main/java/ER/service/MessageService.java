package ER.service;


import java.util.List;

import ER.entity.Message;

public interface MessageService {

	//根据用户uid,flag获取消息
	public List<Message> getMessageListByUF(String uid,String flag);
		
	//公告
	public List<Message> getAllMessageList();
		
	//根据mid查询视频
	public Message getMessageByM(String mid);
	
	//保存
	public void addMessage(Message message);

	//更新
	public void updateMessage(Message message);
	
}
