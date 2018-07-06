package ER.controller;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;

import ER.entity.Address;
import ER.entity.Collect;
import ER.entity.Ep;
import ER.entity.Follow;
import ER.entity.History;
import ER.entity.Message;
import ER.entity.Save;
import ER.entity.Tag;
import ER.entity.User;
import ER.entity.Video;
import ER.entity.Watch;
import ER.service.AddressService;
import ER.service.CollectService;
import ER.service.EpService;
import ER.service.FollowService;
import ER.service.HistoryService;
import ER.service.MessageService;
import ER.service.SaveService;
import ER.service.TagService;
import ER.service.UserService;
import ER.service.VideoService;
import ER.service.WatchService;
import ER.util.JsonResult;

@Controller
@RequestMapping("/user")
public class UserController {

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
	private SaveService saveService;

	@Autowired
	private CollectService collectService;
	
	@Autowired
	private WatchService watchService;
	
	@Autowired
	private HistoryService historyService;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private FollowService followService;
	
	//跳转至用户主界面
	@RequestMapping("/uhome")
	public String uhome(Model model,HttpSession session) {
		User user=userService.getIdByUid((String)session.getAttribute("id"));
		model.addAttribute("user0", user);
		List<Video> video1 = new ArrayList<Video>();
		List<Video> video01=videoService.getVideoListByU((String)session.getAttribute("id"));
		int length1=video01.size();
		if(length1>4){length1=4;}
		for(int i=0;i<length1;i++){
			video1.add(video01.get(i)) ;
		}
		
		List<History> history1 = new ArrayList<History>();
		List<History> history01=historyService.getHistoryListByU((String)session.getAttribute("id"));
		int length2=history01.size();
		if(length2>4){length2=4;}
		for(int i=0;i<length2;i++){
			history1.add(history01.get(i)) ;
		}
		
		List<Collect> collect1 = new ArrayList<Collect>();
		List<Collect> collect01=collectService.getCollectListByU((String)session.getAttribute("id"));
		int length3=collect01.size();
		if(length3>4){length3=4;}
		for(int i=0;i<length3;i++){
			collect1.add(collect01.get(i)) ;
		}
		
		model.addAttribute("video1", video1);
		model.addAttribute("history1", history1);
		model.addAttribute("collect1", collect1);
		
		return "user/home";
	}
	
	//跳转至收藏
	@RequestMapping("/ucollect")
	public String ucollect(Model model,HttpSession session,String cid) {
		
		User user=userService.getIdByUid((String)session.getAttribute("id"));
		model.addAttribute("user0", user);

		model.addAttribute("collect0", this.collectService.getCollectListByU(user.getUid()));
		if(cid == null){
			//model.addAttribute("save0", this.saveService.getSaveListByU(user.getUid()));
		}else{
			model.addAttribute("save0", this.saveService.getSaveListByUC(user.getUid(), cid));
			model.addAttribute("collect1", this.collectService.getCollectByC(cid));
		}
		return "user/collect";
	}
	
	//跳转至视频管理
	@RequestMapping("/uep")
	public String uep(Model model,HttpSession session) {
		User user=userService.getIdByUid((String)session.getAttribute("id"));
		model.addAttribute("user0", user);
		model.addAttribute("video0", this.videoService.getVideoListByU((String)session.getAttribute("id")));
		return "user/ep";
	}
	
	//跳转至视频管理
	@RequestMapping("/uep1")
	public String uep1(Model model,HttpSession session,String vid) {
		User user=userService.getIdByUid((String)session.getAttribute("id"));
		model.addAttribute("user0", user);
		model.addAttribute("video0", this.videoService.getIdByV(vid));
		model.addAttribute("ep0", this.epService.getEpListByV(vid));
		model.addAttribute("tag0", this.tagService.getTagListByV(vid));
		return "user/ep1";
	}
	
