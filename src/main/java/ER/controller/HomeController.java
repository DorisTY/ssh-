package ER.controller;

import java.io.File;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;

import ER.entity.Address;
import ER.entity.Collect;
import ER.entity.Comment;
import ER.entity.Ep;
import ER.entity.History;
import ER.entity.Love;
import ER.entity.Message;
import ER.entity.Reply;
import ER.entity.Save;
import ER.entity.Tag;
import ER.entity.User;
import ER.entity.Video;
import ER.entity.Watch;
import ER.service.AddressService;
import ER.service.CollectService;
import ER.service.CommentService;
import ER.service.EpService;
import ER.service.HistoryService;
import ER.service.LoveService;
import ER.service.MessageService;
import ER.service.ReplyService;
import ER.service.SaveService;
import ER.service.TagService;
import ER.service.UserService;
import ER.service.VideoService;
import ER.service.WatchService;
import ER.util.JsonResult;
import ER.util.PageResults;


@Controller
@RequestMapping("/home")
public class HomeController {
	
	@Autowired
	private AddressService addressService;
	
	@Autowired
	private EpService epService;
	
	@Autowired
	private VideoService videoService;
	
	@Autowired
	private TagService tagService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private CollectService collectService;
	
	@Autowired
	private SaveService saveService;
	
	@Autowired
	private LoveService loveService;
	
	@Autowired
	private WatchService watchService;
	
	@Autowired
	private HistoryService historyService;
	
	@Autowired
	private MessageService messageService;
	
	//跳转至详情页面
	@RequestMapping(value="/details")
	public String detail(Model model,HttpSession session,String channel,String order,Integer PageNo){
		//System.out.println(channel);
		User user=userService.getIdByUid((String)session.getAttribute("id"));
		if(PageNo == null){
			PageNo = 1;
		}
		Integer PageSize = 2000;
		model.addAttribute("user0", user);
		model.addAttribute("channel", channel);
		model.addAttribute("address0", this.addressService.getIdByC(channel));
		model.addAttribute("tag0", this.tagService.getTagListByC(channel));
		
		if(order == null){
			PageResults<Video> video01 = videoService.getVideoListByTCt("%", channel,PageNo,PageSize);
			List<Video> video1 = video01.getResults();
			if(video1 == null){
				System.out.println("无相关视频");
			}else{
				model.addAttribute("video1", video1);
				//当前页
				model.addAttribute("CurrentPage",video01.getCurrentPage());
				//下一页
				model.addAttribute("PageNo",video01.getPageNo());
				//总页数
				model.addAttribute("PageCount", video01.getPageCount());
			}
		//最新发布
		}else if(order.equals("0")){
			PageResults<Video> video02 = videoService.getVideoListByTCt("%", channel,PageNo,PageSize);
			List<Video> video2 = video02.getResults();
			if(video2 == null){
				System.out.println("无相关视频");
			}else{
				model.addAttribute("video1", video2);
				//当前页
				model.addAttribute("CurrentPage",video02.getCurrentPage());
				//下一页
				model.addAttribute("PageNo",video02.getPageNo());
				//总页数
				model.addAttribute("PageCount", video02.getPageCount());
			}
		//最多点赞
		}else if(order.equals("1")){
			PageResults<Video> video03 = videoService.getVideoListByTCl("%", channel,PageNo,PageSize);
			List<Video> video3 = video03.getResults();
			if(video3 == null){
				System.out.println("无相关视频");
			}else{
				model.addAttribute("video1", video3);
				//当前页
				model.addAttribute("CurrentPage",video03.getCurrentPage());
				//下一页
				model.addAttribute("PageNo",video03.getPageNo());
				//总页数
				model.addAttribute("PageCount", video03.getPageCount());
			}
		}
		return "home/details";
	}
	
