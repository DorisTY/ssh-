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
          <li><a href="${pageContext.request.contextPath}/admin/avideo">视频审核</a></li>
          <li class="active"><a href="${pageContext.request.contextPath}/admin/acomment">评论管理<span class="sr-only">(current)</span></a></li>
        </ul>
      </div><!-- sidebar -->
      
      <!-- search -->
      <div class="border2" align="center">
        <form class="form-inline" role="search" method="POST" action="${pageContext.request.contextPath}/admin/acomment">
          <div class="form-group">
            <input type="text" name="name" class="form-control" placeholder="搜索..用户名...">
          </div>
            <button type="submit" class="btn btn-primary">搜索</button>
        </form>
      </div>
      
      <!-- main -->
      <div class="col-md-10 main">
        <div class="pull-right">
	      <a href="${pageContext.request.contextPath}/admin/acomment?istatus=0&rstatus=0">未删除</a>
	      <a href="${pageContext.request.contextPath}/admin/acomment?istatus=1&rstatus=1">已删除</a>
	    </div>
        <h3>评论管理</h3>
        <hr />
      	<c:forEach items="${comment0 }" var="i">
        <div class="row">
          <div class="col-md-10">
            <p><strong>${i.user.name }</strong>对<strong>${i.video.title }</strong>的评论</p>
            <p>${i.info}</p>
            <p class="text-right">${i.info_time }</p>
          </div><!-- col-md-10 -->
          <div class="col-md-2">
            <button type="button" class="btn btn-danger btn-sm" onclick="dodown1('${i.iid }')">删除</button>
            <button type="button" class="btn btn-warning btn-sm" onclick="doreset1('${i.iid }')">恢复</button>
          </div><!-- col-md-2 -->
        </div><!-- row -->
        </c:forEach>
        <c:forEach items="${reply0 }" var="r">
        <div class="row">
          <div class="col-md-10">
            <p><strong>${r.from_user.name }</strong>回复<strong>${r.to_user.name }</strong>的评论</p>
            <p>${r.tip }</p>
            <p class="text-right">${r.tip_time }</p>
          </div><!-- col-md-10 -->
          <div class="col-md-2">
            <button type="button" class="btn btn-danger btn-sm" onclick="dodown2('${r.rid }')">删除</button>
            <button type="button" class="btn btn-warning btn-sm" onclick="doreset2('${r.rid }')">恢复</button>
          </div><!-- col-md-2 -->
        </div><!-- row -->
		
		</c:forEach>

      </div><!-- main -->
        
      <!-- FOOTER -->
      <footer>
        <p class="pull-right fix"><a href="">返回顶部</a></p>
        <p>&copy; 2018 上海海事大学. &middot; 陶媛 &middot; 毕业设计</p>
      </footer>
      <script type="text/javascript">
    	function dodown1(iid){
    		var iid=iid;
    		var data={iid:iid};
    		$.ajax({
    			type:"POST",
    			url:"${pageContext.request.contextPath}/admin/dodown2",
    			data:JSON.stringify(data),
				contentType:"application/json",
    			success:function(result){
    				alert(result.message);
    				window.location.reload();
    			}
    		});
    	}
    	
    	function doreset1(iid){
    		var iid=iid;
    		var data={iid:iid};
    		$.ajax({
    			type:"POST",
    			url:"${pageContext.request.contextPath}/admin/doreset2",
    			data:JSON.stringify(data),
				contentType:"application/json",
    			success:function(result){
    				alert(result.message);
    				window.location.reload();
    			}
    		});
    	}
    	
    	function dodown2(rid){
    		var rid=rid;
    		var data={rid:rid};
    		$.ajax({
    			type:"POST",
    			url:"${pageContext.request.contextPath}/admin/dodown3",
    			data:JSON.stringify(data),
				contentType:"application/json",
    			success:function(result){
    				alert(result.message);
    				window.location.reload();
    			}
    		});
    	}
    	
    	function doreset2(rid){
    		var rid=rid;
    		var data={rid:rid};
    		$.ajax({
    			type:"POST",
    			url:"${pageContext.request.contextPath}/admin/doreset3",
    			data:JSON.stringify(data),
				contentType:"application/json",
    			success:function(result){
    				alert(result.message);
    				window.location.reload();
    			}
    		});
    	}
    </script>
    </div>
  </body>
</html>