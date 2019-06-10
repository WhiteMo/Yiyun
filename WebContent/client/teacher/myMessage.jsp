<%@page import="Bean.*"%>
<%@page import="DBFunction.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
	User user =null;
	if(session.getAttribute("user")==null){
		response.setCharacterEncoding("UTF-8");
		response.sendRedirect(request.getContextPath()+"/client/login/login.jsp?role=student&message=pleaseLogin");
		return ;
	}else{
		user = (User)session.getAttribute("user");
		pageContext.setAttribute("user", user);
	};

	String id = request.getParameter("id");
	Course course = null;
	User[] students = null;
	if (id != null) {
		course = new CourseImpl().getCourseById(id);
		students = new SCImpl().getApplyStudentsByCourseId(id);
		pageContext.setAttribute("course", course);
		pageContext.setAttribute("students", students);
		user.setCount(course.getCourse());
	} else {
		response.sendRedirect(request.getContextPath() + "/client/pcenter/pc_teacher.jsp");
		return;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>课程成员</title>

<!-- css -->
<link href="${basePath}/client/css/bootstrap.min.css" rel="stylesheet" />
<link href="${basePath}/client/css/header_and_footer.css"
	rel="stylesheet" />
<link href="${basePath}/client/css/mumber_management.css"
	rel="stylesheet" />
<!--javascript-->
<script src="${basePath}/client/js/jquery-3.3.1.js"></script>
<script src="${basePath}/client/js/layer.js"></script>
<script src="${basePath}/client/js/bootstrap.js"></script>
<script type="text/javascript">
function agreeApply(studentId){
	var courseId = '<%=course.id%>'
	var basePath="<%=request.getContextPath()%>";
	
	
	$.post(basePath+'/SCAction',{type:"agreeApply",
		courseId:courseId
		,studentId:studentId},function(result){
			if(result=="success"){
				layer.msg("操作成功",{icon:1,time:2000})
				$('.row[studentId='+studentId+']').remove()
			}
		})
}
</script>
</head>
<body style="padding-top: 50px; margin: 8px 0 0 0;">
	<jsp:include page="/client/header_and_footer/header.jsp" flush="true" /><!--动态包含-->

	<div class="container">
		<div id="mm_head">

			<button id="mum_in" type="button" class="btn btn-primary btn-lg"
				data-toggle="modal" data-target="#myModal">导入成员</button>
			<a>下载成员信息</a>
			<div class="mum_searcher">
				<div class="input-group">
					<input type="text" class="form-control" id="mm_input"
						placeholder="Search for.."> <span class="input-group-btn">
						<button class="btn btn-default" id="mm_button" type="button">查找</button>
					</span>
				</div>
				<!-- /input-group -->
			</div>
		</div>
	</div>


	<div class="container" id="outer">
		<div id="main">
			<div class="row">
				<div class="col-xs-3"
					style="border-right: solid 1px #eee; padding: 0; min-height: 600px">
					<div style="padding: 10px 10px 10px 25px">
						<div class="mm-name">课程名称:${course.name}</div>
					</div>
					<div style="border-top: solid 1px #eee;">
						<ul class="mm-info">
							<%@include file="/client/teacher/mm_list.jsp" %>
						</ul>
					</div>
				</div>
				<div class="col-xs-9" style="padding: 0;">
					<div class="mm-leibie">申请学生（1）</div>
					<ul class="mm-mumber">
						<li>
							<div class="row">
								
								<div class="col-xs-2">
									<span>学号</span>
								</div>
								<div class="col-xs-2">
									<span>姓名</span>
								</div>

								<div class="col-xs-3">
									<span>学校</span>
								</div>
								<div class="col-xs-3">
									<span>电话</span>
								</div>
								<div class="col-xs-2">
									<span>操作</span>
								</div>
							</div>
						</li>

						<li>
							<c:forEach var="student" items="${students}">
							<div class="row" studentId="${student.id}">
						
								<div class="col-xs-2">
									<span>${student.account}</span>
								</div>
								<div class="col-xs-2">
									<span>${student.name}</span>
								</div>

								<div class="col-xs-3">
									<span>${student.college}</span>
								</div>
								<div class="col-xs-3">
									<span>${student.teleNumber}</span>
								</div>
								<div class="col-xs-2">
									<a class="btn" onclick="agreeApply('${student.id}')">同意申请</a>
								</div>
							
							</div>	</c:forEach>
						</li>






						<li><button style="width: 80%">同意</button></li>

					</ul>
				</div>
			</div>

		</div>



	</div>

	<!--模态框-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header" style="padding: 0px; border-bottom: 0">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a href="#home" data-toggle="tab">手动添加
						</a></li>
						<li><a href="#ios" data-toggle="tab">从excel导入</a></li>

					</ul>
				</div>
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade in active" id="home">

						学生学号:<input type="text" id="studentAccount"><br /> <font
							size="3" color="red" id="prompt" style="display: none">学生学号有误</font><br />
						<small>添加完后请刷新页面</small>
						<button onclick="addStudent()">添加</button>
					</div>
					<div class="tab-pane fade" id="ios">

						<div class="modal-body">

							<label for="exampleInputFile">请上传成员名单（Excel表格）</label> <input
								type="file" id="exampleInputFile">
							<p class="help-block">仅有一列，为学生id</p>
						</div>

					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>



			</div>
		</div>
	</div>
	<!--模态框-->



	<iframe src="${basePath}/client/header_and_footer/footer.html"
		id="iframe-footer"></iframe>
</body>
</html>