	//跳转至搜索页面
	@RequestMapping(value="/search")
	public String search(String key,String collect1,String order,Integer PageNo,Model model,HttpSession session){
		User user=userService.getIdByUid((String)session.getAttribute("id"));
		if(PageNo == null){
			PageNo = 1;
		}
		Integer PageSize = 2000;
		if(user == null){
			System.out.println("未登录");
		}else{
			model.addAttribute("user0", user);
		}
		if(key==null && collect1==null && order==null){
			PageResults<Video> video04 = videoService.getVideoListByTCt("%", "%",PageNo,PageSize);
			List<Video> video4 = video04.getResults();
			model.addAttribute("video0",video4);
			//当前页
			model.addAttribute("CurrentPage",video04.getCurrentPage());
			//下一页
			model.addAttribute("PageNo",video04.getPageNo());
			//总页数
			model.addAttribute("PageCount", video04.getPageCount());
		}
		if(order == null){
			PageResults<Video> video05 = videoService.getVideoListByTCt("%", "%",PageNo,PageSize);
			List<Video> video5 = video05.getResults();
			model.addAttribute("video0",video5);
			//当前页
			model.addAttribute("CurrentPage",video05.getCurrentPage());
			//下一页
			model.addAttribute("PageNo",video05.getPageNo());
			//总页数
			model.addAttribute("PageCount", video05.getPageCount());
		//最新发布
		}else if(order.equals("0")){
			PageResults<Video> video01 = videoService.getVideoListByTCt("%"+key+"%", collect1,PageNo,PageSize);
			List<Video> video1 = video01.getResults();
			if(video1 == null){
				System.out.println("无相关视频");
			}else{
				model.addAttribute("video0", video1);
				//当前页
				model.addAttribute("CurrentPage",video01.getCurrentPage());
				//下一页
				model.addAttribute("PageNo",video01.getPageNo());
				//总页数
				model.addAttribute("PageCount", video01.getPageCount());
			}
		//最多收藏
		}else if(order.equals("1")){
			PageResults<Video> video02 = videoService.getVideoListByTCs("%"+key+"%", collect1,PageNo,PageSize);
			List<Video> video2 = video02.getResults();
			if(video2 == null){
				System.out.println("无相关视频");
			}else{
				model.addAttribute("video0", video2);
				//当前页
				model.addAttribute("CurrentPage",video02.getCurrentPage());
				//下一页
				model.addAttribute("PageNo",video02.getPageNo());
				//总页数
				model.addAttribute("PageCount", video02.getPageCount());
			}
		//最多点赞
		}else if(order.equals("2")){
			PageResults<Video> video03 = videoService.getVideoListByTCl("%"+key+"%", collect1,PageNo,PageSize);
			List<Video> video3 = video03.getResults();
			if(video3 == null){
				System.out.println("无相关视频");
			}else{
				model.addAttribute("video0", video3);
				//当前页
				model.addAttribute("CurrentPage",video03.getCurrentPage());
				//下一页
				model.addAttribute("PageNo",video03.getPageNo());
				//总页数
				model.addAttribute("PageCount", video03.getPageCount());
			}
		}
		return "home/search";
	}
	
	//跳转至观看页面
	@RequestMapping("/watchvideo")
	public String watchvideo(Model model,HttpSession session,String vid){
		System.out.println(vid);
		User user=userService.getIdByUid((String)session.getAttribute("id"));
		model.addAttribute("user0", user);
		model.addAttribute("video", this.videoService.getIdByV(vid));
		model.addAttribute("ep", this.epService.getEpListByV(vid));
		model.addAttribute("comment0", this.commentService.getCommentListByV(vid));
		model.addAttribute("reply0", this.replyService.getReplyListByV(vid));
		model.addAttribute("tag0",this.tagService.getTagListByV(vid));
		
		//猜你喜欢
		Video video = videoService.getIdByV(vid);
		PageResults<Video> video2 = videoService.getVideoListByTCl("%", video.getAid().getChannel(),1,6);
		List<Video> video3 = video2.getResults();
		model.addAttribute("video3", video3);
		
		if(user != null){
			model.addAttribute("collect0", this.collectService.getCollectListByU(user.getUid()));
		}
		return "home/video";
	} 
	
	//跳转至他人主页
	@RequestMapping("/userhome")
	public String userhome(Model model,HttpSession session,String uid1){
		User user=userService.getIdByUid((String)session.getAttribute("id"));
		User user1=userService.getIdByUid(uid1);
		model.addAttribute("user0", user);
		model.addAttribute("user1", user1);
		model.addAttribute("video1", videoService.getVideoListByU(user1.getUid()));
		model.addAttribute("history1", historyService.getHistoryListByU(user1.getUid()));
		model.addAttribute("collect1", collectService.getCollectListByU(user1.getUid()));
		return "home/home";
	} 
	
	//根据filename选集
	@RequestMapping("/dowatch")
	@ResponseBody
	public Ep dowatch(@RequestBody JSONObject jsonObject){
		System.out.println(jsonObject.getString("filename"));
		System.out.println(jsonObject.getString("vid"));
		Ep ep=epService.getEpByF(jsonObject.getString("filename"),jsonObject.getString("vid"));	
		return ep;
	} 
	
