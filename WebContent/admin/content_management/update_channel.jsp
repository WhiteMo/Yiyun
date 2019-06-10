<%@page import="Bean.Channel"%>
<%@page import="DBFunction.ChannelImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	pageContext.setAttribute("basePath",request.getContextPath());
	String id = request.getParameter("id");
	if(id==null){
		id ="1";
	}
	ChannelImpl cImpl = new ChannelImpl();
	Channel channel = cImpl.getChannelById(id);
	pageContext.setAttribute("channel",channel);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-store">
<meta http-equiv="Expires" content="0">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title></title>
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
<link rel="stylesheet" href="${basePath}/admin/css/editormd.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/main.css">
<script src="${basePath}/admin/js/jquery.min.js"></script>
<script src="${basePath}/admin/js/bootstrap.min.js"></script>
<link href="${basePath}/admin/css/WdatePicker.css" rel="stylesheet"
	type="text/css">

<script>
$(function() {
	$("input[name='title']").focus();
	$('#title').val('<%=channel.title%>');
	$('#weight').val('<%=channel.weight%>');
	$('#targetUrl').val('<%=channel.targetUrl%>')
});
function updateChannel(type){
	var basePath = $('#basePath').val()
	var title = $('#title').val()
	var weight =$('#weight').val()
	var targetUrl =$('#targetUrl').val()
	var id= $('#id').val()
	$.post(basePath+"/ChannelAction",{type:"update",
		id:id,weight:weight,targetUrl:targetUrl,title:title},function(result){
			if(result=="success"){
				if(type=='back'){
					window.event.returnValue = false;
					window.location.href="channel.jsp"
				}else if(type=='add'){
					window.event.returnValue = false;
					window.location.href="add_channel.jsp"
				}else{
					alert('保存成功')
				}
			}else{
				alert('保存失败')
			}		
		})
}
</script>

<link rel="stylesheet" type="text/css"
	href="${basePath}/admin/css/codemirror.min.css">

<body class="skin-blue content-body" style="">

<script type="text/javascript">
var messageOptions = {};
function messageCallback() {
	setTimeout(function() {
		$("#message-toggler").hide();
	}, 600 );
};
function showMessage(message) {
	if(message) {
		$("#message-effect").html(message);
	}
	$("#message-toggler").show();
	$("#message-toggler").css("left",($(window).width() - $("#message-toggler").outerWidth())/2);
	$("#message-effect").effect("highlight", messageOptions, 1200);
	$("#message-effect").effect("highlight", messageOptions, 1200, messageCallback);		
}

