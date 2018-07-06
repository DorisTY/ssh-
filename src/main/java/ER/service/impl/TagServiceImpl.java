package ER.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ER.dao.TagDao;
import ER.entity.Tag;
import ER.service.TagService;


@Service
public class TagServiceImpl implements TagService {

	@Autowired
	private TagDao tagDao;

	//查询视频频道标签
	public List<Tag> getTagListByC(String channel){
		return tagDao.getTagListByC(channel);
	}
		
	//查询视频标签
	public List<Tag> getTagListByV(String vid){
		return tagDao.getTagListByV(vid);
	}
	
	//根据tid返回实体
	public Tag getTagByT(String tid){
		return tagDao.getTagByT(tid);
	}
		
	//保存
	public void addTag(Tag tag){
		tagDao.addTag(tag);
	}

	//更新
	public void updateTag(Tag tag){
		tagDao.updateTag(tag);
	}
}
