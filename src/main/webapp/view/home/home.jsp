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
      <!-- bg -->
	    <div class="container">
	      <div class="jumbotron">
	        <div class="bg2">
	          <div class="font">
	            <div class="col-md-1 border2">
	              <img src="/upload/${user1.uimg }" class="img-responsive img-circle" alt="头像" width="100%">
	            </div>
	            <div class="col-md-8">
	              <h3>${user1.name }</h3>
	              <p><small>${user1.signature }</small></p>
	            </div>
	          </div>
	        </div><!-- bg2 -->
	      </div><!-- jumbotron -->
	    </div><!-- bg -->
	    
      <!-- 投稿 -->
      <div class="row">
        <h2><a href="javascript:void(0);" onclick="hid1()">她的投稿</a></h2>
        <hr />
        <div id="hid01" >
        <c:forEach items="${video1}" var="v">
        <div class="col-md-3 ">
          <div class="thumbnail " style="weight:213px;height:215px;overflow:hidden;">
            <img src="/upload/${v.vimg }" class="img-responsive img-rounded" alt="155*90" width="100%">
            <h4><a href="${pageContext.request.contextPath}/home/watchvideo?vid=${v.vid }">${v.title }</a></h4>
            <p>
              <span><small>收藏量${v.watch.favortime }&nbsp</small></span>
              <span><small>评论${v.watch.commenttime }</small></span>
            </p>
          </div><!-- thumbnail -->
        </div><!-- col-md-3 -->
        </c:forEach>
        </div>
      </div><!-- 投稿 -->

      <!-- 收藏 -->
      <div class="row">
        <h2><a href="javascript:void(0);" onclick="hid2()">她的收藏</a></h2>
        <hr />
        <div id="hid02" >
        <c:forEach items="${collect1}" var="c">
        <div class="col-md-3 ">
          <div class="thumbnail ">
            <h4 class=""><a href="${pageContext.request.contextPath}/user/ucollect?cid=${c.cid }">${c.collectname }</a></h4>
          </div><!-- thumbnail -->
        </div><!-- col-md-3 -->
        </c:forEach>
        </div>
      </div><!-- 收藏 -->

      <!-- 历史 -->
      <div class="row">
        <h2><a href="javascript:void(0);" onclick="hid3()">她的历史</a></h2>
        <hr />
        <div id="hid03" >
        <c:forEach items="${history1}" var="h">
        <div class="col-md-3 ">
          <div class="thumbnail " style="weight:213px;height:215px;overflow:hidden;">
            <img src="/upload/${h.video.vimg}" class="img-responsive img-rounded" alt="155*90" width="100%">
            <h4><a href="${pageContext.request.contextPath}/home/watchvideo?vid=${h.video.vid}">${h.video.title }</a></h4>
            <p>
              <span><small>观看于${h.view_time }</small></span>
            </p>
          </div><!-- thumbnail -->
        </div><!-- col-md-3 -->
        </c:forEach>
        </div>
      </div><!-- 历史 -->

      <!-- FOOTER -->
      <footer>
        <p class="pull-right fix"><a href="">返回顶部</a></p>
        <p>&copy; 2018 上海海事大学. &middot; 陶媛 &middot; 毕业设计</p>
      </footer>
    </div>
    
    <script type="text/javascript">
    	function hid1(){
    		if(document.getElementById("hid01").style.display=="none"){
    			document.getElementById("hid01").style.display="";
    		}else{
    			document.getElementById("hid01").style.display="none";
    		}
    		
    	}
    	function hid2(){
    		if(document.getElementById("hid02").style.display=="none"){
    			document.getElementById("hid02").style.display="";
    		}else{
    			document.getElementById("hid02").style.display="none";
    		}
    		
    	}
    	function hid3(){
    		if(document.getElementById("hid03").style.display=="none"){
    			document.getElementById("hid03").style.display="";
    		}else{
    			document.getElementById("hid03").style.display="none";
    		}
    		
    	}
    </script>
  </body>
</html>