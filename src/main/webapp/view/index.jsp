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
  	<jsp:include   page="head1.jsp" flush="true"/>
    <div class="container">
      <!-- 推送 -->
      <div class="row ">
        <!-- 推广 -->
        <div class="col-xs-6">
          <h2>推广<small>Suggest</small></h2>
          <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
              <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
              <li data-target="#myCarousel" data-slide-to="1"></li>
              <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
              <c:forEach items="${tuiguang}" var="t">
              <div id="tuiguang" class="item">
                <img src="/upload/${t.vimg}" class="img-responsive img-thumbnail" alt="555*200" width="100%">
              </div>
              </c:forEach>
            </div><!-- Wrapper for slides -->
          </div>
        </div><!-- 推广 -->
        <!-- 公告 -->
        <div class="col-xs-6">
          <h2>公告 <small>Notice</small></h2>
          <div class="list-group border3">
          <c:forEach items="${message0}" var="m">
            <a href="${pageContext.request.contextPath}/user/umessage" class="list-group-item">${m.mtitle }</a>
            </c:forEach>
            <a href="${pageContext.request.contextPath}/user/umessage" class="list-group-item list-group-item-info">
              <p class="list-group-item-text text-center">...</p>
            </a>
          </div>
        </div> <!-- 公告 -->
      </div><!-- 推送 -->

      <!-- 音乐 -->
      <div class="row">
        <div class="col-xs-8">
          <div class="border1">
            <h2 style="display: inline">音乐<small>Music</small><a id="music"></a></h2>
            <div class="btn-group pull-right" role="group" >
              <button type="button" class="btn btn-success btn-sm">刷新</button>
              <button onclick="window.location.href='${pageContext.request.contextPath}/home/details?channel=音乐'" type="button" class="btn btn-primary btn-sm">更多</button>
            </div>
          </div>
          
          <div class="row">
            <c:forEach items="${video1}" var="v">
            <div class="col-md-3 ">
              <div class="thumbnail ">
                <img src="/upload/${v.vimg }" class="img-responsive img-rounded" alt="155*90" width="100%">
                <h5><a onclick="newhistory('${v.vid }')" href="${pageContext.request.contextPath}/home/watchvideo?vid=${v.vid }">${v.title }</a></h5>
                <p>
                  <span><small>收藏量${v.watch.favortime }</small>&nbsp</span>
                  <span><small>评论${v.watch.commenttime }</small></span> 
                </p>
              </div><!-- thumbnail -->
            </div><!-- col-md-3 -->
            </c:forEach>
          </div><!-- row -->
        </div><!-- col-xs-8 -->

        <div class="col-xs-4">
          <h2>排行榜<small>Top</small></h2>
          <div class="list-group border3">
            <ul class="list-group-item border3">
            <c:forEach items="${order1}" var="o">
              <a href="${pageContext.request.contextPath}/home/watchvideo?vid=${o.vid }" class="list-group-item ">
                <li>${o.title}</li>
              </a>
              </c:forEach>
              <a href="${pageContext.request.contextPath}/home/details?channel=音乐&&order=1" class="list-group-item list-group-item-info">
                <p class="list-group-item-text text-center">...</p>
              </a>
            </ul>
          </div>
        </div><!-- col-xs-4 -->
      </div><!-- 音乐 -->

      <!-- 舞蹈 -->
      <div class="row">
        <div class="col-xs-8">
          <div class="border1">
            <h2 style="display: inline">舞蹈<small>Dance</small><a id="dance"></a></h2>
            <div class="btn-group pull-right" role="group" >
              <button type="button" class="btn btn-success btn-sm">刷新</button>
              <button onclick="window.location.href='${pageContext.request.contextPath}/home/details?channel=舞蹈'" type="button" class="btn btn-primary btn-sm">更多</button>
            </div>
          </div>
          <div class="row">
            <c:forEach items="${video2}" var="v">
            <div class="col-md-3 ">
              <div class="thumbnail ">
                <img src="/upload/${v.vimg }" class="img-responsive img-rounded" alt="155*90" width="100%">
                <h5><a onclick="newhistory('${v.vid }')" href="${pageContext.request.contextPath}/home/watchvideo?vid=${v.vid }">${v.title }</a></h5>
                <p>
                  <span><small>收藏量${v.watch.favortime }</small>&nbsp</span>
                  <span><small>评论${v.watch.commenttime }</small></span> 
                </p>
              </div><!-- thumbnail -->
            </div><!-- col-md-3 -->
            </c:forEach>
          </div><!-- row -->
        </div><!-- col-xs-8 -->
        
        <div class="col-xs-4">
          <h2>排行榜<small>Top</small></h2>
          <div class="list-group border3">
            <ul class="list-group-item border3">
            <c:forEach items="${order2}" var="o">
              <a href="${pageContext.request.contextPath}/home/watchvideo?vid=${o.vid }" class="list-group-item ">
                <li>${o.title}</li>
              </a>
              </c:forEach>
              <a href="${pageContext.request.contextPath}/home/details?channel=舞蹈&&order=1" class="list-group-item list-group-item-info">
                <p class="list-group-item-text text-center">...</p>
              </a>
            </ul>
          </div>
        </div><!-- col-xs-4 --> 
      </div><!-- 舞蹈 -->

      <!-- 游戏 -->
      <div class="row">
        <div class="col-xs-8">
          <div class="border1">
            <h2 style="display: inline">游戏<small>Game</small><a id="game"></a></h2>
            <div class="btn-group pull-right" role="group" >
              <button type="button" class="btn btn-success btn-sm">刷新</button>
              <button onclick="window.location.href='${pageContext.request.contextPath}/home/details?channel=游戏'" type="button" class="btn btn-primary btn-sm">更多</button>
            </div>
          </div>
          <div class="row">
            <c:forEach items="${video3}" var="v">
            <div class="col-md-3 ">
              <div class="thumbnail ">
                <img src="/upload/${v.vimg }" class="img-responsive img-rounded" alt="155*90" width="100%">
                <h5><a onclick="newhistory('${v.vid }')" href="${pageContext.request.contextPath}/home/watchvideo?vid=${v.vid }">${v.title }</a></h5>
                <p>
                  <span><small>收藏量${v.watch.favortime }</small>&nbsp</span>
                  <span><small>评论${v.watch.commenttime }</small></span> 
                </p>
              </div><!-- thumbnail -->
            </div><!-- col-md-3 -->
            </c:forEach>
          </div><!-- row -->
        </div><!-- col-xs-8 -->
        
        <div class="col-xs-4">
          <h2>排行榜<small>Top</small></h2>
          <div class="list-group border3">
            <ul class="list-group-item border3">
            <c:forEach items="${order3}" var="o">
              <a href="${pageContext.request.contextPath}/home/watchvideo?vid=${o.vid }" class="list-group-item ">
                <li>${o.title}</li>
              </a>
              </c:forEach>
              <a href="${pageContext.request.contextPath}/home/details?channel=游戏&&order=1" class="list-group-item list-group-item-info">
                <p class="list-group-item-text text-center">...</p>
              </a>
            </ul>
          </div>
        </div><!-- col-xs-4 -->
      </div><!-- 游戏 -->

      <!-- 科技 -->
      <div class="row">
        <div class="col-xs-8">
          <div class="border1">
            <h2 style="display: inline">科技<small>Technology</small><a id="technology"></a></h2>
            <div class="btn-group pull-right" role="group" >
              <button type="button" class="btn btn-success btn-sm">刷新</button>
              <button onclick="window.location.href='${pageContext.request.contextPath}/home/details?channel=科技'" type="button" class="btn btn-primary btn-sm">更多</button>
            </div>
          </div>
		  <div class="row">
            <c:forEach items="${video4}" var="v">
            <div class="col-md-3 ">
              <div class="thumbnail ">
                <img src="/upload/${v.vimg }" class="img-responsive img-rounded" alt="155*90" width="100%">
                <h5><a onclick="newhistory('${v.vid }')" href="${pageContext.request.contextPath}/home/watchvideo?vid=${v.vid }">${v.title }</a></h5>
                <p>
                  <span><small>收藏量${v.watch.favortime }</small>&nbsp</span>
                  <span><small>评论${v.watch.commenttime }</small></span> 
                </p>
              </div><!-- thumbnail -->
            </div><!-- col-md-3 -->
            </c:forEach>
          </div><!-- row -->
        </div><!-- col-xs-8 -->

        <div class="col-xs-4">
          <h2>排行榜<small>Top</small></h2>
          <div class="list-group border3">
            <ul class="list-group-item border3">
            <c:forEach items="${order4}" var="o">
              <a href="${pageContext.request.contextPath}/home/watchvideo?vid=${o.vid }" class="list-group-item ">
                <li>${o.title}</li>
              </a>
              </c:forEach>
              <a href="${pageContext.request.contextPath}/home/details?channel=科技&&order=1" class="list-group-item list-group-item-info">
                <p class="list-group-item-text text-center">...</p>
              </a>
            </ul>
          </div>
        </div><!-- col-xs-4 -->
      </div><!-- 科技 -->

      <!-- 生活 -->
      <div class="row">
        <div class="col-xs-8">
          <div class="border1">
            <h2 style="display: inline">生活<small>Life</small><a id="life"></a></h2>
            <div class="btn-group pull-right" role="group" >
              <button type="button" class="btn btn-success btn-sm">刷新</button>
              <button onclick="window.location.href='${pageContext.request.contextPath}/home/details?channel=生活'" type="button" class="btn btn-primary btn-sm">更多</button>
            </div>
          </div>
		  <div class="row">
            <c:forEach items="${video5}" var="v">
            <div class="col-md-3 ">
              <div class="thumbnail ">
                <img src="/upload/${v.vimg }" class="img-responsive img-rounded" alt="155*90" width="100%">
                <h5><a onclick="newhistory('${v.vid }')" href="${pageContext.request.contextPath}/home/watchvideo?vid=${v.vid }">${v.title }</a></h5>
                <p>
                  <span><small>收藏量${v.watch.favortime }</small>&nbsp</span>
                  <span><small>评论${v.watch.commenttime }</small></span> 
                </p>
              </div><!-- thumbnail -->
            </div><!-- col-md-3 -->
            </c:forEach>
          </div><!-- row -->
        </div><!-- col-xs-8 -->

        <div class="col-xs-4">
          <h2>排行榜<small>Top</small></h2>
          <div class="list-group border3">
            <ul class="list-group-item border3">
            <c:forEach items="${order5}" var="o">
              <a href="${pageContext.request.contextPath}/home/watchvideo?vid=${o.vid }" class="list-group-item ">
                <li>${o.title}</li>
              </a>
              </c:forEach>
              <a href="${pageContext.request.contextPath}/home/details?channel=生活&&order=1" class="list-group-item list-group-item-info">
                <p class="list-group-item-text text-center">...</p>
              </a>
            </ul>
          </div>
        </div><!-- col-xs-4 -->
      </div><!-- 生活 -->

      <!-- 娱乐 -->
      <div class="row">
        <div class="col-xs-8">
          <div class="border1">
            <h2 style="display: inline">娱乐<small>Entertainment</small><a id="entertainment"></a></h2>
            <div class="btn-group pull-right" role="group" >
              <button type="button" class="btn btn-success btn-sm">刷新</button>
              <button onclick="window.location.href='${pageContext.request.contextPath}/home/details?channel=娱乐'" type="button" class="btn btn-primary btn-sm">更多</button>
            </div>
          </div>
		  <div class="row">
            <c:forEach items="${video6}" var="v">
            <div class="col-md-3 ">
              <div class="thumbnail ">
                <img src="/upload/${v.vimg }" class="img-responsive img-rounded" alt="155*90" width="100%">
                <h5><a onclick="newhistory('${v.vid }')" href="${pageContext.request.contextPath}/home/watchvideo?vid=${v.vid }">${v.title }</a></h5>
                <p>
                  <span><small>收藏量${v.watch.favortime }</small>&nbsp</span>
                  <span><small>评论${v.watch.commenttime }</small></span> 
                </p>
              </div><!-- thumbnail -->
            </div><!-- col-md-3 -->
            </c:forEach>
          </div><!-- row -->
        </div><!-- col-xs-8 -->

        <div class="col-xs-4">
          <h2>排行榜<small>Top</small></h2>
          <div class="list-group border3">
            <ul class="list-group-item border3">
            <c:forEach items="${order6}" var="o">
              <a href="${pageContext.request.contextPath}/home/watchvideo?vid=${o.vid }" class="list-group-item ">
                <li>${o.title}</li>
              </a>
              </c:forEach>
              <a href="${pageContext.request.contextPath}/home/details?channel=娱乐&&order=1" class="list-group-item list-group-item-info">
                <p class="list-group-item-text text-center">...</p>
              </a>
            </ul>
          </div>
        </div><!-- col-xs-4 -->
      </div><!-- 娱乐 -->

      <!-- 影视 -->
      <div class="row">
        <div class="col-xs-8">
          <div class="border1">
            <h2 style="display: inline">影视<small>Tv</small><a id="tv"></a></h2>
            <div class="btn-group pull-right" role="group" >
              <button type="button" class="btn btn-success btn-sm">刷新</button>
              <button onclick="window.location.href='${pageContext.request.contextPath}/home/details?channel=影视'" type="button" class="btn btn-primary btn-sm">更多</button>
            </div>
          </div>
  		  <div class="row">
            <c:forEach items="${video7}" var="v">
            <div class="col-md-3 ">
              <div class="thumbnail ">
                <img src="/upload/${v.vimg }" class="img-responsive img-rounded" alt="155*90" width="100%">
                <h5><a onclick="newhistory('${v.vid }')" href="${pageContext.request.contextPath}/home/watchvideo?vid=${v.vid }">${v.title }</a></h5>
                <p>
                  <span><small>收藏量${v.watch.favortime }</small>&nbsp</span>
                  <span><small>评论${v.watch.commenttime }</small></span> 
                </p>
              </div><!-- thumbnail -->
            </div><!-- col-md-3 -->
            </c:forEach>
          </div><!-- row -->
        </div><!-- col-xs-8 -->

        <div class="col-xs-4">
          <h2>排行榜<small>Top</small></h2>
          <div class="list-group border3">
            <ul class="list-group-item border3">
            <c:forEach items="${order7}" var="o">
              <a href="${pageContext.request.contextPath}/home/watchvideo?vid=${o.vid }" class="list-group-item ">
                <li>${o.title}</li>
              </a>
              </c:forEach>
              <a href="${pageContext.request.contextPath}/home/details?channel=影视&&order=1" class="list-group-item list-group-item-info">
                <p class="list-group-item-text text-center">...</p>
              </a>
            </ul>
          </div>
        </div><!-- col-xs-4 -->
      </div><!-- 影视 -->

      <!-- FOOTER -->
      <footer>
        <p class="pull-right fix"><a href="">返回顶部</a></p>
        <p>&copy; 2018 上海海事大学. &middot; 陶媛 &middot; 毕业设计</p>
      </footer>
    </div>
    
    <script type="text/javascript">
    	function newhistory(vid){
    		var vid=vid;
    		var data={
    				vid:vid,
    		};
    		$.ajax({
    			type:"POST",
    			url:"${pageContext.request.contextPath}/home/newhistory",
    			data:JSON.stringify(data),
    			contentType:"application/json",
    		})
    	}
    	
    	//推广动态
    	document.getElementById("tuiguang").classList.add("active");
    </script>
    
  </body>
</html>