<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	request.setCharacterEncoding("UTF-8");
	pageContext.setAttribute("basePath", request.getContextPath());
	String role = request.getParameter("role");
	String message = request.getParameter("message");
	pageContext.setAttribute("role", role);
	
%>
<!DOCTYPE html>

<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" href="${basePath}/client/image/header_brand_image.png" type="image/x-icon"/>

<title>登录界面</title>

<!-- Bootstrap core CSS -->
<link href="${basePath}/client/login/css/bootstrap.min.css" rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="${basePath}/client/login/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

<script src="http://cdn.bootcss.com/blueimp-md5/1.1.0/js/md5.js"></script> 
<script src="http://cdn.bootcss.com/blueimp-md5/1.1.0/js/md5.min.js"></script>
<!-- Custom styles for this template -->
<link href="${basePath}/client/login/css/signin.css" rel="stylesheet">
<script src="${basePath}/client/login/js/jquery-3.3.1.js"></script>
<script src="${basePath}/client/login/js/bootstrap.js"></script>
<script src="${basePath}/client/login/js/ie-emulation-modes-warning.js"></script>
<script src="${basePath}/client/js/layer.js"></script>
<link href="${basePath}/client/login/css/header_and_footer.css" rel="stylesheet" />
<style>
.kuang {
	top: 50%;
	left: 50%;
	position: absolute;
	display: block;
	transform: translate(-50%, -50%);
	width: 500px;
	height: 290px;
	background-color: #f8d6d5;
}

.biaoti {
	text-align: center;
	width: 500px;
	height: 40px;
	font-size: 40px;
	color: white;
	display: block;
	position: absolute;
	margin-top: -60px;
}

.sign {
	text-align: center;
	width: 500px;
	height: 30px;
	font-size: 18px;
	color: white;
	display: block;
	position: absolute;
	margin-top: 40px;
}

.sign a {
	color: white;
}

.sign>a :hover, .sign>a :focus {
	color: #f8d6d5;
}
</style>
</head>
<script type="text/javascript">
$(function(){
	<%
		if(message!=null&&message.equals("signsuccess")){
			out.write("layer.msg('注册成功，请登录', {time:2000});");
		}else if(message!=null&&message.equals("pleaseLogin")){
			out.write("layer.msg('请先登录', {time:2000});");
		}
	%>
	document.onkeydown=function(e){
		var keycode=document.all?event.keyCode:e.which;
		if(keycode==13)login();
		}
	
	
})

function login(){
	var account =$('#account').val()
	var password =$('#password').val()
	var role = $('#role').val();
	var basePath = '<%=request.getContextPath()%>'
	password=md5(password);
	$.post(basePath+"/UserAction",{
		type:"login",
		account:account,
		password:password,
		role:role
	},function(result,event){
		if(result=="success"){
			//var event = window.event || event;
			event.returnValue=false;
			window.location.href = basePath+"/client/index.jsp"
		}else if(result=="error_role"){
			$('#warnSpan').html('身份选择错误,请<a href="'+basePath+'/client/login/role_select.jsp">返回</href>重新登录');
			$('#warnSpan').show()
		}else{
			$('#warnSpan').html('密码错误请重试');
			$('#warnSpan').show()
		}
	})
}
</script>
<body style="background-color: #ab2526">
	
	<c:if test="${empty role}">
		<c:redirect url="/client/login/role_select.jsp"/>
	</c:if>
	<jsp:include page="/client/header_and_footer/header.jsp" flush="true"/><!--动态包含-->  
	<div class="kuang">
		<div class="biaoti">亦&emsp;云</div>
		
		<form class="form-signin">
			
			<input type="hidden" name="role" id="role" value="${role}">
			<input type="hidden" name="type" value="login">
			<h2 class="form-signin-heading">Please log in </h2>
			<label for="inputEmail" class="sr-only">account</label> 
			<input
				style="background-color: #f8d6d5" type="text" name="account" id="account"
				class="form-control" placeholder="Email address" required=""
				autofocus="">
			 <label for="inputPassword" class="sr-only">Password</label>
			<input style="background-color: #f8d6d5" type="password"
				name="password" id="password" class="form-control" placeholder="Password"
				required="">
			<div class="checkbox">
			<span style="color:#fa5b5b;display:none" id="warnSpan">密码错误，请重新输入</span>
				<label> 
				<input type="checkbox" value="remember-me">
					Remember me
				</label>
				
			</div>
			
			<button style="background-color: #ab2526; border-color: #ab2526"
				class="btn btn-lg btn-primary btn-block" type="button" onclick="login()">log
				in</button>
		
		</form>
		<div class="sign">
			Don't have an account?
			<a href="${basePath}/client/login/sign_up.jsp?role=${role}">sign up</a>
		</div>
		
	</div>
	<!-- /container -->


	

</body>
</html>