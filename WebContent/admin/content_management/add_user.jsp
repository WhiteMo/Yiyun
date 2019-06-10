<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-store">
<meta http-equiv="Expires" content="0">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>用户添加</title>
<meta name="renderer" content="webkit">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet" href="${basePath}/admin/css/bootstrap.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/font-awesome.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/ionicons.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/jquery-ui.css">
<link rel="stylesheet"
	href="${basePath}/admin/css/jquery.minicolors.css">
<link rel="stylesheet" href="${basePath}/admin/css/metroStyle.css">
<link rel="stylesheet" href="${basePath}/admin/css/AdminLTE.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/skin-blue.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/process.css">
<link rel="stylesheet" href="${basePath}/admin/css/main.css">

<script src="${basePath}/admin/js/jquery.min.js"></script>


<script>
	
	function addUser(type) {
		var name = $("#username").val();
		var password = $("#password").val();
		var againpassword = $("#againPassword").val();
		var role = $("#type").text();
		var college = $("#college").find("option:selected").text();
		var account = $("#account").val();
		var sex = null;
		var obj = document.getElementsByName("gender")
		for (var i = 0; i < obj.length; i++) { //遍历Radio 
			if (obj[i].checked) {
				sex = obj[i].value;
			}
		}

		var email = $("#email").val();
		var telephone = $("#telephone").val();

		if (!name) {
			alert("请输入用户名！");
			return;
		} else if (!password) {
			alert("请输入密码！");
			return;
		} else if (password != againpassword) {
			alert("密码不一致！");
			return;
		} else if (!college || college == null || college == "") {
			alert("请输入学校！");
			return;
		} else {
			$.post("<%=request.getContextPath()%>/UserAction", {
				name : name,
				password : password,
				role : role,
				sex : sex,
				email : email,
				telephone : telephone,
				college : college,
				account : account,
				type : "add"
			}, function(result) {
				if (result == "success") {
					if (type == 'back') {
						window.event.returnValue = false;
						window.location.href = "user.jsp"
					} else if (type == 'add') {
						window.event.returnValue = false;
						window.location.href = "user.jsp"
					}
				} else {
					alert("添加失败!");
				}

			})
		}

	}
</script>
</head>
<body class="skin-blue content-body">

	<div class="content-header">
		<h1>用户管理 - 新增</h1>
	</div>

	<div class="content">
		<div class="box box-primary">
			<form class="form-horizontal" action="">
			<input type="hidden" name="teststr" value="abcde">
				<div class="box-header with-border">
					<div class="btn-toolbar">
						<div class="btn-group">

							<button class="btn btn-default" type="button" onclick=""
								disabled="disabled">新增</button>


							<button class="btn btn-default" type="button" onclick=""
								disabled="disabled">复制</button>

						</div>
						<div class="btn-group">

							<button class="btn btn-default" type="button"
								onclick="if(confirmDelete()){}" disabled="disabled">删除</button>

						</div>
						<div class="btn-group">
							<button class="btn btn-default" type="button"
								onclick="location.href='edit.do?id=&amp;position=-1&amp;';"
								disabled="disabled">上一条</button>
							<button class="btn btn-default" type="button"
								onclick="location.href='edit.do?id=&amp;position=1&amp;';"
								disabled="disabled">下一条</button>
						</div>
						<div class="btn-group">
							<button class="btn btn-default" type="button"
								onclick="window.location.href='user.jsp'">返回</button>
						</div>
					</div>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">

								<label for="username" class="col-sm-4 control-label"><em
									class="required">*</em>用户名</label>
								<div class="col-sm-8">
									<input type="text" id="username" name="username"
										class="form-control {required:true,remote:{url:'check_username.do',type:'post',data:{original:''}},messages:{remote:'用户名已存在'}}">
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="realName" class="col-sm-4 control-label">用户实名</label>
								<div class="col-sm-8">
									<input type="text" id="realName" name="realName"
										maxlength="100" class="form-control">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">

								<label for="username" class="col-sm-4 control-label"><em
									class="required">*</em>账户</label>
								<div class="col-sm-8">
									<input type="text" id="account" name="account">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label for="rawPassword" class="col-sm-4 control-label">密码</label>
								<div class="col-sm-8">
									<input class="form-control" id="password" type="password"
										name="rawPassword">
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="againPassword" class="col-sm-4 control-label">确认密码</label>
								<div class="col-sm-8">
									<input id="againPassword" type="password" name="againPassword"
										class="form-control {equalTo:'#rawPassword'}">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label for="groupId" class="col-sm-4 control-label">学校</label>
								<div class="col-sm-8">
									<select class="form-control" id="college" name="groupId">
										<option value="1">人民大学</option>
									</select>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="status" class="col-sm-4 control-label">状态</label>
								<div class="col-sm-8">
									<select class="form-control" id="status" name="status">
										<option value="0" selected="selected">正常</option>
										<option value="1">锁定</option>
										<option value="2">待验证</option>
									</select>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label for="rank" class="col-sm-4 control-label"> 等级 <span
									class="in-prompt"
									title="等级数越小，级别越高。用户不能提升自身等级。低级别用户不可查看高级别用户。用户只能被授予比自身等级更低或相同的角色。等级为0或1的用户才可被授予全局用户和全局组织的管理权限。"></span>
								</label>
								<div class="col-sm-8">
									<input type="text" id="rank" name="rank" value="1"
										class="form-control {digits:true,min:0,max:2147483647}">
								</div>
							</div>
						</div>
						<div class="col-sm-6">
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
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label for="qqOpenid" class="col-sm-4 control-label">QQ
									OPENID</label>
								<div class="col-sm-8">
									<input type="text" id="qqOpenid" name="qqOpenid" maxlength="64"
										class="form-control">
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="email" class="col-sm-4 control-label">电子邮箱</label>
								<div class="col-sm-8">
									<input type="text" id="email" name="email" maxlength="100"
										class="form-control email">
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="mobile" class="col-sm-4 control-label">手机号码</label>
								<div class="col-sm-8">
									<input type="text" id="telephone" name="mobile" maxlength="100"
										class="form-control">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<div class="form-group">
								<label for="id" class="col-sm-2 control-label">自我介绍</label>
								<div class="col-sm-10">
									<textarea id="describe" name="bio" rows="3" maxlength="255"
										class="form-control"></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="box-footer">
					<button class="btn btn-primary"  type="button" id="submit"
						onclick="addUser('back')">保存并返回</button>

					<button class="btn btn-default"   type="button" id="submitandadd"
						onclick="addUser('add')">保存并新增</button>
				</div>
			</form>
	
		</div>
	</div>

</body>
</html>
