<%@page import="Bean.User"%>
<%@page import="DBFunction.UserImpl"%>
<%@page import="Bean.Article"%>
<%@page import="DBFunction.ArticleImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	String basePath=request.getContextPath();
	pageContext.setAttribute("basePath", request.getContextPath());
	String articleId = request.getParameter("id");
	if(articleId==null){
		articleId = "33";
	}
	Article article = new ArticleImpl().getArticleById(articleId);
	pageContext.setAttribute("article", article);
	User author = new UserImpl().getUserById(article.authorId);
	pageContext.setAttribute("author", author);
	
%>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>文章页面</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">

<meta http-equiv="Access-Control-Allow-Origin" content="*">
<meta http-equiv="Cache-Control" content="no-transform ">
<meta http-equiv="Cache-Control" content="no-siteapp">
<link rel="stylesheet" href="${basePath}/client/article/css/moco.css" type="text/css">
<link rel="stylesheet" href="${basePath}/client/article/css/swiper-3.css">
<link href="${basePath}/client/article/css/captcha.css" rel="stylesheet">
<link rel="stylesheet" href="${basePath}/client/article/css/a.css" type="text/css">
<link charset="utf-8" rel="stylesheet" href="${basePath}/client/article/css/prettify.css">
<link rel="stylesheet" href="${basePath}/client/css/bootstrap.css">
<link href="${basePath}/client/css/header_and_footer.css"
	rel="stylesheet" />
</head>

