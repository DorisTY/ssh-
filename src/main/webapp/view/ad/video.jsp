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
    <div class="container">
      <!-- sidebar -->
      <div class="col-md-2 sidebar border2">
        <ul class="nav nav-sidebar nav-tabs">
          <li><a href="${pageContext.request.contextPath}/admin/auser">用户信息</a></li>
          <li class="active"><a href="${pageContext.request.contextPath}/admin/avideo">视频审核<span class="sr-only">(current)</span></a></li>
          <li><a href="${pageContext.request.contextPath}/admin/acomment">评论管理</a></li>
        </ul>
      </div><!-- sidebar -->

      <!-- search -->
      <div class="border2" align="center">
        <form class="form-inline" role="search" method="POST" action="${pageContext.request.contextPath}/admin/avideo">
          <div class="form-group">
            <input type="text" name="title" class="form-control" placeholder="搜索。。视频名...">
          </div>
            <button type="submit" class="btn btn-primary">搜索</button>
        </form>
      </div>

      <!-- main -->
      <div class="col-md-10 main">
	    <div class="pull-right">
	      <a href="${pageContext.request.contextPath}/admin/avideo?estatus=0">待审核</a>
	      <a href="${pageContext.request.contextPath}/admin/avideo?estatus=2">已通过</a>
	      <a href="${pageContext.request.contextPath}/admin/avideo?estatus=1">未通过</a>
	      <a href="${pageContext.request.contextPath}/admin/avideo?estatus=3">已删除</a>
	    </div>
        <h3>视频审核</h3>
        <hr />
        <c:forEach items="${ep0 }" var="e">
        <div class="row border1">
          <div class="col-md-10">
            <div class="col-md-6">
              <video width="370" controls="controls">
                <source src="/upload/${e.file }" type="video/mp4">
          	  </video>
            </div>
            <div class="col-md-6">
              <h4><a href="#">${e.filename }</a></h4>
              <p><strong>${e.video.up.name }</strong></p>
              <p>${e.video.title }</p>
              <p>${e.video.subtitle }</p>
            </div>
          </div><!-- col-md-10 -->
          <div class="col-md-2">
            <p><button type="button" class="btn btn-success btn-sm" onclick="dopass('${e.eid }')">通过审核</button></p>
            <p><button type="button" class="btn btn-primary btn-sm" onclick="dodiss('${e.eid }')">未过审核</button></p>
            <p><button type="button" class="btn btn-danger btn-sm" onclick="dodown('${e.eid }')">删除视频</button></p>
            <p><button type="button" class="btn btn-warning btn-sm" onclick="doreset('${e.eid }')">恢复视频</button></p>
          </div><!-- col-md-2 -->          
        </div><!-- row -->
       </c:forEach>
      </div><!-- main -->
        
      <!-- FOOTER -->
      <footer>
        <p class="pull-right fix"><a href="">返回顶部</a></p>
        <p>&copy; 2018 上海海事大学. &middot; 陶媛 &middot; 毕业设计</p>
      </footer>
    </div>
    <script type="text/javascript">
    	function dopass(eid){
    		var eid=eid;
    		var data={eid:eid};
    		$.ajax({
    			type:"POST",
    			url:"${pageContext.request.contextPath}/admin/dopass",
    			data:JSON.stringify(data),
				contentType:"application/json",
    			success:function(result){
    				alert(result.message);
    				window.location.reload();
    			}
    		});
    	}
    	
    	function dodiss(eid){
    		var eid=eid;
    		var data={eid:eid};
    		$.ajax({
    			type:"POST",
    			url:"${pageContext.request.contextPath}/admin/dodiss",
    			data:JSON.stringify(data),
				contentType:"application/json",
    			success:function(result){
    				alert(result.message);
    				window.location.reload();
    			}
    		});
    	}
    	
    	function dodown(eid){
    		var eid=eid;
    		var data={eid:eid};
    		$.ajax({
    			type:"POST",
    			url:"${pageContext.request.contextPath}/admin/dodown1",
    			data:JSON.stringify(data),
				contentType:"application/json",
    			success:function(result){
    				alert(result.message);
    				window.location.reload();
    			}
    		});
    	}
    	
    	function doreset(eid){
    		var eid=eid;
    		var data={eid:eid};
    		$.ajax({
    			type:"POST",
    			url:"${pageContext.request.contextPath}/admin/doreset1",
    			data:JSON.stringify(data),
				contentType:"application/json",
    			success:function(result){
    				alert(result.message);
    				window.location.reload();
    			}
    		});
    	}
    </script>
  </body>
</html>