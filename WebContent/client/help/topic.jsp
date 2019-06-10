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
	String articleId = request.getParameter("id");
	if (articleId == null) {
		articleId = "59";
	}
	Article article = new ArticleImpl().getArticleById(articleId);
	pageContext.setAttribute("article", article);
	User author = new UserImpl().getUserById(article.authorId);
	pageContext.setAttribute("author", author);
	String userId = null;
	if (session.getAttribute("user") != null) {
		userId = ((User) session.getAttribute("user")).getId();
	}
	Comment[] comments = new CommentImpl().getCommentsByArticleId(articleId);
	pageContext.setAttribute("comments", comments);
	pageContext.setAttribute("commentsLength", new Integer(comments.length));
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>亦云提问</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="renderer" content="webkit">
<meta name="mobile-agent" content="format=wml"
	;="" url="https://m.imooc.com/wenda/detail/390693">
<link rel="alternate" media="only screen and (max-width: 640px)"
	href="https://m.imooc.com/wenda/detail/390693">
<meta name="mobile-agent" content="format=xhtml"
	;="" url="https://m.imooc.com/wenda/detail/390693">
<meta name="mobile-agent" content="format=html5"
	;="" url="https://m.imooc.com/wenda/detail/390693">
<meta property="qc:admins" content="77103107776157736375">
<meta property="wb:webmaster" content="c4f857219bfae3cb">
<meta http-equiv="Access-Control-Allow-Origin" content="*">
<meta http-equiv="Cache-Control" content="no-transform ">
<meta http-equiv="Cache-Control" content="no-siteapp">
<link rel="dns-prefetch" href="https://www.imooc.com/">
<link rel="dns-prefetch" href="https://img.imooc.com/">
<link rel="dns-prefetch" href="https://img.mukewang.com/">
<link rel="apple-touch-icon" sizes="76x76"
	href="https://www.imooc.com/static/img/common/touch-icon-ipad.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="https://www.imooc.com/static/img/common/touch-icon-iphone-retina.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="https://www.imooc.com/static/img/common/touch-icon-ipad-retina.png">

<meta name="Keywords" content="深度学习，机器学习，测试">


<meta name="Description"
	content="以前的手机号注册过慕课网，现在换手机号了，以前的手机号忘记了，登不上以前的账号了，谁知道怎么办？还能...">


<meta name="viewport" content="width=device-width, initial-scale=1">








<link rel="stylesheet" href="topic_files/moco.css" type="text/css">
<link rel="stylesheet" href="topic_files/swiper-3.css">



<link rel="stylesheet" href="topic_files/layer.css" type="text/css">

<link href="topic_files/captcha.css" rel="stylesheet">


<link rel="stylesheet" href="topic_files/a.css" type="text/css">

