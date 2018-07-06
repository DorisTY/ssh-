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
      <!-- 小标题 -->
      <div class="border1">
        <ul class="nav nav-tabs">
          <c:forEach items="${address0}" var="a">	
            <li role="presentation"><a href="#">${a.aid }</a></li>
          </c:forEach>
        </ul>
      </div><!-- 小标题 -->

      <!-- 标签 -->
      <div class="">
        <span class="label label-default">标签</span>
        <c:forEach items="${tag0}" var="t">	
        <span><a class="badge1">${t.tagname }</a></span>
        </c:forEach>
      </div><!-- 标签 -->

      <!-- 标题 -->
      <div class="border1">
        <h2 style="display: inline">${channel }</h2>
        <div class="btn-group pull-right" role="group" >
        <button type="button" class="btn btn-default btn-sm"
        onclick="window.location.href='${pageContext.request.contextPath}/home/details?channel=${channel }&&order=0'">投稿时间排序</button>
        <button type="button" class="btn btn-default btn-sm"
        onclick="window.location.href='${pageContext.request.contextPath}/home/details?channel=${channel }&&order=1'">视频热度排序</button>
        </div>
      </div><!-- 标题 -->

      <!-- 内容 -->
      <div class="row">
      	<c:forEach items="${video1}" var="v">	
        <div class="col-md-6">
          <div class="col-md-5">
            <img src="/upload/${v.vimg }" class="img-responsive img-rounded border1" alt="155*90" width="100%">
          </div>
          <div class="col-md-7">
            <h4><a href="${pageContext.request.contextPath}/home/watchvideo?vid=${v.vid }">${v.title }</a>
              <span class="pull-right"><small>${v.aid.aid }</small></span>
            </h4>
            <p>${v.subtitle }</p>
            <p>
              <span>${v.up.name } &nbsp</span>
              <span>收藏量${v.watch.favortime }&nbsp</span>
              <span>喜欢${v.watch.liketime }&nbsp</span>
              <span>评论${v.watch.commenttime }</span> 
            </p>
          </div>
        </div><!-- col-md-6 -->
		</c:forEach>
      </div><!-- 内容 -->
        
       <div class="row">
        <div class="col-md-6 col-md-offset-8" >
        <nav aria-label="Page navigation pagination-sm">
          <ul class="pagination">
            <li>
              <a href="javascript:void(0);" onclick="next('${channel}',1)" aria-label="Previous">
                <span aria-hidden="true">&laquo;首页</span>
              </a>
            </li>
            <li><a href="javascript:void(0);" onclick="next('${channel}','${PageNo }')">下一页</a></li>
            <li>
              <a href="javascript:void(0);" onclick="next('${channel}','${PageCount }')" aria-label="Next">
                <span aria-hidden="true">尾页&raquo;</span>
              </a>
            </li>
          </ul>
          <span>当前第${CurrentPage }页,共${PageCount }页</span>
        </nav>
      </div>
     </div>
        
      <!-- FOOTER -->
      <footer>
        <p class="pull-right fix"><a href="">返回顶部</a></p>
        <p>&copy; 2018 上海海事大学. &middot; 陶媛 &middot; 毕业设计</p>
      </footer>
    </div><!-- container -->
    <script type="text/javascript">
    
    function next(channel,PageNo){
    	var channel = channel;
    	var PageNo = PageNo;
    	window.location.href="${pageContext.request.contextPath}/home/details?channel="+channel+"&&PageNo="+PageNo;
    }
    </script>
  </body>
</html>