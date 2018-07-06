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
      <h3>我的投稿</h3>
      <hr />
    </div>
    <div class="row placeholders">
    <c:forEach items="${video0}" var="v">
      <div class="col-md-3">
          <div class="thumbnail ">
            <img src="/upload/${v.vimg }" class="img-responsive img-rounded" alt="155*90" width="100%">
            <h4><a href="${pageContext.request.contextPath}/home/watchvideo?vid=${v.vid }">${v.title }</a></h4>
            <div class="row">
              <div class="col-md-9">
                <span>点赞量${v.watch.liketime}&nbsp</span>
                <span>收藏量${v.watch.favortime}</span>
              </div>
              <div class="col-md-3 dropdown">
                <a data-toggle="dropdown">管理</a>
                <ul class="dropdown-menu">
                  <li><a  class="btn btn-default" onclick="del()" >删除</a><input type="hidden" id="del" value="${v.vid }"></li>
                  <li><a class="btn btn-default" href="${pageContext.request.contextPath}/user/uep1?vid=${v.vid }">修改</a></li>
                </ul>
              </div>
            </div>
          </div><!-- thumbnail -->
        </div><!-- col-md-3 -->  
        </c:forEach>   
      </div><!-- main -->
        
      <!-- FOOTER -->
      <footer>
        <p class="pull-right fix"><a href="">返回顶部</a></p>
        <p>&copy; 2018 上海海事大学. &middot; 陶媛 &middot; 毕业设计</p>
      </footer>
    </div>
<script type="text/javascript">
    
    
    function del(){	
		var vid = $("#del").val();
		
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/user/dodelete",
			data:{vid:vid},
			dataType: "JSON",  
			success:function(result){
				alert(result.message);
				window.location.reload();
			}
		});
		
	}
    
    
	</script>
  </body>
</html>