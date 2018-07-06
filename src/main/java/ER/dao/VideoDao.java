package ER.dao;

import java.util.List;

import ER.entity.Video;
import ER.util.PageResults;

public interface VideoDao {
	
	//查询所有过审视频
	public List<Video> getAllVideoList() ;
		
	//根据分区查询视频
	public List<Video> getVideoListByC(String channel);
	
	//根据title查询视频
	public List<Video> getVideoListByT(String title);
	
	//根据用户查询视频
	public List<Video> getVideoListByU(String up);
	
	//根据title查询视频 最新发布
	public PageResults<Video> getVideoListByTCt(String title,String channel,Integer pageNo,Integer pageSize);
	
	//根据title查询视频 最多收藏
	public PageResults<Video> getVideoListByTCs(String title,String channel,Integer pageNo,Integer pageSize);
	
	//根据title查询视频 最多点赞
	public PageResults<Video> getVideoListByTCl(String title,String channel,Integer pageNo,Integer pageSize);
		
	//根据vid查询视频
	public Video getIdByV(String vid);
	
	//保存
	public void addVideo(Video video);
	
	//更新
	public void updateVideo(Video video);
}
