<%@page import="Bean.*"%>
<%@page import="DBFunction.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
    CourseImpl cImpl = new CourseImpl();
    Course[] courses = cImpl.getAllCourses();
    
    ADImpl adImpl = new ADImpl();
    AD[] ads = adImpl.getAllADs();
    ChannelImpl chImpl=new ChannelImpl();
    Channel[] chs =chImpl.getAllChannel();
    
    pageContext.setAttribute("chs", chs);
    pageContext.setAttribute("ads", ads);
    pageContext.setAttribute("courses", courses);
    pageContext.setAttribute("basePath", request.getContextPath());
    User user = (User)session.getAttribute("user");
    pageContext.setAttribute("user", user);
    Article[] asn = new ArticleImpl().getArticlesByTag("n");
    pageContext.setAttribute("asn", asn);
    
    Article[] asa = new ArticleImpl().getArticlesByTag("a");
    pageContext.setAttribute("asa", asa);
    
    Article[] asp = new ArticleImpl().getArticlesByTag("p");
    pageContext.setAttribute("asp", asp);
    
    
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>亦云课堂</title>
<link
	href="https://fonts.googleapis.com/css?family=Roboto%7CRoboto+Slab%7CMaterial+Icons"
	rel="stylesheet">
<link href="${basePath}/client/css/homepage.css" rel="stylesheet">
<link href="${basePath}/client/css/shouyetou.css" rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="${basePath}/client/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${basePath}/client/css/owl.carousel.css">
<link rel="stylesheet" href="${basePath}/client/css/owl.theme.css">
<link rel="icon" href="${basePath}/client/image/header_brand_image.png"
	type="image/x-icon" />
<!-- Custom styles for this template -->
<link href="${basePath}/client/css/carousel.css" rel="stylesheet">
<script src="${basePath}/client/js/owl.carousel.min.js"></script>
<script type="text/javascript">
function search(str){
    window.event.returnValue=false;
    $.post(basePath+"/SearchAction",{str:str});
}
</script>
<link href="${basePath}/client/css/shouyetou.css" rel="stylesheet" />
<style>
.wrap {
	width: 20px;
	margin-top: 12px;
	margin-bottom: 10px;
	position: relative;
}

.img {
	width: 20px;
	height: 20px;
}