	//跳转至关注
	@RequestMapping("/ufollow")
	public String ufollow(Model model,HttpSession session) {
		User user=userService.getIdByUid((String)session.getAttribute("id"));
		model.addAttribute("user0", user);
		
		//我的关注
		model.addAttribute("follow0", this.followService.getFollowListByUf(user.getUid()));
		//我的粉丝
		model.addAttribute("follow1", this.followService.getFollowListByUt(user.getUid()));
		//互粉
		model.addAttribute("follow2", this.followService.getFollowListByUt2(user.getUid()));
		
		return "user/follow";
	}
	
	//跳转至历史
	@RequestMapping("/uhistory")
	public String uhistory(Model model,HttpSession session) {
		User user=userService.getIdByUid((String)session.getAttribute("id"));
		model.addAttribute("user0", user);
		model.addAttribute("history0", this.historyService.getHistoryListByU(user.getUid()));
		return "user/history";
	}
	
	//跳转至信息管理
	@RequestMapping("/umessage")
	public String umessage(Model model,HttpSession session) {
		User user=userService.getIdByUid((String)session.getAttribute("id"));
		model.addAttribute("user0", user);
		
		List<Message> message1 = new ArrayList<Message>();
		List<Message> message01 = messageService.getMessageListByUF(user.getUid(), "0");
		int length1=message01.size();
		if(length1>5){length1=5;}
		for(int i=0;i<length1;i++){
			message1.add(message01.get(i)) ;
		}
		
		List<Message> message2 = new ArrayList<Message>();
		List<Message> message02 = messageService.getMessageListByUF(user.getUid(), "1");
		int length2=message02.size();
		if(length2>10){length2=10;}
		for(int i=0;i<length2;i++){
			message2.add(message02.get(i)) ;
		}
		
		List<Message> message3 = new ArrayList<Message>();
		List<Message> message03 = messageService.getAllMessageList();
		int length3=message03.size();
		if(length3>10){length3=10;}
		for(int i=0;i<length3;i++){
			message3.add(message03.get(i)) ;
		}
		
		model.addAttribute("message1", message1);
		model.addAttribute("message2", message2);
		model.addAttribute("message3", message3);
		return "user/message";
	}
	
	//跳转至信息编辑
	@RequestMapping("/uperson")
	public String uperson(Model model,HttpSession session) {
		User user=userService.getIdByUid((String)session.getAttribute("id"));
		model.addAttribute("user0", user);
		return "user/person";
	}
	
	//跳转至投稿
	@RequestMapping("/upload")
	public String upload(Model model,HttpSession session){
		User user=userService.getIdByUid((String)session.getAttribute("id"));
		model.addAttribute("user0", user);
		
		return "user/upload";
	}
	
	//选择下拉二级联动
	@RequestMapping("/dochange")
	public @ResponseBody List<Address> change(@RequestBody Address address ){
		System.out.println(address.getChannel());
		//获取aid
		List<Address> addressList=addressService.getIdByC(address.getChannel());
		//获取所有子分区
		for ( Address a : addressList ){
			System.out.println(a.getAid());
		}
		return addressList;
	}
	
	//显示tag
	@RequestMapping("/gettag")
	public @ResponseBody List<Tag> gettag(@RequestBody Address address){
		System.out.println(address.getChannel());
		//获取所有标签list
		List<Tag> tagList=tagService.getTagListByC(address.getChannel());
		//获取所有子分区
		for ( Tag a : tagList ){
			System.out.println(a.getTagname());
		}
		return tagList;
	}
	
