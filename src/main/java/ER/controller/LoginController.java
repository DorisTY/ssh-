package ER.controller;


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ER.entity.Message;
import ER.entity.User;
import ER.entity.Video;
import ER.service.MessageService;
import ER.service.UserService;
import ER.service.VideoService;
import ER.util.JsonResult;
import ER.util.PageResults;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private VideoService videoService;
	
	@Autowired
	private MessageService messageService;

	// 跳转至主页
	@RequestMapping("/index")
	public String index(Model model,HttpSession session) {
		User user=userService.getIdByUid((String)session.getAttribute("id"));
		model.addAttribute("user0", user);
		
		PageResults<Video> video01=videoService.getVideoListByTCt("%","音乐",1,8);
		List<Video> video1 = video01.getResults();
		
		PageResults<Video> order01=videoService.getVideoListByTCl("%", "音乐",1,4);
		List<Video> order1=order01.getResults();
		
		PageResults<Video> video02=videoService.getVideoListByTCt("%","舞蹈",1,8);
		List<Video> video2=video02.getResults();
		
		PageResults<Video> order02=videoService.getVideoListByTCl("%", "舞蹈",1,4);
		List<Video> order2=order02.getResults(); 
		
		PageResults<Video> video03=videoService.getVideoListByTCt("%","游戏",1,8);
		List<Video> video3=video03.getResults();
		
		PageResults<Video> order03=videoService.getVideoListByTCl("%", "游戏",1,4);
		List<Video> order3=order03.getResults(); 
		
		PageResults<Video> video04=videoService.getVideoListByTCt("%","科技",1,8);
		List<Video> video4=video04.getResults();
		
		PageResults<Video> order04=videoService.getVideoListByTCl("%", "科技",1,4);
		List<Video> order4=order04.getResults(); 
		
		PageResults<Video> video05=videoService.getVideoListByTCt("%","生活",1,8);
		List<Video> video5=video05.getResults();
		
		PageResults<Video> order05=videoService.getVideoListByTCl("%", "生活",1,4);
		List<Video> order5=order05.getResults(); 
		
		PageResults<Video> video06=videoService.getVideoListByTCt("%","娱乐",1,8);
		List<Video> video6=video06.getResults();
		
		PageResults<Video> order06=videoService.getVideoListByTCl("%", "娱乐",1,4);
		List<Video> order6=order06.getResults(); 
		
		PageResults<Video> video07=videoService.getVideoListByTCt("%","影视",1,8);
		List<Video> video7=video07.getResults();
		
		PageResults<Video> order07=videoService.getVideoListByTCl("%", "影视",1,4);
		List<Video> order7=order07.getResults(); 
		
		//推广收藏量最多的
		PageResults<Video> tui1=videoService.getVideoListByTCs("%", "%",1,3);
		List<Video> tui=tui1.getResults(); 
		
		model.addAttribute("tuiguang", tui);
		
		//公告
		List<Message> message=new ArrayList<Message>(); 
		List<Message> message0=messageService.getAllMessageList();
		int length00=message0.size();
		if(length00>6){length00=6;}
		for(int i=0;i<length00;i++){
			message.add(message0.get(i)) ;
		}
		
		model.addAttribute("message0", message);
		
		model.addAttribute("video1", video1);
		model.addAttribute("video2", video2);
		model.addAttribute("video3", video3);
		model.addAttribute("video4", video4);
		model.addAttribute("video5", video5);
		model.addAttribute("video6", video6);
		model.addAttribute("video7", video7);
		
		model.addAttribute("order1", order1);
		model.addAttribute("order2", order2);
		model.addAttribute("order3", order3);
		model.addAttribute("order4", order4);
		model.addAttribute("order5", order5);
		model.addAttribute("order6", order6);
		model.addAttribute("order7", order7);
		
		
		return "index";
	}

	// 跳转至登录页面
	@RequestMapping("/login")
	public String login(Model model,HttpSession session) {
		User user=userService.getIdByUid((String)session.getAttribute("id"));
		model.addAttribute("user0", user);
		return "home/register";
	}

	// 跳转至注册页面
	@RequestMapping("/sign")
	public String sign(Model model,HttpSession session) {
		User user=userService.getIdByUid((String)session.getAttribute("id"));
		model.addAttribute("user0", user);
		return "home/sign";
	}

	// 注册
	@RequestMapping(value = "/dosign", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult<String> sign(@RequestBody User user, HttpSession session) {
		JsonResult<String> jsonResult = new JsonResult<String>();
		try {
			// JSONObject jsonObject 解析json
			// System.out.println(jsonObj.getString("password1"));
			User user0 = userService.getIdByM(user.getMobile());
			if(user0 != null){
				jsonResult.setSuccess(false);
				jsonResult.setMessage("该手机号已注册！");
			}else{
				Timestamp time = new Timestamp(new Date().getTime());
				user.setFlag("1");// user.setFlag("0");管理员
				user.setUstatus("0");
				user.setJoin_time(time);
				userService.addUser(user);
				session.setAttribute("user", user.getName());
				session.setAttribute("id", user.getUid());
				jsonResult.setSuccess(true);
				jsonResult.setMessage("注册成功");
				System.out.println(user.getName());
				System.out.println(user.getMobile());
				System.out.println(user.getPassword());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonResult;
	}

	// 登录 flag用户身份 ustatus用户状态
	@RequestMapping(value = "/dologin", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult<String> register(@RequestBody User user, HttpSession session) {
		JsonResult<String> jsonResult = new JsonResult<String>();
		try {
			//验证手机号是否存在，若存在则已注册
			User user0 = userService.getIdByM(user.getMobile());
			if(user0 == null){
				jsonResult.setSuccess(false);
				jsonResult.setMessage("登录失败，请先注册！");
			}else{
				// 前台获取数据到后台查询
				User user1 = userService.getIdByMP(user.getMobile(), user.getPassword());
				if (user1 == null) {
					jsonResult.setSuccess(false);
					jsonResult.setMessage("登录失败，请确认输入正确！");
				} else {
					if (user1.getUstatus().equals("1")) {
						jsonResult.setSuccess(false);
						jsonResult.setMessage("该账户已注销！");
					} else if (user1.getUstatus().equals("0")) {
						if (user1.getFlag().equals("0")) {
							session.setAttribute("user", user1.getName());
							session.setAttribute("id", user1.getUid());
							jsonResult.setSuccess(true);
							jsonResult.setData("0");
							jsonResult.setMessage("管理员登录成功！");
						} else if (user1.getFlag().equals("1")) {
							session.setAttribute("user", user1.getName());
							session.setAttribute("id", user1.getUid());
							jsonResult.setSuccess(true);
							jsonResult.setMessage("欢迎进入ER的世界！");
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonResult;
	}
	
	//用户退出
	@RequestMapping("/down")
	public String down(HttpSession session) {
		session.invalidate();
		return "redirect:/login/index";
	}
}