	//评论
	@RequestMapping("/docomment")
	@ResponseBody
	public JsonResult<String> docomment(@RequestBody JSONObject jsonObject,HttpSession session){
		JsonResult<String> jsonResult = new JsonResult<String>();
		try{
			User user0=userService.getIdByUid((String)session.getAttribute("id"));
			Video video0=videoService.getIdByV(jsonObject.getString("vid"));
			Watch watch0 = watchService.getWatchByW(video0.getWatch().getWid());
			if(user0 == null){
				System.out.println("未登录");
				jsonResult.setSuccess(false);
				jsonResult.setMessage("请先登录");
			}
			else{
				Timestamp time = new Timestamp(new Date().getTime());
				Comment comment0=new Comment();
				comment0.setInfo(jsonObject.getString("info"));
				comment0.setInfo_time(time);
				comment0.setIstatus("0");
				comment0.setVideo(video0);
				comment0.setUser(user0);
				commentService.addComment(comment0);
				//评论+1
				watch0.setCommenttime(watch0.getCommenttime()+1);
				watchService.updateWatch(watch0);
				
				jsonResult.setSuccess(true);
				jsonResult.setMessage("评论已发送");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return jsonResult;
	} 
	
	//回复
	@RequestMapping("/doreply")
	@ResponseBody
	public JsonResult<String> doreply(@RequestBody JSONObject jsonObject,HttpSession session){
		JsonResult<String> jsonResult = new JsonResult<String>();
		try{
			User user0=userService.getIdByUid((String)session.getAttribute("id"));
			Comment comment0 = commentService.getCommentByI(jsonObject.getString("iid"));
			Watch watch0 = watchService.getWatchByW(comment0.getVideo().getWatch().getWid());
			if(user0 == null){
				System.out.println("未登录");
				jsonResult.setSuccess(false);
				jsonResult.setMessage("请先登录");
			}
			else{
				Timestamp time = new Timestamp(new Date().getTime());
				Reply reply0 = new Reply();
				reply0.setTip(jsonObject.getString("tip"));
				reply0.setRstatus("0");
				reply0.setTip_time(time);
				reply0.setComment(comment0);
				reply0.setFrom_user(user0);
				reply0.setTo_user(this.userService.getIdByUid(jsonObject.getString("to_user")));
				replyService.addReply(reply0);
				//评论+1
				watch0.setCommenttime(watch0.getCommenttime()+1);
				watchService.updateWatch(watch0);
				
				jsonResult.setSuccess(true);
				jsonResult.setMessage("回复已发送");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return jsonResult;
	} 

	//新建收藏夹
	@RequestMapping("/newcollect")
	@ResponseBody
	public JsonResult<String> newcollect(@RequestBody Collect collect,HttpSession session){
		JsonResult<String> jsonResult = new JsonResult<String>();
		try{
			User user0=userService.getIdByUid((String)session.getAttribute("id"));
			if(user0 == null){
				System.out.println("未登录");
				jsonResult.setSuccess(false);
				jsonResult.setMessage("请先登录");
			}
			else{
				Collect collect0 = new Collect();
				collect0.setCollectname(collect.getCollectname());
				collect0.setCstatus("0");
				collect0.setUser(user0);
				collectService.addCollect(collect0);
				jsonResult.setSuccess(true);
				jsonResult.setMessage("已新增");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return jsonResult;
	} 
	
	//收藏
	@RequestMapping("/docollect")
	@ResponseBody
	public JsonResult<String> docollect(@RequestBody JSONObject jsonObject,HttpSession session){
		JsonResult<String> jsonResult = new JsonResult<String>();
		try{
			User user0=userService.getIdByUid((String)session.getAttribute("id"));
			Save save = saveService.getSaveByV(jsonObject.getString("vid"), jsonObject.getString("cid"));
			Video video0 = videoService.getIdByV(jsonObject.getString("vid"));
			Watch watch0 = watchService.getWatchByW(video0.getWatch().getWid());
			if(user0 == null){
				System.out.println("未登录");
				jsonResult.setSuccess(false);
				jsonResult.setMessage("请先登录");
			}
			else{
				Timestamp time = new Timestamp(new Date().getTime());
				//未收藏
				if(save == null){
					Collect collect0 = collectService.getCollectByC(jsonObject.getString("cid"));
					Save save0=new Save();
					save0.setCollect(collect0);
					save0.setSave_time(time);
					save0.setSstatus("0");
					save0.setVideo(video0);
					saveService.addSave(save0);
					
					watch0.setFavortime(watch0.getFavortime()+1);
					watchService.updateWatch(watch0);
					
					Message message0=new Message();
					message0.setMtitle("收藏");
					message0.setMtext("收藏了你的视频");
					message0.setMstatus("0");
					message0.setMessage_time(time);
					message0.setFrom_user(user0);
					message0.setTo_user(video0.getUp());
					messageService.addMessage(message0);
					
					jsonResult.setSuccess(true);
					jsonResult.setMessage("已收藏");
				//多次收藏
				}else if(save.getSstatus().equals("0")){
					jsonResult.setSuccess(true);
					jsonResult.setMessage("已收藏");
				//重新收藏
				}else{
					save.setSstatus("0");
					save.setSave_time(time);
					saveService.updateSave(save);
					
					watch0.setFavortime(watch0.getFavortime()+1);
					watchService.updateWatch(watch0);
					
					Message message0=new Message();
					message0.setMtitle("收藏");
					message0.setMtext("收藏了你的视频");
					message0.setMstatus("0");
					message0.setMessage_time(time);
					message0.setFrom_user(user0);
					message0.setTo_user(video0.getUp());
					messageService.addMessage(message0);
					
					jsonResult.setSuccess(true);
					jsonResult.setMessage("已收藏");
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return jsonResult;
	} 
	
	//视频点赞
	@RequestMapping("/dolove")
	@ResponseBody
	public JsonResult<String> dolove(@RequestBody JSONObject jsonObject,HttpSession session){
		JsonResult<String> jsonResult = new JsonResult<String>();
		try{
			User user0=userService.getIdByUid((String)session.getAttribute("id"));
			if(user0 == null){
				System.out.println("未登录");
				jsonResult.setSuccess(false);
				jsonResult.setMessage("请先登录");
			}
			else{
				Video video0 = videoService.getIdByV(jsonObject.getString("vid"));
				Love love = loveService.getLoveByUV(user0.getUid(), video0.getVid());
				Watch watch0 = watchService.getWatchByW(video0.getWatch().getWid());
				Timestamp time = new Timestamp(new Date().getTime());
				//第一次点赞
				if(love == null){
					Love love0 = new Love();
					love0.setLike_time(time);
					love0.setLstatus("0");
					love0.setUser(user0);
					love0.setVideo(video0);
					loveService.addLove(love0);
					
					watch0.setLiketime(watch0.getLiketime()+1);
					watchService.updateWatch(watch0);
					
					Message message0=new Message();
					message0.setMtitle("点赞");
					message0.setMtext("喜欢了你的视频");
					message0.setMstatus("0");
					message0.setMessage_time(time);
					message0.setFrom_user(user0);
					message0.setTo_user(video0.getUp());
					messageService.addMessage(message0);
					
					jsonResult.setSuccess(true);
					jsonResult.setMessage("点赞成功");
				//取消点赞	
				}else if(love.getLstatus().equals("0")){
					love.setLstatus("1");
					love.setLike_time(time);
					loveService.updateLove(love);
					
					watch0.setLiketime(watch0.getLiketime()-1);
					watchService.updateWatch(watch0);
					
					jsonResult.setSuccess(true);
					jsonResult.setMessage("取消点赞");
				//重新点赞
				}else{
					love.setLstatus("0");
					love.setLike_time(time);
					loveService.updateLove(love);
					
					watch0.setLiketime(watch0.getLiketime()+1);
					watchService.updateWatch(watch0);
					
					Message message0=new Message();
					message0.setMtitle("点赞");
					message0.setMtext("喜欢了你的视频");
					message0.setMstatus("0");
					message0.setMessage_time(time);
					message0.setFrom_user(user0);
					message0.setTo_user(video0.getUp());
					messageService.addMessage(message0);
					
					jsonResult.setSuccess(true);
					jsonResult.setMessage("点赞成功");
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return jsonResult;
	} 
	
	//历史记录
	@RequestMapping("/newhistory")
	@ResponseBody
	public void newhistory(@RequestBody JSONObject jsonObject,HttpSession session){
		try{
			User user0=userService.getIdByUid((String)session.getAttribute("id"));
			if(user0 == null){
				System.out.println("未登录没记录");
			}
			else{
				Timestamp time = new Timestamp(new Date().getTime());
				History history0 = new History();
				history0.setHstatus("0");
				history0.setUser(user0);
				history0.setVideo(this.videoService.getIdByV(jsonObject.getString("vid")));
				history0.setView_time(time);
				historyService.addHistory(history0);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	} 
}
