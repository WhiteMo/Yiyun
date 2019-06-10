<%@page import="Bean.*,DBFunction.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	UserImpl uImpl = new UserImpl();
	User u = (User) session.getAttribute("user");
	if (u == null) {
		response.sendRedirect(request.getContextPath() + "/client/login/login.jsp");
		return;
	}
	pageContext.setAttribute("user", u);
	pageContext.setAttribute("basePath", request.getContextPath());
	CourseImpl cImpl = new CourseImpl();
	Course[] courses = cImpl.getCourseByTeacherId(u.id);
	pageContext.setAttribute("courses", courses);
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>PC_teacher</title>

<!-- css -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto%7CRoboto+Slab%7CMaterial+Icons"
	rel="stylesheet">
<link href="${basePath}/client/css/PC.css" rel="stylesheet" />
<link href="${basePath}/client/css/bootstrap.css" rel="stylesheet" />
<link href="${basePath}/client/css/header_and_footer.css"
	rel="stylesheet" />

<!--javascript-->
<script src="${basePath}/client/js/jquery-3.3.1.js"></script>
<script src="${basePath}/client/js/require.js"></script>
<script src="${basePath}/client/js/bootstrap.js"></script>



<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link href="${basePath}/client/css/header_and_footer.css"
	rel="stylesheet" />
</head>
<body style="padding-top: 50px; margin: 8px 0 0 0;">
	<jsp:include page="/client/header_and_footer/header.jsp" flush="true" /><!--动态包含-->
	<div class="jskapian chengse">
		<br />
		<br />
		<div class="touxiang">
			<c:if test="${user.getHeadImgUrl() eq '#'}">
				<c:if test="${user.role eq 'student'}">
					<c:if test="${user.sex eq 'female' }">
						<img src="${basePath}/client/image/female_student.png"
							class="user-image" alt="User Image">
					</c:if>
					<c:if test="${user.sex ne 'female' }">
						<img src="${basePath}/client/image/male_student.jpg"
							class="user-image" alt="User Image">
					</c:if>
				</c:if>
				<c:if test="${user.role ne 'student'}">
					<c:if test="${user.sex eq 'female' }">
						<img src="${basePath}/client/image/female_teacheer.png"
							class="user-image" alt="User Image">
					</c:if>
					<c:if test="${user.sex ne 'female' }">
						<img src="${basePath}/client/image/male_teacher.png"
							class="user-image" alt="User Image">
					</c:if>
				</c:if>
			</c:if>
			<c:if test="${user.getHeadImgUrl() ne '#'}">
				<img src="${user.getHeadImgUrl()}" class="user-image"
					alt="User Image">
			</c:if>
		</div>
		<div
			style="position: absolute; left: 50%; margin: 0 20px; width: 220px;">
			<h1>${user.name}</h1>
			<h2>${user.college}</h2>


		</div>
		<p>。。。。。。。。。。个人简介。。。。。。。。。。。</p>

		<!--<div class="hang">
		<div class="geshu">1</div>
		<div class="geshu">1</div>
		<div class="geshu">52</div></div>
		<div class="hang">
		<div class="geshu">实战</div>
		<div class="geshu">课程</div>
		<div class="geshu">粉丝</div></div>
		<div class="triangle1"></div>
		<div class="triangle2"></div>  -->
	</div>
	<div class="dingbu row">
		<div class="biaoti">
			主讲课程 <a href="${basePath}/client/teacher/course.jsp?id=<%=u.id%>">查看更多...</a>
			</div>
			<div class="text-center">

				<c:forEach var="course" items="${courses}" begin="0" end="2">
					<a
						href="${basePath}/client/teacher/mumber_management.jsp?id=${course.id}">
						<div class="kapian">
							<div class="pic">
								<img src="${course.imgUrl}" />
							</div>
							<div class="txt">
								<h3>${course.name}</h3>
								<h4>${course.college}</h4>
								<div class="jianjie">${course.shortContent}</div>
								
								<div>
									<a
										href="${basePath}/client/teacher/myMessage.jsp?id=${course.id}"\>&nbsp&nbsp&nbsp未读消息：${course.getCourse()}</a>
								</div>
								<!-- 
									<div class="pingfen">评分：</div>
								 <div class="score">9.5</div>
								<div class="userdata">
									<span class="glyphicon glyphicon-thumbs-up"></span>26258
								</div>-->
							</div>
						</div>
					</a>


				</c:forEach>

				<br style="clear: both;"> 
			</div>
	
	</div>

	<div class="shouji row">
		<div class="biaoti">手记文章</div>
		<div class="text-center">
			<div class="baikapian wenzhang">
				<div class="shouji">
					<span class="glyphicon glyphicon-book"></span>&ensp;手记文章
				</div>
				<div class="wentopic">MyCat 启蒙：分布式系统的数据库架构演变</div>
				<div class="hotpic">
					<img src="${basePath}/client/image/wenzhang1.jpg" />
				</div>
				<div class="hotcontent">单数据库架构
					一个项目在初期的时候，为了尽可能快地验证市场，其对业务系统的最大要求是快速实现。在这个阶段，代码开发人员为了能快速实现业务系统，一般都是将所有层级（MVC）的业务代码都写在同一个项目中，所有的业务数据都存放在同一个数据库中。此时，项目的整体架构图如下所示${basePath}/client.</div>
				<div class="hotcontent">浏览</div>
				<div class="hotcontent">366</div>
				<div class="hotcontent">推荐</div>
				<div class="hotcontent">6</div>
				<a href="#">
					<div class="tiaozhuan">
						阅读全文<span class="glyphicon glyphicon-arrow-right"></span>
					</div>
				</a>
			</div>
			<div class="baikapian wenzhang">
				<div class="shouji">
					<span class="glyphicon glyphicon-book"></span>&ensp;手记文章
				</div>
				<div class="wentopic">【Java框架型项目从入门到装逼】第十一节 用户新增之把数据传递到后台</div>
				<div class="hotpic">
					<img src="${basePath}/client/image/wenzhang2.jpg" />
				</div>
				<div class="hotcontent">让我们继续来做“主线任务”，这一节，我们来做具体的用户新增功能。首先，为了简单起见，我把主页面改了一些，改的是列表那一块。删去了一些字段，和数据库表对应一致：
					现在，我们要实现一个效果，就是当我点击新增用户的按钮时，就弹出一个框来。因为我们使用的是EasyUI组件，所以我们可以用dialog组件来${basePath}/client.</div>
				<div class="hotcontent">浏览</div>
				<div class="hotcontent">313</div>
				<div class="hotcontent">推荐</div>
				<div class="hotcontent">3</div>
				<a href="#">
					<div class="tiaozhuan">
						阅读全文<span class="glyphicon glyphicon-arrow-right"></span>
					</div>
				</a>
			</div>
		</div>
	</div>
	<br />
	<br />
	<jsp:include page="/client/header_and_footer/shouyewei.jsp"
		flush="true" /><!--动态包含-->
</body>
</html>

