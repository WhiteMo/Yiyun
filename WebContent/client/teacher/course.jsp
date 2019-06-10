<%@page import="Tool.StringTool"%>
<%@page import="Bean.*,DBFunction.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	StringTool tool = new StringTool();
	pageContext.setAttribute("basePath", request.getContextPath());
	User teacher = (User) session.getAttribute("user");
	if(session.getAttribute("user")==null){
		response.sendRedirect(request.getContextPath()+"/client/login/login.jsp");
		return ;
	}
	CourseImpl cImpl = new CourseImpl();
	Course[] courses = cImpl.getCourseByTeacherId(teacher.getId());
	pageContext.setAttribute("teacher", teacher);
	pageContext.setAttribute("courses", courses);
	pageContext.setAttribute("id", teacher.getId());
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>Course</title>

<!-- css -->
<link href="${basePath}/client/css/Teacher.css" rel="stylesheet" />
<link href="${basePath}/client/css/bootstrap.css" rel="stylesheet" />
<link href="${basePath}/client/css/header_and_footer.css"
	rel="stylesheet" />
<link href="${basePath}/client/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${basePath}/client/css/signin.css" rel="stylesheet">
<script src="${basePath}/client/js/ie-emulation-modes-warning.js"></script>
<!--javascript-->
<script src="${basePath}/client/js/jquery-3.3.1.js"></script>
<script src="${basePath}/client/js/require.js"></script>
<script src="${basePath}/client/js/bootstrap.js"></script>
<link href="${basePath}/client/css/header_and_footer.css"
	rel="stylesheet" />
<style>
.back {
	display: none;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.45);
	position: fixed;
	left: 0;
	top: 0;
	z-index: 9;
}

.kuang {
	opacity: 1;
	z-index: 1111;
	display: none;
	top: 50%;
	left: 50%;
	position: absolute;
	display: block;
	transform: translate(-50%, -50%);
	width: 500px;
	height: 310px;
	background-color: white;
}

.sign {
	text-align: center;
	width: 500px;
	height: 30px;
	font-size: 18px;
	color: white;
	display: block;
	position: absolute;
	margin-top: 40px;
}

.sign a {
	color: white;
}

.sign>a :hover, .sign>a :focus {
	color: #f8d6d5;
}

.remove {
	float: right;
	margin: 5px;
}

.create {
	margin-left: 18px;
}
.buttomNav{
	position:absolute:bottom:0;
}
</style>

<script type="text/javascript">
	function deleteCourse(id){
		
		var basePath='<%=request.getContextPath()%>'
		var b = confirm("确定要删除吗？")
		if(b){
			$.post(basePath+"/CourseAction",{type:"delete"
				,id:id},function(result){
					if(result=="success"){
						location.reload();
					}
				})
		}else{
			
		}
		
	}

</script>


</head>
<body style="padding-top: 50px; padding-bottom: 0px; margin: 8px 0 0 0;">
	<jsp:include page="/client/header_and_footer/header.jsp" flush="true" /><!--动态包含-->
	<br />
	<br />

	<div class="container">
		<div class="page-header">
			<h1>
				课堂管理 <small>${teacher.name}</small>
			</h1>
		</div>
		<div class="create">

			<a href="${basePath}/client/course/add_course.jsp?id=${id}"> <span
				class="glyphicon glyphicon-plus"></span>创建班级
			</a>
		</div>

		
		<c:forEach var="course" items="${courses}" varStatus="st">
		
		<c:if test="${st.index%4==0}">
			<div class="row">
		</c:if>		
		
		<div class="col-md-3 col-lg-3  col-sm-3 col-xs-3">
				<a href="${basePath}/client/teacher/mumber_management.jsp?id=${course.id}">
					<div class="kapian">
						<div class="pic">
							<img src="${course.imgUrl}" />
						</div>
						<div class="txt">
							<h3>${course.name}</h3>
							<h4>${course.teacherName}</h4>
							<div class="pingfen">邀请码：${course.getCode()}</div>
							<div class="userdata">
								<span class="glyphicon glyphicon-user"></span>成员
							</div>
						</div>
					</div>
				</a>
				<div class="genggai">
					<a href="${basePath}/client/course/update_course.jsp?id=${course.id}">编辑</a>
					<a onclick="deleteCourse('${course.id}')">删除</a>
					<a href="${basePath}/client/teacher/mumber_management.jsp?id=${course.id}">班级管理</a>
					<a href="${basePath}/client/course/teacher/course.jsp?id=${course.id}">课件管理</a>
				
				</div>
			</div>
		<c:if test="${st.last}">
		</div>
		</c:if>
		<c:if test="${!st.last&&(st.index+1)%4==0}">
		</div>
		</c:if>

		</c:forEach>		
		<br />
		<br />
		
</body>
<script type="text/javascript">
        $(function(){
        })
        function openDialog(){
            document.getElementById('light').style.display='block';
            document.getElementById('fade').style.display='block'
        }
        function closeDialog(){
            document.getElementById('light').style.display='none';
            document.getElementById('fade').style.display='none'
        }
    </script>
</html>
