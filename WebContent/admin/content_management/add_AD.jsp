<%@page import="Bean.AD"%>
<%@page import="DBFunction.ADImpl"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
	ADImpl adImpl = new ADImpl();
	AD a = null;
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-store">
<meta http-equiv="Expires" content="0">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>广告添加</title>
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
<link rel="stylesheet" href="${basePath}/admi
	n/css/process.css">
<link rel="stylesheet" href="${basePath}/admin/css/editormd.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/main.css">

<script src="${basePath}/admin/js/jquery.min.js"></script>
<script src="${basePath}/admin/js/bootstrap.min.js"></script>
<script src="${basePath}/admin/js/jquery-ui.js"></script>
<script src="${basePath}/admin/js/jquery-validation.min.js"></script>
<script src="${basePath}/admin/js/jquery.validation_zh_CN.js"></script>
<script src="${basePath}/admin/js/jquery-form.min.js"></script>
<script src="${basePath}/admin/js/jquery-ajaxfileuploader.min.js"></script>
<script src="${basePath}/admin/js/jquery.minicolors.min.js"></script>
<script src="${basePath}/admin/js/jquery-cookie.min.js"></script>
<script src="${basePath}/admin/js/jquery.ztree.all.min.js"></script>
<script type="text/javascript"
	src="${basePath}/admin/js/ajaxfileupload.js"></script>
<script type="text/javascript">
	function chooseFile(){
		$('#fileToUpload').click();
	}
	function ajaxFileUpload(type) {
		$.ajaxFileUpload({
			url :'<%=request.getContextPath()%>/ajaxUpload',
			secureuri : false,
			fileElementId : 'fileToUpload',
			dataType : 'json',
			success : function(data, status) {
				$('#viewImg').attr('src',data.picUrl)
				
			},
			error : function(data, status, e) {
				alert('上传出错');
			}
		})
		return false;
	}
function addAD(type){
	var basePath = $('#basePath').val();
	var imgUrl = $('#viewImg').attr('src');
	var title = $('#title').val();
	var shortContent = $('#shortContent').val();
	if(title==""||title==null){
		$('#title').focus()
		alert('请输入标题!')
		return ;
	}

	window.event.returnValue=false;
	$.post(basePath+"/ADAction",{type:'add'
		,title:title
		,imgUrl:imgUrl
		,shortContent:shortContent
		},function(result){
			if(result=='success'){
				if(type=='back'){
					window.event.returnValue=false;
					window.location.href=basePath+"/admin/content_management/AD.jsp";
				}else if(type=='add'){
					window.event.returnValue=false;
					window.location.href=basePath+"/admin/content_management/add_AD.jsp";
				}
			}else {
				alert('失败')
			}
			
		}).val();
}

</script>


</head>
<body class="skin-blue content-body" style="">
	<input id="basePath" type="hidden" value="${basePath}">

	<div class="content-header">
		<h1>广告管理 - 添加</h1>
	</div>
	<div class="content" style="">
		<div class="box box-primary" style="">
			<form class="form-horizontal" method="post" novalidate="novalidate"
				style="">
				<div class="box-header with-border">
					<div class="btn-toolbar">
						<div class="btn-group">
							<button class="btn btn-default" type="button" onclick=""
								disabled="disabled">新增</button>
						</div>
						<div class="btn-group">
							<button class="btn btn-default" type="button" onclick=""
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
								onclick="location.href='audit_pass.do?ids=&amp;redirect=edit&amp;queryNodeId=&amp;queryNodeType=&amp;queryInfoPermType=&amp;queryStatus=&amp;position=0&amp;';"
								disabled="disabled">审核通过</button>


							<button class="btn btn-default" type="button"
								onclick="location.href='audit_reject.do?ids=&amp;redirect=edit&amp;queryNodeId=&amp;queryNodeType=&amp;queryInfoPermType=&amp;queryStatus=&amp;position=0&amp;';"
								disabled="disabled">撤销审核</button>


							<button class="btn btn-default" type="button"
								onclick="location.href='audit_return.do?ids=&amp;redirect=edit&amp;queryNodeId=&amp;queryNodeType=&amp;queryInfoPermType=&amp;queryStatus=&amp;position=0&amp;';"
								disabled="disabled">退稿</button>

						</div>
						<div class="btn-group">
							<button class="btn btn-default" type="button"
								onclick="location.href='edit.do?id=&amp;queryNodeId=&amp;queryNodeType=&amp;queryInfoPermType=&amp;queryStatus=&amp;position=-1&amp;';"
								disabled="disabled">上一条</button>
							<button class="btn btn-default" type="button" onclick=""
								disabled="disabled">下一条</button>
						</div>
						<div class="btn-group">
							<button class="btn btn-default" type="button"
								onclick="location.href='article.jsp'">返回</button>
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
										<input id="title" type="text" name="title" maxlength="150"
											class="required form-control"> 
									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="row">
						<div class="col-sm-12">
							<div class="form-group">
								<label class="col-sm-2 control-label">描述</label>
								<div class="col-sm-10">
									<textarea id="shortContent" name="metaDescription" rows="5"
										class="form-control {maxlength:450}"></textarea>
								</div>
							</div>
						</div>
					</div>

					<div class="row">

						<div class="col-sm-12">
							<div class="form-group">
								<label class="col-sm-2 control-label">标题图</label>
								<div class="col-sm-10">
									<div style="display: table; width: 100%;">
										<div style="display: table-cell; vertical-align: middle;">

											<div class="form-inline" style="margin-top: 3px;">
												<button class="btn btn-default" type="button"
													onclick="return chooseFile()">选择并上传</button>
												<input type="file" id="fileToUpload" name="fileToUpload"
													onchange="ajaxFileUpload()" accept="image/*"
													style="display: none" value="#"> <input
													type="hidden" id="imgSrc" name="imgSrc">
												<!--  <button class="btn btn-default" type="button"
													onclick="return ajaxFileUpload()">上传</button>		-->					
												<button class="btn btn-default" type="button"
													id="smallImageSwfCancel" onclick="" disabled="">取消</button>
											</div>
											<div>
												<label class="checkbox-inline"><input
													type="checkbox" id="s_smallImage" checked="checked">压缩</label>
												<label class="checkbox-inline"><input
													type="checkbox" id="e_smallImage">不按原图比例</label> <label
													class="checkbox-inline"><input type="checkbox"
													id="wm_smallImage">水印</label>
											</div>
										</div>
										<div
											style="width: 200px; display: table-cell; vertical-align: middle; text-align: center;">
											<img id="viewImg" src="#" style="width: 200px">
										</div>
									</div>
									<div id="smallImageSwfProgress"></div>
								</div>
							</div>
						</div>

					</div>

					<div class="row">

						<div class="col-sm-12">
							<div class="form-group">
								<label class="col-sm-2 control-label">文章内容</label>
								<div class="col-sm-10">
									<div style="display: table; width: 100%;">
										<div style="display: table-cell; vertical-align: middle;">
											<textarea rows="10" id="content" cols="40"
												style="width: 666px; resize: none;"></textarea>
										</div>

									</div>
									<div id="smallImageSwfProgress"></div>
								</div>
							</div>
						</div>

					</div>

				</div>
				<div class="box-footer">
					<button class="btn btn-primary"
						onclick="addAD('back')">保存并返回</button>
					<button class="btn btn-default" onclick="addAD('add')">保存并新增</button>
				</div>

			</form>
		</div>
	</div>


</body>
</html>