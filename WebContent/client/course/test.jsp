<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>ipv6测试网站</title>
    <script type="text/javascript" src="${basePath}/client/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${basePath}/client/js/layer.js"></script>
    <script type="text/javascript" src="${basePath}/client/js/ipv6.js"></script>
</head>
<script language="JavaScript" type="text/javascript">
var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
if (userAgent.indexOf("Chrome") > -1){
	  alert("这是Chrome浏览器")
}
</script>
<body style="padding-top:60px;margin-top:60px; margin:8px 0 0 0;">
	<button onclick="_ipv6test_start()">测试按钮</button>
</body>
</html>