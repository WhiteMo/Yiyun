<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
 	String contentPage = request.getParameter("contentPage");
 	if(contentPage==null){
 		contentPage="article.jsp";
 	}
 	pageContext.setAttribute("basePath", request.getContextPath());
 	pageContext.setAttribute("contentPage",contentPage);
 %>
<!DOCTYPE html>
<html style="height: auto;">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>亦云后台管理界面</title>
<meta name="renderer" content="webkit">
<!-- <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"> -->
<script>
        if (top != this) {
            top.location = this.location;
        }
    </script>
<link rel="stylesheet" href="${basePath}/admin/css/bootstrap.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/font-awesome.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/ionicons.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/AdminLTE.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/skin-blue.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/main.css">

<style>
#gly:hover, #gly:active {
	background-color: #1e282c;
}

#gly {
	color: #fff;
	padding: 15px;
}
</style>
</head>


<script type="text/javascript">


</script>

<body class="skin-blue sidebar-mini" style="height: auto;">
	<!--  style="overflow:visible;" -->
	<div class="wrapper" style="overflow: visible; height: auto;">
		<header class="main-header">
			<!-- Logo -->
			<a href="${basePath}/admin/index.jsp" class="logo">
				<!-- mini logo for sidebar mini 50x50 pixels --> <span
				class="logo-mini"><b></b>亦云</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>亦云</b>课堂管理</span>
			</a>

			<!-- Header Navbar -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="${basePath}/admin/index.jsp" id="gly"
					class=" glyphicon glyphicon-menu-hamburger "
					data-toggle="offcanvas" role="button"> <span class="sr-only">Toggle
						navigation</span>
				</a>
	
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<li><a href="#" 
							title="网站首页"> <i class="glyphicon glyphicon-home"></i>
						</a></li>
						
						<li class="user-menu"><a href="javascript:;"> <!-- The user image in the navbar-->
								<img src="./jspXCMS管理平台_files/anonymous.png" class="user-image"
								alt="User Image"> 
								<span class="hidden-xs">admin</span>
						</a></li>
						<li><a href="#"
							title="退出"> <span>退出</span> <i
								class="glyphicon glyphicon-log-out"></i>
						</a></li>
					</ul>
				</div>
			</nav>
		</header>



		<aside class="main-sidebar">
			<section class="sidebar">
				<ul class="sidebar-menu">
					<li class="treeview"><a href="javascript:;"><i
							class="glyphicon glyphicon-edit"></i> <span>内容管理</span> <span
							class="pull-right-container"> <i
								class="glyphicon glyphicon-chevron-left glyphicon-chevron-right"></i>
						</span> </a>
						<ul class="treeview-menu">
							<li><a
								href="javascript:changePage(&#39;content_management/article.jsp&#39;)"><i
									class="glyphicon glyphicon-unchecked"></i> <span>文档管理</span></a></li>
							<li><a
								href="javascript:changePage(&#39;content_management/channel.jsp&#39;)"><i
									class="glyphicon glyphicon-unchecked"></i> <span>栏目管理</span></a></li>
							<li><a
								href="javascript:changePage(&#39;content_management/comment.jsp&#39;)"><i
									class="glyphicon glyphicon-unchecked"></i> <span>评论管理</span></a></li>
							<li><a
								href="javascript:changePage(&#39;content_management/course.jsp&#39;)"><i
									class="glyphicon glyphicon-unchecked"></i> <span>课程管理</span></a></li>
							<li><a
								href="javascript:changePage(&#39;content_management/AD.jsp&#39;)"><i
									class="glyphicon glyphicon-unchecked"></i> <span>广告管理</span></a></li>
						
						</ul></li>


					<li class="treeview"><a href="javascript:;"><i
							class="glyphicon glyphicon-folder-close"></i> <span>文件管理</span> <span
							class="pull-right-container"> <i
								class="glyphicon glyphicon-chevron-right"></i>
						</span> </a>
						<ul class="treeview-menu">
							<li><a
								href="javascript:nav(&#39;file_management/web_file_2/update.do&#39;,&#39;file_management/web_file_2/left.do?noSelect=true&#39;);"><i
									class="glyphicon glyphicon-unchecked"></i> <span>上传文件</span></a></li>
							<li><a
								href="javascript:nav(&#39;file_management/web_file_3/list.do&#39;,&#39;file_management/web_file_3/left.do?noSelect=true&#39;);"><i
									class="glyphicon glyphicon-unchecked"></i> <span>全站文件</span></a></li>
						</ul></li>

					<li class="treeview"><a href="javascript:;"><i
							class="glyphicon glyphicon-user"></i> <span>用户权限</span> <span
							class="pull-right-container"> <i
								class="glyphicon glyphicon-chevron-right"></i>
						</span> </a>
						<ul class="treeview-menu">
							<li><a
								href="javascript:changePage(&#39;content_management/user.jsp&#39;)"><i
									class="glyphicon glyphicon-unchecked"></i> <span>用户管理</span></a></li>
							<li><a
								href="javascript:nav(&#39;user_right/role/main.jsp&#39;,&#39;&#39;);"><i
									class="glyphicon glyphicon-unchecked"></i> <span>角色管理</span></a></li>
							<li><a
								href="javascript:nav(&#39;user_right/member_group/list.do&#39;,&#39;&#39;);"><i
									class="glyphicon glyphicon-unchecked"></i> <span>会员组</span></a></li>
						</ul></li>

				</ul>
				<!-- /.sidebar-menu -->
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper clearfix" style="min-height: 516px;">
	
			<div id="centerContentWrapper" class=""
				style="margin-left: 0px; position: relative; min-height: 516px;">
				<iframe class="" id="centerFrame"
					onload="IFrameReSize('centerFrame')" name="center" scrolling="auto"
					style="width: 100%; min-height: 100%; border: 0;"
					src="${basePath}/admin/content_management/${contentPage}"
					height="511"></iframe>
			</div>
		</div>


	</div>
	<!-- ./wrapper -->

	<script src="${basePath}/admin/js/jquery.min.js"></script>
	<script src="${basePath}/admin/js/bootstrap.min.js"></script>
	<script src="${basePath}/admin/js/app.min.js"></script>
	<script>
        $(function() {

            $(".treeview-menu>li:not(.treeview)>a").click(function() {
                $(this).parent().parent().find("li").removeClass("active");
                $(this).parent().parent().parent().parent().find("li").not($(this).parent().parent().parent()[0]).removeClass("active");
                $(this).parent().addClass("active");
            });
        });

        function changePage(centerUrl) {
            //先移除内容，以免调整框架宽度时页面晃动
            try {
                $(window.frames['center'].document.body).empty();
            } catch (ex) {}
            window.frames['center'].location.href = centerUrl;
        }
        


        function keepSession() {
            $.get("/jsp/keep_session?d=" + new Date() * 1);
        }
        setInterval(keepSession, 600000);

        function changeFrameHeight() {
			var ifm = document.getElementById("centerFrame");
            var centerheight = $(window.frames['center'].document.body).height();
            var leftheight = $(window.frames['left'].document.body).height();
            var height = centerheight > leftheight ? centerheight : leftheight;
      
            height = height + "px";
         
            ifm.style.height = height;
		
        }

        window.onresize = function() {
			changeFrameHeight();
        }

        function IFrameReSize(iframename) {

            var pTar = document.getElementById(iframename);

            if (pTar) { //f

                if (pTar.contentDocument && pTar.contentDocument.body.offsetHeight) {

                    pTar.height = pTar.contentDocument.body.offsetHeight;

                } //ie

                else if (pTar.Document && pTar.Document.body.scrollHeight) {

                    pTar.height = pTar.Document.body.scrollHeight;

                }

            }

        }
    </script>


</body>

</html>