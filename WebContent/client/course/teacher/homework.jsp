<%@page import="java.net.URLEncoder"%>
<%@page import="DBFunction.WareImpl"%>
<%@page import="Bean.Ware"%>
<%@page import="Bean.Announcement"%>
<%@page import="DBFunction.AnnouncementImpl"%>
<%@page import="Bean.User"%>
<%@page import="DBFunction.CourseImpl"%>
<%@page import="Bean.Course"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%

 
	String basePath = request.getContextPath();
	pageContext.setAttribute("basePath",request.getContextPath());
	String  id=request.getParameter("id");
	
	User user = (User)session.getAttribute("user");
	if(user==null){
		response.sendRedirect(request.getContextPath()+"/client/login/login.jsp?message=pleaseLogin");
		return ;
	}
	pageContext.setAttribute("user", user);
	
	if(id==null){
		response.sendRedirect(request.getContextPath()+"/client/teacher/course.jsp?id="+user.getId());
		return ;
	}
	Course course = new CourseImpl().getCourseById(id);
	pageContext.setAttribute("course",course);
	Ware[] wares = new WareImpl().getWaresByCourseId(course.getId());
	pageContext.setAttribute("wares", wares);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="X-UA-Compatible" content="IE=9">

<title>课堂公告</title>
<link href="${basePath}/client/course/teacher/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="${basePath}/client/course/teacher/css/common.css"
	rel="stylesheet" type="text/css">
<link href="${basePath}/client/course/teacher/css/emoji.css"
	rel="stylesheet" type="text/css">
<link href="${basePath}/client/course/teacher/css/previewfile.css"
	rel="stylesheet" type="text/css">
<link href="${basePath}/client/course/teacher/css/sprites.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="${basePath}/client/course/teacher/css/announce.css">
<script src="${basePath}/client/js/layer.js"></script>
<link charset="utf-8" rel="stylesheet"
	href="${basePath}/client/course/teacher/css/webuploader.css">
<link rel="stylesheet"
	href="${basePath}/client/course/teacher/css/style.css"
	id="layui_layer_PublicCommonjsliblayerskindingstylecss" style="">
<script src="${basePath}/client/js/jquery.min.js"></script>
<script src="${basePath}/client/course/teacher/js/wangEditor.min.js"></script>
<script src="${basePath}/client/js/layer.js"></script>
<script src="${basePath}/client/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${basePath}/admin/js/ajaxfileupload.js"></script>
<link rel="stylesheet"
	href="${basePath}/m/teacher/css/font-awesome.min.css">
<script type="text/javascript">
	var basePath ='<%=request.getContextPath()%>'
	var courseId = '<%=id%>'
	$(function(){
		  var E = window.wangEditor
		  var editor = new E('#div1', '#content')  // 两个参数也可以传入 elem 对象，class 选择器
		  editor.create()
	})
	
	function ajaxFileUpload(type) {
		$.ajaxFileUpload({
			url :'<%=request.getContextPath()%>/uploadFile?type=course&courseId=<%=id%>',
			secureuri : false,
			type:"POST",
			fileElementId : 'fileToUpload',
			dataType : 'JSON',
			success : function(data, status) {
				layer.msg("上传成功",{icon:1,time:2000})
			},
			error : function(data, status, e) {
				layer.msg("上传失败",{icon:2,time:2000})
			}
		})

		return false;

	}
	
	function updateWare(){
		
	}
	
	function deleteWare(id){
		layer.confirm('确认要删除吗？', {
            btn : [ '确定', '取消' ],//按钮
        	title: "删除确认"
		}, function(index) {
            layer.close(index);
            //此处请求后台程序，下方是成功后的前台处理……
     		$.post(basePath+"/WareAction",{type:"delete"
			,id:id},function(result){
				if(result=="success"){
					layer.msg("删除成功",{icon:1,time:1500})
					location.reload();
				}else{
					layer.msg("网络异常",{icon:2,time:1500})
				}
			})
        }); 
		
	}
	
