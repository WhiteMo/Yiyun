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
<title>介绍页面</title>
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
#container {width: 100%;height:200 px;background-color:#f5f5f5;}
#photo {float: left; width: 40%;}
#content {float: left; width: 45%;margin:20px;}
#space {float:left;width:100px; height:50px;}
#walkthrough-content {
	display: none
}

#walkthrough-content h3 {
	height: 30px;
	line-height: 30px
}

#walkthrough-content p {
	line-height: 28px
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
				<div class="part_essay js-part_essay" style="height:2650px">
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
							亦云课堂成员
							</span>
						</h1>

					</div>

					<!-- 手记 详情 -->
					<div class="detail-content-wrap">
						<!--h2 "detail-title">
							<span class="d-t js-title">
							用户操作手册
							</span>
						</h2-->
						<br></br>
						<div style = "float:left;background-color:#f5f5f5;" id="container">
						<div id="photo">
						<img src="${basePath}/client/image/zxm.jpg" height="200" width="200">
						</div>
						<div class="detail-content js-lookimg" id="content">
						周小明，男，1982年3月出生，工程师，中国人民大学信息学院信息技术综合实验室，专业领域：计算机网络、云计算、虚拟化、深度学习与神经网络、区块链等。
						</div>
						</div>
						<br></br>
						
						<div id="space"></div>
						
						<br></br>
						<div style = "float:left;background-color:#f5f5f5;" id="container">
						<div id="photo">
						<img src="${basePath}/client/image/jm.jpg" height="200" width="200">
						</div>
						<div class="detail-content js-lookimg" id="content">
						焦敏，计算机软件与理论博士，中国人民大学信息学院高级工程师，主要研究方向是数据库，大数据，MOOC课程建设。
						</div>
						</div>
						<br></br>
						
						<div id="space"></div>
						
						<br></br>
						<div style = "float:left;background-color:#f5f5f5;" id="container">
						<div id="photo">
						<img src="${basePath}/client/image/zwy.jpg" height="200" width="200">
						</div>
						<div class="detail-content js-lookimg" id="content">
						宗巍阳
						<br/>
						负责网站结构的构建，及整合各模块代码
						</div>
						</div>
						<br></br>
						
						<div id="space"></div>
						
						<br></br>
						<div style = "float:left;background-color:#f5f5f5;" id="container">
						<div id="photo">
						<img src="${basePath}/client/image/lrx.jpg" height="200" width="200">
						</div>
						<div class="detail-content js-lookimg" id="content">
						刘芮汐
						<br/>
						负责视频推流转码实现和流媒体服务器搭建
						</div>
						</div>
						<br></br>
						
						<div id="space"></div>
						
						<br></br>
						<div style = "float:left;background-color:#f5f5f5;" id="container">
						<div id="photo">
						<img src="${basePath}/client/image/lz.jpg" height="200" width="200">
						</div>
						<div class="detail-content js-lookimg" id="content">
						刘专
						<br/>
						负责数据库搭建以及聊天室实现
						</div>
						</div>
						<br></br>
						
						<div id="space"></div>
						
						<br></br>
						<div style = "float:left;background-color:#f5f5f5;" id="container">
						<div id="photo">
						<img src="${basePath}/client/image/hjw.jpg" height="200" width="200">
						</div>
						<div class="detail-content js-lookimg" id="content">
						胡景文
						<br/>
						负责流媒体编解码技术和部分网页实现
						</div>
						</div>
						<br></br>
						
						<div id="space"></div>
						
						<br></br>
						<div style = "float:left;background-color:#f5f5f5;" id="container">
						<div id="photo">
						<img src="${basePath}/client/image/lfr.jpg" height="200" width="200">
						</div>
						<div class="detail-content js-lookimg" id="content">
						吕芳锐
						<br/>
						负责前端页面的设计与实现
						</div>
						</div>
						<br></br>
						
						<div id="space"></div>
						
						<br></br>
						<div style = "float:left;background-color:#f5f5f5;" id="container">
						<div id="photo">
						<img src="${basePath}/client/image/ztj.jpg" height="200" width="200">
						</div>
						<div class="detail-content js-lookimg" id="content">
						曾恬静
						<br/>
						负责前端页面的设计与实现
						</div>
						</div>
						<br></br>
						
						<div id="space"></div>
						
						<br></br>
						<div style = "float:left;background-color:#f5f5f5;" id="container">
						<div id="photo">
						<img src="${basePath}/client/image/xrj.jpg" height="200" width="200">
						</div>
						<div class="detail-content js-lookimg" id="content">
						肖若瑾
						<br/>
						负责亦云直播课堂前端网页的设计与搭建
						</div>
						</div>
						<br></br>
						
						<div id="space"></div>
						
						<br></br>
						<div style = "float:left;background-color:#f5f5f5;" id="container">
						<div id="photo">
						<img src="${basePath}/client/image/ywq.png" height="200" width="200">
						</div>
						<div class="detail-content js-lookimg" id="content">
						杨皖晴
						<br/>
						负责前端页面的设计和实现
						</div>
						</div>
						<br></br>
				
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