</script>
<input type="hidden" id="basePath" value="${basePath}">
<input type="hidden" id="id" value="${channel.id}">
	<div id="message-toggler"
		style="display: none; position: absolute; top: 8px; background-color: #ccc;">
		<div id="message-effect"
			style="font-size: 16px; font-weight: bold; padding: 8px 20px; _width: 50px; word-break: keep-all; white-space: nowrap; text-align: center; color: #00a65a;">
			操作成功</div>
	</div>
	<div class="content-header">
		<h1>栏目管理-修改</h1>
	</div>
	<div class="content" style="">
		<div class="box box-primary" style="">
			<form class="form-horizontal" 
				method="post" style="">

				<div class="box-header with-border">
					<div class="btn-toolbar">
						<div class="btn-group">

							<button class="btn btn-default" type="button"
								onclick="location.href='create.do?queryNodeId=&amp;queryNodeType=&amp;queryInfoPermType=&amp;queryStatus=&amp;';"
								disabled="disabled">新增</button>

						</div>
						<div class="btn-group">

							<button class="btn btn-default" type="button"
								onclick="location.href='create.do?id=&amp;queryNodeId=&amp;queryNodeType=&amp;queryInfoPermType=&amp;queryStatus=&amp;';"
								disabled="disabled">复制</button>

							<button class="btn btn-default" type="button"
								onclick="location.href='view.do?id=&amp;queryNodeId=&amp;queryNodeType=&amp;queryInfoPermType=&amp;queryStatus=&amp;position=&amp;';"
								disabled="disabled">查看</button>
							<button class="btn btn-default" type="button"
								onclick="window.open('');" disabled="disabled">前台浏览</button>
						</div>
						<div class="btn-group">

							<button class="btn btn-default" type="button"
								onclick="if(confirmDelete()){location.href='logic_delete.do?ids=&amp;queryNodeId=&amp;queryNodeType=&amp;queryInfoPermType=&amp;queryStatus=&amp;';}"
								disabled="disabled">删除</button>


							<button class="btn btn-default" type="button"
								onclick="if(confirmDelete()){location.href='delete.do?ids=&amp;queryNodeId=&amp;queryNodeType=&amp;queryInfoPermType=&amp;queryStatus=&amp;';}"
								disabled="disabled">彻底删除</button>

						</div>

						<div class="btn-group">
							<button class="btn btn-default" type="button"
								onclick="location.href='edit.do?id=&amp;queryNodeId=&amp;queryNodeType=&amp;queryInfoPermType=&amp;queryStatus=&amp;position=-1&amp;';"
								disabled="disabled">上一条</button>
							<button class="btn btn-default" type="button"
								onclick="location.href='edit.do?id=&amp;queryNodeId=&amp;queryNodeType=&amp;queryInfoPermType=&amp;queryStatus=&amp;position=1&amp;';"
								disabled="disabled">下一条</button>
						</div>
						<div class="btn-group">
							<button class="btn btn-default" type="button"
								onclick="location.href='channel.jsp'">返回</button>
						</div>
					</div>
				</div>
				<div class="box-body" style="">

					<div class="row">

						<div class="col-sm-12">
							<div class="form-group">
								<label class="col-sm-2 control-label"><em
									class="required">*</em>标题</label>
								<div class="col-sm-10">
									<div class="input-group">
										<input type="text" id="title" name="title" maxlength="50"
											class="required form-control" value="${channel.title}">
									</div>
								</div>
							</div>
						</div>

					</div>





					<div class="row">

						<div class="col-sm-12">
							<div class="form-group">
								<label class="col-sm-2 control-label">跳转链接</label>
								<div class="col-sm-10">
									<input type="text" id="targetUrl" name="targetUrl"
										value="${channel.targetUrl}" class="required form-control">
								</div>
							</div>
						</div>

					</div>

					<div class="row">

						<div class="col-sm-12">
							<div class="form-group">
								<label class="col-sm-2 control-label">描述</label>
								<div class="col-sm-10">
									<textarea name="metaDescription" rows="5"
										class="form-control {maxlength:450}"></textarea>
								</div>
							</div>
						</div>

					</div>





					<div class="row">

						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label">权重</label>
								<div class="col-sm-8">
									<select id="weight" name="priority" class="form-control">
									<c:forEach var="i" begin="0" end="9" step="1">
										<option value="${i}">${i}</option>
									</c:forEach>
									</select>
								</div>
							</div>
						</div>







					</div>

					<!--  
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label">作者</label>
								<div class="col-sm-8">
									<input type="text" name="author" maxlength="50"
										class="form-control">
								</div>
							</div>
						</div>
					</div>
					-->


					<!--  
					<div class="row">
						<div class="col-sm-12">
							<div class="form-group">
								<label class="col-sm-2 control-label">属性</label>
								<div class="col-sm-10">
								<label class="checkbox-inline"><input type="checkbox"
										name="attrIds" value="12"
										onclick="$('#attr_img_12').toggle(this.checked);">焦点(focus)</label>
									&nbsp; <label class="checkbox-inline"><input
										type="checkbox" name="attrIds" value="5"
										onclick="$('#attr_img_5').toggle(this.checked);">新闻焦点(focusnews)</label>
									&nbsp; <label class="checkbox-inline"><input
										type="checkbox" name="attrIds" value="6"
										onclick="$('#attr_img_6').toggle(this.checked);">图片焦点(focusphoto)</label>
									&nbsp; <label class="checkbox-inline"><input
										type="checkbox" name="attrIds" value="7"
										onclick="$('#attr_img_7').toggle(this.checked);">视频焦点(focusvideo)</label>
									&nbsp; <label class="checkbox-inline"><input
										type="checkbox" name="attrIds" value="8"
										onclick="$('#attr_img_8').toggle(this.checked);">产品焦点(focusproduct)</label>
									&nbsp; <label class="checkbox-inline"><input
										type="checkbox" name="attrIds" value="9"
										onclick="$('#attr_img_9').toggle(this.checked);">下载焦点(focusdownload)</label>
									&nbsp; <label class="checkbox-inline"><input
										type="checkbox" name="attrIds" value="2"
										onclick="$('#attr_img_2').toggle(this.checked);">头条(headlines)</label>
									&nbsp; <label class="checkbox-inline"><input
										type="checkbox" name="attrIds" value="10"
										onclick="$('#attr_img_10').toggle(this.checked);">手机焦点(focusmobile)</label>
									&nbsp;

								</div>
							</div>
						</div>
					</div>	
				</div>-->
				<div class="box-footer">
					<button class="btn btn-primary" 
					 onclick="updateChannel('save')" type="submit">保存</button>

					<input type="hidden" id="draft" name="draft" value="false">

					<button class="btn btn-default" type="submit"
						onclick="updateChannel('back')">保存并返回</button>

					<button class="btn btn-default" type="submit"
						onclick="updateChannel('add')">保存并新增</button>
				</div>
			</form>
		</div>
	</div>

</body>
</html>