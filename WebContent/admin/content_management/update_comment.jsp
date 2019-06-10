<%@page import="Bean.Comment"%>
<%@page import="DBFunction.CommentImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	CommentImpl cImpl = new CommentImpl();
	Comment comment = cImpl.getCommentById(id);
	pageContext.setAttribute("id", id);
	pageContext.setAttribute("comment", comment);
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
<title>评论更改</title>
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
<link rel="stylesheet"
	href="${basePath}/admin/css/metroStyle/metroStyle.css">
<link rel="stylesheet" href="${basePath}/admin/css/AdminLTE.min.css">
<link rel="stylesheet"
	href="${basePath}/admin/css/skins/skin-blue.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/process.css">
<link rel="stylesheet" href="${basePath}/admin/css/editormd.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/main.css">
<!--[if lt IE 9]>
<script src="/jsp/static/vendor/html5shiv/html5shiv.min.js"></script>
<script src="/jsp/static/vendor/respond/respond.min.js"></script>
<![endif]-->

<script src="${basePath}/admin/js/jquery.min.js"></script>
<script src="${basePath}/admin/js/bootstrap.min.js"></script>
<link href="${basePath}/admin/js/WdatePicker.css" rel="stylesheet"
	type="text/css">

<script type="text/javascript">
	$(function() {
		$("#validForm").validate();
		$("input[name='text']").focus();
	});
	function confirmDelete() {
		return confirm("您确定删除吗？");
	}
</script>
</head>

<script type="text/javascript">
	function updateComment(type) {
		window.event.returnValue = false;
		var basePath = $('#basePath').val();
		var content = $('#content').val()
		var score = $('#score').val()
		var date = $('#date').val()
		var id = $('#id').val()
		$.post(basePath + "/CommentAction", {
			type : "update",
			date : date,
			content : content,
			score : score,
			id : id
		}, function(result) {
			if (result == 'success') {

				if (type == 'back') {
					window.event.returnValue = false;
					window.location.href = "comment.jsp"
				} else if(type='add'){
				
				}else{
					
				}
			} else {
				alert('更新失败')
			}
		})
	}
</script>


<body class="skin-blue content-body">

	<!-- 用于显示操作结果信息。配合Controller的RedirectAttributes.addFlashAttribute("message","xxx")，可以只在第一次访问页面时显示信息，刷新页面不会重复显示  -->
	<script type="text/javascript">
		var messageOptions = {};
		function messageCallback() {
			setTimeout(function() {
				$("#message-toggler").hide();
			}, 600);
		};
		function showMessage(message) {
			if (message) {
				$("#message-effect").html(message);
			}
			$("#message-toggler").show();
			$("#message-toggler")
					.css(
							"left",
							($(window).width() - $("#message-toggler")
									.outerWidth()) / 2);
			$("#message-effect").effect("highlight", messageOptions, 1200);
			$("#message-effect").effect("highlight", messageOptions, 1200,
					messageCallback);
		}
	</script>
	<input type="hidden" id="basePath" value="${basePath}">
	<input type="hidden" id="id" value="${id}">
	<div id="message-toggler"
		style="display: none; position: absolute; top: 8px; background-color: #ccc;">
		<div id="message-effect"
			style="font-size: 16px; font-weight: bold; padding: 8px 20px; _width: 50px; word-break: keep-all; white-space: nowrap; text-align: center; color: #00a65a;">
			操作成功</div>
	</div>

	<div class="content-header">
		<h1>评论管理 - 修改</h1>
	</div>
	<div class="content">
		<div class="box box-primary">
			<form class="form-horizontal" method="post" novalidate="novalidate">
				<div class="box-header with-border">
					<div class="btn-toolbar">
						<div class="btn-group">

							<button class="btn btn-default" type="button"
								onclick="location.href='create.do?';">新增</button>

						</div>
						<div class="btn-group">

							<button class="btn btn-default" type="button"
								onclick="location.href='create.do?id=20&amp;';">复制</button>


							<button class="btn btn-default" type="button"
								onclick="if(confirmDelete()){location.href='delete.do?ids=20&amp;';}">删除</button>

						</div>
						<div class="btn-group">
							<button class="btn btn-default" type="button"
								onclick="location.href='edit.do?id=&amp;position=-1&amp;';"
								disabled="disabled">上一条</button>
							<button class="btn btn-default" type="button"
								onclick="location.href='edit.do?id=19&amp;position=1&amp;';">下一条</button>
						</div>
						<div class="btn-group">
							<button class="btn btn-default" type="button"
								onclick="location.href='comment.jsp';">返回</button>
						</div>
					</div>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-sm-12">
							<div class="form-group">
								<label class="col-sm-2 control-label">文档</label>
								<div class="col-sm-10">
									<input type="text" value="${comment.getCourseName()}"
										class="form-control" disabled="disabled">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label">用户</label>
								<div class="col-sm-8">
									<input type="text" value="${comment.getUserName()}"
										class="form-control" disabled="disabled">
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label"><em
									class="required">*</em>评论日期</label>
								<div class="col-sm-8">
									<input class="form-control required" type="text"
										name="creationDate" value="${comment.getDate()}"
										onclick="WdatePicker({dateFmt:'yyyy-MM-ddTHH:mm:ss'});">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label"><em
									class="required">*</em>状态</label>
								<div class="col-sm-8">
									<select class="form-control" name="status" disabled="disabled">
										<option value="0">未审核</option>
										<option value="1" selected="selected">已审核</option>
										<option value="2">推荐</option>
										<option value="3">屏蔽</option>
									</select>
								</div>
							</div>
						</div>

					</div>

					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label"><em
									class="required">*</em>得分</label>
								<div class="col-sm-8">
									<input type="text" name="score" id="score"
										value="${comment.getScore()}" class="form-control required digits">
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label">审核日期</label>
								<div class="col-sm-8">
									<input class="form-control" type="text" id="date"
										name="auditDate" value=""
										onclick="WdatePicker({dateFmt:'yyyy-MM-ddTHH:mm:ss'});">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<div class="form-group">
								<label class="col-sm-2 control-label"><em
									class="required">*</em>评论</label>
								<div class="col-sm-10">
									<textarea name="text" rows="5" id='content'
										class="form-control">${comment.getContent()}</textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="box-footer">
					<button class="btn btn-primary" type="submit"
						onclick="updateComment('stay')">保存</button>
					<button class="btn btn-default" type="submit"
						onclick="updateComment('back')">保存并返回</button>

				</div>

			</form>
		</div>
	</div>

</body>
</html>