<body>
	<jsp:include page="/client/header_and_footer/header.jsp"></jsp:include>
	<br>
	<div id="main" style="margin-top:50px">

		<div class="main_con clearfix">
			<!-- 分享&收藏 -->
			
			<!-- 分享&收藏 end -->
			<div class="left_essay l">
				<div class="part_essay js-part_essay">
					<div class="originalImg"></div>
					<!-- 面包屑 -->
					<div class="detail-path">
						<a class="imooc" target="_blank" href="https://www.imooc.com/"><i class="imv2-imooc"></i></a> <a href="https://www.imooc.com/article" target="_blank">手记</a> 
					</div>
					<!-- 面包屑end -->
					<div class="detail-title-wrap">
						<h1 class="detail-title">
							<span class="d-t js-title">${article.getTitle()}</span>
						</h1>
						<div class="dc-profile clearfix">
							<div class="l">
								<span class="spacer">${article.getDate()}</span> <span class="spacer spacer-2">1626浏览</span>
							</div>
							
						</div>
					</div>

					<!-- 手记详情 -->
					<div class="detail-content-wrap">
						<div class="detail-content js-lookimg">
							${article.content}
						</div>
						
						
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
							<button id="js-praise">
								<span class="imv2-thumb_up"></span>
								<div style="position: absolute; top: 50%; left: 50%; width: 230px; height: 230px; margin-left: -115px; margin-top: -115px; opacity: 0.6; display: none; transform: rotate(0deg) translate(0px, 0px);">
									<svg style="position: absolute; width: 100%; height: 100%;">
										<ellipse style="opacity: 1; display: none;" cy="0" cx="0" ry="15" rx="15" transform="rotate(0,0,0)" fill-opacity="1" stroke-linecap="" stroke-dashoffset="NaN " fill="#F9B552" stroke-dasharray="NaN " stroke-opacity="1" stroke-width="0" stroke="transparent"></ellipse>
										<ellipse style="opacity: 1; display: none;" cy="0" cx="0" ry="15" rx="15" transform="rotate(0,0,0)" fill-opacity="1" stroke-linecap="" stroke-dashoffset="NaN " fill="#F9B552" stroke-dasharray="NaN " stroke-opacity="1" stroke-width="0" stroke="transparent"></ellipse>
										<ellipse style="opacity: 1; display: none;" cy="0" cx="0" ry="15" rx="15" transform="rotate(0,0,0)" fill-opacity="1" stroke-linecap="" stroke-dashoffset="NaN " fill="#F9B552" stroke-dasharray="NaN " stroke-opacity="1" stroke-width="0" stroke="transparent"></ellipse>
										<ellipse style="opacity: 1; display: none;" cy="0" cx="0" ry="15" rx="15" transform="rotate(0,0,0)" fill-opacity="1" stroke-linecap="" stroke-dashoffset="NaN " fill="#F9B552" stroke-dasharray="NaN " stroke-opacity="1" stroke-width="0" stroke="transparent"></ellipse>
										<ellipse style="opacity: 1; display: none;" cy="0" cx="0" ry="15" rx="15" transform="rotate(0,0,0)" fill-opacity="1" stroke-linecap="" stroke-dashoffset="NaN " fill="#F9B552" stroke-dasharray="NaN " stroke-opacity="1" stroke-width="0" stroke="transparent"></ellipse>
										<ellipse style="opacity: 1; display: none;" cy="0" cx="0" ry="15" rx="15" transform="rotate(0,0,0)" fill-opacity="1" stroke-linecap="" stroke-dashoffset="NaN " fill="#F9B552" stroke-dasharray="NaN " stroke-opacity="1" stroke-width="0" stroke="transparent"></ellipse></svg>
								</div>
								<div style="position: absolute; top: 50%; left: 50%; width: 180px; height: 180px; margin-left: -90px; margin-top: -90px; opacity: 0.6; display: none; transform: translate(0px, 0px);">
									<svg style="position: absolute; width: 100%; height: 100%;">
										<ellipse cy="90" cx="90" ry="0" rx="0" transform="rotate(0,90,90)" fill-opacity="transparent" stroke-linecap="" stroke-dashoffset="" fill="transparent" stroke-dasharray="" stroke-opacity="1" stroke-width="20" stroke="#F9B552"></ellipse></svg>
								</div>
							</button>
							<div class="num-person">
								<em class="num">14</em>人推荐
							</div>
							<div class="praise-share icon-drop_up hide">
								<!--  -->
								<div class="praise-share-box">
									<p>若觉得本文不错，就分享一下吧！</p>
									<div class="share-content bdsharebuttonbox bdshare-button-style0-16" data-bd-bind="1526094620866">
										<div class="icon-warp">
											<a onclick="_hmt.push(['_trackEvent', 'sjtj_top', 'share', 'wx'])" data-track="topshare-1-1" href="#" class="bds_weixin icon-nav imv2-weixin_c share-icon" data-cmd="weixin" title="分享到微信"></a>
										</div>
										<div class="icon-warp">
											<a onclick="_hmt.push(['_trackEvent', 'sjtj_top', 'share', 'wb'])" data-track="topshare-1-2" href="#" class="bds_tsina icon-nav imv2-weibo_c share-icon" data-cmd="tsina" title="分享到新浪微博"></a>
										</div>
										<div class="icon-warp">
											<a onclick="_hmt.push(['_trackEvent', 'sjtj_top', 'share', 'qq'])" data-track="topshare-1-3" href="#" class="bds_qzone icon-nav imv2-qq_c share-icon" data-cmd="qzone" title="分享到QQ空间"></a>
										</div>
									</div>
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
									<img src="%E5%A6%82%E4%BD%95%E7%B3%BB%E7%BB%9F%E5%BF%AB%E9%80%9F%E5%AD%A6%E4%B9%A0%E5%8C%BA%E5%9D%97%E9%93%BE%E6%8A%80%E6%9C%AF_%E6%85%95%E8%AF%BE%E6%89%8B%E8%AE%B0_files/avatar_default.png" alt="" width="40">

								</div>
								<p class="fadeInput l js-showcommentModal">共同学习，写下你的评论</p>

							</div>
							<!-- 评论框end -->
							<!-- 评论 -->
							<div class="df-title" id="all_comments">
								<span class="comment-num"><i>2</i></span> 评论
							</div>
							<div id="js-feedback-list-wrap" class="feedback-list">

								<div id="js-feedback-list">
									<div class="comment-box clearfix">
										<div class="comment clearfix">
											<div class="feed-author l">
												<a href="https://www.imooc.com/u/1058390/articles"><img src="%E5%A6%82%E4%BD%95%E7%B3%BB%E7%BB%9F%E5%BF%AB%E9%80%9F%E5%AD%A6%E4%B9%A0%E5%8C%BA%E5%9D%97%E9%93%BE%E6%8A%80%E6%9C%AF_%E6%85%95%E8%AF%BE%E6%89%8B%E8%AE%B0_files/556a977a0001336b07770777-100-100.jpg" width="48"><span class="com-floor">2楼</span></a>
											</div>
											<div class="feed-list-content">
												<a class="nick" href="https://www.imooc.com/u/1058390/articles" target="_blank">湖心小筑</a>
												<p>没干货，☹️☹️☹️</p>
												<div class="comment-footer clearfix">
													<span class="agree-with l" data-commentid="43314" data-uid="1058390" data-username="湖心小筑"><b class="imv2-thumb_up" title="赞同"></b><em>0</em></span><span class="reply-btn" data-commentid="43314" data-uid="1058390" data-username="湖心小筑">回复</span><span class="report-btn js-tip-off tipoff " data-id="43314" data-uid="1058390" data-type="10" data-src="/article/28428">举报</span><span class="feed-list-times"> 1小时前</span>
												</div>
											</div>
										</div>
										<div class="reply-boxhide"></div>
										<div class="release-reply clearfix">
											<a href="https://www.imooc.com/u//articles" class="user-head"><img src="" alt=""></a>
											<div class="replay-con l">
												<div class="textarea-wrap">
													<textarea placeholder="写下你的回复..."></textarea>
												</div>
												<p class="errtip"></p>
												<div class="reply-ctrl clearfix">
													<div class="captcha-verify-box js-reply-verify-box hide"></div>
													<div class="btn-wrap">
														<div class="cancel-btn">取消</div>
														<div data-comment-uid="1058390" class="release-reply-btn">回复</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="comment-box clearfix">
										<div class="comment clearfix">
											<div class="feed-author l">
												<a href="https://www.imooc.com/u/6600861/articles"><img src="%E5%A6%82%E4%BD%95%E7%B3%BB%E7%BB%9F%E5%BF%AB%E9%80%9F%E5%AD%A6%E4%B9%A0%E5%8C%BA%E5%9D%97%E9%93%BE%E6%8A%80%E6%9C%AF_%E6%85%95%E8%AF%BE%E6%89%8B%E8%AE%B0_files/54586849000122fd02200220-100-100.jpg" width="48"><span class="com-floor">1楼</span></a>
											</div>
											<div class="feed-list-content">
												<a class="nick" href="https://www.imooc.com/u/6600861/articles" target="_blank">慕仰4505333</a>
												<p>Grrffffffffffffffffff</p>
												<div class="comment-footer clearfix">
													<span class="agree-with l" data-commentid="43283" data-uid="6600861" data-username="慕仰4505333"><b class="imv2-thumb_up" title="赞同"></b><em>0</em></span><span class="reply-btn" data-commentid="43283" data-uid="6600861" data-username="慕仰4505333">回复</span><span class="report-btn js-tip-off tipoff " data-id="43283" data-uid="6600861" data-type="10" data-src="/article/28428">举报</span><span class="feed-list-times"> 1天前</span>
												</div>
											</div>
										</div>
										<div class="reply-boxhide"></div>
										<div class="release-reply clearfix">
											<a href="https://www.imooc.com/u//articles" class="user-head"><img src="" alt=""></a>
											<div class="replay-con l">
												<div class="textarea-wrap">
													<textarea placeholder="写下你的回复..."></textarea>
												</div>
												<p class="errtip"></p>
												<div class="reply-ctrl clearfix">
													<div class="captcha-verify-box js-reply-verify-box hide"></div>
													<div class="btn-wrap">
														<div class="cancel-btn">取消</div>
														<div data-comment-uid="6600861" class="release-reply-btn">回复</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 分页页码  -->
							<!-- <div class="qa-comment-page hide"></div> -->

							<div class="qa-comment-page hide" style="display: none;">
								<div class="moreBtn js-more" data-page="2">展开查看更多评论</div>
							</div>
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
					<a href="#" class="l img_con" title="${author.getName()}" target="_blank"> 
								<c:if test="${author.getHeadImgUrl() eq '#'}">
                                           		<c:if test="${author.role eq 'student'}">
                                           			<c:if test="${author.sex eq 'female' }">
                                           				<img src="${basePath}/client/image/female_student.png">
                                           			</c:if>
                                           			<c:if test="${author.sex ne 'female' }">
                                           				<img src="${basePath}/client/image/male_student.jpg">
                                           			</c:if>
                                           		</c:if>
                                           		<c:if test="${author.role ne 'student'}">
                                           			<c:if test="${author.sex eq 'female' }">
                                           				<img src="${basePath}/client/image/female_teacheer.png">
                                           			</c:if>
                                           			<c:if test="${author.sex ne 'female' }">
                                           				<img src="${basePath}/client/image/male_teacher.png">
                                           			</c:if>
                                           		</c:if>
                                           </c:if>
                                           <c:if test="${author.getHeadImgUrl() ne '#'}">
                                         	  <img src="${author.getHeadImgUrl()}">
                                           </c:if>
				
					</a>
					<div class="text_con l">
						<div class="name_con clearfix">
							<p class="name l">
								<a class="nick" href="" title="${author.getName()}" target="_blank"> ${author.getName()} </a>
							</p>
							<p class="job-icon l"></p>
							<p class="forward">
								<span class="js-add-follow" data-uid="2137489" data-type="1">关注</span>
							</p>
						</div>
						<div class="job"></div>
						<div class="contribution clearfix">
							<a href="#" target="_blank" class="js-article-num l"> <span>1</span> 篇手记
							</a> <a href="#" target="_blank" class="js-article-words l"> 贡献 <span>2388</span>
								字
							</a>
						</div>
					</div>
				</div>
				<!-- 作者信息end -->
				<!-- 作者相关文章 -->
				<!-- 作者相关文章end -->
				<!-- 相关课程 -->
				<div class="related_lessons js-related_lessons">
					<div class="title">相关课程</div>
					<ul>
						<li class="lesson-item clearfix">
							<div class="img_con l">
								<img src="%E5%A6%82%E4%BD%95%E7%B3%BB%E7%BB%9F%E5%BF%AB%E9%80%9F%E5%AD%A6%E4%B9%A0%E5%8C%BA%E5%9D%97%E9%93%BE%E6%8A%80%E6%9C%AF_%E6%85%95%E8%AF%BE%E6%89%8B%E8%AE%B0_files/5af2a67500016b9905400300-360-202.jpg">
								<p class="root">实战</p>
							</div>
							<div class="text_con l clearfix">
								<a target="_blank" href="https://coding.imooc.com/class/214.html" class="name js-hover-name l oneLine">区块链入门与去中心化应用实战</a>
								<p class="price l">￥199.00</p>
								<div class="dot l">
									<i class="imv2-dot_samll"></i>
								</div>
								<p class="type l">初级</p>
								<div class="dot l">
									<i class="imv2-dot_samll"></i>
								</div>
								<p class="people l">
									<i class="imv2-set-sns"></i> <span>47</span>
								</p>
							</div>
						</li>
									
					</ul>
				</div>
				<!-- 相关课程end -->
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
				<li class="icon-warp l"><a onclick="_hmt.push(['_trackEvent', 'sjtj_left', 'share', 'pl'])" data-track="pl-1-1" href="#comment" class="icon-nav imv2-chat_bubble" title="评论"></a> <span>评论</span></li>
				<li class="icon-warp l"><a onclick="_hmt.push(['_trackEvent', 'sjtj_left', 'share', 'sc'])" data-track="sc-1-1" data-id="28428" href="javascript:" class="js-follow icon-nav icon-star2 " title="收藏"></a> <span>收藏</span>
				</li>
				<li class="input l js-showcommentModal">共同学习，写下你的评论</li>
				<li class="icon-warp2 l"><a class="js-forward-btn imv2-forward icon-nav2" href="#"> </a> <a onclick="_hmt.push(['_trackEvent', 'sjtj_left', 'share', 'wx'])" data-track="letfshare-1-1" href="#" class="bds_weixin icon-nav2 icon-share-weichat share-icon" data-cmd="weixin" title="分享到微信"></a> <a onclick="_hmt.push(['_trackEvent', 'sjtj_left', 'share', 'wb'])" data-track="letfshare-1-2" href="#" class="bds_tsina icon-nav2 icon-share-weibo share-icon" data-cmd="tsina" title="分享到新浪微博"></a> <a onclick="_hmt.push(['_trackEvent', 'sjtj_left', 'share', 'qq'])" data-track="letfshare-1-3" href="#" class="bds_qzone icon-nav2 icon-share-qq share-icon" data-cmd="qzone" title="分享到QQ空间"></a></li>
			</ul>
		</div>




		<div class="hide">
			<input data-pic="5af11a4a0001a75e05500550" id="js-share-img" type="hidden"> <input data-pic="//img2.mukewang.com/5af2c02c0001436212391176-100-100.jpg" id="js-img-author" type="hidden">
		</div>
		<div class="r"></div>

	</div>



	<div id="J_GotoTop" class="elevator">

		<a href="https://www.imooc.com/user/feedback" class="elevator-msg" target="_blank"> <i class="icon-feedback"></i> <span class="">意见反馈</span>
		</a> <a href="https://www.imooc.com/about/faq" class="elevator-faq" target="_blank"> <i class="icon-ques"></i> <span class="">常见问题</span>
		</a> <a href="https://www.imooc.com/mobile/app" target="_blank" class="elevator-app"> <i class="icon-appdownload"></i> <span class="">APP下载</span>
			<div class="elevator-app-box"></div>
		</a> <a href="javascript:void(0)" class="elevator-weixin no-goto" id="js-elevator-weixin"> <i class="icon-wxgzh"></i> <span class="">官方微信</span>
			<div class="elevator-weixin-box"></div>
		</a> <a href="javascript:void(0)" class="elevator-top no-goto" style="display: none;" id="backTop"> <i class="icon-up2"></i> <span class="">返回顶部</span>
		</a>
	</div>



	<script type="text/javascript" charset="utf-8" src="%E5%A6%82%E4%BD%95%E7%B3%BB%E7%BB%9F%E5%BF%AB%E9%80%9F%E5%AD%A6%E4%B9%A0%E5%8C%BA%E5%9D%97%E9%93%BE%E6%8A%80%E6%9C%AF_%E6%85%95%E8%AF%BE%E6%89%8B%E8%AE%B0_files/ueditor.js"></script>

	<!--script-->
	<script type="text/javascript" src="%E5%A6%82%E4%BD%95%E7%B3%BB%E7%BB%9F%E5%BF%AB%E9%80%9F%E5%AD%A6%E4%B9%A0%E5%8C%BA%E5%9D%97%E9%93%BE%E6%8A%80%E6%9C%AF_%E6%85%95%E8%AF%BE%E6%89%8B%E8%AE%B0_files/error.js"></script>
	<script src="%E5%A6%82%E4%BD%95%E7%B3%BB%E7%BB%9F%E5%BF%AB%E9%80%9F%E5%AD%A6%E4%B9%A0%E5%8C%BA%E5%9D%97%E9%93%BE%E6%8A%80%E6%9C%AF_%E6%85%95%E8%AF%BE%E6%89%8B%E8%AE%B0_files/ssologin.js"></script>
	<script type="text/javascript" src="%E5%A6%82%E4%BD%95%E7%B3%BB%E7%BB%9F%E5%BF%AB%E9%80%9F%E5%AD%A6%E4%B9%A0%E5%8C%BA%E5%9D%97%E9%93%BE%E6%8A%80%E6%9C%AF_%E6%85%95%E8%AF%BE%E6%89%8B%E8%AE%B0_files/sea.js"></script>
	<script type="text/javascript" src="%E5%A6%82%E4%BD%95%E7%B3%BB%E7%BB%9F%E5%BF%AB%E9%80%9F%E5%AD%A6%E4%B9%A0%E5%8C%BA%E5%9D%97%E9%93%BE%E6%8A%80%E6%9C%AF_%E6%85%95%E8%AF%BE%E6%89%8B%E8%AE%B0_files/sea_config.js"></script>
	<script type="text/javascript">
		seajs.use("/static/page/" + OP_CONFIG.module + "/" + OP_CONFIG.page);
	</script>


	<script src="%E5%A6%82%E4%BD%95%E7%B3%BB%E7%BB%9F%E5%BF%AB%E9%80%9F%E5%AD%A6%E4%B9%A0%E5%8C%BA%E5%9D%97%E9%93%BE%E6%8A%80%E6%9C%AF_%E6%85%95%E8%AF%BE%E6%89%8B%E8%AE%B0_files/captcha.js"></script>

	<div class="tipoff-block js-tipoff-block"></div>
	<div class="tipoff-box js-tipoff-box">
		<div class="tipoff-top-box clearfix">
			<p class="l tipoff-title">举报</p>
			<span class="r tipoff-close-btn icon-close2 js-tipoff-close"></span>
		</div>
		<div class="tipoff-type-box js-tipoff-typebox clearfix">
			<div class="tipoff-loading">
				<div class="bounce1"></div>
				<div class="bounce2"></div>
				<div class="bounce3"></div>
			</div>
		</div>
		<div class="tipoff-content">
			<textarea name="tipoff-content" class="tipoff-desc js-tipoff-desc" placeholder="写下举报理由"></textarea>
			<div class="tipoff-text">
				<span class="js-tipoff-text">0</span>/150
			</div>
		</div>
		<div class="tipoff-btn-box clearfix">
			<div class="r tipoff-submit-btn js-tipoff-submit" data-tipofftype="">提交</div>
			<div class="r tipoff-cancel-btn js-tipoff-close">取消</div>
		</div>
	</div>








	<div style="display: none">
		<script type="text/javascript">
			var _hmt = _hmt || [];
			(function() {
				var hm = document.createElement("script");
				hm.src = "https://hm.baidu.com/hm.js?f0cfcccd7b1393990c78efdeebff3968";
				var s = document.getElementsByTagName("script")[0];
				s.parentNode.insertBefore(hm, s);
			})();
			(function(d) {
				window.bd_cpro_rtid = "rHT4P1c";
				var s = d.createElement("script");
				s.type = "text/javascript";
				s.async = true;
				s.src = location.protocol + "//cpro.baidu.com/cpro/ui/rt.js";
				var s0 = d.getElementsByTagName("script")[0];
				s0.parentNode.insertBefore(s, s0);
			})(document);
		</script>
		<script>
			(function() {
				var bp = document.createElement('script');
				var curProtocol = window.location.protocol.split(':')[0];
				if (curProtocol === 'https') {
					bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
				} else {
					bp.src = 'http://push.zhanzhang.baidu.com/push.js';
				}
				var s = document.getElementsByTagName("script")[0];
				s.parentNode.insertBefore(bp, s);
			})();
		</script>
	</div>



	

</body></html>