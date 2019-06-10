<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>帮助页面</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Access-Control-Allow-Origin" content="*">
<link rel="icon" href="${basePath}/client/image/header_brand_image.png"
	type="image/x-icon" />

<link rel="stylesheet" href="${basePath}/client/article/css/moco.css"
	type="text/css">
<link rel="stylesheet"
	href="${basePath}/client/article/css/swiper-3.css">
<link href="${basePath}/client/article/css/captcha.css" rel="stylesheet">
<link rel="stylesheet" href="${basePath}/client/article/css/a.css"
	type="text/css">
<link rel="stylesheet"
	href="${basePath}/client/article/css/prettify.css">
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
</style>
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
					<div class="detail-path">
						<a class="imooc" target="_blank" href="#"><i
							class="fa fa-file-text"></i></a> <a>手记文章</a>
					</div>
					<!-- 面包屑end -->
					<div class="detail-title-wrap">
						<h1 class="detail-title">
							<span class="d-t js-title">${article.getTitle()}</span>
						</h1>
						<div class="dc-profile clearfix">
							<div class="l">
								<span class="spacer">3天前</span> <span class="spacer spacer-2">1626浏览</span>
							</div>

						</div>
					</div>

					<!-- 手记详情 -->
					<div class="detail-content-wrap">
						<div class="detail-content js-lookimg">${article.content}</div>


						<!-- 标签 -->
						<div class="cat-box">

							<div class="original-warp">
								<p class="original">本文原创发布于亦云平台，转载请注明出处，谢谢合作</p>
							</div>
						</div>
						<!-- 推荐 -->
						<div class="praise-box">
							<!-- 
							 -->

							<div class="num-person">
								<em class="num">14</em>人推荐
							</div>
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
				<div class="opus-wrap clearfix">
					<div class="detail-left">
						<div class="detail-feedback-wrap">
							<!-- 评论框 -->
							<div class="df-ipt-wrap clearfix" id="comment">

								<div class="feeds-author l">
									<c:if test="${empty user}">
										<img src="${basePath}/client/image/anonymous.png" alt=""
											width="40">
									
									</c:if>
									<c:if test="${not empty user}">
										<img src="${user.getHeadImgUrl()}" alt="" width="40">
									
									</c:if>
								</div>
								<c:if test="${empty user}">
								<p class="fadeInput l js-showcommentModal"
											onclick="addCommentPre()">请先登录，然后才能评论哦</p>
								</c:if>
								<c:if test="${not empty user}">
								<p class="fadeInput l js-showcommentModal"
											onclick="addCommentPre()">共同学习，写下你的评论</p>
								</c:if>
							</div>
							<!-- 评论框end -->
							<!-- 评论 -->
							<div class="df-title" id="all_comments">
								<span class="comment-num"><i>${commentsLength}</i></span> 评论
							</div>
							<c:if test="${commentsLength eq 0}">
								<p>暂无评论</p>
							</c:if>
							<c:if test="${commentsLength ne 0}">
								<div id="js-feedback-list-wrap" class="feedback-list">

									<div id="js-feedback-list">

										<c:forEach var="comment" items="${comments}" varStatus="st">
											<c:set var="tempUser" value="${comment.getUser()}"></c:set>
											<div class="comment-box clearfix">
												<div class="comment clearfix">
													<div class="feed-author l">
														<a href="#"><img src="${tempUser.getHeadImgUrl()}"
															width="48"><span class="com-floor">${st.index}楼</span></a>
													</div>
													<div class="feed-list-content">
														<a class="nick" href="" target="_blank">${tempUser.getName()}</a>
														<p>${comment.getContent()}</p>
														<div class="comment-footer clearfix">
															<span class="agree-with l"
																onclick="thumbUp('${comment.getId()}')"
																data-id="${comment.getId()}"
																data-username="${tempUser.getName()}"> <b
																class="fa fa-thumbs-o-up" title="赞同"></b><em>${comment.getScore()}</em></span><span
																class="reply-btn">回复</span><span
																class="report-btn js-tip-off tipoff " data-id="43314"
																data-uid="1058390" data-type="10"
																data-src="/article/28428">举报</span><span
																class="feed-list-times"> 1小时前</span>
														</div>
													</div>
												</div>
												<div class="reply-boxhide"></div>
												<div class="release-reply clearfix">
													<a href="#" class="user-head"><img src="" alt=""></a>
													<div class="replay-con l">
														<div class="textarea-wrap">
															<textarea placeholder="写下你的回复..."></textarea>
														</div>
														<p class="errtip"></p>
														<div class="reply-ctrl clearfix">
															<div class="captcha-verify-box js-reply-verify-box hide"></div>
															<div class="btn-wrap">
																<div class="cancel-btn">取消</div>
																<div data-comment-uid="1058390"
																	class="release-reply-btn">回复</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</c:if>
						</div>
					</div>
				</div>
				<div class="article_wrap">
					<div class="feed-loading js-feed-loading" data-page="2">
						<i class="imv2-loading"></i><span>正在加载中</span>
					</div>
				</div>
			</div>
			<div class="right_recommend r">

				<!-- 作者信息 -->
				<div class="author_info js-author_info clearfix">
					<c:if test="${empty author}">
						<a href="#" class="l img_con" title="尚未登录" target="_blank"> <img
							src="${basePath}/client/image/anonymous.png">
						</a>
					</c:if>
					<c:if test="${not empty author}">
						<a href="#" class="l img_con" title="${author.getName()}"
							target="_blank"> <img src="${author.getHeadImgUrl()}">
						</a>
					</c:if>


					<div class="text_con l">
						<div class="name_con clearfix">
							<p class="name l">
								<a class="nick" href="" title="${author.getName()}"
									target="_blank"> ${author.getName()} </a>
							</p>
							<p class="job-icon l"></p>
							<p class="forward">
								<span class="js-add-follow" data-uid="2137489" data-type="1">关注</span>
							</p>
						</div>
						<div class="job">${author.getCollege()}
							<c:if test="${author.getRole() eq 'student'}">学生</c:if>
							<c:if test="${author.getRole() eq 'teacher'}">教师</c:if>
						</div>

						<div class="contribution clearfix">
							<a href="#" class="js-article-num l"> <span>1</span> 篇手记
							</a>

						</div>
					</div>
				</div>
				<!-- 作者信息end -->
				<!-- 作者相关文章 -->
				<!-- 作者相关文章end -->
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