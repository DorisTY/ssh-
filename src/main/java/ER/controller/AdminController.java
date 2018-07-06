package ER.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ER.entity.Comment;
import ER.entity.Ep;
import ER.entity.Message;
import ER.entity.Reply;
import ER.entity.User;
import ER.entity.Video;
import ER.service.CommentService;
import ER.service.EpService;
import ER.service.MessageService;
import ER.service.ReplyService;
import ER.service.UserService;
import ER.service.VideoService;
import ER.util.JsonResult;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private EpService epService;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private ReplyService replyService;
	
	//跳转至管理员主界面
	@RequestMapping("/auser")
	public String auser(Model model,HttpSession session,String ustatus,String name) {
		User user=userService.getIdByUid((String)session.getAttribute("id"));
		model.addAttribute("user0", user);
		if(ustatus==null && name==null){
			System.out.println("0");
			model.addAttribute("user1", this.userService.getAllUserList());
		}else if(name!=null){
			model.addAttribute("user1", this.userService.getUserListByN("%"+name+"%"));
		}else if(ustatus!=null){
			model.addAttribute("user1", this.userService.getUserListByU(ustatus));
		}
		return "ad/user";
	}
	
	//跳转至管理视频
	@RequestMapping("/avideo")
	public String avideo(Model model,HttpSession session,String estatus,String title){
		User user=userService.getIdByUid((String)session.getAttribute("id"));
		model.addAttribute("user0", user);
		if(estatus==null && title==null){
			model.addAttribute("ep0", this.epService.getAllEpList());
		}else if(title!=null){
			model.addAttribute("ep0", this.epService.getEpListByT("%"+title+"%"));
		}else if(estatus!=null){
			model.addAttribute("ep0", this.epService.getEpListByE(estatus));
		}
		return "ad/video";
	}
	
	//跳转至管理评论
	@RequestMapping("/acomment")
	public String acomment(Model model,HttpSession session,String rstatus,String istatus,String name){
		User user=userService.getIdByUid((String)session.getAttribute("id"));
		model.addAttribute("user0", user);
		if(istatus==null && rstatus==null && name==null){
			System.out.println("0");
			model.addAttribute("comment0", this.commentService.getAllCommentList());
			model.addAttribute("reply0", this.replyService.getAllReplyList());
		}else if(name!=null){
			model.addAttribute("comment0", this.commentService.getCommentListByN("%"+name+"%"));
			model.addAttribute("reply0", this.replyService.getReplyListByN("%"+name+"%"));
		}else{
			model.addAttribute("comment0", this.commentService.getCommentListByIs(istatus));
			model.addAttribute("reply0", this.replyService.getReplyListByRs(rstatus));
		}
		return "ad/comment";
	}
	
	//注销用户
	@RequestMapping("/dodown")
	@ResponseBody
	public JsonResult<String> dodown(@RequestBody User user){
		JsonResult<String> jsonResult = new JsonResult<String>();
		try{
			System.out.println(user.getUid());
			User user0=userService.getIdByUid(user.getUid());
			user0.setUstatus("1");
			userService.updateUser(user0);
			jsonResult.setSuccess(true);
			jsonResult.setMessage("该账户已注销");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return jsonResult;
	}
	
	//恢复用户
	@RequestMapping("/doreset")
	@ResponseBody
	public JsonResult<String> doreset(@RequestBody User user){
		JsonResult<String> jsonResult = new JsonResult<String>();
		try{
			System.out.println(user.getUid());
			User user0=userService.getIdByUid(user.getUid());
			user0.setUstatus("0");
			userService.updateUser(user0);
			jsonResult.setSuccess(true);
			jsonResult.setMessage("该账户已恢复");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return jsonResult;
	}
	
	//通过审核
	@RequestMapping("/dopass")
	@ResponseBody
	public JsonResult<String> dopass(@RequestBody Ep ep,HttpSession session){
		JsonResult<String> jsonResult = new JsonResult<String>();
		try{
			System.out.println(ep.getEid());
			Timestamp time = new Timestamp(new Date().getTime());
			User user0=userService.getIdByUid((String)session.getAttribute("id"));
			System.out.println(user0.getName());
			Ep ep0=epService.getEpByE(ep.getEid());
			ep0.setEstatus("2");
			ep0.getVideo().setVstatus("2");
			epService.updateEp(ep0);
			Message message0=new Message();
			message0.setMtitle("视频审核");
			message0.setMtext("您最新上传的视频已通过");
			message0.setMstatus("0");
			message0.setMessage_time(time);
			message0.setFrom_user(user0);
			message0.setTo_user(ep0.getVideo().getUp());
			messageService.addMessage(message0);
			jsonResult.setSuccess(true);
			jsonResult.setMessage("通过");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return jsonResult;
	}
	
	//未过审核
	@RequestMapping("/dodiss")
	@ResponseBody
	public JsonResult<String> dodiss(@RequestBody Ep ep,HttpSession session){
		JsonResult<String> jsonResult = new JsonResult<String>();
		try{
			System.out.println(ep.getEid());
			Timestamp time = new Timestamp(new Date().getTime());
			User user0=userService.getIdByUid((String)session.getAttribute("id"));
			System.out.println(user0.getName());
			Ep ep0=epService.getEpByE(ep.getEid());
			ep0.setEstatus("1");
			ep0.getVideo().setVstatus("1");
			epService.updateEp(ep0);
			Message message0=new Message();
			message0.setMtitle("视频审核");
			message0.setMtext("您最新上传的视频未通过");
			message0.setMstatus("0");
			message0.setMessage_time(time);
			message0.setFrom_user(user0);
			message0.setTo_user(ep0.getVideo().getUp());
			messageService.addMessage(message0);
			jsonResult.setSuccess(true);
			jsonResult.setMessage("未通过");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return jsonResult;
	}
	
	//删除视频
	@RequestMapping("/dodown1")
	@ResponseBody
	public JsonResult<String> dodown1(@RequestBody Ep ep,HttpSession session){
		JsonResult<String> jsonResult = new JsonResult<String>();
		try{
			System.out.println(ep.getEid());
			Timestamp time = new Timestamp(new Date().getTime());
			User user0=userService.getIdByUid((String)session.getAttribute("id"));
			System.out.println(user0.getName());
			Ep ep0=epService.getEpByE(ep.getEid());
			ep0.setEstatus("3");
			ep0.getVideo().setVstatus("3");
			epService.updateEp(ep0);
			Message message0=new Message();
			message0.setMtitle("视频审核");
			message0.setMtext("您有视频被删除");
			message0.setMstatus("0");
			message0.setMessage_time(time);
			message0.setFrom_user(user0);
			message0.setTo_user(ep0.getVideo().getUp());
			messageService.addMessage(message0);
			jsonResult.setSuccess(true);
			jsonResult.setMessage("已删除");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return jsonResult;
	}
	
	//恢复视频
	@RequestMapping("/doreset1")
	@ResponseBody
	public JsonResult<String> doreset1(@RequestBody Ep ep,HttpSession session){
		JsonResult<String> jsonResult = new JsonResult<String>();
		try{
			System.out.println(ep.getEid());
			Timestamp time = new Timestamp(new Date().getTime());
			User user0=userService.getIdByUid((String)session.getAttribute("id"));
			System.out.println(user0.getName());
			Ep ep0=epService.getEpByE(ep.getEid());
			ep0.setEstatus("2");
			ep0.getVideo().setVstatus("2");
			epService.updateEp(ep0);
			Message message0=new Message();
			message0.setMtitle("视频审核");
			message0.setMtext("您的视频已恢复");
			message0.setMstatus("0");
			message0.setMessage_time(time);
			message0.setFrom_user(user0);
			message0.setTo_user(ep0.getVideo().getUp());
			messageService.addMessage(message0);
			jsonResult.setSuccess(true);
			jsonResult.setMessage("已恢复");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return jsonResult;
	}
	
	//删除评论
	@RequestMapping("/dodown2")
	@ResponseBody
	public JsonResult<String> dodown2(@RequestBody Comment comment,HttpSession session){
		JsonResult<String> jsonResult = new JsonResult<String>();
		try{
			System.out.println(comment.getIid());
			Timestamp time = new Timestamp(new Date().getTime());
			User user0=userService.getIdByUid((String)session.getAttribute("id"));
			//System.out.println(user0.getName());
			Comment comment0=commentService.getCommentByI(comment.getIid());
			comment0.setIstatus("1");
			commentService.updateComment(comment0);
			Message message0=new Message();
			message0.setMtitle("评论审核");
			message0.setMtext("您有评论被删除");
			message0.setMstatus("0");
			message0.setMessage_time(time);
			message0.setFrom_user(user0);
			message0.setTo_user(comment0.getUser());
			messageService.addMessage(message0);
			jsonResult.setSuccess(true);
			jsonResult.setMessage("已删除");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return jsonResult;
	}
	
	//恢复评论
	@RequestMapping("/doreset2")
	@ResponseBody
	public JsonResult<String> doreset2(@RequestBody Comment comment,HttpSession session){
		JsonResult<String> jsonResult = new JsonResult<String>();
		try{
			Timestamp time = new Timestamp(new Date().getTime());
			User user0=userService.getIdByUid((String)session.getAttribute("id"));
			System.out.println(user0.getName());
			Comment comment0=commentService.getCommentByI(comment.getIid());
			comment0.setIstatus("0");
			commentService.updateComment(comment0);
			Message message0=new Message();
			message0.setMtitle("评论审核");
			message0.setMtext("您有评论被恢复");
			message0.setMstatus("0");
			message0.setMessage_time(time);
			message0.setFrom_user(user0);
			message0.setTo_user(comment0.getUser());
			messageService.addMessage(message0);
			jsonResult.setSuccess(true);
			jsonResult.setMessage("已恢复");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return jsonResult;
	}
	
	//删除回复
	@RequestMapping("/dodown3")
	@ResponseBody
	public JsonResult<String> dodown3(@RequestBody Reply reply,HttpSession session){
		JsonResult<String> jsonResult = new JsonResult<String>();
		try{
			System.out.println(reply.getRid());
			Timestamp time = new Timestamp(new Date().getTime());
			User user0=userService.getIdByUid((String)session.getAttribute("id"));
			System.out.println(user0.getName());
			Reply reply0=replyService.getReplyByR(reply.getRid());
			reply0.setRstatus("1");
			replyService.updateReply(reply0);
			Message message0=new Message();
			message0.setMtitle("评论审核");
			message0.setMtext("您有回复被删除");
			message0.setMstatus("0");
			message0.setMessage_time(time);
			message0.setFrom_user(user0);
			message0.setTo_user(reply0.getFrom_user());
			messageService.addMessage(message0);
			jsonResult.setSuccess(true);
			jsonResult.setMessage("已删除");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return jsonResult;
	}
	
	//恢复回复
	@RequestMapping("/doreset3")
	@ResponseBody
	public JsonResult<String> doreset3(@RequestBody Reply reply,HttpSession session){
		JsonResult<String> jsonResult = new JsonResult<String>();
		try{
			Timestamp time = new Timestamp(new Date().getTime());
			User user0=userService.getIdByUid((String)session.getAttribute("id"));
			System.out.println(user0.getName());
			Reply reply0=replyService.getReplyByR(reply.getRid());
			reply0.setRstatus("0");
			replyService.updateReply(reply0);
			Message message0=new Message();
			message0.setMtitle("评论审核");
			message0.setMtext("您有回复被恢复");
			message0.setMstatus("0");
			message0.setMessage_time(time);
			message0.setFrom_user(user0);
			message0.setTo_user(reply0.getFrom_user());
			messageService.addMessage(message0);
			jsonResult.setSuccess(true);
			jsonResult.setMessage("已恢复");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return jsonResult;
	}
	
	//发公告
	@RequestMapping("/dopublish")
	@ResponseBody
	public JsonResult<String> dopublish(@RequestBody Message message,HttpSession session){
		JsonResult<String> jsonResult = new JsonResult<String>();
		try{
			Timestamp time = new Timestamp(new Date().getTime());
			User user0=userService.getIdByUid((String)session.getAttribute("id"));
			//System.out.println(user0.getName());
			Message message0=new Message();
			message0.setMtitle(message.getMtitle());
			message0.setMtext(message.getMtext());
			message0.setMstatus("2");
			message0.setMessage_time(time);
			message0.setFrom_user(user0);
			messageService.addMessage(message0);
			jsonResult.setMessage("发布成功");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return jsonResult;
	}
}
