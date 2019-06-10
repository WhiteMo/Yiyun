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
<script type="text/javascript">

		
		$(function(){
			layer.msg('正在检测您的电脑是否支持ipv6', {
				  icon: 16
				  ,shade: 0.01
				  ,time:10000
				  ,cancel:function(){
					  alert('弹出层取消')
				  },close:function(){
					  alert('弹出层关闭')
				  }
				});
			
		})
			
		function ipv6ok(){
			layer.close(layer.index)
			alert('yes')
		}
		function ipv6no(){
			alert('no')
			
		}
		_ipv6test_start()
</script>
<body style="padding-top:60px;margin-top:60px; margin:8px 0 0 0;">
	<button onclick="_ipv6test_start()">测试按钮</button>
</body>
</html>