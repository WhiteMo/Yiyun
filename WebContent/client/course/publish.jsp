<%@page import="DBFunction.*"%>

<%@page import="Bean.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	
	String id = request.getParameter("id");

	if (id == null) {
		response.sendRedirect(request.getContextPath() + "/client/index.jsp");
		return;
	}
	User user = null;
	if(session.getAttribute("user")==null){
		response.sendRedirect(request.getContextPath()+"/client/login/login.jsp");
		
		return ;
	}else{
		user = (User)session.getAttribute("user");
		pageContext.setAttribute("user",session.getAttribute("user"));
	}
	Course course = new CourseImpl().getCourseById(id);
	pageContext.setAttribute("course", course);
	pageContext.setAttribute("basePath", request.getContextPath());
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>直播间</title>
<link rel="stylesheet" href="${basePath}/client/css/style.css">
<link rel="stylesheet" href="${basePath}/client/css/comment.css">
<link rel="stylesheet" href="${basePath}/client/css/bootstrap.css">
<link rel="icon" href="${basePath}/client/image/header_brand_image.png"
	type="image/x-icon" />
<link href="${basePath}/client/css/header_and_footer.css"
	rel="stylesheet" />
<script src="${basePath}/client/js/jquery.min.js"></script>
<script src="${basePath}/client/js/layer.js"></script>
<script src="${basePath}/client/js/ipv6.js"></script>
<script src="${basePath}/client/js/jwplayer.js"> </script>
<script src="${basePath}/client/js/bootstrap.js"></script>
<script src="${basePath}/client/js/header-and-footer.js"></script>



<script type="text/javascript">




	function ipv6ok(){
		layer.closeAll()
		$('#ipv6Status').html('正在使用ipv6进行推流')
		var basePath='<%=request.getContextPath()%>'
		var id='<%=id%>'
		$.post(basePath+"/CourseAction",{type:"update",id:id,isIpv6:'1'},function(result){
			if(result=='success'){
				
			}else{
				layer.msg("检测ipv6出现了网络异常，可忽略",{icon:3,time:1200})
			}
		})
	}
	function ipv6no(){
		$('#ipv6Status').html('正在使用ipv4进行推流')

		var basePath='<%=request.getContextPath()%>'
		var id='<%=id%>'
			$.post(basePath+"/CourseAction",{type:"update",id:id,isIpv6:'0'},function(result){
				if(result=='success'){
					
				}else{
					layer.msg("检测ipv6出现了网络异常，可忽略",{icon:3,time:1200})
				}
			})
		
		layer.closeAll()
	}

	$(function(){
		var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
		if (userAgent.indexOf("Chrome")>-1&& userAgent.indexOf("Safari") > -1&&userAgent.indexOf("Edge") <=-1){
			layer.msg("Chrome浏览器由于安全问题不允许使用摄像头，请用其它浏览器进行直播！",{time:10000,icon:2});
			$('#ipv6Status').html('请更换其它浏览器进行直播');
		}else{
			_ipv6test_start()
			layer.msg("正在检测是否支持Ipv6,请稍等...",{icon:16,time:5000,shade:0.01})
		}
	})
	
	
</script>


<script type="text/javascript">
		//var str = "http://www.helpexamples.com/flash/video/water.flv";
		//var str2 = "1";
		//playswf(str,str2);
		var str = "rtmp://%5B2001:da8:270:2018:f816:3eff:fe9e:c5b6%5D:1935/rtmplive";
		//var str1 = "rtmp://[2401:ec00:21:9:baca:3aff:fe61:74c1]:1935/live";
		var str2 = "<%=id%>";
							
		function playswf(sFile,sFile2)
		{
			var flag = 0;
			if (sFile != "" && sFile2 != "")
			{
				flag = 1;
				$('#player').html('<embed height="570" width="100%" src="tuiliu.swf?userTxt='+sFile+'&&userStream='+sFile2+'" type="application/x-shockwave-flash" ></embed>');
				}
			else
			{
			 	var basePath="<%=request.getContextPath()%>";
				flag = 0;
				$('#player')
					.html(
							'<img width="100%" src="'
									+ basePath
									+ '/client/image/videoBng.png" onclick="playswf(str,str2)">');
		}

		//	document.write('<embed height="600" width="900" src="tuiliu.swf?userTxt='+sFile+'&&userStream='+sFile2+'" type="application/x-shockwave-flash" ></embed>');
	}
