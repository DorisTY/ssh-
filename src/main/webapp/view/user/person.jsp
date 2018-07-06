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
            <li role="presentation"  class="active">
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
      <div class="row" id="info">
          <h3>修改信息</h3>
          <hr />
          <div>
            <form id="person" class="form-horizontal" onsubmit="return false" enctype="multipart/form-data">
              <div class="form-group form-inline">
                <label for="name" class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="name" name="name" placeholder="Name" value="${user0.name }">
                </div>
              </div>
              <div class="form-group">
                <label for="email" class="col-sm-2 control-label">Email</label>
                <div class="col-sm-10">
                  <input type="email" class="form-control" id="email" name="email" placeholder="Email" value="${user0.email }">
                </div>
              </div>
              <div class="form-group form-inline">
                <label for="password1" class="col-sm-2 control-label">修改密码</label>
                <div class="col-sm-10">
                  <input type="password" class="form-control" id="password1" name="password1" placeholder="Password" value="${user0.password }">
                </div>
              </div>
              <div class="form-group form-inline">
                <label for="password2" class="col-sm-2 control-label">确认密码</label>
                <div class="col-sm-10">
                  <input type="password" class="form-control" id="password" name="password" placeholder="Password" value="${user0.password }">
                </div>
              </div>
              <div class="form-group form-inline">
                <label for="sex" class="col-sm-2 control-label">性别</label>
                <div class="col-sm-10">
                  <select class="form-control" id="sex" name="sex">
                    <option>男</option>
                    <option>女</option>
                  </select>
                </div>
              </div>
              <div class="form-group form-inline">
                <label for="location" class="col-sm-2 control-label">城市</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="location" name="location" placeholder="城市" value="${user0.location }">
                </div>
              </div>
              <div class="form-group">
                <label for="sign" class="col-sm-2 control-label">个性签名</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="signature" name="signature" placeholder="个性签名不超过72个字" value="${user0.signature }">
                </div>
              </div>
              <div class="form-group">
                <label for="uimg" class="col-sm-2 control-label">头像</label>
                <div class="col-sm-10">
		           <input type="file" id="uimg" name="uimg">
		           <p>·建议上传高清头像</p>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <button id="submit" type="button" class="btn btn-primary">提交修改</button>
                  <button id="down" type="button" class="btn btn-danger">注销账户</button>
                </div>
              </div>
            </form>
          </div>     
      </div><!-- main -->
        
      <!-- FOOTER -->
      <footer>
        <p class="pull-right fix"><a href="">返回顶部</a></p>
        <p>&copy; 2018 上海海事大学. &middot; 陶媛 &middot; 毕业设计</p>
      </footer>
    </div>
    <script type="text/javascript">
    $("#submit").on("click",function(){	
		var formData = new FormData($("#person")[0]);

		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/user/doperson",
			data:formData,
			contentType: false,  
            processData: false,
			success:function(result){
				if(result.success==true){
					alert(result.message);
					window.location.href = "${pageContext.request.contextPath}/user/uhome";
				}
				else{
					alert(result.message);
					window.location.reload();
				}
				
			}
		})
		
	});
    $("#down").on("click",function(){
		$.ajax({
			type:"GET",
			url:"${pageContext.request.contextPath}/user/dodown",
			success:function(result){
				alert(result.message);
				window.location.href = "${pageContext.request.contextPath}/login/index";
			}
		})
		
	});
    </script>
  </body>
</html>