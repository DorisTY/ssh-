package ER.test;

import ER.entity.Address;
import ER.entity.Collect;
import ER.entity.Comment;
import ER.entity.Ep;
import ER.entity.Message;
import ER.entity.Reply;
import ER.entity.User;
import ER.entity.Video;
import ER.entity.Watch;
import ER.service.AddressService;
import ER.service.CollectService;
import ER.service.CommentService;
import ER.service.EpService;
import ER.service.MessageService;
import ER.service.ReplyService;
import ER.service.UserService;
import ER.service.VideoService;
import ER.service.WatchService;
import ER.util.PageResults;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;


/**
 * @Title:
 * @Description:
 * @author:
 * @date
 * @update
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:applicationContext.xml", "classpath:applicationContext-mvc.xml" })
public class UserTest extends AbstractJUnit4SpringContextTests {

	@Autowired
	private UserService userService;

	@Autowired
	private VideoService videoService;
	
	@Autowired
	private AddressService addressService;
	@Autowired
	private EpService epService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private CollectService collectService;
	@Autowired
	private WatchService watchService;
	
	/*
	@Test
	public void addUser() {
		Timestamp time1 = new Timestamp(System.currentTimeMillis());
		Timestamp time2 = new Timestamp(new Date().getTime()); 
		User user = new User();
		user.setMobile("123456789");
		user.setPassword("111111");
		user.setName("ty");
		user.setJoin_time(time2);
		userService.addUser(user);
		
	}
	
	
	@Test
	public void getUSer(){
		List<User> userList=userService.getAllUserList();
		for ( User a : userList ){
			//获取所有用户名
			   System.out.println(a.getName());
			}
	}
				//model.addAttribute("aidlist",this.addressService.getIdByC("音乐"));
			for ( Address aids : aidlist ){
				   System.out.println(aids.getAid());
				}
			
	//测试添加
	@Test
	public void testmto(){
		User user = new User();
		user.setMobile("123456789");
		user.setPassword("111111");
		user.setName("ty");
		userService.addUser(user);
		Video video = new Video();
		video.setTitle("sdkfjklsaj");
		video.setContent("sdjkhjkds");
		
		video.setUser(user);
		videoService.addVideo(video);
		
	}
	
	//测试登录
	@Test
	public void testmto(){
		User user1=userService.getIdByMP("13761435659","111111");
		System.out.println(user1.getName());
		System.out.println(user1.getFlag());
		System.out.println(user1.getUstatus());
		//List<Address> userList=addressService.getIdByC("音乐");
		//for ( Address a : userList ){
			
		Address a=addressService.getIdByA("编舞");
		System.out.println(a.getAid());
		System.out.println(a.getChannel());
		}
		
		String getid=UUID.randomUUID().toString();
		System.out.println(getid);
		//获取所有用户名
			   //System.out.println(a.getAid());
			  // System.out.println(a.getChannel());
			//
			 * 
			 * <c:forEach items="${aidlist}" var="u">
				  <option value="${u.aid}">${u.aid}</option>
				</c:forEach>
			 * }
	*/
	
	@Test
	public void testmto(){
		Address address = addressService.getAddressByU("402881e7632a47b301632a4a950b0000");
		System.out.println(address.getChannel());
	}
	
}
