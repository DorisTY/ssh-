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
            <li role="presentation"  class="active">
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
      <!-- sidebar -->
      <div class="col-md-2 sidebar border2">
        <ul class="nav nav-sidebar nav-tabs">
          <li class="active"><a href="#info">系统消息<span class="sr-only">(current)</span></a></li>
          <li><a href="#message">我的消息</a></li>
        </ul>
      </div><!-- sidebar -->
      
      <!-- main -->
      <div class="col-md-10 main">
        <div class="row" id="info">
          <h3>公告</h3>
          <hr />
          <c:forEach items="${message3}" var="m3">
          <div class="border5">
            <p class="pull-right">${m3.message_time }</p>
            <p><strong>${m3.mtitle }</strong></p>
            <p>${m3.mtext }</p>
          </div>
          </c:forEach>
          <c:forEach items="${message1}" var="m1">
          <div class="border5">
            <p class="pull-right">${m1.message_time }</p>
            <p><strong>${m1.mtitle }</strong></p>
            <p>${m1.mtext }</p>
          </div>
          </c:forEach>
        </div>

        <div class="row" id="message">
          <h3>我的消息</h3>
          <hr />
          <c:forEach items="${message2}" var="m2">
          	<p><strong>${m2.from_user.name }</strong>${m2.mtext }<span class="pull-right">${m2.message_time }</span></p>
		  </c:forEach>
        </div>        
      </div><!-- main -->
        
      <!-- FOOTER -->
      <footer>
        <p class="pull-right fix"><a href="">返回顶部</a></p>
        <p>&copy; 2018 上海海事大学. &middot; 陶媛 &middot; 毕业设计</p>
      </footer>
    </div>
  </body>
</html>