package ER.dao;

import java.util.List;

import ER.entity.Tag;

public interface TagDao {
	
	//查询视频频道标签
	public List<Tag> getTagListByC(String channel);
		
	//查询视频标签
	public List<Tag> getTagListByV(String vid);
	
	//根据tid返回实体
	public Tag getTagByT(String tid);
		
	//保存
	public void addTag(Tag tag);

	//更新
	public void updateTag(Tag tag);
}