</script>


</head>
<body style="background-color: #e5eaf0;">
	<div id="course-header"  data-sys="1"
		class="topbox cl"
		style="background-image: url(//assets.ketangpai.com/theme/big/13.jpg); filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='//assets.ketangpai.com/theme/big/13.jpg', sizingMethod='scale')">
		<div class="nav nav-clear clearfix">
			<ul class="nav-menu-left">
				<li class="nav-menu-item"><a class="side-button"
					href="${basePath}/client/teacher/course.jsp?id=${user.getId()}"><i
						class="fa fa-backward"></i> 返回 </a></a></li>
			</ul>
			<!--左滑出left-->
			<div class="leftcon" style="left: -350px;">
				<div class="nav-top">
					<a href="#">课堂</a> <span class="line"></span> <a href="#">备课区</a> <span
						class="line"></span> <a href="#"> <b class="fl">私信</b>
					</a>
				</div>
				<div class="open-course" style="height: 374px;">
					<div class="open-box" style="top: 0px;">
						<p>已有课程</p>
						<div class="list">
							<a href="#" title="${course.getName()}"> <i
								style="background-color: #526c86"></i> <span>${course.getName()}</span>
							</a>
						</div>
					</div>
				</div>
			</div>
			<!--左leftend-->
			<ul class="nav-menu-right">
				<li class="nav-menu-item ico notice"><a id="notice"
					　href="javascript:;"> <img
						src="./公告-简单好用的互动课堂管理工具 - 课堂派_files/ktp1_03.png" width="20"
						alt="通知"></a>
					<div class="notice-ct hide" style="display: none;">
						<span class="arr"></span>
						<div class="th-bar">
							<span class="tit fl">通知</span>
							<div class="less fr">
								<a id="messageset" href="#">设置</a>
							</div>
							<div class="less fr">
								<a id="ignore-all" href="javascript:void(0);">忽略全部</a>
							</div>
						</div>
						<p class="zw">暂无新通知</p>
						<div class="bt-bar">
							<div class="more">
								<a class="link" href="#">查看全部</a>
							</div>
						</div>
					</div></li>
				<li class="nav-menu-item user"><a id="user" href="javascript:;"><img
						class="avatar" src="${user.getHeadImgUrl()}"
						alt="${user.getName()}" title="${user.getName()}"></a>
					<div class="user-info hide" style="display: none;">
						<ul>
							<li><a class="link setting" href="#">个人设置</a></li>
							<li><a class="link wenkudown" href="#">文库下载</a></li>
							<li><a class="link logout" href="#">退出账户</a></li>
						</ul>
					</div></li>
			</ul>
		</div>
	
		<div class="topm cl">
			<h1>${course.getName()}</h1>
			<div class="codetip">使用以下邀请码邀请学生加课</div>
			<div class="box-box">
				<div class="sele" id="course-code-select"
					data-abc="${course.getCode()}">
					<div class="qrcode fl"></div>
					<div class="codetext">${course.getCode()}</div>
				</div>
				<div class="selecon cl" style="display: none;">
					<ul>
						<!-- <li><a id="stop-course-code" href="javascript:;">停用</a></li>
						<li class="hide2"><a id="start-course-code"
							href="javascript:;">启用</a></li>
						<li><a id="reset-course-code" href="javascript:;">重置</a></li> -->
					</ul>
				</div>
			</div>

		</div>
		<div class="topr fr">
			<div class="toprx cl">
				<ul>
					
				</ul>
			</div>
		</div>
	</div>

	<div class="banner cl" style="position: relative; z-index: 2;">
		<div class="in-header"
			style="background: none repeat scroll 0% 0% #526c86;">
			<ul class="nav-menu-left hide" style="display: none;">
				<li class="nav-menu-item"><a class="side-button"
					href="javascript:;"><img
						src="./公告-简单好用的互动课堂管理工具 - 课堂派_files/ktp1_09.png" alt=""></a></li>
			</ul>
			<div id="third-nav" class="nav gWidth">
				<a href="./course.jsp?id=${course.getId()}" >公告</a>
				 <a href="#" class="active">课件</a> 
				 <a href="#">话题</a>
				<a href="#">资料</a>
			</div>
		</div>
	</div>
	<div class="banner2" style="display: none;"></div>
	<div class="bg"></div>



	<div class="announce-page editor-page">
		<div class="cWidth">
			<div class="send-an" id="send-an">
				<a style="padding-left: 5px"
					href="javascript:$('#send-box').show();$('#fileToUpload').click()"><span
					class="glyphicon glyphicon-pencil"></span>上传课件</a>
				<input type="file" id="fileToUpload" name="fileToUpload" 
				style="display:none" onchange="ajaxFileUpload()" value=""></input>
			</div>
	
			<div class="announce-box">
				<ul id="viewer-container-lists">
				
				<c:forEach items="${wares}" var="ware">
				
				
						<li>
							<div class="announce-cont-box">
								<div class="title clearfix">
									<h3>
										<a href="${basePath}/WareAction?type=getWareById&id=${ware.getId()}">${ware.getName()}</a>
									</h3>
									<div class="btn-group" style="float:right">
										<button type="button"
											class="btn  dropdown-toggle btn-xs"
											data-toggle="dropdown" style="background-color:white;width:10px;height:10px">
											 <span class="fa fa-cog"></span>
										</button>
										<ul class="dropdown-menu" role="menu">
											<li><a href="javascript:;" data-state="0"
													class="top">设为置顶</a></li>
											<li><a href="javascript:void(0);" class="edit">编辑</a></li>
											<li><a onclick="deleteWare('${ware.getId()}');" class="del">删除</a></li>
										</ul>
									</div>
								</div>
								<div class="time">
									<span> 发布时间：${ware.getDate()}</span>
								</div>
							

							</div>
						</li>
				
				
				</c:forEach>
			
				</ul>


			</div>
		</div>
	</div>

	<!--各种弹窗-->

	<!--导入通知-->
	<div class="dr-pop" id="dr-pop">
		<div class="pop-title">
			<h3>导入公告</h3>
			<a href="javascript:;" class="close"></a>
			<div class="dr-from">
				<a href="javascript:;" class="import2 active">从班级导入</a>
			</div>
		</div>
		<div class="pop-cont clearfix" style="height: 384px;"></div>
		<div class="btns">
			<a href="javascript:;" class="cancel">取消</a> <a href="javascript:;"
				class="sure">导入</a>
		</div>
	</div>



	<span style="display: none"> <img
		src="./公告-简单好用的互动课堂管理工具 - 课堂派_files/track_ua.gif"></span>
	<div class="help-dips">
		<a href="javascript:;" class="help-icon help-icon-ques"></a>
		<div style="display: none;" class="help-dips-box">
			<i class="help-icon help-icon-bdot"></i> <a href="javascript:;"
				class="btn-feedback">反馈问题</a> <a href="#" target="_blank">产品动态</a> <a
				href="#" target="_blank">帮助中心</a>
		</div>
	</div>
	<a href="javascript:;" class="back-to-top" style="display: inline;"></a>
	<!--反馈问题窗口-->
	<div class="little-pop layer-feedBack" id="feedBackWindow"
		data-email="baimo_mail@163.com">
		<div class="feedback-header clearfix">
			<a href="javascript:;" class="closeFeedback fr"></a>
		</div>
		<div class="btns">
			<span class="yourEmail">您的邮箱：<input type="email" name="email"
				value="baimo_mail@163.com"></span> <a href="javascript:;"
				class="cancel">取消</a> <a href="javascript:;" class="sure">确定</a>
		</div>
	</div>
	<link href="./公告-简单好用的互动课堂管理工具 - 课堂派_files/simditor.css"
		rel="stylesheet" type="text/css">


</body>
</html>