.notice {
	margin-top: 7px;
	width: 17px;
	height: 17px;
	line-height: 20px;
	font-size: 10px;
	color: #000;
	text-align: center;
	background-color: #FFD700;
	border-radius: 50%;
	position: absolute;
	right: -10px;
	top: -10px;
}
</style>
</head>
<body>

	<div id="header-body">
		<div class="container lvrongqi">
			<div class="col-xs-1 col-sm-1" style="font-size: 36px;">&emsp;&emsp;&emsp;</div>
			<div class="col-xs-10 col-sm-10">
				<nav class="row header-nav navbar navbar-inverse navbar-fixed-top ">
					<div class="container-fluid">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1"
								aria-expanded="false">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<a class="navbar-brand" id="header_brand" href="#"> <img
								alt="Brand" id="brand_img"
								src="${basePath}/client/image/header_brand_image.png"> <span
								style="float: left; padding: 10px 5px;">亦云课堂</span>
							</a>
						</div>
						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<c:forEach var="ch" items="${chs}">
									<li><a href="${basePath}${ch.getTargetUrl()}">${ch.getTitle()}</a></li>
								</c:forEach>
								<li class="">
									<form id="header-searcher" class="navbar-form  navbar-right"
										style="margin-top: 7px; margin-bottom: 7px;"
										action="${basePath}/SearchAction">
										<span class="form-group"> <input
											id="header-searcher-input" type="text" class="form-control"
											placeholder="搜索" name="str">
										</span> <input type="submit" id="footer-searcher-button" value="搜索"
											class="btn btn-default glyphicon glyphicon-search">


									</form>
								</li>
								<c:if test="${user==null}">
									<li>&nbsp;&nbsp;
										<button type="button" class="nobutton header-sign-button"
											onclick="window.location.href='${basePath}/client/login/role_select.jsp'">登录|注册</button>
									</li>
								</c:if>
								<c:if test="${user!=null}">
									<li class="dropdownc user-menu"><a href="#"
										class="dropdown-toggle" data-toggle="dropdown"
										style=""> <!-- The user image in the navbar-->
											<c:if test="${user.getHeadImgUrl() eq '#'}">
												<c:if test="${user.role eq 'student'}">
													<c:if test="${user.sex eq 'female' }">
														<img src="${basePath}/client/image/female_student.png"
															class="user-image" style="height: 30px;" alt="User Image">
													</c:if>
													<c:if test="${user.sex ne 'female' }">
														<img src="${basePath}/client/image/male_student.jpg"
															class="user-image" style="height: 30px;" alt="User Image">
													</c:if>
												</c:if>
												<c:if test="${user.role ne 'student'}">
													<c:if test="${user.sex eq 'female' }">
														<img src="${basePath}/client/image/female_teacheer.png"
															class="user-image" style="height: 30px;" alt="User Image">
													</c:if>
													<c:if test="${user.sex ne 'female' }">
														<img src="${basePath}/client/image/male_teacher.png"
															class="user-image" style="height: 30px;" alt="User Image">
													</c:if>
												</c:if>
											</c:if> <c:if test="${user.getHeadImgUrl() ne '#'}">
												<img src="${user.getHeadImgUrl()}" class="user-image"
													style="height: 30px; margin-top: -10px;" alt="User Image">
											</c:if> <!-- hidden-xs hides the username on small devices so only the image appears. -->
											<span class="hidden-xs">${user.name} <b class="caret"></b></span>
									</a>
										<ul class="dropdown-menu">
											<c:if test="${user.role=='student'}">
												<li><a
													href="${basePath}/client/pcenter/pc_student.jsp?id=${user.id}">个人主页</a></li>
												<li>
												<li><a
													href="${basePath}/client/course/student/course.jsp?id=${user.id}">个人中心</a></li>
												<li>
											</c:if>
											<c:if test="${user.role=='teacher' }">
												<li><a
													href="${basePath}/client/pcenter/pc_teacher.jsp?id=${user.id}">教师入口</a></li>
												<li><a
													href="${basePath}/client/teacher/course.jsp?id=${user.id}">班级管理</a>
												</li>
											</c:if>
											<li><a
												href="${basePath}/client/pcenter/update_pinfo.jsp?id=${user.id}">资料修改</a></li>
											<li><a href="${basePath}/UserAction?type=cancelLoad">退出</a></li>
										</ul></li>
									<c:if test="${user.role=='teacher' }">
										<li>
											<div class="wrap">
												<div class="img">
													<a
														href="${basePath}/client/pcenter/pc_teacher.jsp?id=${user.id}"><span
														class="material-icons">notifications</span></a>
												</div>

												<c:if test="${user.messageCount gt '0'}">
													<div class="notice">${user.messageCount}</div>
												</c:if>
											</div>
										</li>
									</c:if>
								</c:if>

								<li><a href="${basePath}/client/help/help.jsp">帮助</a></li>
							</ul>
						</div>
						<!-- /.navbar-collapse -->
					</div>
					<!-- /.container-fluid -->
				</nav>
			</div>
			<div class="col-xs-1 col-sm-1"></div>
		</div>
	</div>
	<div id="myCarousel" class="carousel slide" style="margin-bottom:0px" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<c:forEach var="ad" items="${ads}" varStatus="num">
				<c:if test="${num.index == 0}">
					<li data-target="#myCarousel" data-slide-to="${num.index}"
						class="active"></li>
				</c:if>
				<c:if test="${num.index > 0}">
					<li data-target="#myCarousel" data-slide-to="${num.index}"></li>
				</c:if>
			</c:forEach>
		</ol>
		<div class="carousel-inner" role="listbox">
			<c:forEach var="ad" items="${ads}" varStatus="num">
				<c:if test="${num.index == 0}">
					<div class="item active">
						<div class="expand">
							<img class="first-slide" src="${ad.imgUrl}" alt="First slide">
						</div>
						<div class="container">
							<div class="carousel-caption">
								<h1>${ad.title}</h1>
								<p>${ad.shortContent}</p>
								<p>
									<a class="btn btn-lg btn-primary" href="${ad.targetUrl}"
										role="button">了解更多</a>
								</p>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${num.index > 0}">
					<div class="item">
						<div class="expand">
							<img class="second-slide" src="${ad.imgUrl}" alt="Second slide">
						</div>
						<div class="container">
							<div class="carousel-caption">
								<h1>${ad.title}</h1>
								<p>${ad.shortContent}</p>
								<p>
									<a class="btn btn-lg btn-primary" href="${ad.targetUrl}"
										role="button">了解更多</a>
								</p>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<div class="container" style="margin-bottom: 4rem;"></div>
	<!--广告位结束-->
	<!--讨论区-->
	<div class="changecolor">
		<div class="container ">
			<div class="row">
				
				<div class=" col-sm-4 col-xs-4">
					<div class="HOT baikapian" style="max-width:100%">
					<c:forEach var="article" items="${asn}" begin="0" end="8"
						varStatus="s">
						<c:if test="${s.index eq 0}">
				
								<div class="remen">热门话题</div>
								<div class="row">
								<div class="hottopic col-xs-7">
									<a href="${basePath}/client/article/article.jsp?id=${article.getId()}"> ${article.getTitle()} </a>
								</div>
								<div class="hotpic col-xs-3">
									<img src="${basePath}/client/image/hot1.jpg" />
								</div>
								</div>
								
								<div class="hotcontent"></div>
								<a href="${basePath}/client/article/article.jsp?id=${article.getId()}">
									<div class="tiaozhuan">
										了解详情<span class="glyphicon glyphicon-arrow-right"></span>
									</div>
								</a>
							
								<div class="wangqi">往期回顾</div>
						</c:if>
						<c:if test="${s.index > 0}">
							<div class="row" style="margin-top:10px">
							<div class="zuowenzi col-xs-6">
								<a style="color:black" href="${basePath}/client/article/article.jsp?id=${article.getId()}">${article.getTitle()}</a>
							</div>
							<div class="hotpic col-xs-4">
								<img src="${article.getImgUrl()}" />
							</div>
							</div>
						</c:if>
					</c:forEach>

					</div>
				</div>


			<div class=" col-sm-4 col-xs-4">
				
				<c:forEach var="article" items="${asa}" begin="0"  end="1" >
								
				
				<div class="baikapian wenzhang">
					<div class="shouji">
						<span class="glyphicon glyphicon-book"></span>&ensp;手记文章
					</div>
					
					<div class="row">
						<div class="wentopic col-xs-8">${article.getTitle()}</div>
						<div class="hotpic col-xs-3">
						<img src="${article.getImgUrl()}" />
					</div>
					</div>
					
					<div class="hotcontent">${article.getShortContent()}</div>
					
					<a href="${basePath}/client/article/article.jsp?id=${article.getId()}">
						<div class="tiaozhuan">
							阅读全文<span class="glyphicon glyphicon-arrow-right"></span>
						</div>
					</a>
					
				</div>	
				</c:forEach>
			</div>
			<div class=" col-sm-4 col-xs-4">
				<c:forEach var="article" items="${asp}">
					<div class="question baikapian">
					<div class="shouji">
						<span class="glyphicon glyphicon-question-sign"></span>&ensp;问题讨论
					</div>
					<div class="ques">${article.getTitle()}</div>
					<div class="request">${article.getShortContent()}</div>
					<a href="${basePath}/client/article/article.jsp?id=${article.getId()}">
						<div class="tiaozhuan">
							查看详情<span class="glyphicon glyphicon-arrow-right"></span>
						</div>
					</a>
					</div>
				
				</c:forEach>
			</div>

		</div>
	</div>
	</div>
	</div>
	<!--讨论区结束-->
	<!--课程推荐-->
	<div class="biaoti">课&ensp;/&ensp;程&ensp;/&ensp;推&ensp;/&ensp;荐</div>
	<div class="container">
		<div class="row">
			<%
                Course[] rCourses = cImpl.getCoursesByTag();
                pageContext.setAttribute("rCourses", rCourses);
            %>
			<c:forEach var="course" items="${rCourses}" begin="0" end="3">
				<div class="col-md-3 col-lg-3  col-sm-6 col-xs-6">
					<a href="${basePath}/client/course/course_info.jsp?id=${course.id}">
						<div class="kapian">
							<div class="pic">
								<img src="${course.imgUrl}" />
							</div>
							<div class="txt">
								<h3>${course.name}</h3>
								<h4>${course.college}${course.teacherName}</h4>
								<div class="jianjie">${course.shortContent}</div>
								<div class="pingfen">评分：</div>
								<div class="score">9.5</div>
								<div class="userdata">
									<span class="glyphicon glyphicon-thumbs-up"></span>
								</div>
							</div>
						</div>
					</a>

				</div>
			</c:forEach>
		</div>
	</div>
	<!--课程推荐结束-->
	<!--新课推荐-->
	<div class="biaoti">新&ensp;/&ensp;上&ensp;/&ensp;好&ensp;/&ensp;课</div>
	<div class="container">
		<div class="row">
			<%
                Course[] nCourses = cImpl.getCoursesByTag();
                pageContext.setAttribute("nCourses", rCourses);
            %>
			<c:forEach var="course" items="${nCourses}" begin="0" end="3">
				<div class="col-md-3 col-lg-3  col-sm-6 col-xs-6">
					<a href="${basePath}/client/course/course_info.jsp?id=${course.id}">
						<div class="kapian">
							<div class="pic">
								<img src="${course.imgUrl}" />
							</div>
							<div class="txt">
								<h3>${course.name}</h3>
								<h4>${course.college}${course.teacherName}</h4>
								<div class="jianjie">${course.shortContent}</div>
								<div class="pingfen">评分：</div>
								<div class="score">9.5</div>
								<div class="userdata">
									<span class="glyphicon glyphicon-thumbs-up"></span>
								</div>
							</div>
						</div>
					</a>

				</div>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="/client/header_and_footer/shouyewei.jsp"
		flush="true" /><!--动态包含-->

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="${basePath}/client/js/jquery-3.3.1.js"></script>
	<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
	<script src="${basePath}/client/js/bootstrap.min.js"></script>
	<!-- Just to make our placeholder image work. Don't actually copy the next line! -->
	<script src="${basePath}/client/js/holder.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script> -->
</body>
</html>
