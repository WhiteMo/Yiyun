<%@page import="Bean.*"%>
<%@page import="DBFunction.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());

	ChannelImpl hchImpl = new ChannelImpl();
	Channel[] hchs = hchImpl.getAllChannel();
	User user = (User) session.getAttribute("user");
	pageContext.setAttribute("hchs", hchs);
	pageContext.setAttribute("user", user);
%>
<nav class="header-nav navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" id="header_brand" href="#"
				onclick="window.location.href='${basePath}/client/index.jsp'"> <img
				alt="Brand" id="brand_img" 
				src="${basePath}/client/image/header_brand_image.png"> <span
				style="float: left;padding:10px 5px ">亦云课堂</span>
			</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<c:forEach var="hch" items="${hchs}">
					<li><a href="${basePath}${hch.getTargetUrl()}">${hch.getTitle()}</a></li>
				</c:forEach>

				<c:if test="${empty user}">
					<li>
						<button type="button" class="nobutton header-sign-button"
							onclick="window.location.href='${basePath}/client/login/login.jsp'"
							data-toggle="modal" data-target="#myModal">登录|注册</button>
					</li>
				</c:if>
				<c:if test="${not empty user}">
					<li class="dropdownc user-menu">
						<a 
							class="dropdown-toggle" data-toggle="dropdown">
					
								
								
								<c:if test="${user.getHeadImgUrl() eq '#'}">
                                           		<c:if test="${user.role eq 'student'}">
                                           			<c:if test="${user.sex eq 'female' }">
                                           				<img src="${basePath}/client/image/female_student.png"
                                       					     class="user-image" style="height: 30px" alt="User Image">
                                           			</c:if>
                                           			<c:if test="${user.sex ne 'female' }">
                                           				<img src="${basePath}/client/image/male_student.jpg"
                                       					     class="user-image" style="height: 30px" alt="User Image">
                                           			</c:if>
                                           		</c:if>
                                           		<c:if test="${user.role ne 'student'}">
                                           			<c:if test="${user.sex eq 'female' }">
                                           				<img src="${basePath}/client/image/female_teacher.png"
                                       					     class="user-image" style="height: 30px" alt="User Image">
                                           			</c:if>
                                           			<c:if test="${user.sex ne 'female' }">
                                           				<img src="${basePath}/client/image/male_teacher.png"
                                       					     class="user-image" style="height: 30px" alt="User Image">
                                           			</c:if>
                                           		</c:if>
                                           </c:if>
                                           <c:if test="${user.getHeadImgUrl() ne '#'}">
                                         	  <img src="${user.getHeadImgUrl()}"
                                            class="user-image" style="height: 30px" alt="User Image">
                                           </c:if>
								
								
								
								
								
								
								<!-- hidden-xs hides the username on small devices so only the image appears. -->
								<span class="hidden-xs">${user.name} <b class="caret"></b></span>
						</a>
						<ul class="dropdown-menu">
					<c:if test="${user.role eq 'student'}">
									<li><a
										href="${basePath}/client/pcenter/pc_student.jsp?id=${user.id}">个人主页</a></li>
									<li>
									<li><a
										href="${basePath}/client/course/student/course.jsp?id=${user.id}">我的课程</a></li>
									<li>
									<a
										href="${basePath}/client/pcenter/update_pinfo.jsp?id=${user.id}">资料修改</a></li>
									<li><a href="${basePath}/UserAction?type=cancelLoad">退出</a></li>					
					</c:if>
					
					
					<c:if test="${user.role eq 'teacher'}">
							<li><a
								href="${basePath}/client/pcenter/pc_teacher.jsp?id=${user.id}">教师入口</a>
							</li>
							<li><a
								href="${basePath}/client/teacher/course.jsp?id=${user.id}">班级管理</a>
							</li>
							<li><a
								href="${basePath}/client/pcenter/update_pinfo.jsp?id=${user.id}">资料修改</a></li>
							<li><a href="${basePath}/UserAction?type=cancelLoad">退出</a></li>
					</c:if>
					</ul>
				</li>
				</c:if>
				<li><a href="${basePath}/client/help/help.jsp">帮助</a></li>


			</ul>




			<li>
				<form id="header-searcher"
					class="navbar-form navbar-left navbar-right"
					action="${basePath}/SearchAction">
					<span class="form-group"> <input id="header-searcher-input"
						type="text" class="form-control" placeholder="搜索" name="str">
					</span> <input type="submit" id="footer-searcher-button" value="搜索"
						class="btn btn-default"> <span
						class="glyphicon glyphicon-search" aria-hidden="true"></span>

					<!--button type="button" id="footer-searcher-button"
											class="btn btn-default" onclick="return header_searcher()">
											<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
										</button-->
				</form>
			</li>
			
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>





