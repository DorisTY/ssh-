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
            <li role="presentation">
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
            <li role="presentation" class="active">
              <a href="${pageContext.request.contextPath}/user/ufollow">关注</a>
            </li>
            <li role="presentation">
              <a href="${pageContext.request.contextPath}/user/ufollow">粉丝</a>
            </li>
          </ul>
        </nav>
    </div><!-- nav2 -->
    <div class="container">
      <!-- sidebar -->
      <div class="col-md-2 sidebar border2">
        <ul class="nav nav-sidebar nav-tabs">
          <li class="active"><a href="#following">我的关注 <span class="sr-only">(current)</span></a></li>
          <li><a href="#follower">我的粉丝</a></li>
        </ul>
      </div><!-- sidebar -->
      
      <!-- main -->
      <div class="col-md-10">
        <div class="row" id="following">
          <h3>我的关注</h3>
          <hr />
          <c:forEach items="${follow0 }" var="f0">
          <div class="row">
            <div class="col-md-1" >
              <img src="/upload/${f0.to_user.uimg }" class="img-responsive img-circle" alt="300*300" width="50">
            </div><!-- col-md-1 -->
            <div class="col-md-9">
              <p><strong><a href="${pageContext.request.contextPath}/home/userhome?uid1=${f0.to_user.uid }">${f0.to_user.name }</a></strong></p>
              <p>${f0.to_user.signature }</p>
            </div><!-- col-md-9 -->
            <div class="col-md-2">
              <!-- Single button -->
              <div class="btn-group">
                <button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  已关注 <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                  <li><a href="${pageContext.request.contextPath}/user/downfollow?fid=${f0.fid}">取消关注</a></li>
                </ul>
              </div>
            </div><!-- col-md-2 -->
          </div><!-- row -->
          </c:forEach>
        </div>
        <div class="row" id="follower">
          <h3>我的粉丝</h3>
          <hr />
          <c:forEach items="${follow2 }" var="f2">
          <div class="row">
            <div class="col-md-1" >
              <img src="/upload/${f2.from_user.uimg }" class="img-responsive img-circle" alt="300*300" width="50">
            </div><!-- col-md-1 -->
            <div class="col-md-9">
              <p><strong><a href="${pageContext.request.contextPath}/home/userhome?uid1=${f2.to_user.uid }">${f2.from_user.name }</a></strong></p>
              <p>${f2.from_user.signature }</p>
            </div><!-- col-md-9 -->
            <div class="col-md-2">
              <!-- Single button -->
              <div class="btn-group">
                <button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  相互关注 <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                  <li><a href="${pageContext.request.contextPath}/user/downfollow?fid=${f2.fid}">取消关注</a></li>
                </ul>
              </div>
            </div><!-- col-md-2 -->
          </div><!-- row -->
          </c:forEach>
          
          <c:forEach items="${follow1 }" var="f1">
          <div class="row">
            <div class="col-md-1" >
              <img src="/upload/${f1.from_user.uimg }" class="img-responsive img-circle" alt="300*300" width="50">
            </div><!-- col-md-1 -->
            <div class="col-md-9">
              <p><strong><a href="${pageContext.request.contextPath}/home/userhome?uid1=${f1.to_user.uid }">${f1.from_user.name }</a></strong></p>
              <p>${f1.from_user.signature }</p>
            </div><!-- col-md-9 -->
            <div class="col-md-2">
              <!-- Single button -->
              <div class="btn-group">
                <button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  未关注 <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                  <li><a href="JavaScript:void(0)" onclick="follow('${f1.from_user.uid }')">关注</a></li>
                </ul>
              </div>
            </div><!-- col-md-2 -->
          </div><!-- row -->
          </c:forEach>
          
        </div>


      </div><!-- main -->
        
      <!-- FOOTER -->
      <footer>
        <p class="pull-right fix"><a href="">返回顶部</a></p>
        <p>&copy; 2018 上海海事大学. &middot; 陶媛 &middot; 毕业设计</p>
      </footer>
      
      <script type="text/javascript">
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
     				window.location.reload();
     			}
     		});
     	};
      </script>
    </div>
  </body>
</html>