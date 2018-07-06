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
            <li role="presentation" class="active">
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
      <div class="row">
        <h2>我的收藏</h2>
        <hr />
      </div><!-- 收藏 -->
      <!-- sidebar -->
      <div class="col-md-2 sidebar">
        <ul class="nav nav-sidebar">
          <c:forEach items="${collect0 }" var="c">
          <li><a href="${pageContext.request.contextPath}/user/ucollect?cid=${c.cid }">${c.collectname }</a></li>
          </c:forEach>
        </ul>
        <button type="button" class="btn btn-default btn-sm pull-right" data-toggle="modal" data-target="#myModal">新建收藏夹</button>
        <!-- 模态框（Modal） -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							收藏夹名
						</h4>
					</div>
					<div class="modal-body">
						<input type="text" class="form-control" placeholder="收藏夹名" id="collectname">
					</div>
					<div class="modal-footer">
						<button id="newcollect" type="button" class="btn btn-primary">
							提交更改
						</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
      </div><!-- sidebar -->
      <!-- main -->
      <div class="col-md-10">
        <div class="row">
        
          <h3>${collect1.collectname }</h3>
          <div class="btn-group pull-right" role="group" >
            <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal0">管理</button>
            <button type="button" class="btn btn-default btn-sm"
            onclick="window.location.href='${pageContext.request.contextPath}/user/downcollect?cid=${collect1.cid }'">删除</button>
          </div>
		
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="myModal0" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							收藏夹名
						</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" id="cid" value="${collect1.cid }">
						<input type="text" class="form-control" placeholder="收藏夹名" id="collectname0">
					</div>
					<div class="modal-footer">
						<button id="updatecollect" type="button" class="btn btn-primary">
							提交更改
						</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
        </div><!-- 收藏 -->
        
        
        <div class="row placeholders">
        <c:forEach items="${save0 }" var="s">
          <div class="col-md-3">
              <div class="thumbnail ">
                <img src="/upload/${s.video.vimg }" class="img-responsive img-rounded" alt="155*90" width="100%">
                <h4><a href="${pageContext.request.contextPath}/home/watchvideo?vid=${s.video.vid }">${s.video.title }</a></h4>
                <div class="row">
                  <div class="col-md-8">
                    <span>收藏于${s.save_time }</span>
                  </div>
                  <div class="col-md-4 dropdown">
                    <a href="javascript:void(0);" data-toggle="dropdown">管理</a>
                    <ul class="dropdown-menu">
                      <li><a href="${pageContext.request.contextPath}/user/downsave?sid=${s.sid }">取消收藏</a></li>
                    </ul>
                  </div>
                </div>
              </div><!-- thumbnail -->
            </div><!-- col-md-3 -->
            </c:forEach>
        </div>         
      </div><!-- main -->
        
      <!-- FOOTER -->
      <footer>
        <p class="pull-right fix"><a href="">返回顶部</a></p>
        <p>&copy; 2018 上海海事大学. &middot; 陶媛 &middot; 毕业设计</p>
      </footer>
    </div>
    <script type="text/javascript">
    $("#newcollect").on("click",function(){
		var collectname=$("#collectname").val();
		if(collectname==""){
			alert("请输入收藏夹名");
			}else{
		var data={collectname:collectname};
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/home/newcollect",
			data:JSON.stringify(data),
			contentType:"application/json",
			success:function(result){
				if(result.success == true){
   					alert(result.message);
   					window.location.reload();
   				}else{
   					alert(result.message);
   					window.location.href = "${pageContext.request.contextPath}/login/login";
   				}
			}
		});
		}
	});
    
    $("#updatecollect").on("click",function(){
		var collectname=$("#collectname0").val();
		var cid=$("#cid").val();
		if(collectname==""){
			alert("请输入收藏夹名");
			}else{
		var data={collectname:collectname,
				cid:cid,};
		
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/user/updatecollect",
			data:JSON.stringify(data),
			contentType:"application/json",
			success:function(result){
   				alert(result.message);
   				window.location.reload();
			}
		});
		}
	});
    </script>
  </body>
</html>