	//投稿
	@RequestMapping(value="/doupload",method = RequestMethod.POST)
	@ResponseBody
	public JsonResult<String> doupload(@RequestParam(value="vimg",required=false) MultipartFile vimg,
			@RequestParam(value="file",required=false) MultipartFile[] files,
			String title,String subtitle,String content,
			String channel,String aid,String tagname,
			HttpServletRequest request,HttpSession session){
		JsonResult<String> jsonResult=new JsonResult<String>();
		try{ 
			Timestamp time = new Timestamp(new Date().getTime());
			//获取当前用户名
			String up0=(String)session.getAttribute("id");
			System.out.println(session.getAttribute("id"));
			System.out.println(tagname);
			//保存用户信息
			User user0=userService.getIdByUid(up0);
			System.out.println(user0.getName());
			//保存分区信息
			Address address0=addressService.getIdByA(aid);

			//保存视频数据
			Watch watch0 = new Watch();
			watchService.addWatch(watch0);
			
			Video video0=new Video();
			
			if(vimg.isEmpty()){
				System.out.println("图片未上传");
			}else{
				System.out.println("图片原名: " + vimg.getOriginalFilename());
				String name1=new Date().getTime()+vimg.getOriginalFilename();
				//文件后缀
				//System.out.println(name.substring(name.lastIndexOf(".")));
				//文件类型
				//System.out.println(vimg.getContentType());
		        //通过tansferto上传文件到tomcat
		        vimg.transferTo(new File("D:\\upload\\"+name1));
		        //保存video信息
				video0.setTitle(title);
				video0.setContent(content);
				video0.setSubtitle(subtitle);
				video0.setVimg(name1);
				video0.setVstatus("0");
				video0.setAid(address0);
				video0.setUp(user0);
				video0.setWatch(watch0);
				videoService.addVideo(video0);
			}
			
			if(tagname.equals("")){
				
			}else{
				//保存tag信息
				Tag tag0=new Tag();
				tag0.setTagname(tagname);
				tag0.setTstatus("1");
				tag0.setVideo(video0);
				tagService.addTag(tag0);
			}
			
			int i=0;
			for(MultipartFile file : files){
				if(file.isEmpty()){
					System.out.println("文件未上传");
				}else{
					System.out.println("文件原名: " + file.getOriginalFilename());
					String name2=new Date().getTime()+file.getOriginalFilename();
					file.transferTo(new File("D:\\upload\\"+name2));
					//保存ep信息
					i=i+1;
					String filename="p"+i;
					//filename=UUID.randomUUID().toString();
					Ep ep0=new Ep();
					ep0.setFilename(filename);
					ep0.setEstatus("0");
					ep0.setFile(name2);
					ep0.setUpload_time(time);
					ep0.setVideo(video0);
					epService.addEp(ep0);
				}
			}
			System.out.println("保存完毕");
			jsonResult.setMessage("投稿成功");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return jsonResult;
	}
	
	//编辑个人信息
	@RequestMapping(value="/doperson",method = RequestMethod.POST)
	@ResponseBody
	public JsonResult<String> doperson(@RequestParam(value="uimg",required=false) MultipartFile uimg,
			String name,String email,String password,String password1,String sex,String location,String signature,
			HttpServletRequest request,HttpSession session)
	{
		JsonResult<String> jsonResult=new JsonResult<String>();
		try{ 
			if( password.equals(password1)){
				//获取当前用户名
				String up0=(String)session.getAttribute("id");
				System.out.println(session.getAttribute("id"));
				//保存用户信息
				User user0=userService.getIdByUid(up0);
				user0.setEmail(email);
				user0.setLocation(location);
				user0.setName(name);
				user0.setSignature(signature);
				user0.setPassword(password);
				user0.setSex(sex);
				
				if(uimg.isEmpty()){
					System.out.println("图片未上传");
				}else{
					System.out.println("图片原名: " + uimg.getOriginalFilename());
					String name1=new Date().getTime()+uimg.getOriginalFilename();
					//文件后缀
					//System.out.println(name.substring(name.lastIndexOf(".")));
					//文件类型
					//System.out.println(vimg.getContentType());
			        //通过tansferto上传文件到tomcat
			        uimg.transferTo(new File("D:\\upload\\"+name1));
			        user0.setUimg(name1);
				}
				userService.updateUser(user0);
				
				System.out.println("修改完毕");
				jsonResult.setMessage("修改成功");
				jsonResult.setSuccess(true);
			}
			else{
				jsonResult.setSuccess(false);
				jsonResult.setMessage("请确认密码一致");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return jsonResult;
	}
	
	//编辑视频信息
	@RequestMapping(value="/doep",method = RequestMethod.POST)
	@ResponseBody
	public JsonResult<String> doep(@RequestParam(value="vimg",required=false) MultipartFile vimg,
			String vid,Integer duration,String title,String subtitle,String content,
			String channel,String aid,String tagname,
			HttpServletRequest request,HttpSession session){
		JsonResult<String> jsonResult=new JsonResult<String>();
		try{ 
			System.out.println(tagname);
			Address address0=addressService.getIdByA(aid);
			Video video0=videoService.getIdByV(vid);
			if(vimg.isEmpty()){
				System.out.println("图片未上传");
			}else{
				System.out.println("图片原名: " + vimg.getOriginalFilename());
				String name1=new Date().getTime()+vimg.getOriginalFilename();
				//文件后缀
				//System.out.println(name.substring(name.lastIndexOf(".")));
				//文件类型
				//System.out.println(vimg.getContentType());
		        //通过tansferto上传文件到tomcat
				vimg.transferTo(new File("D:\\upload\\"+name1));
		        video0.setVimg(name1);
			}
			video0.setTitle(title);
			video0.setContent(content);
			video0.setSubtitle(subtitle);
			video0.setAid(address0);
			videoService.updateVideo(video0);
			
			if(tagname.equals("")){
				
			}else{
				//保存tag信息
				Tag tag0=new Tag();
				tag0.setTagname(tagname);
				tag0.setTstatus("1");
				tag0.setVideo(video0);
				tagService.addTag(tag0);
			}
			
			
			System.out.println("修改完毕");
			jsonResult.setMessage("修改成功");
			jsonResult.setSuccess(true);
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return jsonResult;
	}
	
	//删除视频信息
	@RequestMapping(value="/dodelete")
	@ResponseBody
	public JsonResult<String> dodelete(String vid){
		JsonResult<String> jsonResult=new JsonResult<String>();
		try{ 	
			Video video0=videoService.getIdByV(vid);
			video0.setVstatus("3");
			videoService.updateVideo(video0);	
			System.out.println("删除完毕");
			jsonResult.setMessage("删除成功");
			jsonResult.setSuccess(true);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return jsonResult;
	}
	
	//记录视频时长
	@RequestMapping(value="/doduration")
	@ResponseBody
	public JsonResult<String> doduration(@RequestBody Ep ep){
		JsonResult<String> jsonResult=new JsonResult<String>();
		try{ 	
			if(ep.getEid().equals("")){
				jsonResult.setMessage("先选集");
			}else{
				Ep ep0 = epService.getEpByE(ep.getEid());
				ep0.setDuration(ep.getDuration());
				epService.updateEp(ep0);
				jsonResult.setMessage("已记录时长");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return jsonResult;
	}
	
	//注销用户
	@RequestMapping(value="/dodown",method = RequestMethod.GET)
	@ResponseBody
	public JsonResult<String> dodown(HttpSession session){
		JsonResult<String> jsonResult=new JsonResult<String>();
		try{ 
			//获取当前用户名
			String up=(String)session.getAttribute("id");
			System.out.println(session.getAttribute("id"));
			//保存用户信息
			User user0=userService.getIdByUid(up);
			user0.setUstatus("1");
			userService.updateUser(user0);
			session.invalidate();
			System.out.println("用户已注销");
			jsonResult.setMessage("用户已注销");
			jsonResult.setSuccess(true);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return jsonResult;
	}
	
	//修改收藏夹名
	@RequestMapping("/updatecollect")
	@ResponseBody
	public JsonResult<String> updatecollect(@RequestBody Collect collect){
		JsonResult<String> jsonResult = new JsonResult<String>();
		try{
			Collect collect0 = collectService.getCollectByC(collect.getCid());
			collect0.setCollectname(collect.getCollectname());
			collectService.updateCollect(collect0);
			jsonResult.setSuccess(true);
			jsonResult.setMessage("已更新收藏夹名");
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return jsonResult;
	} 
	
	//删除整个收藏夹
	@RequestMapping("/downcollect")
	public String downcollect(String cid){
		try{
			Collect collect0 = collectService.getCollectByC(cid);
			collect0.setCstatus("1");
			collectService.updateCollect(collect0);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/user/ucollect";
	} 
	
	//取消收藏
	@RequestMapping("/downsave")
	public String downsave(String sid){
		try{
			Save save0 = saveService.getSaveByS(sid);
			save0.setSstatus("1");
			saveService.updateSave(save0);
			Watch watch = watchService.getWatchByW(save0.getVideo().getWatch().getWid());
			watch.setFavortime(watch.getFavortime()-1);
			watchService.updateWatch(watch);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/user/ucollect";
	} 
	
	//删除历史记录
	@RequestMapping("/downhistory")
	public String downhistory(String hid){
		try{
			History history = historyService.getHistoryByH(hid);
			history.setHstatus("1");
			historyService.updateHistory(history);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/user/uhistory";
	} 
	
	//关注
	@RequestMapping("/dofollow")
	@ResponseBody
	public JsonResult<String> dofollow(@RequestBody User user,HttpSession session){
		JsonResult<String> jsonResult = new JsonResult<String>();
		try{
			//获取当前用户名
			String from=(String)session.getAttribute("id");
			System.out.println(user.getUid());
			System.out.println(from);
			//是否关注
			Follow follow = followService.getFollowByFT(from, user.getUid());
			//是否被关注
			Follow follow1 = followService.getFollowByFT(user.getUid(), from);
			//未关注，也未被关注
			if(follow == null && follow1 == null){
				Follow follow0 = new Follow();
				follow0.setFstatus("1");
				follow0.setFrom_user(this.userService.getIdByUid(from));
				follow0.setTo_user(this.userService.getIdByUid(user.getUid()));
				followService.addFollow(follow0);
				jsonResult.setMessage("已关注");
			//我未关注，被关注
			}else if(follow == null && follow1.getFstatus().equals("1")){
				follow1.setFstatus("2");
				followService.updateFollow(follow1);
				jsonResult.setMessage("已相互关注");
			//我关注，未被关注    重复关注+之前取消关注
			}else if(follow.getFstatus().equals("1") || follow.getFstatus().equals("0") && follow1 == null){
				follow.setFstatus("1");
				followService.updateFollow(follow);
				jsonResult.setMessage("已关注");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return jsonResult;
	} 
	
	//取消关注
	@RequestMapping("/downfollow")
	public String downfollow(String fid,HttpSession session){
		try{
			//我关注的
			Follow follow0 = followService.getFollowByF(fid);
		
			if(follow0 == null){
				System.out.println("不存在的");
			//取消关注
			}else if(follow0.getFstatus().equals("1")){
				follow0.setFstatus("0");
				followService.updateFollow(follow0);
			//取消互粉
			}else if(follow0.getFstatus().equals("2")){
				follow0.setFstatus("1");
				followService.updateFollow(follow0);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/user/ufollow";
	} 
	
	//删除标签
	@RequestMapping("/downtag")
	@ResponseBody
	public JsonResult<String> downtag(@RequestBody Tag tag,HttpSession session){
		JsonResult<String> jsonResult = new JsonResult<String>();
		try{
			Tag tag0 = tagService.getTagByT(tag.getTid());
			tag0.setTstatus("0");
			tagService.updateTag(tag0);
			jsonResult.setMessage("标签已删除");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return jsonResult;
	} 
}