</script>
<script type="text/javascript">
	var ws;
	//var username = getUrlParameter('username');
	var username='<%=user.name%>';
	var roomid='<%=id%>';
	var url = "ws://chatSocket?username="
	+username;

	window.onload = connect;
	function connect() {
		if ('WebSocket' in window) {
			ws = new WebSocket(url);
		} else if ('MozWebSocket' in window) {
			ws = new MozWebSocket(url);
		} else {
			alert('该浏览器不支持websocket');
			return;
		}

		ws.onmessage = function(event) {
			
		    //var index=result.sendMsg.indexOf("@&#~");
		    //var room=result.sendMsg.substring(0,index);
		    //alert(index);
			eval("var result=" + event.data);
			//欢迎语言
			//if (result.alert != undefined) {
				//document.getElementById("content").innerHTML += result.alert
					//	+ "<br/>";
			//}
			//列表
			//alert(result.sendMsg);
			/*if (result.names != undefined) {
				document.getElementById("userList").innerHTML = "";
				var arr = result.names;
				for (var i = 0; i < arr.length; i++) {
					document.getElementById("userList").innerHTML += arr[i]
							+ "<br/>";
				}
			}*/
			//聊天内容
			
			if (result.from != undefined) {
				var index=result.sendMsg.indexOf("@&#~");
			    var room=result.sendMsg.substring(0,index);
			    if(room==roomid)
				document.getElementById("content").innerHTML += result.from
						+ " " + result.date + " 说：<br/>" + result.sendMsg.substring(index+4)
						+ "<br/>";
			}
		};
	}

	function wsSend() {

		var msg = document.getElementById("msg");
		var roomid='<%=id%>';
		msg.value=roomid+"@&#~"+msg.value;
		//alert(msg.value);
		ws.send(msg.value);
		
		msg.value = "";
	}

	//截取URL 中的传过来的值
	function getUrlParameter(name) {
		name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
		var regexS = "[\\?&]" + name + "=([^&#]*)";
		var regex = new RegExp(regexS);
		var results = regex.exec(window.parent.location.href);
		if (results == null)
			return "";
		else {
			return results[1];
		}
	}
</script>
</head>
<body style="padding-top: 60px; margin-top: 60px; margin: 8px 0 0 0;">
	<jsp:include page="/client/header_and_footer/header.jsp" flush="true" /><!--动态包含-->
	<div class="container">
		<!--标题-->
		<div class="row clearfix">
			<div class="col-sm-12 col-md-12 col-lg-12">
				<div class="page-header">
					<h1>
						${course.name}<small id="onlive"> <font id="ipv6Status">（正在推流）</font> 
						<!-- 推流地址
						 <script
								type="text/javascript">			
								document.write(str + '/' + str2);
						</script> -->
						</small> <br>
						<h5>
							<a href="/examples/OBS.exe">建议下载obs </a>
						</h5>
					</h1>
				</div>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-sm-12 col-md-12 col-lg-12">
				<div class="col-sm-8 col-md-8 col-lg-8">
					<div id="willesPlay">
						<!--播放器头部-->
						<!--播放器内容-->
						<div class="playContent" width="100%" height="600px">
							<div id="player">
								<script type="text/javascript">
								
								playswf("","");
								</script>
							</div>
							<input type="button" value="开始" onclick="playswf(str,str2)" />
							<input type="button" value="暂停" onclick="playswf('','')" />
						</div>
					</div>
				</div>

				<div id="Playercase" class="col-sm-4 col-md-4 col-lg-4"
					style="height: 525px">
					<div id="content" style="height: 450px"></div>
					<div style="position: relative; zoom: 1; width: 350px; top: 20px">
						<textarea style="overflow:scroll;overflow-x:hidden;resize:none;padding-left: 0px; width: 306px; height: 51px;"
							id="msg" maxlength="50" placeholder="和大家一起聊天吧" tabindex="1"
							data-type="cont" style="color: rgb(169, 169, 169);"></textarea>
						<div
							style="display: block; position: relative; width: 43px; height: 51px; line-height: 51px; border-radius: 0 4px 4px 0; background: #f70; color: #fff; font-size: 14px; float: left; text-align: center; float: right; cursor: pointer;"
							onclick="wsSend()">发送</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    <jsp:include page="/client/header_and_footer/shouyewei.jsp"
		flush="true" /><!--动态包含-->
	<!--iframe src="${basePath}/client/header_and_footer/footer.html"
		id="iframe-footer"></iframe-->

</body>
</html>