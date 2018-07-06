package ER.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import ER.basedao.impl.BaseDao;
import ER.dao.TagDao;
import ER.entity.Tag;

@Repository
public class TagDaoImpl extends BaseDao<Tag,Long> implements TagDao{
	
	//查询视频频道标签
	public List<Tag> getTagListByC(String channel){
		String hql = "from Tag t where t.video.aid.channel = ? and t.tstatus='1' group by t.tagname"; 
        List<Tag> tagList = getListByHQL(hql,new Object[]{channel}); 
		return tagList;
	}
		
	//查询视频标签
	public List<Tag> getTagListByV(String vid){
		String hql = "from Tag t where t.video.vid = ? and t.tstatus='1'"; 
        List<Tag> tagList = getListByHQL(hql,new Object[]{vid}); 
		return tagList;
	}
		
	//根据tid返回实体
	public Tag getTagByT(String tid) {
		String hql = "from Tag t where t.tid = ?"; 
		Tag tag = getByHQL(hql,new Object[]{tid}); 
		return tag;
	}
		
	//保存
	@Override
	public void addTag(Tag tag){
        save(tag);   
   }

	//更新
	@Override
	public void updateTag(Tag tag){
        update(tag);   
   }
	
}
