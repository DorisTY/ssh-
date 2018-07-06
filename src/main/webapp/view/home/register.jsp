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
	<!-- head -->
	<h2 align="center">登录</h2>
	<div class="container p3">
		<form class="form-horizontal border2" onsubmit="return false">
			<div class="form-group">
				<label for="mobile" class="col-sm-2 control-label">Moblie</label>
				<div class="col-md-10">
					<input id="mobile" type="mobile" class="form-control" placeholder="Mobile">
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-md-2 control-label">Password</label>
				<div class="col-md-10">
					<input id="password" type="password" class="form-control" placeholder="Password">
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-offset-2 col-md-10">
					<button id="signclick" type="button" class="btn btn-primary btn-block">确认</button>
				</div>
				<a href="${pageContext.request.contextPath}/login/sign">去注册 go</a>
			</div>
		</form>
	</div>
	
	<script type="text/javascript">
		$("#signclick").on("click",function(){
			var mobile=$("#mobile").val();
			var password=$("#password").val();
			
			if(mobile==""){
				alert("请输入手机号");
			}else if(password==""){
				alert("请输入密码");
			}else{
				var user={
						mobile:mobile,
						password:password,
				};
				$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/login/dologin",
					data:JSON.stringify(user),
					contentType:"application/json",
					success:function(result){
						if(result.success==true){
							if(result.data=="0"){
								alert(result.message);
								window.location.href = "${pageContext.request.contextPath}/admin/auser";
							}else{
								alert(result.message);
								window.location.href = "${pageContext.request.contextPath}/login/index";
							}
						}else{
							alert(result.message);
							window.location.reload();
						}
						
					}
					
				});
			}
		});
	</script>

  </body>
</html>