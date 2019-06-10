<%@page import="DBFunction.*"%>
<%@page import="Bean.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
	if(id==null){
		response.sendRedirect(request.getContextPath()+"/client/index.jsp");
		return ;
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
<script src="${basePath}/client/js/jquery-3.3.1.js"></script>
<script src="${basePath}/client/js/layer.js"></script>
<script src="${basePath}/client/js/ipv6.js"></script>
<script src="${basePath}/client/js/jwplayer.js"> </script>
<script src="${basePath}/client/js/header-and-footer.js"></script>

<script language="javascript">
function ipv6ok(){
	$('#onlive').html('正在使用(ipv6)推流')
	$('#isIpv6').val('1')
	sessionStorage.setItem("isIpv6","yes")
	playIpv6()
}
function ipv6no(){
	$('#onlive').html('正在使用(ipv4)推流')
	$('#isIpv6').val('1')
	sessionStorage.setItem("isIpv6","no")
	playIpv6()
}
	function playInit(){
		$('#player').html(
				'<embed height="600" width="900" src="tuiliu2.swf?userTxt='
						+ "" + '&&userStream=' + ""
						+ '" type="application/x-shockwave-flash" ></embed>');
	
	}
	
	
	function playIpv6(){
		var ipv4 = "rtmp://183.174.60.25:1935/live";
		var ipv6 = "rtmp://[2401:ec00:21:9:baca:3aff:fe61:74c1]:1935/live";
		var courseId = "<%=course.id%>"
		//var courseId ="1"
		
		var flag = 0;
		if (ipv4 != "" && ipv6 != "" && courseId != "")
		{
			flag = 1;
		}
		else
		{
			flag = 0;
		}
		$('#player').html('<embed height="600" width="900" src="tuiliu2.swf?userTxt='+ipv4+'&&userTxt2='+ipv6+'&&userStream='+courseId+'" type="application/x-shockwave-flash" ></embed>');
	
	
	}
	
	function play(){
		var isIpv6=$('#isIpv6').val()
		playIpv6()
	}
	$(function(){
		playInit();
		if(sessionStorage.getItem("isIpv6")=="yes"){
			$('#onlive').html('正在使用(ipv6)推流')
		}else if(sessionStorage.getItem("isIpv6")=="no"){
			$('#onlive').html('正在使用(ipv4)推流')
		}else{
			setTimeout(function(){
				_ipv6test_start()
				},0)
			layer.msg('正在检测您的电脑是否支持ipv6', {
			  icon: 16
			  ,shade: 0.01
			  ,time:3000
			});
			
		}
	})
</script>

</head>
<body style="padding-top:60px;margin-top:60px; margin:8px 0 0 0;">
  <jsp:include page="/client/header_and_footer/header.jsp" flush="true"/><!--动态包含-->  
	
	
	
	<input type="hidden" id="isIpv6" value="0">
	<div class="container">
		<!--标题-->
		<div class="row clearfix">
			<div class="col-sm-12 col-md-12 col-lg-12">
				<div class="page-header">
					<h1>
						${course.name} <small id="onlive"> （正在推流） </small>
					</h1>
				</div>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-sm-12 col-md-12 col-lg-12">
				<div id="willesPlay">
					<!--播放器头部-->
					<!--播放器内容-->
					<div class="playContent" width="100%" height="600px">
							<div id="player">
							</div>
							<input type="button" value="start" id="start" onclick="play()"/>
							<input type="button" value="stop" id="pause" onclick="playInit()" />
					</div>
				</div>
			</div>
		</div>
	</div>
<iframe src="${basePath}/client/header_and_footer/footer.html" id="iframe-footer"></iframe> 

</body>
</html>