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
          <li class="active"><a href="${pageContext.request.contextPath}/admin/auser">用户信息<span class="sr-only">(current)</span></a></li>
          <li><a href="${pageContext.request.contextPath}/admin/avideo">视频审核</a></li>
          <li><a href="${pageContext.request.contextPath}/admin/acomment">评论管理</a></li>
        </ul>
      </div><!-- sidebar -->
      
      <!-- search -->
      <div class="border2" align="center">
        <form class="form-inline" role="search" method="POST" action="${pageContext.request.contextPath}/admin/auser">
          <div class="form-group">
            <input type="text" name="name" class="form-control" placeholder="搜索..用户名...">
          </div>
            <button type="submit" class="btn btn-primary">搜索</button>
        </form>
      </div>
      
      <!-- main -->
      <div class="col-md-10 main">
        <div class="pull-right">
	      <a href="${pageContext.request.contextPath}/admin/auser?ustatus=0">已注册</a>
	      <a href="${pageContext.request.contextPath}/admin/auser?ustatus=1">已注销</a>
	    </div>
        <h3>用户信息</h3>
        <hr />
        <div class="row">
        	<button type="button" class="btn btn-success btn-sm pull-right" data-toggle="modal" data-target="#myModal1">发公告</button>
        </div>
        <!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						发公告
					</h4>
				</div>
				<div class="modal-body">
				  <div class="form-group form-inline">
				    <input type="text" id="mtitle" class="form-control" placeholder="公告名">
				  </div>
				  <div class="form-group">
				    <textarea rows="3" id="mtext" class="form-control" placeholder="公告内容">
				    </textarea>
				  </div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="dopublish()">
						发布
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	
        <c:forEach items="${user1 }" var="u">
        <div class="row">
         <div class="col-md-1" >
            <img src="/upload/${u.uimg }" class="img-responsive img-circle" alt="300*300" width="50">
          </div><!-- col-md-1 -->
          <div class="col-md-8">
            <p><strong>${u.name }</strong></p>
            <p>${u.signature }</p>
          </div><!-- col-md-8 -->
          <div class="col-md-3">
            <button type="button" class="btn btn-danger btn-sm" onclick="dodown('${u.uid }')">注销</button>
            <button type="button" class="btn btn-warning btn-sm" onclick="doreset('${u.uid }')">恢复</button>
          </div><!-- col-md-3 -->
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
    	function dodown(uid){
    		var uid=uid;
    		var data={uid:uid};
    		$.ajax({
    			type:"POST",
    			url:"${pageContext.request.contextPath}/admin/dodown",
    			data:JSON.stringify(data),
				contentType:"application/json",
    			success:function(result){
    				alert(result.message);
    				window.location.reload();
    			}
    		});
    	}
    	
    	function doreset(uid){
    		var uid=uid;
    		var data={uid:uid};
    		$.ajax({
    			type:"POST",
    			url:"${pageContext.request.contextPath}/admin/doreset",
    			data:JSON.stringify(data),
				contentType:"application/json",
    			success:function(result){
    				alert(result.message);
    				window.location.reload();
    			}
    		});
    	}
    	
    	function dopublish(){
    		var mtitle = $("#mtitle").val();
    		var mtext = $("#mtext").val();
    		var data={
    				mtitle:mtitle,
    				mtext:mtext,
    				};
    		
    		$.ajax({
    			type:"POST",
    			url:"${pageContext.request.contextPath}/admin/dopublish",
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