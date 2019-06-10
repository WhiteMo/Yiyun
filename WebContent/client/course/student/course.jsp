<%@page import="Bean.Course"%>
<%@page import="DBFunction.SCImpl"%>
<%@page import="Bean.User"%>
<%@page import="DBFunction.UserImpl"%>
<%@page import="Bean.Article"%>
<%@page import="DBFunction.ArticleImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
	SCImpl scImpl =new SCImpl();
	User user = (User)session.getAttribute("user");
	if(user==null){
		response.sendRedirect(request.getContextPath()+"/client/login/login.jsp?message=pleaseLogin");
		return ;
	}
	String studentId = user.getId();
	Course[] courses = scImpl.getCoursesByStudentId(studentId);
	pageContext.setAttribute("courses", courses);
%>
<!DOCTYPE html>
<html ng-app="Unicourse" class="ng-scope">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>

	.activeSpan{
		margin-left:30px;
	}
</style>
<script type="text/javascript">
	

</script>
<style type="text/css">
@charset "UTF-8"; 

[ng\:cloak], [ng-cloak], [data-ng-cloak], [x-ng-cloak], .ng-cloak,
	.x-ng-cloak, .ng-hide {
	display: none !important;
}

ng\:form {
	display: block;
}

.ng-animate-block-transitions {
	transition: 0s all !important;
	-webkit-transition: 0s all !important;
}
</style>
<title>学生个人中心</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="icon" href="${basePath}/client/image/header_brand_image.png" type="image/x-icon"/>
<link id="theme" href="${basePath}/client/course/student/css/bootstrap.style.css"
	rel="stylesheet">
<link href="${basePath}/client/course/student/css/font-awesome.min.css" rel="stylesheet">
<link href="${basePath}/client/course/student/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="${basePath}/client/css/bootstrap.css">
<link href="${basePath}/client/css/header_and_footer.css"
	rel="stylesheet" />
<script src="${basePath}/client/js/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="/obelearn/Public/js/ie-compatible.js"></script>
<![endif]-->
<style>
.list-group-item:first-child {
	border-radius: 0px;
	border-top: none;
}

.tabtitle:visited, .tabtitle:active, .tabtitle:focus {
	outline: none;
	border: none;
}

.courseitem .glyphicon-chevron-right {
	display: none;
}

.courseitem.cur .glyphicon-chevron-right {
	display: block;
}

.list-group-item {
	overflow: hidden;
}

.thumbnail {
	background-color: #F0F0F0
}

