<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
  	 pageContext.setAttribute("basePath", request.getContextPath());
  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${basePath}/client/article/css/moco.css"
	type="text/css">
<link rel="stylesheet"
	href="${basePath}/client/article/css/swiper-3.css">
<link href="${basePath}/client/article/css/captcha.css" rel="stylesheet">
<link rel="stylesheet" href="${basePath}/client/article/css/a.css"
	type="text/css">
<link charset="utf-8" rel="stylesheet"
	href="${basePath}/client/article/css/prettify.css">
<link rel="stylesheet" href="${basePath}/client/css/bootstrap.css">
<link href="${basePath}/client/css/header_and_footer.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${basePath}/m/teacher/css/font-awesome.min.css">
<script src="${basePath}/client/js/jquery.min.js"></script>
<script src="${basePath}/client/js/bootstrap.js"></script>
<script src="${basePath}/client/js/layer.js"></script>
<script type="text/javascript">

$(function(){
	layer.msg('你好啊~',{icon:1});
})
</script>
</head>

<body>
<!-- 模态框（Modal）评论 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">模态框（Modal）标题</h4>
				</div>
				<div class="modal-body">在这里添加一些文本</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-primary">提交更改</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- Modal结束 -->
</body>
</html>