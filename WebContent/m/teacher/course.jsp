<%@page import="Bean.Course"%>
<%@page import="Bean.User"%>
<%@page import="DBFunction.CourseImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	String basePath = request.getContextPath();
	pageContext.setAttribute("basePath",basePath);
	User teacher  = (User)session.getAttribute("user");
	if(teacher==null){
		response.sendRedirect(basePath+"/m/teacher/login.jsp");
		return ;
	}
	String teacherId = teacher.getId();
	Course[] courses = new CourseImpl().getCourseByTeacherId(teacherId);
	pageContext.setAttribute("courses",courses);
	for(int i=0;i<courses.length;i++){
		System.out.println(courses[i].getImgUrl());
	}
%>    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="content-language" lang="zh-CN">
<meta name="applicable-device" content="mobile">
<meta name="HandheldFriendly" content="True">

<link rel="apple-touch-icon-precomposed" sizes="57x57"
	href="http://www.qiyipic.com/common/fix/h5_iqiyi/desktop_logo-57.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="http://www.qiyipic.com/common/fix/h5_iqiyi/desktop_logo-72.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="http://www.qiyipic.com/common/fix/h5_iqiyi/desktop_logo-114.png">
<meta name="google-site-verification"
	content="L-6UypsjHtMHwskdXOo3D2ziLYdCVFL4fUlLt-onfVU">
<script charset="utf-8" src="./爱奇艺视频_files/x.js.下载"></script>
<script type="text/javascript" src="./爱奇艺视频_files/lib.2.0.5.min.js.下载"></script>
<link type="text/css" href="./爱奇艺视频_files/h5-search.css"
	rel="stylesheet">
<script src="./爱奇艺视频_files/qoe.min.js.下载"></script>

<title>爱奇艺视频</title>
<script async="" src="./爱奇艺视频_files/push.js.下载"></script>
<script async="" src="./爱奇艺视频_files/beacon.js.下载"></script>
<script async="" src="./爱奇艺视频_files/hm.js.下载"></script>
<script async="" src="http://push.zhanzhang.baidu.com/push.js"></script>
<script async="" src="http://b.scorecardresearch.com/beacon.js"></script>
<script async=""
	src="//hm.baidu.com/hm.js?5df871ab99f94347b23ca224fc7d013f"></script>

<link rel="stylesheet" href="${basePath}/m/teacher/css/font-awesome.min.css">
</head>
<body>
	<!-- 搜索导航 -->
	<div glue-component="common.component.navbase.header"
		glue-id="common.component.navbase.header_37">
		<section class="m-header-search m-search-page">
			<hgroup id="headerEl" glue-node="headerEl" class="fixed_top"
				style="z-index: 6000; top: 0px;">
				<!-- 头部搜索 -->
				<div glue-component="common.component.search.SearchInput"
					glue-id="searchInput" class="m-search-full-bgfff">
					<div class="header-search-box">
						<a href="#" class="logo-iqiyi"
							style="background:url(${basePath}/client/image/logo.png); 
							background-repeat:no-repeat;
							background-size: auto 100%;
							white-space: nowrap;
						"></a>
						<span style="line-height: 30px;color:white;font-size:20;margin-left:50px;margin-top:20px">亦云课堂</span>
						<span style="line-height: 30px;z-index:123" class="fa fa-sign-out;float:right"></span>退出登录
					</div>
					<!-- suggest -->
					
				</div>
				<!-- 头部搜索end -->
			</hgroup>
		</section>
	</div>
	<!-- 搜索导航 end -->
	
	<div glue-component="page.search.component.utils.Search"
		glue-behavior="page.search.component.SearchScroll" glue-id="search">
		<div style="padding-top:0.5rem"></div>
		<div glue-node="search_results">
			
			<c:forEach var="course" items="${courses}">
				<!-- 单条视频-->
			<div class="m-box m-box-top">
				<div class="m-box-items m-box-items-full">
					<div class="m-topList m-topList-search">
						<div class="topList-img">
							<a href="./chat.jsp?id=${course.id}"
								class="topList-link" data-delegate="go" data-page-tmplid="play"
								data-widget-ptype="1-1-1"
								style="background-image: url(http://www.1y.net/${course.getImgUrl()});">
								<div class="c-rb">
									<span class="c-date">
									<c:if test="${course.getStatus() eq '0'}">
										已经结束
									</c:if>
									<c:if test="${course.getStatus() eq '1'}">
										正在直播
									</c:if>
									<c:if test="${course.getStatus() eq '2'}">
										将要直播
									</c:if>
									</span>
								</div>
							</a>
							<!-- 拍客角标 -->
						</div>
						<a class="topList-text"
							href="./chat.jsp?id=${course.id}"
							data-widget-ptype="1-1-2" data-delegate="go"
							data-page-tmplid="play">
							<div class="topList-title">
								<span class="green">${course.getName()}</span>：${course.getShortContent()}
							</div> <em class="topList-type"></em> <em
							class="topList-video">听课人数:2</em>
						</a>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
		<div class="m-box" style="" glue-hide="btn_moreStyle"
			data-widget-btn="more" glue-node="btn_more">
			<div class="m-box-items m-box-items-full">
				<section class="m-linkMore noborder-top">
					<a href="./login.jsp" class="m-link" glue-node="load_btn"
						glue-bind-html="tip">点击退出登录</a>
				</section>
			</div>
		</div>
		

	</div>

	<div class="m-box-bottom">
		<div class="page-c-items">
			<footer class="m-footer" glue-component="common.component.footer">
				<img src="${basePath}/client/image/logo2.png">
			</footer>
		</div>
	</div>


	<!-- 底部 结束 -->



	<script type="text/javascript">
    ;(function(d, m) {
        var i = new Image(),
            s = '//iqiyi.irs01.com/irt?_iwt_t=i&_iwt_id=&_iwt_UA=UA-iqiyi-000008&r=' + m.random() + +new Date();
        i.src = s;
    })(document, Math);
</script>


</body>
</html>