package ER.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import ER.basedao.impl.BaseDao;
import ER.dao.VideoDao;
import ER.entity.Video;
import ER.util.PageResults;

@Repository
public class VideoDaoImpl extends BaseDao<Video,Long> implements VideoDao{
	
	//查询所有过审视频
	public List<Video> getAllVideoList() {
		List<Video> videoList = getListByHQL("from Video v where v.vstatus = '2' order by v.vid desc"); 
		return videoList;
	}
		
	//根据分区查询视频
	public List<Video> getVideoListByC(String channel) {
		String hql = "from Video v where v.aid.channel = ? and v.vstatus = '2'"; 
		List<Video> videoList = getListByHQL(hql,new Object[]{channel}); 
		return videoList;
	}
	
	//根据title查询视频
	public List<Video> getVideoListByT(String title) {
		String hql = "from Video v where v.title like ? and v.vstatus = '2'"; 
		List<Video> videoList = getListByHQL(hql,new Object[]{title}); 
		return videoList;
	}
	
	//根据用户查询视频
	public List<Video> getVideoListByU(String up) {
		String hql = "from Video v where v.up.uid = ? and v.vstatus = '2'"; 
		List<Video> videoList = getListByHQL(hql,new Object[]{up}); 
		return videoList;
	}
	
	//根据title查询视频 最新发布
	public PageResults<Video> getVideoListByTCt(String title,String channel,Integer pageNo,Integer pageSize) {
		String hql = "from Video v where v.title like ? and v.aid.channel like ? and v.vstatus = '2' order by v.vid desc"; 
		String countHql = "select count(*) from Video v where v.vstatus = '2'";
		PageResults<Video> videoList = findPageByFetchedHql(hql,countHql,pageNo,pageSize,new Object[]{title,channel}); 
		return videoList;
	}
	
	//根据title查询视频 最多收藏
	public PageResults<Video> getVideoListByTCs(String title,String channel,Integer pageNo,Integer pageSize) {
		String hql = "from Video v where v.title like ? and v.aid.channel like ? and v.vstatus = '2' order by v.watch.favortime desc,v.watch.liketime desc,v.watch.commenttime desc"; 
		String countHql = "select count(*) from Video v where v.vstatus = '2'";
		PageResults<Video> videoList = findPageByFetchedHql(hql,countHql,pageNo,pageSize,new Object[]{title,channel}); 
		return videoList;
	}
	
	//根据title查询视频 最多点赞
	public PageResults<Video> getVideoListByTCl(String title,String channel,Integer pageNo,Integer pageSize) {
		String hql = "from Video v where v.title like ? and v.aid.channel like ? and v.vstatus = '2' order by v.watch.liketime desc,v.watch.favortime desc,v.watch.commenttime desc"; 
		String countHql = "select count(*) from Video v where v.vstatus = '2'";
		PageResults<Video> videoList = findPageByFetchedHql(hql,countHql,pageNo,pageSize,new Object[]{title,channel}); 
		return videoList;
	}
	
	//根据vid查询视频
	public Video getIdByV(String vid) {
		String hql = "from Video v where v.vid = ?"; 
		Video video = getByHQL(hql,new Object[]{vid}); 
		return video;
	}
	
	//保存
	@Override
	public void addVideo(Video video){
        save(video);   
   }
	
	//更新
    @Override
	public void updateVideo(Video video){
        update(video);
    }
	
}
