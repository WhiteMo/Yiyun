<%@page import="Bean.AD"%>
<%@page import="DBFunction.ADImpl"%>
<%@page import="DBFunction.CourseImpl"%>
<%@page import="Bean.Course"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	CourseImpl cImpl = new CourseImpl();
	Course[] courses = cImpl.getAllCourses();
	ADImpl adImpl = new ADImpl();
	AD[] ads = adImpl.getAllADs();

	pageContext.setAttribute("ads", ads);
	pageContext.setAttribute("courses", courses);
	pageContext.setAttribute("basePath", request.getContextPath());
	//session.removeAttribute("user");
	//session.setAttribute("count", str);
%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>搜索页面</title>

    <!-- Bootstrap -->
    <link href="${basePath}/client/css/bootstrap.css" rel="stylesheet" />
    <link href="${basePath}/client/css/header_and_footer.css" rel="stylesheet" />
    <link href="${basePath}/client/css/searcher_show_style1.css" rel="stylesheet" />
    <link href="${basePath}/client/css/searcher_show_style_common.css" rel="stylesheet" />
    <link href="${basePath}/client/css/searcher.css" rel="stylesheet" />


    <!--javascript-->

    <script src="${basePath}/client/js/jquery-3.3.1.js"></script>
    <script src="${basePath}/client/js/header-and-footer.js"></script>
    <script src="${basePath}/client/js/bootstrap.js"></script>
    <script src="${basePath}/client/js/searcher.js"></script>
	<script src="${basePath}/client/js/require.js"></script>

  
</head>

<body style="padding-top:50px; margin:8px 0 0 0;">
	<jsp:include page="/client/header_and_footer/header.jsp" flush="true"/><!--动态包含-->  
    <!--  -->
    <div class="container <!--hidden-xs--> searcher-searcher">
        <!-- 搜索栏 -->
        <div class="row" style="height:100%">
            <div class="col-md-1 hidden-sm"><br /></div>
            <div class="col-xs-3" style="height:100%">
                <img src="${basePath}/client/image/header_brand_image.png" />
                <span id="searcher-searcher-brand">亦云课堂</span>
            </div>
            <div class="col-xs-7">
                <div class="input-group searcher-searcher-form">
                    <!---->
                    <form id="header-searcher"
										class="navbar-form navbar-left navbar-right" action="${basePath}/SearchAction">
                    <input type="text" class="form-control" placeholder="搜索" name="str">
                    <!--input type="submit" id="footer-searcher-button" class="btn btn-default"-->
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="submit" >
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                    </button>
                    </span>
                    </form>
                </div>
                <!-- /input-group -->
            </div>
        </div>
   		
   	
    </div>
    <!-- 搜索栏 -->

    <div class="container searcher-selecter">
        <!-- 选项 -->
        <div class="searcher-selecter-content">
            <!-- 课程 -->

            <h4>课程:</h4>

            <a href="#" class="list-group-item">
             		    计算机
            </a>
            <a href="#" class="list-group-item">
         			       数学
            </a>
            <a href="#" class="searcher-selecter-active list-group-item ">
           				     哲♂学
            </a>
        </div>
        <!-- 课程 -->

        <hr />
        <!--分割线-->

        <div class="searcher-selecter-content">
            <!-- 学校 -->
            <h4>学校:</h4>
            <a href="#" class="list-group-item">
                人大
            </a>
            <a href="#" class="list-group-item">
                中国人民大学
            </a>
            <a href="#" class="searcher-selecter-active list-group-item ">
                中国人民大学信息学院
            </a>
        </div>
        <!-- 学校 -->

    </div>
    <!-- 选项 -->

    <div class="container searcher-show">
        <!-- 课程展示 -->
        <c:forEach var="course" items="${courses1}" varStatus="num">
        <div class="searcher-show-course">
            <!-- 课程1 -->
            <div class=" view view-first searcher-myview">
                <img src="${course.imgUrl}">
                <div class="mask">
                    <h2>${course.name}</h2>
                    <p>$course.shortContent}</p>
                    <a href="${basePath}/client/course/course_info.jsp?id=${course.id}" class="info">Read More</a>
                </div>
            </div>
            <div class="searcher-show-info">
                <h3>${course.name}</h3>
                <p style="margin: 0 0 30px;">
                    ${course.shortContent}
                </p>
                <div>
                    <span style="float:left;color:#777">讲师："${course.teacherName}" </span>
                    <span style="float:right;color:#777">
                            <span>
                                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span>32人
                    </span>
                    &ensp;
                    <span onclick="red_it(this)" style="cursor:pointer">
                                    <span class="glyphicon glyphicon-heart-empty"  aria-hidden="true"></span>16
                    </span>

                    </span>
                </div>
                <br/>
                <div style="padding-top:0.5em">
                    <span style="float:right;">
                        <a style="color:#777;" href="${basePath}/course/course-info.html">更多信息</a>
                    </span>
                </div>
            </div>
        </div>
        </c:forEach>
       
    </div>
    <!-- 课程展示 -->

	<jsp:include page="/client/header_and_footer/shouyewei.jsp" flush="true"/><!--动态包含-->  
    </body>

</html>