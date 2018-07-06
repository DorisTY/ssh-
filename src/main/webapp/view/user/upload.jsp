<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
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
    <div class="container">
      <!-- main -->
      <div class="row" id="upload">
        <h3>我要投稿</h3>
        <hr />
      </div>
      <div class="row"> 
        <form id="uploadform" class="form-horizontal" onsubmit="return false" enctype="multipart/form-data">
          <div class="form-group">
            <label for="vimg" class="col-sm-2 control-label">视频封面</label>
            <div class="col-sm-10">
              <input type="file" id="vimg" name="vimg">
              <p>·建议上传高清封面</p>
            </div>
          </div>
          <div class="form-group">
            <label for="file" class="col-sm-2 control-label">视频文件</label>
            <div class="col-sm-10">
              <input type="file" id="file" name="file" multiple="multiple">
              <p>·单次最多上传10p视频</p>
	            <div class="progress " style="width: 500px">
				    <div id="progress-bar" class="progress-bar progress-bar-success progress-bar-striped" role="progressbar"
				         aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
				    </div>
				</div>
			</div>
          </div>
        
        

          <div class="form-group">
            <label for="title" class="col-sm-2 control-label">视频大标题</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="title" name="title" placeholder="视频大标题">
              <p>·标题长度在 72 字内</p>
            </div>
          </div>
          
           
          <div class="form-group">
            <label for="sign" class="col-sm-2 control-label">分区</label>
            <div class="col-sm-10">
              <select class="form-control" id="channel" name="channel">
				  <option>音乐</option>
				  <option>舞蹈</option>
				  <option>游戏</option>
				  <option>科技</option>
				  <option>生活</option>
				  <option>娱乐</option>
				  <option>影视</option>
			  </select>
            </div>
          </div>

          <div class="form-group">
            <label for="sign" class="col-sm-2 control-label">子分区</label>
            <div class="col-sm-10">
              <select class="form-control" id="aid" name="aid">
                <option>原唱</option>
				<option>翻唱</option>
			  </select>
			  
            </div>
          </div>
          <div class="form-group">
            <label for="tag" class="col-sm-2 control-label">标签</label>
            <div class="col-sm-10">
            	<p id="tid"></p>
				<input type="text" class="form-control" id="tagname" name="tagname" placeholder="自定义标签">
            </div>
          </div>

 
 
          <div class="form-group">
            <label for="subtitle" class="col-sm-2 control-label">视频简介</label>
            <div class="col-sm-10">
              <textarea class="form-control" id="subtitle" name="subtitle" rows="2" placeholder="视频简介"></textarea>
              <p>·标题长度在72  字内</p>
            </div>
          </div>
          <div class="form-group">
            <label for="content" class="col-sm-2 control-label">视频介绍</label>
            <div class="col-sm-10">
              <textarea class="form-control" id="content" name="content" rows="4" placeholder="视频介绍"></textarea>
              <p>·标题长度在 72 字内</p>
            </div>
          </div>

         
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <button id="uploadclick" type="button" class="btn btn-primary">提交</button>
            </div>
          </div>
        </form>
      </div><!-- main -->
        
      <!-- FOOTER -->
      <footer>
        <p class="pull-right fix"><a href="">返回顶部</a></p>
        <p>&copy; 2018 上海海事大学. &middot; 陶媛 &middot; 毕业设计</p>
      </footer>
    </div>
    
    <script type="text/javascript">
    
    $("#channel").change(function(){
		var channel = $("#channel").val();
		var aid;
		var data={
				channel:channel,
		};
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/user/dochange",
			data:JSON.stringify(data),
			contentType:"application/json",
			success:function(data){		
				$("#aid").empty();
				for(var i = 0; i < data.length; i++){
					$("#aid").append("<option  value='" + data[i].aid + "'>" + data[i].aid + "</option>");
				}
			}
		})
    });
   
    //ready文档结构已经加载完成时触发
    $(function(){ 
    	var channel = $("#channel").val();
    	var data={
				channel:channel,
		};
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/user/gettag",
			data:JSON.stringify(data),
			contentType:"application/json",
			success:function(data){	
				for(var i = 0; i < data.length; i++){
					var tagname = data[i].tagname;
					$("#tid").append("<span class='badge1'><a onclick=dotag('"+ tagname +"')>" + tagname + "</a></span>");
				}
			}
		})
  	});
    
    //鼠标置于子分区时触发
    $("#aid").mousemove(function(){
    	var channel = $("#channel").val();
    	var data={
				channel:channel,
		};
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/user/gettag",
			data:JSON.stringify(data),
			contentType:"application/json",
			success:function(data){	
				$("#tid").empty();
				for(var i = 0; i < data.length; i++){
					var tagname = data[i].tagname;
					$("#tid").append("<span class='badge1'><a onclick=dotag('"+ tagname +"')>" + tagname + "</a></span>");
				}
			}
		})
    });
    
    //点击标签填表
    function dotag(tagname){
    	var tagname = tagname;
    	//alert("tagname");
    	document.getElementById("tagname").value = tagname;
    	
    }
    
    //投稿
    $("#uploadclick").on("click",function(){	
    	var xhrOnProgress = function (fun) {
            xhrOnProgress.onprogress = fun; //绑定监听
            //使用闭包实现监听绑
            return function () {
                //通过$.ajaxSettings.xhr();获得XMLHttpRequest对象
                var xhr = $.ajaxSettings.xhr();
                //判断监听函数是否为函数
                if (typeof xhrOnProgress.onprogress !== 'function')
                    return xhr;
                //如果有监听函数并且xhr对象支持绑定时就把监听函数绑定上去
                if (xhrOnProgress.onprogress && xhr.upload) {
                    xhr.upload.onprogress = xhrOnProgress.onprogress;
                }
                return xhr;
            }
        }
    	
    	
    	var formData = new FormData($("#uploadform")[0]);
		var vimg=$("#vimg").val();
		var file=$("#file").val();
		var title=$("#title").val();
		if(vimg==""){
			alert("请上传封面");}
		else if(file==""){
			alert("请上传文件");}
		else if(title==""){
			alert("请输入视频标题");}
		else{
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/user/doupload",
				data:formData,
				contentType: false,  
	            processData: false,
	            xhr: xhrOnProgress(function (e) {
                    var percent = e.loaded / e.total;
                    $("#progress-bar").css("width", (percent * 500));
                }),
				success:function(result){
					alert(result.message);
					window.location.href = "${pageContext.request.contextPath}/login/index";
				}
			})
		};
	});
    
	</script>
  </body>
</html>