<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String basePath = request.getContextPath();
 	pageContext.setAttribute("basePath", basePath);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head lang="zh-cmn-Hans">
<meta charset="utf-8">
<meta name="applicable-device" content="mobile">
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
<meta name="applicable-device" content="mobile">
<meta name="HandheldFriendly" content="True">
<title>教师登录</title>		
<link rel="stylesheet" type="text/css" href="inc/aui.2.0.css"/>
<link rel="stylesheet" type="text/css" href="inc/public.css"/>
<link href="inc/style.css" type="text/css" rel="stylesheet"/>
<script src="${basePath}/client/js/jquery.min.js"></script>
<script src="${basePath}/client/js/layer.js"></script>
<script>

	document.onkeydown=function(e){
	var keycode=document.all?event.keyCode:e.which;
	if(keycode==13)login();
	}
	var basePath = '<%=request.getContextPath()%>'
	function login(){
		var account=$('#account').val()
		var password = $('#password').val()
		$.post(basePath+'/UserAction',{type:"login"
			,account:account
			,role:"teacher"
			,password:password},function(result){
				
				if(result=="success"){
					window.location.href='./course.jsp'
				}else{
					layer.msg("密码错误",{icon:2});
				}
			})
	}
</script>
<link rel="stylesheet" href="${basePath}/m/teacher/css/font-awesome.min.css">
</head>
<body style="height:100%;">
<!--头部-->
<header class="aui-bar aui-bar-nav">
    <a class="aui-pull-left aui-btn">
        <span class="aui-iconfont;head-txt"><span  class="fa fa-user-circle"></span> 教师登录</span>
    </a>
    <a class="aui-pull-right aui-btn" onclick="window.Android.backToApp()" href="javasrcipt:window.Android.backToApp();">
        <span class="aui-iconfont;head-txt">
        	 退出程序 <span class="fa fa-power-off" aria-hidden="true"></span>
        </span>
    </a>
</header>
		
    <div class="content">
    	<div class="content-tilte"><center>亦云课堂</center></div>
        <div class="lins"></div>
        <div class="form-box">
        <form>
			<div class="input-form">
            	<span><img src="img/icon-cellphone.png"></span>
            	<input class="inputstyle" type="text" id="account" placeholder="请输入账号">
            </div>
            <div class="lins"></div>
            <div class="input-form">
            	<span><img src="img/icon－password.png"></span>
            	<input class="inputstyle" type="password" id="password" placeholder="请输入密码">
            </div>
            <div class="lins"></div>
            <div class="checkbox">
            	<span><input name="rememberpassword" type="checkbox" value="" />记住密码</span>
                <span class="aui-pull-right">忘记密码？</span>
            </div>
            <div class="lins"></div>
            <div class="sub">
            	<input type="button" name="submit"  value="登录" onclick="login()">
            </div>
        
        
            <div class="or" style="height:100%;">
            <span class="division aui-pull-left"></span>
            <span class="txt-or">or</span>
            <span class="division aui-pull-right"></span>
            </div>
       </form>          
 	</div>
 	</div>
</body>
</html>
