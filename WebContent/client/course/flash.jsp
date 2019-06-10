<%@page import="DBFunction.*"%>
<%@page import="Bean.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
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

</head>
<body style="padding-top: 60px; margin-top: 60px; margin: 8px 0 0 0;">
	<jsp:include page="/client/header_and_footer/header.jsp" flush="true" /><!--动态包含-->

 
	<div class="container">
		<!--标题-->
		<div class="row clearfix">
			<div class="col-sm-12 col-md-12 col-lg-12">
				<div class="page-header">
					<h1>
						flash兼容问题 <br> <br>
						
						<small id="onlive"> <a href="https://jingyan.baidu.com/article/e75aca8568cd6d142fdac678.html"> Chrome浏览器 </a> </small>   <br> <br>
						<small id="onlive"> <a href="https://https://jingyan.baidu.com/article/359911f540a56757fe0306d1.html"> IE浏览器 </a> </small>   <br> <br>
						<small id="onlive"> <a href="https://https://jingyan.baidu.com/article/359911f540a56757fe0306d1.html"> Firefox浏览器 </a> </small>   <br> <br>
						<small id="onlive"> <a href="https://https://jingyan.baidu.com/article/359911f540a56757fe0306d1.html"> 360安全浏览器 </a> </small>   <br> <br>
						<small id="onlive"> <a href="https://https://jingyan.baidu.com/article/359911f540a56757fe0306d1.html"> QQ浏览器 </a> </small>   <br> <br>
						<small id="onlive"> <a href="https://https://jingyan.baidu.com/article/359911f540a56757fe0306d1.html"> 搜狗浏览器 </a> </small>   <br> <br>
					</h1>
				</div>
			</div>
		</div>
		
			
	</div>
	<iframe src="${basePath}/client/header_and_footer/footer.html"
		id="iframe-footer"></iframe>

</body>
</html>