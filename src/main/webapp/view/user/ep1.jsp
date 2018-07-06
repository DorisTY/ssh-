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
    <jsp:include   page="head2.jsp" flush="true"/>
    <!-- nav2 -->
    <div class="container">
      <nav class="border1">
        <ul class="nav navbar-nav nav-pills">
            <li role="presentation">
            	<a href="${pageContext.request.contextPath}/user/uhome">主页</a>
            </li>
            <li role="presentation">
              <a href="${pageContext.request.contextPath}/user/uperson">修改信息</a>
            </li>
            <li role="presentation" class="active">
              <a href="${pageContext.request.contextPath}/user/uep">投稿</a>
            </li>
            <li role="presentation">
              <a href="${pageContext.request.contextPath}/user/umessage">消息</a>
            </li>
            <li role="presentation">
              <a href="${pageContext.request.contextPath}/user/ucollect">收藏</a>
            </li>
            <li role="presentation">
              <a href="${pageContext.request.contextPath}/user/uhistory">历史</a>
            </li>
          </ul>
          <ul class="nav navbar-nav nav-pills navbar-right">
            <li role="presentation">
              <a href="${pageContext.request.contextPath}/user/ufollow">关注</a>
            </li>
            <li role="presentation">
              <a href="${pageContext.request.contextPath}/user/ufollow">粉丝</a>
            </li>
          </ul>
        </nav>
    </div><!-- nav2 -->
    <div class="container">
    <!-- main -->
    <div class="row" id="upload">
      <h3>我要修改</h3>
      <hr />
    </div>
    <div class="row placeholders">
      <form id="uploadform" class="form-horizontal" onsubmit="return false" enctype="multipart/form-data">
          <input type="hidden" name="vid" value="${video0.vid }"> 
          <div class="form-group">
            <label for="vimg" class="col-sm-2 control-label">视频封面</label>
            <div class="col-sm-10">
              <input type="file" id="vimg" name="vimg">
              <p>·建议上传高清封面</p>
            </div>
          </div>
          
          <div class="form-group">
            <label for="title" class="col-sm-2 control-label">视频大标题</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="title" name="title" value="${video0.title }">
              <p>·标题长度在72字内</p>
            </div>
          </div>
          
           
          <div class="form-group">
            <label for="sign" class="col-sm-2 control-label">分区</label>
            <div class="col-sm-10">
              <select class="form-control" id="channel" name="channel">
				  <option>${video0.aid.channel }</option>
				  <option>音乐</option>
				  <option>舞蹈</option>
				  <option>游戏</option>
				  <option>科技</option>
				  <option>生活</option>
				  <option>娱乐</option>
				  <option>影视</option>
			  </select>
            </div>
          </div>

          <div class="form-group">
            <label for="sign" class="col-sm-2 control-label">子分区</label>
            <div class="col-sm-10">
              <select class="form-control" id="aid" name="aid">
                <option>${video0.aid.aid }</option>
			  </select>
			  
            </div>
          </div>
          <div class="form-group">
            <label for="tag" class="col-sm-2 control-label">标签</label>
            <div class="col-sm-10">
            	<c:forEach items="${tag0}" var="t">	
		        	<span><a class="badge1" onclick="downtag('${t.tid }')">${t.tagname }</a></span>
		        </c:forEach>
				<input type="text" class="form-control" id="tagname" name="tagname" placeholder="自定义标签">
            </div>
          </div>

          <div class="form-group">
            <label for="subtitle" class="col-sm-2 control-label">视频简介</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="subtitle" name="subtitle"  value="${video0.subtitle }">
              <p>·标题长度在72字内</p>
            </div>
          </div>
          <div class="form-group">
            <label for="content" class="col-sm-2 control-label">视频介绍</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="content" name="content" value="${video0.content }">
              <p>·标题长度在72字内</p>
            </div>
          </div>

          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <button id="uploadclick" type="button" class="btn btn-primary">提交</button>
            </div>
          </div>
        </form>  
        <form id="" class="form-horizontal" onsubmit="return false" enctype="multipart/form-data">
        <c:forEach items="${ep0}" var="e">
          <div class="form-group">
            <label for="filename" class="col-sm-2 control-label">视频标题</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="filename" name="filename" value="${e.filename }">
              <p>${e.file }</p>
            </div>
          </div>
        
          <div class="form-group">
            <div class="pull-right">
              <button id="" type="button" class="btn btn-primary">提交</button>
            </div>
          </div>
          </c:forEach>
        </form> 
      </div><!-- main -->
        
      <!-- FOOTER -->
      <footer>
        <p class="pull-right fix"><a href="">返回顶部</a></p>
        <p>&copy; 2018 上海海事大学. &middot; 陶媛 &middot; 毕业设计</p>
      </footer>
      <script type="text/javascript">
    
    $("#channel").change(function(){
		var channel = $("#channel").val();
		var aid;
		var data={
				channel:channel,
		};
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/user/dochange",
			data:JSON.stringify(data),
			contentType:"application/json",
			success:function(data){		
				$("#aid").empty();
				for(var i = 0; i < data.length; i++){
					$("#aid").append("<option  value='" + data[i].aid + "'>" + data[i].aid + "</option>");
				}
			}
		})
    });
    
    $("#uploadclick").on("click",function(){	
		var formData = new FormData($("#uploadform")[0]);
		
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/user/doep",
			data:formData,
			contentType: false,  
            processData: false,
			success:function(result){
				alert(result.message);
				window.location.href = "${pageContext.request.contextPath}/user/uep";
			}
		})
		
	});
    
	function downtag(tid){
		var tid=tid;
		if(confirm("确认要删除标签吗？")){
			var data={
					tid:tid,
			};
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/user/downtag",
				data:JSON.stringify(data),
				contentType:"application/json",
				success:function(data){		
					alert(data.message);
					window.location.reload();
				}
			});
		};
		
    }
	</script>
    </div>
  </body>
</html>