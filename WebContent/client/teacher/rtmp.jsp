<%@page import="Bean.*"%>
<%@page import="DBFunction.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
	String id=request.getParameter("id");
	Course course = null;
	User[] students = null;
	User teacher = (User)session.getAttribute("user");
	if(teacher==null){
		response.sendRedirect(request.getContextPath()+"/client/login/login.jsp?role=teacher&message=pleaseLogin");  
		return;
	}else{
		pageContext.setAttribute("teacher", teacher);
	}
	if(id!=null){
		course = new CourseImpl().getCourseById(id);
		students = new SCImpl().getStudentsByCourseId(id);
		pageContext.setAttribute("course",course);
		pageContext.setAttribute("students", students);
	}else{
		response.sendRedirect(request.getContextPath()+"/client/pcenter/pc_teacher.jsp");  
		return;
	}

%>
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
<script src="${basePath}/client/js/require.js"></script>
<script src="${basePath}/client/js/bootstrap.js"></script>

</head>
<script type="text/javascript">
function addStudent(){
	var account =$('#studentAccount').val()
	var courseId='<%=id%>';
	var basePath = '<%=request.getContextPath()%>';
	$.post(basePath+'/SCAction',{type:'add'
		,account:account
		,courseId:courseId},function(result){
			if(result=='success'){
				$('#prompt').attr('color','green').html('添加成功').show();
				
			}else if(result=="errorAccount"){
				$('#prompt').attr('color','red').html('学生学号不对').show();
			}else{
				$('#prompt').attr('color','red').html('出现了未知的错误').show();
			}
		})
}

</script>
<body style="padding-top: 50px; margin: 8px 0 0 0;">
	<jsp:include page="/client/header_and_footer/header.jsp" flush="true" /><!--动态包含-->

	<div class="container">
		<div id="mm_head">

			<button id="mum_in" type="button" class="btn btn-primary btn-lg"
				data-toggle="modal" data-target="#myModal">导入成员</button>
			<a href="${basePath}/client/course/update_course.jsp?id=${course.id}">课程信息修改</a>
			<div class="mum_searcher">
				<div class="input-group">
					<input type="text" class="form-control" id="mm_input"
						placeholder="Search for.."> <span
						class="input-group-btn">
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
					<div class="mm-leibie">推流地址 <span></span></div>
					<ul class="mm-mumber">
						<li>
							<script type="text/javascript">	
								var str = "rtmp://183.174.60.25:1935/live";
								//var str1 = "rtmp://[2401:ec00:21:9:baca:3aff:fe61:74c1]:1935/live";
								var str2 = "<%=id%>";
								document.write(str + '/' + str2);
							</script>
						</li>
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
				
				<div class="modal-header" style="padding:0px;border-bottom:0">
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
					
					学生学号:<input type="text" id="studentAccount"><br/>
					<font size="3" color="red" id="prompt" style="display:none">学生学号有误</font><br/>
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
