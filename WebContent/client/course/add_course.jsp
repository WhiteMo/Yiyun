<%@page import="Bean.*"%>
<%@page import="DBFunction.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
	if(id==null){
		out.write("<script type='text/javascript'>");
		out.write("window.location.href="+request.getContextPath()+"/client/index.jsp");
		out.write("</script>");	
	}
	pageContext.setAttribute("basePath", request.getContextPath());
	CourseImpl cImpl = new CourseImpl();
	Course c = null;
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-store">
<meta http-equiv="Expires" content="0">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>课程添加</title>
<meta name="renderer" content="webkit">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet" href="${basePath}/admin/css/bootstrap.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/font-awesome.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/ionicons.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/jquery-ui.css">
<link rel="stylesheet"
	href="${basePath}/admin/css/jquery.minicolors.css">
<link rel="stylesheet" href="${basePath}/admin/css/metroStyle.css">
<link rel="stylesheet" href="${basePath}/admin/css/AdminLTE.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/skin-blue.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/WdatePicker.css">
<link rel="stylesheet" href="${basePath}/admin/css/process.css">
<link rel="stylesheet" href="${basePath}/admin/css/editormd.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/main.css">

<script src="${basePath}/admin/js/jquery.min.js"></script>
<script src="${basePath}/admin/js/bootstrap.min.js"></script>
<script src="${basePath}/admin/js/jquery-ui.js"></script>
<script src="${basePath}/admin/js/jquery-validation.min.js"></script>
<script src="${basePath}/admin/js/jquery.validation_zh_CN.js"></script>
<script src="${basePath}/admin/js/jquery-form.min.js"></script>
<script src="${basePath}/admin/js/jquery-ajaxfileuploader.min.js"></script>
<script src="${basePath}/admin/js/jquery.minicolors.min.js"></script>
<script src="${basePath}/admin/js/jquery-cookie.min.js"></script>
<script src="${basePath}/admin/js/jquery.ztree.all.min.js"></script>
<script type="text/javascript"
	src="${basePath}/admin/js/ajaxfileupload.js"></script>
<script src="${basePath}/admin/js/cn_WdatePicker.js"></script>
<script type="text/javascript">


	function chooseFile(){
		$('#fileToUpload').click();
	}

	function ajaxFileUpload(type) {
		$.ajaxFileUpload({
			url :'<%=request.getContextPath()%>/ajaxUpload',
			secureuri : false,
			fileElementId : 'fileToUpload',
			dataType : 'json',
			success : function(data, status) {
				$('#viewImg').attr('src',data.picUrl)
				
			},
			error : function(data, status, e) {
				alert('上传出错');
			}
		})

		return false;

	}

function addCourse(type){
	var basePath = $('#basePath').val();
	var imgUrl = $('#viewImg').attr('src');
	var name = $('#name').val();
	var wareUrl = $('#wareUrl').val();
	var college = $('#college').val();
	var teacherName = $('#teacherName').val()
	var targetUrl = $('#targetUrl').val()
	var shortContent = $('#shortContent').val();
	var weight = $("#weight").find("option:selected").text();
	var status = $('#status').val();
	var isOpen = $('#isOpen').val()
	var teacherId='<%=id%>';
	var tag = ''

	$.post(basePath+"/CourseAction",{type:'add'
		,name:name
		,teacherName:teacherName
		,shortContent:shortContent
		,tag:tag
		,imgUrl:imgUrl
		,wareUrl:wareUrl
		,targetUrl:targetUrl
		,teacherId:teacherId
		,college:college
		,isOpen:isOpen
		,status:status
		},function(result){
			if(result=='success'){
				window.location.href=basePath+"/client/teacher/course.jsp";
			}else {
				alert('失败')
			}
			
		}).val();
}
$(function(){
	$('#status').val('2')
})
</script>


</head>
<body class="skin-blue content-body" style="">
	<input id="basePath" type="hidden" value="${basePath}">

	<div class="content-header">
		<h1>课程管理 -添加</h1>
	</div>
	<div class="content" style="">
		<div class="box box-primary" style="">
			<form class="form-horizontal" method="post" novalidate="novalidate"
				style="">
				<div class="box-body" style="">

					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label"><em
									class="required">*</em>课程名字</label>
								<div class="col-sm-8">
									<input id="name" type="text" name="name" maxlength="150"
										class="required form-control">
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label">是否对外开放</label>
								<div class="col-sm-8">
									<select name="priority" id="isOpen" class="form-control">
										<option value="0">否</option>
										<option value="1">是</option>
									</select>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label">教师名字</label>
								<div class="col-sm-8">
									<input id="teacherName" type="text" name="teacherName"
										maxlength="150" class="required form-control">
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label">开课大学</label>
								<div class="col-sm-8">
									<input id="college" type="text" name="college" maxlength="150"
										class="required form-control">
								</div>
							</div>
						</div>
					</div>


				

					<div class="row">

						<div class="col-sm-12">
							<div class="form-group">
								<label class="col-sm-2 control-label">描述</label>
								<div class="col-sm-10">
									<textarea id="shortContent" name="metaDescription" rows="5"
										class="form-control {maxlength:450}"></textarea>
								</div>
							</div>
						</div>

					</div>

					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label">状态</label>
								<div class="col-sm-8">
									<select name="status" id="status" class="form-control">
										<option value="0">已经结束</option>
										<option value="1">正在直播</option>
										<option value="2">即将直播</option>
									</select>
								</div>
							</div>
						</div>
					</div>

				

					<div class="row">
						<div class="col-sm-12">
							<div class="form-group">
								<label class="col-sm-2 control-label">课程封面图</label>
								<div class="col-sm-10">
									<div style="display: table; width: 100%;">
										<div style="display: table-cell; vertical-align: middle;">

											<div class="form-inline" style="margin-top: 3px;">
												<button class="btn btn-default" type="button"
													onclick="return chooseFile()">选择并上传</button>
												<input type="file" id="fileToUpload" name="fileToUpload"
													onchange="ajaxFileUpload()" accept="image/*"
													style="display: none" value="#"> 
													<input
													type="hidden" id="imgSrc" name="imgSrc">
												
												<button class="btn btn-default" type="button"
													id="smallImageSwfCancel" onclick="" disabled="">取消</button>
											</div>

										</div>
										<div
											style="width: 200px; display: table-cell; vertical-align: middle; text-align: center;">
											<img id="viewImg" src="#" style="width: 200px">
										</div>
									</div>
									<div id="smallImageSwfProgress"></div>
								</div>
							</div>
						</div>

					</div>



				</div>
				<div class="box-footer">
					<button type="button" class="btn btn-primary" onclick="addCourse('back')">保存并返回</button>
				<button class="btn btn-default" type="button"
								onclick="location.href='${basePath}/client/teacher/course.jsp'">返回</button>
				</div>

			</form>
		</div>
	</div>


</body>
</html>