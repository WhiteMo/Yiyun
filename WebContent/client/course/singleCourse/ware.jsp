<%@page import="Bean.Ware"%>
<%@page import="DBFunction.WareImpl"%>
<%@page import="Bean.Course"%>
<%@page import="DBFunction.CourseImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<% 
	String basePath = request.getContextPath();
	String courseId = request.getParameter("courseId");
	pageContext.setAttribute("basePath", basePath);
	Course course = null;
	CourseImpl cImpl = new CourseImpl();
	if(courseId==null){
		response.sendRedirect(request.getContextPath()+"/client/pcenter/pc_student.jsp");  
		return;
	}else{
		course = cImpl.getCourseById(courseId);
		pageContext.setAttribute("course", course);
	}
	WareImpl wImpl =new WareImpl();
	Ware[] wares = wImpl.getWaresByCourseId(courseId);
	pageContext.setAttribute("wares",wares);
%>
<!--公告、课件、讨论-->
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>课件</title>
	<!-- css -->
    <link href="${basePath}/client/css/bootstrap.css" rel="stylesheet" />
    <link href="${basePath}/client/css/header_and_footer.css" rel="stylesheet" />
	<link href="${basePath}/client/css/bulletin.css" rel="stylesheet" />

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
	<link href="${basePath}/client/css/header_and_footer.css" rel="stylesheet" />
  </head>
  <body style="padding-top:50px">
    <jsp:include page="/client/header_and_footer/header.jsp" flush="true"/><!--动态包含--> 
   <div class="className"><a href="#" target="_blank">${course.name}</a></div>
    <div class="classTeacher"><a href="#" target="_blank">${course.teacherName}</a></div>
	<div class="sideNav">
	    <img src="${course.imgUrl}" style="width:100%;height:150px;"></img>
	    <ul>
	  
		     <li style="background-color:#ab3234"><a class="hover" href="${basePath}/client/course/course_info_student.jsp?id=${course.getId()}">
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
	
	<div class="courseSource">
	<br>
	     
	    <div class="bulletinTitle">
				     课件列表
		</div>
		<c:forEach var="ware" items="${wares}">
		<div class="source">
		  	 <div class="sourceLogo">
		  	    <h1><span class="glyphicon glyphicon-file" aria-hidden="true"></span></h1>
		  	 </div>
		 	  <div class="sourceInfo">
		  	    <a href="${basePath}/WareAction?type=getWareById&id=${ware.getId()}" target="_blank">${ware.getName()}</a>
				  <h5>${ware.getDate()}</h5>
		   	</div>
		</div>
		</c:forEach>
		
	
		<br><br>
	</div>
    
	<div style="margin-top:5%;width:100%;height:100px;background-color:#151515;float:left">
	</div>
    
  </body>
  
</html>