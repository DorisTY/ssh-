<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <title>ER</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/self.css" rel="stylesheet">

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

  </head>

  <body>
    <jsp:include   page="head3.jsp" flush="true"/>
    <!-- 视频名 -->
    <div class="container">
      <div class="col-md-8">
      	<h3>${video.title }</h3>
      	<input type="hidden" id="vid" name="vid" value="${video.vid }"> 
      	<p>
          <ol class="breadcrumb border4">
          <li><a href="${pageContext.request.contextPath}/login/index">首页</a></li>
          <li><a href="${pageContext.request.contextPath}/home/details?channel=${video.aid.channel }">${video.aid.channel }</a></li>
          <li class="active">${video.title }</li>
          </ol>
        </p> 
   		<p class="text-right">
          <span> 收藏${video.watch.favortime }&nbsp&nbsp</span>
          <span> 评论${video.watch.commenttime }&nbsp&nbsp</span>
          <span> 喜欢${video.watch.liketime }&nbsp&nbsp</span>
        </p>
        <p class="text-right" id="time">
        </p>
        
      </div><!-- col-md-8 -->

      <div class="col-md-1 border2">
      	<img src="/upload/${video.up.uimg }" class="img-responsive img-circle" alt="300*300" width="80">
      </div><!-- col-md-1 -->

      <div class="col-md-3">
        <div class="border2">
          <h4 style="display: inline-block;"><a href="${pageContext.request.contextPath}/home/userhome?uid1=${video.up.uid }">${video.up.name }</a></h4>
          <button id="f" onclick="follow('${video.up.uid }')" class="btn btn-primary btn-sm pull-right" type="submit">关注+</button>
          <p>${video.up.signature }</p>
           </div>
      </div><!-- col-md-3 -->
    </div><!-- 视频名 -->


    <!-- 选集 -->
    <div class="container border1">
      <c:forEach items="${ep}" var="e">
      <button id="filename" type="button" class="btn btn-default" onclick="filename('${e.filename }','${e.video.vid }')">${e.filename }</button>
      </c:forEach>
    </div><!-- 选集 -->

    <!-- 视频 -->
    <div class="container">
        <div class="col-md-8">
          <video id="video0" width="730" controls preload="auto" data-setup="{}">
            <source src="" type="video/mp4">
    		<source src="" type="video/webm">
    		<p>
		      To view this video please enable JavaScript, and consider upgrading to a web browser that
		      <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
		    </p>
          </video>
          <div class=" form-inline">
	          <button class="btn btn-sm" id="btn1" onclick="duration('${user}')">记录时长</button>
	          <button class="btn btn-sm" onclick="loop()">洗脑循环</button>
	          <button class="btn btn-sm" id="capture" onclick="capture()">痴汉截图</button>
	          <select class="form-control" id="speed">
	            <option value="0.5">x0.5</option>
				<option selected value="1.0">x1.0</option>
				<option value="2.0">x2.0</option>
			  </select>
		  </div>
        <script type="text/javascript">
 
          myVid=document.getElementById("video0");
		  function loop(){
			  if(myVid.loop == true){
				  myVid.loop=false;
				  alert("取消循环");
			  }else{
				  myVid.loop=true;
				  alert("已循环");
			  }
		  }
		  
		  $("#speed").change(function(){
			  var speed = $("#speed").val();
			  myVid.playbackRate=speed;
			 //alert("倍速已改变");
		  })

		  function duration(user){
			  if(user == ""){
				  alert("请先登录");
			  }else{
				  var duration = parseInt(myVid.duration);
				  var eid = $("#btn1").val();
				  //计算到秒
				  //alert(duration);
				  var data={
						  duration:duration,
						  eid:eid
			   				};
			   		$.ajax({
			   			type:"POST",
			   			url:"${pageContext.request.contextPath}/user/doduration",
			   			data:JSON.stringify(data),
			   			contentType:"application/json",
			   			success:function(data){
			   				alert(data.message);
			   			}
			   		});
			  }
		  }
		  
		function capture(){
				document.getElementById("show").style.display="";
				var canvas = document.getElementById("canvas");
				canvas.width = myVid.videoWidth * 0.5;
			    canvas.height = myVid.videoHeight * 0.5;
			    canvas.getContext('2d').drawImage(myVid, 0, 0, canvas.width, canvas.height);
			}
  		</script>
  		
        </div><!-- col-md-8 -->
        <div class="col-md-4 border3"> 
          <h3>${video.title }</h3>
          <div class="p2">
          <c:forEach items="${tag0}" var="t">
            <a class="badge1">${t.tagname }&nbsp</a>
			</c:forEach>
          </div>
          
          <p class="border1 p1">${video.content }</p>
        </div><!-- col-md-4 -->
    </div><!-- 视频 -->

    <!-- 分享 --> 
    <div class="container">
      <p class="text-center">
        <span><a href="javascript:void(0);" onclick="onBlog()">分享至微博</a>&nbsp&nbsp</span>
        <span><a href="javascript:void(0);"  data-toggle="modal" data-target="#myModal1">收藏${video.watch.favortime}</a>&nbsp&nbsp</span>
        <span><a href="javascript:void(0);"  onclick="dolove()">点赞${video.watch.liketime}</a></span>
      </p>
    	<div id="show" class="border1" style="display: none">
            <h2 >我的截图</h2>
            <canvas class="border3" id="canvas" width="320" height="180"></canvas>
        </div>
      
      
    </div><!-- row3分享 -->

	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						选择收藏夹
					</h4>
				</div>
				<div class="modal-body">
				<c:forEach items="${collect0 }" var="co">
				  <div class="radio">
				    <label>
				      <input type="radio"  name="collect0" value="${co.cid }"> ${co.collectname }
				    </label>
				    <br />
				  </div>
				  </c:forEach>
				  <div class="form-group form-inline">
				    <input type="text" id="collectname" class="form-control" placeholder="新建收藏夹名">
				    <button type="button" id="newcollect" class="btn btn-default">新建</button>
				  </div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="docollect()">
						提交
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	
	<div class="container">
          <div class="border1">
            <h2 >猜你喜欢</h2>
          </div>
          <div class="row">
            <c:forEach items="${video3}" var="v">
            <div class="col-md-2 ">
              <div class="thumbnail ">
                <img src="/upload/${v.vimg }" class="img-responsive img-rounded" alt="155*90" width="100%">
                <h5><a onclick="newhistory('${v.vid }')" href="${pageContext.request.contextPath}/home/watchvideo?vid=${v.vid }">${v.title }</a></h5>
              </div><!-- thumbnail -->
            </div><!-- col-md-3 -->
            </c:forEach>
          </div><!-- row -->
      </div><!-- 猜你喜欢 -->
	
    <!-- 评论 -->
    <div class="container">

      <div class="row">
        <form onsubmit="return false">
          <div class="col-md-1 form-group">
            <img src="/upload/${user0.uimg}" class="img-responsive img-circle" alt="300*300" width="50">
          </div>
          <div class="col-md-11 form-group">
            <textarea class="form-control" rows="3" id="info" placeholder="评论内容"></textarea>
          </div>
          <button id="docomment" type="button" class="btn btn-default pull-right">发表评论</button>
        </form>
      </div>

	  <c:forEach items="${comment0 }" var="c">
      <div class="row">
        <div class="col-md-1" >
          <img src="/upload/${c.user.uimg}" class="img-responsive img-circle" alt="300*300" width="50">
        </div><!-- col-md-1 -->
        <div class="col-md-11">
          <p><strong><a>${c.user.name}</a></strong></p>
          <p>${c.info}</p>
          <p class="text-right">${c.info_time}&nbsp
          	<a data-toggle="modal" data-target="#myModal" href = "javascript:void(0);" 
          	onclick ="doreply0('${c.iid}','${c.user.uid}')">回复</a>&nbsp
          </p>
        </div><!-- col-md-11 -->
      </div><!-- row -->
	  
      <!-- 模态框（Modal） -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							回复
						</h4>
					</div>
					<div class="modal-body">
						<input id="iid0" type="hidden" value=''>
						<input id="uid0" type="hidden" value=''>
						<input id="tip" type="text" class="form-control" placeholder="回复内容">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="doreply()">
							提交
						</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
      </c:forEach>
      
      <c:forEach items="${reply0 }" var="r">
	  <div class="row">
        <div class="col-md-1 col-md-offset-1" >
          <img src="/upload/${r.from_user.uimg}" class="img-responsive img-circle" alt="300*300" width="50">
        </div><!-- col-md-1 -->
        <div class="col-md-10">
          <p><strong><a>${r.from_user.name}</a></strong>&nbsp回复&nbsp<strong><a>${r.to_user.name}</a></strong></p>
          <p>${r.tip}</p>
          <p class="text-right">${r.tip_time}</p>
        </div><!-- col-md-11 -->
      </div><!-- row -->
      </c:forEach>
      
    </div><!-- 评论 -->

    <footer class="container">
      <p class="pull-right fix"><a href="">返回顶部</a></p>
      <p>&copy; 2018 上海海事大学. &middot; 陶媛 &middot; 毕业设计</p>
    </footer>
    <script type="text/javascript">
    
    //选集播放
    function filename(filename,vid){
		var filename = filename;
		var vid = vid;
		var data={
				filename:filename,
				vid:vid,
		};
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/home/dowatch",
			data:JSON.stringify(data),
			contentType:"application/json",
			success:function(data){		
				//alert(data.file);
				$("#video0").attr("src","/upload/"+data.file);
				document.getElementById("btn1").value=data.eid;
				var uptime = new Date(data.upload_time);
				$("#time").empty();
				$("#time").append("<span>"+uptime+"<span>");
			}
		})
    }
    
    //默认加载ep第一个视频
    $(function(){
    	var filename = "p1";
		var vid = $("#vid").val();
		var data={
				filename:filename,
				vid:vid,
		};
		//alert("加载完成");
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/home/dowatch",
			data:JSON.stringify(data),
			contentType:"application/json",
			success:function(data){		
				//alert(data.file);
				$("#video0").attr("src","/upload/"+data.file);
				var uptime = new Date(data.upload_time);
				$("#time").append("<span>"+uptime+"<span>");
			}
		});
    });
    
    //收藏模态框传参
    $("#myModal").modal("hide");
    function doreply0(iid0,uid0){
    	$("#iid0").val(iid0);
    	$("#uid0").val(uid0);
    }

   	$("#docomment").on("click",function(){
   		var info=$("#info").val();
   		var vid=$("#vid").val();
   		var data={
   				info:info,
   				vid:vid,
   				};
   		$.ajax({
   			type:"POST",
   			url:"${pageContext.request.contextPath}/home/docomment",
   			data:JSON.stringify(data),
   			contentType:"application/json",
   			success:function(result){
   				if(result.success == true){
   					alert(result.message);
   					window.location.reload();
   				}else{
   					alert(result.message);
   					window.location.href = "${pageContext.request.contextPath}/login/login";
   				}
   			}
   		});
   	});
    
    function doreply(){
		var iid=$("#iid0").val();
		var to_user=$("#uid0").val();
		var tip=$("#tip").val();
		var data={
				iid:iid,
				to_user:to_user,
				tip:tip,
				};
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/home/doreply",
			data:JSON.stringify(data),
			contentType:"application/json",
			success:function(result){
				if(result.success == true){
   					alert(result.message);
   					window.location.reload();
   				}else{
   					alert(result.message);
   					window.location.href = "${pageContext.request.contextPath}/login/login";
   				}
			}
		});
	}
	
    //新建收藏夹
	$("#newcollect").on("click",function(){
		var collectname=$("#collectname").val();
		if(collectname==""){
			alert("请输入收藏夹名");
			}else{
		var data={collectname:collectname};
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/home/newcollect",
			data:JSON.stringify(data),
			contentType:"application/json",
			success:function(result){
				if(result.success == true){
   					alert(result.message);
   					top.location.reload();
   				}else{
   					alert(result.message);
   					window.location.href = "${pageContext.request.contextPath}/login/login";
   				}
			}
		});
		}
	});
	
	//收藏
	function docollect(){
   		var cid=$("input[name='collect0']:checked").val();
   		var vid=$("#vid").val();
   		var data={
   				cid:cid,
   				vid:vid,
   				};
   		$.ajax({
   			type:"POST",
   			url:"${pageContext.request.contextPath}/home/docollect",
   			data:JSON.stringify(data),
   			contentType:"application/json",
   			success:function(result){
   				if(result.success == true){
   					alert(result.message);
   					window.location.reload();
   				}else{
   					alert(result.message);
   					window.location.href = "${pageContext.request.contextPath}/login/login";
   				}
   			}
   		});
   	};
   	
  //视频点赞
	function dolove(){
   		var vid=$("#vid").val();
   		var data={vid:vid};
   		$.ajax({
   			type:"POST",
   			url:"${pageContext.request.contextPath}/home/dolove",
   			data:JSON.stringify(data),
   			contentType:"application/json",
   			success:function(result){
   				if(result.success == true){
   					alert(result.message);
   					window.location.reload();
   				}else{
   					alert(result.message);
   					window.location.href = "${pageContext.request.contextPath}/login/login";
   				}
   			}
   		});
   	};
   	
   	
   	//关注
   	function follow(uid){
   		var uid=uid;
   		var data={uid:uid};
   		$.ajax({
   			type:"POST",
   			url:"${pageContext.request.contextPath}/user/dofollow",
   			data:JSON.stringify(data),
   			contentType:"application/json",
   			success:function(result){
   				alert(result.message);
   					
   			}
   		});
   	};
   	
   	//分享到微博
   	function onBlog() {  //3个参数：1要分享的内容，2分享的地址，3appkey
        var txtVal = "分享视频，分享你的快乐！";   
        var vid=$("#vid").val();
        var url = "http://localhost:8080/ER01/home/watchvideo?vid="+vid;
        window.open("http://v.t.sina.com.cn/share/share.php?appkey=4120396272&title=" + 
        		encodeURIComponent(txtVal)+"&url="+encodeURIComponent(url));
	}
   	
	</script>
  </body>
</html>