</head>
<body>

	<div id="header">
		<div class="page-container" id="nav">
			<div id="logo" class="logo">
				<a href="https://www.imooc.com/" target="_self" class="hide-text"
					title="首页">慕课网</a>
			</div>


			<button type="button"
				class="navbar-toggle visible-xs-block js-show-menu">
				<i class="icon-menu"></i>
			</button>
			<ul class="nav-item">
				<li class="set-btn visible-xs-block"><a
					href="https://www.imooc.com/user/newlogin" target="_self">登录</a> /
					<a href="https://www.imooc.com/user/newsignup" target="_self">注册</a></li>

				<li><a href="https://www.imooc.com/course/list" target="_self">免费课程</a>
				</li>
				<li><a href="https://class.imooc.com/" class="program-nav "
					target="_self">职业路径<i class="icn-new"></i></a></li>
				<li><a href="https://coding.imooc.com/" target="_self">实战</a></li>
				<li><a href="https://www.imooc.com/wenda" class="active"
					target="_self">猿问</a></li>
				<li><a href="https://www.imooc.com/article" target="_self">手记</a></li>

			</ul>
			<div id="login-area">
				<ul class="header-unlogin clearfix">
					<li class="app-load" id="js-app-load"><a
						href="https://www.imooc.com/mobile/app" target="_blank"
						style="width: 60px;">下载APP</a>
						<div class="app-load-box clearfix js-load-box">
							<img src="topic_files/appload.png" class="l">
							<div class="r">
								<p>扫描下载慕课网APP</p>
								<a
									href="https://itunes.apple.com/cn/app/mu-ke-wang/id722179140?mt=8"
									target="_blank"><i class="icon-apple"></i>App Store下载</a> <a
									href="https://www.imooc.com/mobile/mukewang.apk"
									target="_blank"><i class="icon-android"></i>Android下载</a>
							</div>
						</div></li>

					<li class="shop-cart" id="shop-cart"><a
						href="https://order.imooc.com/pay/cart" class="shop-cart-icon"
						target="_blank"> <span class="icon-shopping-cart js-endcart"></span><span>购物车</span><span
							class="shopping_icon js-cart-num" data-ordernum="0"
							data-cartnum="0" style="display: none">0</span>
					</a>
						<div class="my-cart" id="js-my-cart">
							<div class="cart-title-box clearfix">
								<h2 class="l">我的购物车</h2>
								<h5 class="r">
									已加入<span class="js-incart-num">0</span>门课程
								</h5>
							</div>
							<div class="cart-wrap">
								<div class="clear-cart">
									<span class="cartIcon icon-shopping-cart"></span>
									<h3>购物车里空空如也</h3>
									<div class="text">快去这里选购你中意的课程</div>
									<p>
										<a class="go-link" href="https://coding.imooc.com/"
											target="_blank">实战课程</a>
									</p>
									<p>
										<a class="go-link" href="https://class.imooc.com/"
											target="_blank">职业路径</a>
									</p>
								</div>
							</div>
							<div class="more-box clearfix">
								<div class="l show-box">
									<span class="text"><a
										href="https://order.imooc.com/myorder" target="_blank">我的订单中心</a></span>
								</div>
								<a href="https://order.imooc.com/pay/cart" target="_blank"
									class="r moco-btn moco-btn-red go-cart">去购物车</a>
							</div>
						</div></li>
					<li class="header-signin"><a href="#" id="js-signin-btn">登录</a>
						/ <a href="#" id="js-signup-btn">注册</a></li>
				</ul>
			</div>
			<div class="search-warp clearfix"
				style="min-width: 32px; height: 72px;">
				<div class="pa searchTags">
					<a href="https://class.imooc.com/sc/20" target="_blank">前端入门</a> <a
						href="https://class.imooc.com/sc/18" target="_blank">Java入门</a>
				</div>

				<div class="search-area" data-search="top-banner">
					<input class="search-input" data-suggest-trigger="suggest-trigger"
						autocomplete="off" type="text"> <input class="btn_search"
						data-search-btn="search-btn" type="hidden">
					<ul class="search-area-result" data-suggest-result="suggest-result">
					</ul>
				</div>
				<div class="showhide-search" data-show="no">
					<i class="icon-search"></i>
				</div>
			</div>
		</div>
	</div>

	<div class="bindHintBox js-bindHintBox hide">
		<div class="pr">
			为了账号安全，请及时绑定邮箱和手机<a href="https://www.imooc.com/user/setbindsns"
				class="ml20 color-red" target="_blank">立即绑定</a>
			<button class="closeBindHint js-closeBindHint" type="button"></button>
			<div class="arrow"></div>
		</div>
	</div>


	<div id="main">

		<script>