;
.redv {
	color: #871727;
}
</style>
</head>
<body ng-app="Unicourse" style="">


	<jsp:include page="/client/header_and_footer/header.jsp"></jsp:include>
	<div id="main-container" class="container">

		<div class="row ng-scope" ng-controller="news">
			<div class="col-lg-3 col-md-3 col-sm-3 hidden-xs" id="main-left">
				<div id="sidebar1" class="panel panel-primary">
					<div class="panel-heading">
						<div class="list-icon">
							<span class="glyphicon glyphicon-th"></span>
						</div>
						我的课程
					</div>
					<div class="list-group" role="menu">
					<c:forEach var="course" items="${courses}">
					
						<span class="hide">${course.id}</span> 
						<a
							href="${basePath}/client/course/course_info_student.jsp?id=${course.id}" title="${course.name}"
							class="list-group-item courseitem" >
							${course.name}<span
							class="glyphicon glyphicon-chevron-right pull-right"></span>
						</a>
					</c:forEach>
						<span class="hide">#</span> 
						<a
							href="javascript:void(0);" title="全部课程"
							class="list-group-item courseitem">
							全部课程<span style="margin-left:30px;"
							class="glyphicon glyphicon-arrow-right"></span>
						</a>
						
					</div>
				</div>

			</div>
			<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
				<div id="main-right">
					<div class="row" style="min-width: 450px">
						<div style="position: relative">
							<ul class="nav nav-tabs newstype">
								<li ng-class="{true:&#39;active&#39;}[type==0]" class="active"><a
									href="javascript:void(0);" data-type="0"
									ng-click="changeType(0);" class="tabtitle">全部</a></li>
								<li ng-class="{true:&#39;active&#39;}[type==1]"><a
									href="javascript:void(0);" data-type="1"
									ng-click="changeType(1);" class="tabtitle">问答</a></li>
								<li ng-class="{true:&#39;active&#39;}[type==2]"><a
									href="javascript:void(0);" data-type="2"
									ng-click="changeType(2);" class="tabtitle">公告</a></li>
								<li ng-class="{true:&#39;active&#39;}[type==3]"><a
									href="javascript:void(0);" data-type="3"
									ng-click="changeType(3);" class="tabtitle">作业</a></li>
								<li ng-class="{true:&#39;active&#39;}[type==4]"><a
									href="javascript:void(0);" data-type="4"
									ng-click="changeType(4);" class="tabtitle">课件</a></li>
								<li ng-class="{true:&#39;active&#39;}[type==5]"><a
									href="javascript:void(0);" data-type="5"
									ng-click="changeType(5);" class="tabtitle">大纲</a></li>
								<span class="pull-right"
									style="margin-top: 10px; margin-right: 5px"><a
									href=""
									ng-hide="cno==0" >进入课程&gt;&gt;</a></span>
							</ul>
						</div>

						<div class="list-group" style="border: top:none;">
							<!-- ngRepeat: n in news -->
							<div class="list-group-item ng-scope ng-binding"
								ng-repeat="n in news">
								<a href="h#"
									class="ng-binding">亦云管理员</a>
									欢迎您使用亦云平台
				
							</div>
							
							<div>
								<div class="page"></div>
							</div>
							<div class="list-group-item" style="text-align: center;">
								<button class="btn btn-link" id="btn-more"
									ng-click="getMoreNews();" ng-hide="stop||onload">加载更多</button>
								<span ng-show="onload" class="ng-hide">加载中……</span> <span
									ng-show="stop" class="ng-hide">没有更多新消息了</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-1 col-md-1 col-sm-1 hidden-xs">
				<div id="corner" style="position: fixed;">
					<div id="btn-totop" class="corner-btn" style="display: none;">
						<a href="#"
							title="回顶部" onclick="goTop();return false;"> <span
							class=" icon-circle-arrow-up icon-3x"></span>
						</a>
					</div>
				
				</div>

				<div class="modal fade" id="modal-feedback">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true" id="btn-closemodal">×</button>
								<h4 class="modal-title">意见与建议</h4>
							</div>
							<form id="form-feedback" class="form ng-pristine ng-valid"
								action="#">
								<div class="modal-body">
									<div class="form-group">
										<label for="fbcontent">
											我们接受各种形式各种内容的反馈，您的意见与建议是我们前进的不竭动力~ <img
											src="./Unicourse+新鲜事_files/shy.gif">
										</label>
										<textarea name="fbcontent" id="fbcontent" class="form-control"
											placeholder="在这里输入您想说的" style="height: 150px"></textarea>
										<div class="errormessage" id="blankerror"
											style="display: none;">
											你好像啥都没写唉<img src="./Unicourse+新鲜事_files/kb.gif">
										</div>
									</div>
									<div class="form-group">
										<label for="feedback-chk"> 是否匿名： <input type="radio"
											name="anonymous" value="0" checked=""> 否 <input
											type="radio" name="anonymous" value="1">是
										</label>
									</div>
									<div class="form-group">
										您的吐槽将于 <a
											href="#"
											target="_blank">吐槽区</a> 中呈现，有什么想说的尽情说出来吧~<img
											src="./Unicourse+新鲜事_files/dx.gif"> <br> <a
											href="#"
											target="_blank">看看大家都在说啥</a> <img
											src="./Unicourse+新鲜事_files/lks.gif">
									</div>
									<input type="hidden" name="title" id="feedback-title"
										value="Unicourse+新鲜事"> <input type="hidden"
										name="utype" value="1">
								</div>

								<div class="modal-footer">
									<button type="button" class="btn btn-primary"
										id="btn-submitfeedback">提交</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">取消</button>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
		<div class="modal fade" id="modal-version">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true" id="btn-closemodal">×</button>
						<h4 class="modal-title">系统更新提示</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>更新日期：2017年1月12日</label>
						</div>
						<div class="form-group">

							<h2>友情提示</h2>
							<p>
								新增作业冻结功能，教师可以随时冻结作业，<strong>作业冻结之后将不能提交，删除及重交。</strong>
							</p>
							<img src="./Unicourse+新鲜事_files/freeze.png" style="width: 100%;">
						</div>
						<div class="form-group">
							还没交上机作业，大作业，各种作业的同学们可要抓紧了，被freeze了可就真没办法了= =</div>
						<div class="form-group">
							<strong>欢迎大家在又双叒叕使用Unicourse一学期后向我们提出建议与反馈，您的意见是我们不断前进的动力~</strong>
						</div>
						<div class="form-group">
							<h1>祝大家寒假快乐~</h1>
						</div>
					</div>
					<form id="form-version" class="form ng-pristine ng-valid">
						<div class="modal-body">
							<div class="form-group">
								<textarea name="vccontent" class="form-control"
									placeholder="你也可以在这里输入你对Unicourse+的吐槽、不满、批评(lao shi kan bu dao)，如果有建议那就更好了，或发送邮件至unicourse@163.com联系(dui)我们，或随时点击右下角的小铅笔在吐槽区留(shua)言(ping)，您的意见与反馈是我们不断前(zuo)进(si)的动力！"
									style="height: 150px" id="fbcontent"></textarea>
								<div class="errormessage" id="blankerror">请输入内容</div>
							</div>
							<input type="hidden" name="title" id="feedback-title" value="">
							<input type="hidden" name="utype" value="2">
							<div class="form-group"></div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								id="btn-submitcomment">提交</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">直接进入系统</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div id="info" data-activeheader="#header-home"></div>
	<footer id="footer">
		<div class="container">
			<div class="col-lg-12">
				Copyright&nbsp;©&nbsp;2013-2018&nbsp;UniCourse,&nbsp;All Rights
				Reserved.</div>
		</div>
	</footer>





	<div id="textarea_simulator"
		style="position: absolute; top: 0px; left: 0px; visibility: hidden;"></div>
</body>
</html>