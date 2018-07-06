package ER.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ER.annotation.Log;
import ER.dao.VideoDao;
import ER.entity.Video;
import ER.service.VideoService;
import ER.util.PageResults;

@Service
public class VideoServiceImpl implements VideoService {

	@Autowired
	private VideoDao videoDao;

	//查询所有过审视频
	public List<Video> getAllVideoList() {
		return videoDao.getAllVideoList();
	}
		
	//根据分区查询视频
	public List<Video> getVideoListByC(String channel){
		return videoDao.getVideoListByC(channel);
	}
	
	//根据title查询视频
	public List<Video> getVideoListByT(String title){
		return videoDao.getVideoListByT(title);
	}
	
	//根据用户查询视频
	public List<Video> getVideoListByU(String up){
		return videoDao.getVideoListByU(up);
	}
	
	//根据title查询视频 最新发布
	public PageResults<Video> getVideoListByTCt(String title,String channel,Integer pageNo,Integer pageSize){
		return videoDao.getVideoListByTCt(title, channel, pageNo, pageSize);
	}
	
	//根据title查询视频 最多收藏
	public PageResults<Video> getVideoListByTCs(String title,String channel,Integer pageNo,Integer pageSize){
		return videoDao.getVideoListByTCs(title, channel, pageNo, pageSize);
	}
	
	//根据title查询视频 最多点赞
	public PageResults<Video> getVideoListByTCl(String title,String channel,Integer pageNo,Integer pageSize){
		return videoDao.getVideoListByTCl(title, channel, pageNo, pageSize);
	}
	
	//根据vid查询视频
	public Video getIdByV(String vid){
		return videoDao.getIdByV(vid);
	}
		
	//保存
	@Log
	public void addVideo(Video video) {
		videoDao.addVideo(video);
	}
	
	//更新
	public void updateVideo(Video video){
		videoDao.updateVideo(video);
	}

}
