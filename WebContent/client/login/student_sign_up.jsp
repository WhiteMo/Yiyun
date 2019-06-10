<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>注册界面</title>



<link href="${basePath}/client/login/css/bootstrap.min.css" rel="stylesheet">
<script src="${basePath}/client/login/js/jquery-1.8.3.min.js"></script>
<script src="${basePath}/client/login/js/bootstrap.min.js"></script>
<style type="text/css">
.form-control{
	width:80%
}
</style>
<script>
	function adduser() {
		var basePath = '<%=request.getContextPath()%>';
		var name = $("#username").val();
		var password = $("#password").val();
		
		var againpassword = $("#againpassword").val();
		var college = $("#college").find("option:selected").text();
		var teleNumber = $("#teleNumber").val();
		var account=$("#teleNumber").val();
		var contract = $("input[type='checkbox']").is(':checked');
		var sex = null;
		var obj = document.getElementsByName("gender")
		for (var i = 0; i < obj.length; i++) { //遍历Radio 
			if (obj[i].checked) {
				sex = obj[i].value;
			}
		}

		if(name==null)alert("请输入用户名！");
		else if(contract==false){alert("请阅读用户协议！");}
		else if(password!=againpassword) alert("密码不一致！");
		else {
			$.post(basePath+"/UserAction", {
				name : name,
				password : password,
				sex : sex,
				teleNumber : teleNumber,
				college : college,
				account:account,
				role:"student",
				type : "signup"
			}, function(result) {
				if (result == "success") {
						window.event.returnValue = false;
						window.location.href = "login.jsp";
					}
				 else {
					alert("注册失败!");
				}

			})
		}
		
		
	}
</script>

	


<style type="text/css">
body {
	background: url('<%=request.getContextPath()%>/client/login/img/4.jpg')
		no-repeat;
	background-size: cover;
	font-size: 16px;
	background-color: #ab2526;
}

.form {
	background: rgba(255, 255, 255, 0.2);
	width: 100%;
	margin: 50px auto;
}

#register_form {
	display: block;
}

input[type="text"], input[type="password"] {
	padding-left: 26px;
}

.checkbox {
	padding-top: 10px;
}
</style>

</head>

<body>
	<div class="container">
		<div class="form row">
			<form class="col-sm-3 col-md-3 col-lg-3" ></form>
			<form class="form-horizontal col-sm-6 col-md-6 col-lg-6">
				<h3 class="form-title" style="; font-weight:bold">注册账号</h3>
				 
				<div class="col-sm-12 col-md-12 col-lg-12">
				<div class="form-group">
								<label class="col-sm-4 control-label">性别</label>
								<div class="col-sm-8">
									<label class="radio-inline"><input type="radio"
										value="M" name="gender">男</label> <label class="radio-inline"><input
										type="radio" value="F" name="gender">女</label> <label
										class="radio-inline"><input type="radio" value="null"
										name="gender">保密</label>
								</div>
				</div>
					<div class="form-group">
						<h5 class="form_hint">请选择您所在的学校：</h5>
							<!-- 后台获取数据 -->
							<select id="college" class="form-control">
								<option>请选择</option>
								<option>中国人民大学</option>
								<option>北京大学</option>
								<option>清华大学</option>
								<option>中国政法大学</option>
								<option>北京理工大学</option>
								<option>...</option>
							</select>
						</div>
					<div class="form-group">
						<h5 class="form_hint">请输入您的学工号（登录账号）：</h5>
						<input class="form-control required" id="account" type="text"
							placeholder="可使用英文字符、下划线，最多16个字符" name="username"
							autofocus="autofocus" />
					</div>
				  	<div class="form-group">
						<h5 class="form_hint">请输入您的昵称：</h5>
						<input class="form-control required" id="username" type="text"
							placeholder="可使用汉字、英文字符、下划线，最多5个字符" name="username"
							autofocus="autofocus" />
					</div>
					<div class="form-group">
						<h5 class="form_hint">请输入您的手机号：</h5>
						<input class="form-control required" id="teleNumber" type="text"
							placeholder="电子邮箱或手机号" name="username" autofocus="autofocus" />
					</div>
					<div class="form-group">
						<h5 class="form_hint">请输入您的密码：</h5>
						<input class="form-control required" id="password" type="password"
							placeholder="建议包含数字、字母、符号，请勿使用过于简单的密码" id="register_password"
							name="password" />
					</div>
					<div class="form-group">
						<h5 class="form_hint">请确认您的密码：</h5>
						<input class="form-control required" id="againpassword"
							type="password" placeholder="需和刚才输入的密码一致" name="rpassword" />
					</div>
					<div class="form-group row">
						<h5 class="form_hint">请输入验证码：</h5>
						
							<input class="checknumber" style="width:400px;height:33px;" type="text" name="email" />
				
							<button type="button" class="btn btn-default" style="float:right">点击获取验证码</button>
						
					</div>
					<div class="checkbox">
						<label> <input type="checkbox" value="1"> 同意协议
						</label>
					</div>

					<div class="form-group">
						<button  type="button" class="btn btn-md pull-right"
							onclick="adduser()">注册</button>
					</div>
					</div>
			</form>
		</div>
		</div>
</body>
</html>
