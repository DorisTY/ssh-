<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8"%>
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

    <!-- Bootstrap 
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/self.css" rel="stylesheet"> -->


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) 
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script> -->
    <!-- Include all compiled plugins (below), or include individual files as needed 
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> -->

  </head>

  <body>
    <!-- head -->
    <div class="bg1">
      <div class="container-fluid">
        <!-- nav1 -->
        <nav class="navbar navbar-inverse">
          <div class="container-fluid ">
            <!-- header -->
            <div class="navbar-header">
               <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="${pageContext.request.contextPath}/login/index">E R</a>
            </div><!-- header -->

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="${pageContext.request.contextPath}/login/login">Welcome to ER<span class="sr-only">(current)</span></a></li>
                <li>
                  <img src="/upload/${user0.uimg }" class="img-responsive img-circle" alt="300*300" width="50">
                </li>
                <li class="dropdown">
                  <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${user} <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="${pageContext.request.contextPath}/user/uhome">个人中心</a></li>
                    <li role="separator" class="divider"></li>
                    <li><a href="${pageContext.request.contextPath}/user/umessage">消息</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/ucollect">收藏</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/uhistory">历史</a></li>
                    <li role="separator" class="divider"></li>
                    <li><a href="${pageContext.request.contextPath}/login/down">退出</a></li>
                  </ul>
                </li>
                <li><a href="${pageContext.request.contextPath}/user/upload">投稿 </a></li>
              </ul>
            </div><!-- /.navbar-collapse -->
          </div><!-- fluid -->
        </nav><!-- nav1 -->
      </div><!-- fluid -->
      
      <!-- search -->
      <div class="container">
        <div class="col-md-4 col-md-offset-8">
        	<button  class="btn btn-primary" onclick="window.location.href='${pageContext.request.contextPath}/home/search'">前往搜索</button>
        </div>
      </div><!-- search -->
    </div><!-- head -->

    <!-- nav2 -->
    <div class="container">
      <nav class="border1">
        <ul class="nav nav-pills">
          <li role="presentation" class="active"><a href="#">首页</a></li>
          <li role="presentation">
            <a href="#music">音乐</a>
          </li>
          <li role="presentation">
            <a href="#dance">舞蹈</a>
          </li>
          <li role="presentation">
            <a href="#game">游戏</a>
          </li>
          <li role="presentation">
            <a href="#technology">科技</a>
          </li>
          <li role="presentation">
            <a href="#life">生活</a>
          </li>
          <li role="presentation">
            <a href="#entertainment">娱乐</a>
          </li>
          <li role="presentation">
            <a href="#tv">影视</a>
          </li>
        </ul>
      </nav>
    </div><!-- nav2 -->
  </body>
</html>