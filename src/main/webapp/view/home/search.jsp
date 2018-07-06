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
    <!-- search -->
    <div class="container">
      <div class="border1">
        <form role="search" method="post" action="${pageContext.request.contextPath}/home/search">
          <div class="form-group form-inline" align="center">
            <input id="search" name="key" type="text" class="form-control input-lg" placeholder="搜索..." value="%">
            <button type="submit" class="btn btn-primary btn-lg">搜索</button>
          </div>
            
          <div id="collect0" class="form-group">
            <label for="1">分区</label>
		    <label class="btn btn-default">
		      <input id="1" type="radio"  name="collect1" value="%" checked="checked"> 综合
		    </label>
		    <label class="btn btn-default">
		      <input type="radio"  name="collect1" value="音乐"> 音乐
		    </label>
		    <label class="btn btn-default">
		      <input type="radio"  name="collect1" value="舞蹈"> 舞蹈
		    </label>
		    <label class="btn btn-default">
		      <input type="radio"  name="collect1" value="游戏"> 游戏
		    </label>  
		    <label class="btn btn-default">
		      <input type="radio"  name="collect1" value="科技"> 科技
		    </label>
		    <label class="btn btn-default">
		      <input type="radio"  name="collect1" value="生活"> 生活
		    </label>
		    <label class="btn btn-default">
		      <input type="radio"  name="collect1" value="娱乐"> 娱乐
		    </label>
		    <label class="btn btn-default">
		      <input type="radio"  name="collect1" value="影视"> 影视
		    </label>
		   </div>
		   <div id="order0" class="form-group">
		    <label for="2">排序</label>
		    <label class="btn btn-default">
		      <input id="2" type="radio"  name="order" value="0" checked="checked"> 最新发布
		    </label>
		    <label class="btn btn-default">
		      <input type="radio"  name="order" value="1"> 最多收藏
		    </label>
		    <label class="btn btn-default">
		      <input type="radio"  name="order" value="2"> 最多点赞
		    </label>
		   </div>
        </form>
      </div>
    </div><!-- search -->

    <!-- 内容 -->
    <div class="container">
      <c:forEach items="${video0 }" var="v">
      <div class="row border3 border2">
        <div class="col-md-2">
            <img src="/upload/${v.vimg }" class="img-responsive img-rounded border1" alt="155*90" width="100%">
          </div>
          <div class="col-md-10">
            <h4><a href="${pageContext.request.contextPath}/home/watchvideo?vid=${v.vid }">${v.title }</a></h4>
            <p>${v.subtitle }</p>
            <p>
              <span> 收藏量${v.watch.favortime }&nbsp&nbsp</span>
              <span> 评论数${v.watch.commenttime }&nbsp&nbsp</span> 
              <span> 点赞数${v.watch.liketime }&nbsp&nbsp</span>
              <span> <a href="${pageContext.request.contextPath}/home/userhome?uid1=${v.up.uid }">${v.up.name }</a></span>
            </p>
          </div> 
      </div><!-- row -->
     </c:forEach>
     
    </div><!-- 内容 -->

    <!-- 分页 
    <div class="row">
        <div class="col-md-6 col-md-offset-8" >
        <nav aria-label="Page navigation pagination-sm">
          <ul class="pagination">
            <li>
              <a href="javascript:void(0);" onclick="next()" aria-label="Previous">
                <span aria-hidden="true">&laquo;首页</span>
              </a>
            </li>
            <li><a href="javascript:void(0);" onclick="next('${PageNo }')">下一页</a></li>
            <li>
              <a href="javascript:void(0);" onclick="next('${PageCount }')" aria-label="Next">
                <span aria-hidden="true">尾页&raquo;</span>
              </a>
            </li>
          </ul>
          <span>当前第${CurrentPage }页,共${PageCount }页</span>
        </nav>
      </div>
     </div><!-- 分页 -->

	<script type="text/javascript">
	 function next(){
		 var key = $("#search").val();
		 var collect1 = $("input[name='collect1']:checked").val();
		 var order = $("input[name='order']:checked").val();
	     var PageNo = 1;
	     window.location.href="${pageContext.request.contextPath}/home/search?key="+key+"&collect1="+collect1+"&order="+order;
	  }
	</script>
    <footer class="container">
      <p class="pull-right fix"><a href="">返回顶部</a></p>
      <p>&copy; 2018 上海海事大学. &middot; 陶媛 &middot; 毕业设计</p>
    </footer>

  </body>
</html>