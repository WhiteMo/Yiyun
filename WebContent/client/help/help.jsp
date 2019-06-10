<%@page import="Bean.Comment"%>
<%@page import="DBFunction.CommentImpl"%>
<%@page import="Bean.User"%>
<%@page import="DBFunction.UserImpl"%>
<%@page import="Bean.Article"%>
<%@page import="DBFunction.ArticleImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	String basePath = request.getContextPath();
	pageContext.setAttribute("basePath", request.getContextPath());
	String userId = null;
	if (session.getAttribute("user") != null) {
		userId = ((User) session.getAttribute("user")).getId();
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>文章页面</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Access-Control-Allow-Origin" content="*">
<link rel="icon" href="${basePath}/client/image/header_brand_image.png"
	type="image/x-icon" />

<link rel="stylesheet" href="${basePath}/client/help/css/moco.css"
	type="text/css">
<link rel="stylesheet"
	href="${basePath}/client/help/css/swiper-3.css">
<link href="${basePath}/client/help/css/captcha.css" rel="stylesheet">
<link rel="stylesheet" href="${basePath}/client/help/css/a.css"
	type="text/css">
<link rel="stylesheet"
	href="${basePath}/client/help/css/prettify.css">
<link rel="stylesheet" href="${basePath}/client/css/bootstrap.css">
<link href="${basePath}/client/css/header_and_footer.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${basePath}/m/teacher/css/font-awesome.min.css">
<script src="${basePath}/client/js/jquery.min.js"></script>
<script src="${basePath}/client/js/bootstrap.js"></script>
<script src="${basePath}/client/js/layer.js"></script>
<script src="${basePath}/client/course/teacher/js/wangEditor.min.js"></script>
<style>
.w-e-text {
	padding: 0 10px;
	overflow-y: auto;
}
h1{
	text-align:center; 
 }
</style>
<script>
$(function(){
	 var E = window.wangEditor
	  var editor = new E('#toolbar', '#content')  // 两个参数也可以传入 elem 对象，class 选择器
	  editor.create()
	 $('#js-feedback-list-wrap').children().each(function(){
		$(this).removeAttr("onfocus"); 
	 })
})	
</script>
</head>

<body>
	<jsp:include page="/client/header_and_footer/header.jsp"></jsp:include>
	<br>

	<!-- 模态框（Modal）评论 -->
	<div class="modal fade" id="commentModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">发送评论</h4>
				</div>
				<div class="modal-body">
					<div id="toolbar" class="toolbar"
						style="border-bottom: 1px solid #c8cdd2; background-color: #eceef0; flex-wrap: wrap"></div>
					<div id="content" class="text"
						style="border: 1px solid #c8cdd2; min-height: 80px; height: 80px"></div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-primary"
						onclick="addComment()">发送</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- Modal结束 -->



	<div id="main" style="margin-top: 50px">

		<div class="main_con clearfix">
			<!-- 分享&收藏 -->

			<!-- 分享&收藏 end -->
			<div class="left_essay l">
				<div class="part_essay js-part_essay">
					<div class="originalImg"></div>
					<!-- 面包屑 -->
					<!--div class="detail-path">
						<a class="imooc" target="_blank" href="#"><i
							class="fa fa-file-text"></i></a> <a>手记文章</a>
					</div-->
					<!-- 面包屑end -->
					<div class="detail-title-wrap">
						<h1 class="detail-title">
							<span class="d-t js-title">
							操作流程
							</span>
						</h1>

					</div>

					<!-- 手记详情 -->
					<div class="detail-content-wrap">
						<h2 "detail-title">
							<span class="d-t js-title">
							用户操作手册
							</span>
						</h2>
						<br></br>
						<div class="detail-content js-lookimg">
						　　输入www.1y.net进入网站首页。
						</div>
						<br></br>
						<img src="${basePath}/client/image/help1.png" height="363" width="696">
						<br></br>
						<p>　</p>
						<div class="detail-content js-lookimg">
						　　点击“登录|注册”按钮跳转至身份选择界面，选择学生或老师身份。
						</div>
						<br></br>
						<img src="${basePath}/client/image/help2.png" height="363" width="696">
						<br></br>
						<p>　</p>
						<div class="detail-content js-lookimg">
						　　进入登陆界面，若没有账号，点击登陆框下的sign up进行账号注册。
						</div>
						<br></br>
						<img src="${basePath}/client/image/help3.png" height="363" width="696">
						<br></br>
						<p>　</p>
						<div class="detail-content js-lookimg">
						　　在注册界面填写相应信息，若信息无误，点击注册按钮即可完成注册。
						</div>
						<br></br>
						<img src="${basePath}/client/image/help4.png" height="363" width="696">
						<!-- 推荐 -->
						<div class="praise-box">
							<div class="praise-share icon-drop_up hide">
								<!--  -->
								<div class="praise-share-box">
									<p>若觉得本文不错，就分享一下吧！</p>

								</div>
							</div>
						</div>
						<!-- 推荐end -->
					</div>
					<br></br>
					<div class="detail-title-wrap">
						<h2 class="detail-title">
							<span class="d-t js-title">
							不同身份的使用说明：
							</span>
						</h2>

					</div>
					
					<!-- 手记详情 -->
					<div class="detail-content-wrap">
						<h3 "detail-title">
							<span class="d-t js-title">
							教师身份
							</span>
						</h3>
						<p>　</p>
						<div class="detail-content js-lookimg">
						　　登陆成功后点击导航栏的用户名或头像即可选择进入教师入口、班级管理、资料修改或退出登录。
若要创建班级，可直接在上一步选择班级管理，进入管理界面后点击【创建班级】；或进入教师个人主页后，在【主讲课程-查看更多】里进入班级管理界面进行班级创建。
						</div>
						<br></br>
						<img src="${basePath}/client/image/help5.png" height="363" width="696">
						<br></br>
						<img src="${basePath}/client/image/help6.png" height="363" width="696">
						<br></br>
						<p>　</p>
						<div class="detail-content js-lookimg">
						　　进入课程创建界面后，输入课程相应信息，点击【保存并返回】，即成功创建一门课程。
成功创建课程后，点击课程封面或课程下方的【班级管理】，即可进入班级管理界面。
在班级管理界面，点击相应按钮可进行课程信息修改、课程成员增删、查看并通过课程申请、查看推流地址，进入直播间开始直播。
						</div>
						<br></br>
						<img src="${basePath}/client/image/help7.png" height="363" width="696">
						<br></br>
						<p>　</p>
						<div class="detail-content js-lookimg">
						　　点击【导入成员】，教师可以手动输入学号添加学生，或使用excel批量导入。或可在【课程人员】界面查看分配给本门课程的邀请码，通过告知学生课程邀请码、学生输入邀请码参与课程。
此外，没有邀请码也没有被教师导入但仍向申请听课的学生会被推送到教师的【课程申请】处，教师可在此通过学生的听课申请。

点击【开始直播】进入课程直播间，点击屏幕正中的三角标志，即可开始直播。教师可通过网页右侧评论栏或手机应用，查看学生对与当前课程的疑问和讨论。
						</div>
						<br></br>
						<img src="${basePath}/client/image/help8.png" height="363" width="696">
						<br></br>
						<p>　</p>
						<div class="detail-content js-lookimg">
						　　若要上传课件、发布作业或公告，教师需退回【课程管理】界面，点击课程预览图下方的【课件管理】，即可进入相应界面。
						</div>
						<br></br>
						<img src="${basePath}/client/image/help9.png" height="363" width="696">
						
						<br></br>
						<br></br>
						<h3 "detail-title">
							<span class="d-t js-title">
							学生身份
							</span>
						</h3>
						<p>　</p>
						<div class="detail-content js-lookimg">
						　　登录成功后，可在首页浏览寻找自己想学习的课程；也可用搜索栏搜索自己想学习的课程，在搜索结果页面，点击课程预览图进入课程详情界面。
						</div>
						<br></br>
						<img src="${basePath}/client/image/help10.png" height="363" width="696">
						<br></br>	
						<img src="${basePath}/client/image/help11.png" height="363" width="696">	
						<br></br>
						<p>　</p>
						<div class="detail-content js-lookimg">
						　　对于公开课程，若课程已在直播，可直接进入课程直播间进行听课；
对于非公开课程，可通过点击课程详情界面的【申请听课】按钮，向授课教师发出申请，待申请通过后即可开始听课，并查看相关课程资料。

学生也可在导航栏点击头像或昵称，选择进入【个人主页】、【个人中心】、【资料修改界面】。
在个人主页中，学生可查看自己目前学习的课程、发表的课后随笔以及已获得的课程证书。
						</div>
						<br></br>
						<p>　</p>
						<img src="${basePath}/client/image/help12.png" height="363" width="696">	
						<br></br>
						<p>　</p>
						<div class="detail-content js-lookimg">
						　　点击课程预览图，界面跳转后点击【课程观看】即可进入课程直播间。
						</div>
						<br></br>
						<img src="${basePath}/client/image/help13.png" height="363" width="696">
						<br></br>
						<p>　</p>
						<div class="detail-content js-lookimg">
						　　在个人主页中点击【所学课程-查看更多】，即可进入课程资源管理界面，在此学生可以查看自己所学课程发布的公告、课件、作业、课程大纲等，也可在线提交作业。
						</div>
						<br></br>
						<img src="${basePath}/client/image/help14.png" height="363" width="696">
						<br></br>	
						<p>　</p>
						<div class="detail-content js-lookimg">
						　　在个人主页中点击【添加随笔】，即可进入课程随笔编写页面，点击发布即可完成个人随笔的发布。
						</div>						
						<!-- 推荐 -->
						<div class="praise-box">
							<div class="praise-share icon-drop_up hide">
								<!--  -->
								<div class="praise-share-box">
									<p>若觉得本文不错，就分享一下吧！</p>

								</div>
							</div>
						</div>
						<!-- 推荐end -->
					</div>
					
				</div>

				<div class="article_wrap">
					<div class="feed-loading js-feed-loading" data-page="2">
						<i class="imv2-loading"></i><span>正在加载中</span>
					</div>
				<iv-->
			</div>
		</div>
	
	
		<div class="bottom-fixed js-bottom-fixed hide">
			<ul class="bottom-wrap clearfix">
				<!-- 推荐 -->
				<li class="praise-box l">
					<button id="js-praise-bottom">
						<span class="imv2-thumb_up"></span>
					</button>
				</li>
				<!-- 推荐end -->
				<li class="icon-warp l"><a
					onclick="_hmt.push(['_trackEvent', 'sjtj_left', 'share', 'pl'])"
					data-track="pl-1-1" href="#comment"
					class="icon-nav imv2-chat_bubble" title="评论"></a> <span>评论</span></li>
				<li class="icon-warp l"><a
					onclick="_hmt.push(['_trackEvent', 'sjtj_left', 'share', 'sc'])"
					data-track="sc-1-1" data-id="28428" href="javascript:"
					class="js-follow icon-nav icon-star2 " title="收藏"></a> <span>收藏</span>
				</li>
				<li class="input l js-showcommentModal">共同学习，写下你的评论</li>

			</ul>
		</div>


		<div class="r"></div>

	</div>
	
</body>
</html>