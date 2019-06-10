<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
	pageContext.setAttribute("basePath",basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>文章页面</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Access-Control-Allow-Origin" content="*">
<link rel="icon" href="${basePath}/client/image/header_brand_image.png"
	type="image/x-icon" />

<link rel="stylesheet" href="${basePath}/client/article/css/moco.css"
	type="text/css">
<link rel="stylesheet"
	href="${basePath}/client/article/css/swiper-3.css">
<link href="${basePath}/client/article/css/captcha.css" rel="stylesheet">
<link rel="stylesheet" href="${basePath}/client/article/css/a.css"
	type="text/css">
<link rel="stylesheet"
	href="${basePath}/client/article/css/prettify.css">
<link rel="stylesheet" href="${basePath}/client/css/bootstrap.css">
<link href="${basePath}/client/css/header_and_footer.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${basePath}/m/teacher/css/font-awesome.min.css">
<script src="${basePath}/client/js/jquery.min.js"></script>
<script src="${basePath}/client/js/bootstrap.js"></script>
<script src="${basePath}/client/js/layer.js"></script>
<script src="${basePath}/client/course/teacher/js/wangEditor.min.js"></script>
<script type="text/javascript"
	src="${basePath}/admin/js/ajaxfileupload.js"></script>


<script type="text/javascript">
function ajaxFileUpload(type) {
	$.ajaxFileUpload({
		url :'<%=request.getContextPath()%>/uploadFile?courseId=1&test1=2',
		secureuri : false,
		type:"POST",
		fileElementId : 'fileToUpload',
		dataType : 'JSON',
		success : function(data, status) {
			alert('上传成功')
		},
		error : function(data, status, e) {
			alert('上传出错');
		}
	})

	return false;

}
</script>
</head>
<body>
	<input type="file" id="fileToUpload" name="fileToUpload"
		onchange="ajaxFileUpload('file')" accept="*/*"
		value="#">
	<img id="viewImg" src="#" style="width: 200px">
</body>
</html>