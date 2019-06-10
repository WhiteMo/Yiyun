<%@page import="Bean.*,DBFunction.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
	User student = (User) session.getAttribute("user");
	if(session.getAttribute("user")==null){
		response.sendRedirect(request.getContextPath()+"/client/login/login.jsp");
		return ;
	}
	SCImpl sImpl = new SCImpl();
	Course[] courses = sImpl.getCoursesByStudentId(student.id);
	pageContext.setAttribute("student", student);
	pageContext.setAttribute("courses", courses);
	pageContext.setAttribute("id", student.getId());
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


<!-- Custom styles for this template -->
<link href="${basePath}/client/css/signin.css" rel="stylesheet">

<!--javascript-->
<script src="${basePath}/client/js/jquery-3.3.1.js"></script>
<script src="${basePath}/client/js/bootstrap.js"></script>
<script src="${basePath}/client/js/layer.js"></script>


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
</style>

<script type="text/javascript">
	function deleteSC(id){
		var basePath='<%=request.getContextPath()%>'
		var courseId = id;
		var userId = '<%=student.id%>'
		var b = confirm("确定要退课吗？")
		if(b){
			$.post(basePath+"/SCAction",{type:"deleteSC"
				,courseId:courseId,userId:userId},function(result){
					if(result=="success"){
						location.reload();
					}
				})
		}else{
			
		}
		
	}
	//prompt层
	function test(){
		var basePath = '<%=request.getContextPath()%>'
		var userId = '<%=student.id%>'
		layer.prompt({title: '输入邀请码加入课程', formType: 0}, function(pass, index){
				
			$.post(basePath+"/SCAction",{type:"addCourseByCode"
			 		,userId:userId
			 		,code:pass},function(result){
			 			if(result=="success"){
			 				layer.close(index); 
			 				layer.msg('操作成功', {
			 			       icon: 1,
			 			       time:1000
			 			      });
			 			}else if(result=="errorCode"){
			 				layer.close(index); 
			 				layer.msg('非法的邀请码', {
				 			       icon: 2,
				 			       time:1000
				 			      });
			 			}else if(result=="repeat"){
			 				layer.close(index); 
			 				layer.msg('已经添加', {
				 			       icon: 3,
				 			       time:1000
				 			      });
			 			}else{
			 				layer.close(index); 
			 				layer.msg('未知的错误', {
				 			       icon: 2,
				 			       time:1000
				 			      });
			 			}
			 		})
			
			})
	}
	
</script>


</head>
<body style="padding-top: 50px; padding-bottom: 0px; margin: 8px 0 0 0;">
	<jsp:include page="/client/header_and_footer/header.jsp" flush="true" /><!--动态包含-->
	<br />
	<br />

	<div class="container">
		
		<div class="create">
			<button onclick="test()"> <span
				class="glyphicon glyphicon-plus"></span>加入课程
			</button>
		</div>
		<c:forEach var="course" items="${courses}" varStatus="st">
		
		<c:if test="${st.index%4==0}">
			<div class="row">
		</c:if>		
		
		<div class="col-md-3 col-lg-3  col-sm-3 col-xs-3">
				<a href="${basePath}/client/course/course_info_student.jsp?id=${course.id}">
					<div class="kapian">
						<div class="pic">
							<img src="${course.imgUrl}" />
						</div>
						<div class="txt">
							<h3>${course.name}</h3>
							<h4>${course.teacherName}</h4>
							<div class="pingfen">邀请码：${course.getCode()}</div>
							<div class="userdata">
								<span class="glyphicon glyphicon-user"></span>成员26
							</div>
						</div>
					</div>
				</a>
				<div class="genggai">
					<a href="${basePath}/client/course/update_course.jsp?id=${course.id}">编辑</a>
					<a onclick="deleteSC('${course.id}')">退课</a>
					<a href="${basePath}/client/student/mumber_management.jsp?id=${course.id}">班级管理</a>
					<!--  <a href="#">打包下载</a>-->
				</div>
			</div>
		<c:if test="${st.last}"></div></c:if>
		<c:if test="${!st.last&&(st.index+1)%4==0}"></div></c:if>

		</c:forEach>
		
				
		
		
		<br />
		<br />
		<iframe src="${basePath}/client/header_and_footer/footer.html"
			id="iframe-footer"></iframe>
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
