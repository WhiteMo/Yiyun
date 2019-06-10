<%@page import="Bean.*"%>
<%@page import="DBFunction.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
	String id = request.getParameter("id");
	if(id==null){
		id="1";
	}
	CourseImpl cImpl = new CourseImpl();
	Course c =cImpl.getCourseById(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-store">
<meta http-equiv="Expires" content="0">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>文章添加</title>
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
<script type="text/javascript"
	src="${basePath}/admin/js/ajaxfileupload.js"></script>

<script type="text/javascript">
	$(function(){
		$('#basePath').val('<%=request.getContextPath()%>');
		$('#viewImg').attr('src','<%=c.getImgUrl()%>');
		$('#name').val('<%=c.getName()%>');
		$('#wareUrl').val('<%=c.getWareUrl()%>');
		$('#college').val('<%=c.getCollege()%>');
		$('#teacherName').val('<%=c.getTeacherName()%>')
		$('#targetUrl').val('<%=c.getTargetUrl()%>')
		$('#shortContent').val('<%=c.getShortContent()%>');
		$('#status').val('<%=c.getStatus()%>');
		$('#id').val('<%=c.getId()%>');
	})
	
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

function updateCourse(type){
	var basePath = '<%=request.getContextPath()%>';
	var imgUrl = $('#viewImg').attr('src');
	var name = $('#name').val();
	var wareUrl = $('#wareUrl').val();
	var college = $('#college').val();
	var teacherName = $('#teacherName').val()
	var targetUrl = $('#targetUrl').val()
	var shortContent = $('#shortContent').val();
	var weight = $("#weight").find("option:selected").text();
	var status = $('#status').val();
	var id= $('#id').val();
	var tag = ''
	$('input:checkbox[name=attr]:checked').each(function(k){
	    if(k == 0){
	        tag = $(this).val();
	    }else{
	        tag += ','+$(this).val();
	    }
	})
	if(name==""||name==null){
		$('#name').focus()
		alert('请输入课程名字!')
		return ;
	}

	window.event.returnValue=false;
	$.post(basePath+"/CourseAction",{type:'update'
		,name:name
		,teacherName:teacherName
		,shortContent:shortContent
		,tag:tag
		,imgUrl:imgUrl
		,wareUrl:wareUrl
		,targetUrl:targetUrl
		,college:college
		,id:id
		,status:status
		},function(result){
			if(result=='success'){
				if(type=="back"){
					window.event.returnValue=false;
					window.location.href=basePath+"/admin/content_management/course.jsp";
				}else if(type=='add'){
					window.event.returnValue=false;
					window.location.href=basePath+"/admin/content_management/add_course.jsp";
				}else{
					window.event.returnValue=false;
				}
			}else {
				window.event.returnValue=false;
				alert('失败')
			}
			
		}).val();
}

</script>


</head>
<body class="skin-blue content-body" style="">
	<input id="basePath" type="hidden" value="${basePath}">
	<input id="id" type="hidden" value="<%=c.id%>">
	<div class="content-header">
		<h1>课程管理 -修改</h1>
	</div>
	<div class="content" style="">
		<div class="box box-primary" style="">
			<form class="form-horizontal" method="post" novalidate="novalidate"
				style="">
				<div class="box-header with-border">
					<div class="btn-toolbar">
						<div class="btn-group">
							<button class="btn btn-default" type="button" onclick=""
								disabled="disabled">新增</button>
						</div>
						<div class="btn-group">
							<button class="btn btn-default" type="button" onclick=""
								disabled="disabled">复制</button>
							<button class="btn btn-default" type="button"
								onclick="location.href='view.do?id=&amp;queryNodeId=&amp;queryNodeType=&amp;queryInfoPermType=&amp;queryStatus=&amp;position=&amp;';"
								disabled="disabled">查看</button>
							<button class="btn btn-default" type="button"
								onclick="window.open('');" disabled="disabled">前台浏览</button>
						</div>
						<div class="btn-group">

							<button class="btn btn-default" type="button" onclick=""
								disabled="disabled">删除</button>


							<button class="btn btn-default" type="button" onclick=""
								disabled="disabled">彻底删除</button>

						</div>
						<div class="btn-group">

							<button class="btn btn-default" type="button" onclick=""
								disabled="disabled">审核通过</button>


							<button class="btn btn-default" type="button" onclick=""
								disabled="disabled">撤销审核</button>


							<button class="btn btn-default" type="button" onclick=""
								disabled="disabled">退稿</button>

						</div>
						<div class="btn-group">
							<button class="btn btn-default" type="button" onclick=""
								disabled="disabled">上一条</button>
							<button class="btn btn-default" type="button" onclick=""
								disabled="disabled">下一条</button>
						</div>
						<div class="btn-group">
							<button class="btn btn-default" type="button"
								onclick="location.href='course.jsp'">返回</button>
						</div>
					</div>
				</div>
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
								<label class="col-sm-4 control-label">跳转链接</label>
								<div class="col-sm-8">
									<input id="targetUrl" type="text" name="targetUrl"
										maxlength="150" class="required form-control">
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
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label">课件地址</label>
								<div class="col-sm-8">
									<input id="wareUrl" type="text" name="wareUrl" maxlength="150"
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

						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label">优先级</label>
								<div class="col-sm-8">

									<select name="priority" id="weight" class="form-control">

										<option>0</option>

										<option>1</option>

										<option>2</option>

										<option>3</option>

										<option>4</option>

										<option>5</option>

										<option>6</option>

										<option>7</option>

										<option>8</option>

										<option>9</option>

									</select>


								</div>
							</div>
						</div>

						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label">发布时间</label>
								<div class="col-sm-8">
									<div class="input-group">
										<input type="text" name="publishDate" value=""
											onclick="WdatePicker({dateFmt:'yyyy-MM-ddTHH:mm:ss'});"
											class="form-control "
											style="padding-left: 3px; padding-right: 3px;"> <span
											class="input-group-addon"
											style="padding-left: 3px; padding-right: 3px;">至</span> <input
											type="text" name="offDate" value=""
											onclick="WdatePicker({dateFmt:'yyyy-MM-ddTHH:mm:ss'});"
											class="form-control"
											style="padding-left: 3px; padding-right: 3px;">
									</div>

								</div>
							</div>
						</div>

					</div>





					<div class="row">
						<div class="col-sm-12">
							<div class="form-group">
								<label class="col-sm-2 control-label">属性</label>
								<div class="col-sm-10">

									<label class="checkbox-inline"> <!--多选框  --> <input
										type="checkbox" name="attr" value="0">热点推荐
									</label> <label class="checkbox-inline"> <!--多选框  --> <input
										type="checkbox" name="attr" value="1">最新课程
									</label>

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
					<button class="btn btn-primary" onclick="updateCourse('stay')">保存</button>
					<button class="btn btn-default" onclick="updateCourse('back')">保存并返回</button>
					<button class="btn btn-default" onclick="updateCourse('add')">保存并新增</button>
				</div>

			</form>
		</div>
	</div>


</body>
</html>