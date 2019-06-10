<%@page import="DBFunction.*"%>
<%@page import="Bean.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
	String id=request.getParameter("id");
	Course course = null;
	CourseImpl cImpl = new CourseImpl();
	if(id==null){
		response.sendRedirect(request.getContextPath()+"/client/pcenter/pc_student.jsp");  
		return;
	}else{
		course = cImpl.getCourseById(id);
		pageContext.setAttribute("course", course);
	}
	Announcement[] anns = new AnnouncementImpl().getAnnouncementByCourseId(course.getId());
	pageContext.setAttribute("anns",anns);
	
%>
<!--公告、课件、讨论-->
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>课程详情</title>
	<!-- css -->
    <link href="${basePath}/client/css/bootstrap.css" rel="stylesheet" />
    <link href="${basePath}/client/css/header_and_footer.css" rel="stylesheet" />
	<link href="${basePath}/client/css/bulletin.css" rel="stylesheet" />

    <!--javascript-->
    <script src="${basePath}/client/js/jquery-3.3.1.js"></script>
    <script src="${basePath}/client/js/require.js"></script>
    <script src="${basePath}/client/js/bootstrap.js"></script>
	
	<link href="${basePath}/client/css/header_and_footer.css" rel="stylesheet" />
  </head>
  <body style="padding-top:50px">
     <jsp:include page="/client/header_and_footer/header.jsp" flush="true"/><!--动态包含-->  
    <div class="className"><a href="#" target="_blank">${course.name}</a></div>
    <div class="classTeacher"><a href="#" target="_blank">${course.teacherName}</a></div>
	<div class="sideNav">
	    <img src="${course.imgUrl}" style="width:100%;height:150px;"></img>
	    <ul>
	  
		     <li style="background-color:#ab3234"><a class="hover" href="#" target="_blank">
			          <span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>&nbsp公告</a>
			 </li>
			<!-- 
			 <li><a href="1-1-3-2.html" target="_blank">
			          <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp课件</a></li>
			 <li><a href="1-1-3-3.html" target="_blank">
			          <span class="glyphicon glyphicon-bullhorn" aria-hidden="true"></span>&nbsp讨论</a></li>
			 <li><a href="1-1-3-4.html" target="_blank">
			          <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp作业及测试</a></li>
					  
			 <li><a href="${basePath}/client/1-1-1/1-1-1.html" target="_blank">
			          <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>&nbsp课程简介</a></li>
			-->
			<li><a href="${basePath}/client/course/singleCourse/ware.jsp?courseId=${course.getId()}">
			          <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp课件</a></li>
			 <li><a href="${basePath}/client/course/course_live.jsp?id=${course.id}">
			          <span class="glyphicon glyphicon-facetime-video" aria-hidden="true"></span>&nbsp课程观看</a></li>
			 <div id="lanPos"></div>
		</ul>
	</div>
	
	<div class="bulletinBody">
	<br>
	     <div class="waring">
		    <h4>
		  
			<%
				if(anns.length==0){
					%>
					<span class="glyphicon glyphicon-bell" aria-hidden="true">
					&nbsp</span>老师还没有发布新的公告诶，可以安心玩耍了~
					<%
				}else{
					%>
							<span class="glyphicon glyphicon-bell" aria-hidden="true">
							&nbsp</span>老师发布了最新的公告
					<%
				}
			%>
		

			</h4>
		</div>
	    <div class="bulletinTitle">
	     课程公告
		</div>
		
		<c:forEach var="ann" items="${anns}">
			<div class="bulletinContent">
			  <h3 style="font-family:黑体">${ann.getTitle()}</h3><br>
			  <h4>${ann.getContent()}</h4><br>
			  <h4 style="float:right">${ann.getDate() }</h4><br><br>
			</div>
		</c:forEach>
		
	
		<br>
		<br>
		<br>
		
	</div>
	<div style="margin-top:5%;width:100%;height:100px;background-color:#151515;float:left">
	</div>
    
	<iframe src="${basePath}/client/header_and_footer/footer.html" id="iframe-footer"></iframe>
  </body>
  
</html>