var quesname="慕课网账号忘记了怎么办";   //问答名称
var url = 'https://www.imooc.com' + window.location.pathname;
window._bd_share_config = {
    "common":{
        "bdUrl": url,
        "bdSnsKey": {
            'tsina':'2788596354'
        },
        "bdText":quesname+""+"_慕课网_猿问",
        "bdMini":"2",
        "bdMiniList":false,
        "bdPic":"",
        "bdStyle":"0",
        "bdSize":"16"
    },
    share : [{
            "tag" : "share_1",
            "onBeforeClick":function(cmd,config){
                if(cmd=="qzone"){
                    config.bdText = quesname+url+"_慕课网_猿问";
                }else{
                    config.bdText = "[慕课猿问："+quesname+url+"(分享自@慕课网)#慕课爱分享#";
                }
                return config;
            }
        },{
            "tag" : "share_2",
            "onBeforeClick":function(cmd,config){
                if(cmd=="tsina"){
                    config.bdText = "我在慕课网(@慕课网) 提了一个问题“"+quesname+"”"+url;
                }else{
                    config.bdText = "我在慕课网 提了一个问题“"+quesname+"”"+url;
                }
                return config;
            }   
        },{
            "tag" : "share_3",
            "onBeforeClick":function(cmd,config){
                if(cmd=="tsina"){
                    config.bdText = "我在慕课网(@慕课网) 回答了“"+quesname+"”"+url+"快来围观";
                }else{
                    config.bdText = "我在慕课网 回答了“"+quesname+"”"+url+"快来围观";
                }
                return config;
            }   
        },
                        {
            "tag" : 'share_answer_283058',
            "bdUrl" : 'https://www.imooc.com/wenda/wdanswer/283058',
            "bdText":'[慕课猿问：慕课网账号忘记了怎么办 回答者:小草1434 (分享自@慕课网)#慕课爱分享#'
        }
                ,        {
            "tag" : 'share_answer_283041',
            "bdUrl" : 'https://www.imooc.com/wenda/wdanswer/283041',
            "bdText":'[慕课猿问：慕课网账号忘记了怎么办 回答者:一起私奔好不好 (分享自@慕课网)#慕课爱分享#'
        }
                ,        {
            "tag" : 'share_answer_283030',
            "bdUrl" : 'https://www.imooc.com/wenda/wdanswer/283030',
            "bdText":'[慕课猿问：慕课网账号忘记了怎么办 回答者:慕仰4176389 (分享自@慕课网)#慕课爱分享#'
        }
                ,        {
            "tag" : 'share_answer_283022',
            "bdUrl" : 'https://www.imooc.com/wenda/wdanswer/283022',
            "bdText":'[慕课猿问：慕课网账号忘记了怎么办 回答者:丨慕丨课丨网丨别等我了丨 (分享自@慕课网)#慕课爱分享#'
        }
            ]
};
</script>

		<div class="wenda clearfix">
			<div class="l wenda-main">
				<div class="qa-content" data-qid="390693">
					<div class="qa-content-inner ">
						<div id="js-content-main">
							<div class="detail-q-title clearfix">
								<!-- 话题 -->
								<h1 class="js-qa-wenda-title detail-wenda-title">慕课网账号忘记了怎么办</h1>


								<!-- 问答信息 -->
								<div class="wenda-intro-box clearfix">
									<div class="detail-user l">
										<a href="https://www.imooc.com/u/6771261/bbs" class="author l">
											<img
											src="topic_files/5333a1660001394602000200-100-100_002.jpg"
											alt="慕仰4176389"> 慕仰4176389
										</a>

									</div>

									<!-- 编辑 -->
									<div class="wenda-edit-box r">
										<span class="count-item l">回答<i>4</i></span> <span
											class="count-item l">浏览<i>94</i></span>

									</div>
									<!-- 编辑 end -->
								</div>
							</div>

							<div id="js-qa-wenda" class="detail-wenda aimgPreview rich-text">
								<p>
									以前的手机号注册过慕课网，现在换手机号了，以前的手机号忘记了，登不上以前的账号了，谁知道怎么办？还能找回么<br>
								</p>
							</div>
						</div>

						<!-- 编辑问答 -->
						<!-- 编辑问答 end -->

						<!-- 源自 & 分享 & 关注 -->
						<div class="qa-header detail-user-tips clearfix">
							<div class="qa-header-left labelCon l clearfix">
								<div class="item l">
									<a href="https://www.imooc.com/wenda/58">深度学习</a>
								</div>
								<div class="item l">
									<a href="https://www.imooc.com/wenda/57">机器学习</a>
								</div>
								<div class="item l">
									<a href="https://www.imooc.com/wenda/51">测试</a>
								</div>
							</div>
							<div class="qa-header-right r">
								<!-- credit -->

								<!-- share -->
								<div class="small-share l wd-share">
									<ul class="share-wrap">
										<li class="weichat-posi js-top-share">
											<div
												class="bdsharebuttonbox weichat-style bdshare-button-style0-16"
												data-tag="share_1" data-quesid="390693">
												<a href="#" class="bds_weixin icon-nav icon-share-weichat"
													data-cmd="weixin" title="分享到微信"></a> <a href="#"
													class="bds_qzone icon-nav icon-share-qq" data-cmd="qzone"
													title="分享到QQ空间"></a> <a href="#"
													class="bds_tsina icon-nav icon-share-weibo"
													data-cmd="tsina" title="分享到新浪微博"></a>
											</div>
										</li>
									</ul>
								</div>
								<em class="split l"></em>
								<!-- follow -->
								<a href="javascript:void(0)" data-id="390693" title="关注"
									class="l wenda-add-collection js-collection-btn"> <i
									class="icon-heart"></i> <span
									class="detail-hearts js-detail-follow"></span>
								</a>
							</div>

						</div>
						<!-- 源自 & 分享 & 关注 end-->
					</div>

				</div>

				<div id="js-qa-comment-input"
					class="detail-comment-input js-msg-context clearfix">
					<h3 class="answer-add-tip">添加回答</h3>
					<div id="add-answer" class="detail-ci-avator">
						<button id="answer-frame" class="answer-btn"></button>
					</div>

					<div id="avator-wrap" class="detail-ci-avator answer-hidden l">
					</div>
					<div id="js-reply-wrap" class="answer-hidden l">
						<div id="js-reply-editor-box"
							class="wd-comment-box  js-ci-unlogin"></div>
						<div id="js-qa-ci-footer" class="qa-ci-footer clearfix">
							<span class="qa-tips l"></span>
							<div class="qa-ci-footright">
								<div class="captcha-verify-box js-answer-verify-box hide"></div>
								<button id="js-wenda-ci-submit"
									class="btn btn-red detail-ans disabled" data-qid="390693">回答</button>
							</div>
						</div>
					</div>


				</div>
				<!-- 回答数 -->
				<div class="ans_num">4回答</div>
				<!-- 回答回复 start -->
				<div class="ques-answer ques-new-answer clearfix">
					<!-- 已采纳标志 -->

					<div class="edit-title">编辑回答</div>
					<div class="answer-con first" id="id_283058">
						<div class="user-pic l">
							<a href="https://www.imooc.com/u/1728826/bbs" target="_blank">
								<img src="topic_files/55389d2000017d3601860186-100-100.jpg"
								alt="?" width="40" height="40">
							</a>
						</div>
						<!--.user end-->
						<div class="detail-r">
							<a class="detail-name" href="https://www.imooc.com/u/1728826/bbs"
								target="_blank">小草1434</a> <span class="answer-member"
								title="回答达人"></span>



						</div>


						<div class="answer-content rich-text aimgPreview">
							<p>如果不是特别的违规事件，都是可以找回的，比如邮箱号，比如客服申诉</p>
						</div>
						<div class="ctrl-bar js-msg-context clearfix js-reply-tool hide">
							<div class="detail-editor-btns r">
								<span class="qa-tips"></span>
								<button class="btn btn-normal js-reply-cancel">取消</button>
								<button class="btn btn-red js-reply-submit" data-id="283058">保存</button>
							</div>
						</div>

						<div class="ctrl-bar clearfix js-wenda-tool">

							<span class="agree-with " data-ques-id="390693"
								data-answer-id="283058" data-hasop=""><i
								class="icon-thumb-revert"></i></span> <span class="oppose "
								data-ques-id="390693" data-answer-id="283058" data-hasop=""><i
								class="imv2-thumb_down"></i><em>反对</em></span> <span class="reply"
								data-replynum="0" data-reply-id="283058" data-ques-uid="6771261"><em>0</em>个回复</span>



							<span class="time r">9小时前</span>

						</div>
						<!--.ctrl-bar end-->


					</div>
					<!--.answer-con end-->
					<div class="reply-con">
						<ul class="reply-list">

						</ul>
						<!--.reply-list end-->
						<div class="release-reply-con clearfix">
							<i class="icon-ques-revert"></i>
							<!--.user-pic end-->


							<div class="textarea-con">
								<div class="txt-reply">
									你还没有登录，请先<span class="lgn js-lgn">登录</span>或<span
										class="regst js-rgr">注册</span>慕课网帐号
								</div>
							</div>
							<p class="err-tip"></p>
							<div class="userCtrl clearfix">
								<!-- <div class="verify-code"></div> -->
								<div class="captcha-verify-box js-reply-verify-box hide"></div>
								<div class="do-reply-btn" data-answer-id="283058"
									data-ques-uid="6771261">回复</div>
							</div>
						</div>
						<!--.release-reply-con end-->
					</div>
					<!--.reply-con end-->

				</div>




				<!-- 回答回复 end -->
				<div class="qa-comment-page"></div>

			</div>



		</div>

		<div id="reply-box" style="display: none;">
			<div class="js-qa-reply-ibox qa-reply-ibox clearfix">
				<div class="qa-reply-iavator l">
					<img src="topic_files/avatar_default.png" alt="">
				</div>
				<div class="qa-reply-iwrap">
					<div class="qa-reply-iarea">
						<textarea maxlength="2000" name="" id="" class="js-reply-ipt ipt"
							disabled="disabled" placeholder="写下你的评论..."></textarea>
					</div>
					<div class="qa-reply-ifoot clearfix">
						<div class="qa-reply-footright r">
							<div class="captcha-verify-box js-reply-verify-box hide"></div>
							<span class="qa-tips"></span>
							<button class="btn-normal btn-mini js-ipt-cancel">取消</button>
							<button class="btn-green btn-mini disabled">提交</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="pop-tips-layer"></div>
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
				<textarea name="tipoff-content" class="tipoff-desc js-tipoff-desc"
					placeholder="写下举报理由"></textarea>
				<div class="tipoff-text">
					<span class="js-tipoff-text">0</span>/150
				</div>
			</div>
			<div class="tipoff-btn-box clearfix">
				<div class="r tipoff-submit-btn js-tipoff-submit" data-tipofftype="">提交</div>
				<div class="r tipoff-cancel-btn js-tipoff-close">取消</div>
			</div>
		</div>





	</div>

	<div id="footer" data="wenda,detail">
		<div class="waper">
			<div class="footerwaper clearfix">
				<div class="followus r">
					<a class="followus-weixin" href="javascript:;" target="_blank"
						title="微信">
						<div class="flw-weixin-box"></div>
					</a> <a class="followus-weibo" href="http://weibo.com/u/3306361973"
						target="_blank" title="新浪微博"></a> <a class="followus-qzone"
						href="http://user.qzone.qq.com/1059809142/" target="_blank"
						title="QQ空间"></a>
				</div>
				<div class="footer_intro l">
					<div class="footer_link">
						<ul>
							<li><a href="https://www.imooc.com/" target="_blank">网站首页</a></li>
							<li><a href="https://www.imooc.com/about/cooperate"
								target="_blank" title="企业合作">企业合作</a></li>
							<li><a href="https://www.imooc.com/about/job"
								target="_blank">人才招聘</a></li>
							<li><a href="https://www.imooc.com/about/contact"
								target="_blank">联系我们</a></li>
							<li><a href="https://www.imooc.com/about/recruit"
								target="_blank">讲师招募</a></li>
							<li><a href="https://www.imooc.com/about/faq"
								target="_blank">常见问题</a></li>
							<li><a href="https://www.imooc.com/user/feedback"
								target="_blank">意见反馈</a></li>
							<li><a href="http://daxue.imooc.com/" target="_blank">慕课大学</a></li>
							<li><a href="https://www.imooc.com/about/friendly"
								target="_blank">友情链接</a></li>
							<!--  <li><a href="/corp/index" target="_blank">合作专区</a></li>
                        <li><a href="/about/us" target="_blank">关于我们</a></li> -->
						</ul>
					</div>
					<p>Copyright © 2018 imooc.com All Rights Reserved | 京ICP备
						12003892号-11</p>
				</div>
			</div>
		</div>
	</div>


</body>
</html>