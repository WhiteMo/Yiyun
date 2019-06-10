<%@page import="Bean.AD"%>
<%@page import="DBFunction.ADImpl"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
	ADImpl adImpl = new ADImpl();
	String id = request.getParameter("id");
	AD a = null;
	if(id==null){
		id="21";
		a = adImpl.getADById(id);
	}else{
		a = adImpl.getADById(id);
		pageContext.setAttribute("a", a);
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-store">
<meta http-equiv="Expires" content="0">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>广告修改</title>
<meta name="renderer" content="webkit">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet"
	href="${basePath}/admin/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${basePath}/admin/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${basePath}/admin/css/ionicons.min.css">
<link rel="stylesheet"
	href="${basePath}/admin/css/jquery-ui.css">
<link rel="stylesheet"
	href="${basePath}/admin/css/jquery.minicolors.css">
<link rel="stylesheet"
	href="${basePath}/admin/css/metroStyle.css">
<link rel="stylesheet"
	href="${basePath}/admin/css/AdminLTE.min.css">
<link rel="stylesheet"
	href="${basePath}/admin/css/skin-blue.min.css">
<link rel="stylesheet"
	href="${basePath}/admi
	n/css/process.css">
<link rel="stylesheet"
	href="${basePath}/admin/css/editormd.min.css">
<link rel="stylesheet"
	href="${basePath}/admin/css/main.css">

<script src="${basePath}/admin/js/jquery.min.js"></script>
<script src="${basePath}/admin/js/bootstrap.min.js"></script>


<script type="text/javascript" src="${basePath}/admin/js/ajaxfileupload.js"></script>
<script type="text/javascript">
	
	$(function(){
		$('#viewImg').attr('src','<%=a.imgUrl%>');
		$('#imgSrc').val('<%=a.imgUrl%>');
		$('#title').val('<%=a.title%>');
		var author = "白墨"
		var shortContent = $('#shortContent').val('<%=a.shortContent%>');
		var weight = $("#weight").find("option:selected").text();
		$('input:checkbox[name=attr]').each(function(k){
		    if(tag.indexOf($(this).val())>-1){
		    	$(this).attr("checked",true)
		    }
		})
	})
	
	function chooseFile(){
		$('#fileToUpload').click();
	}

	function ajaxFileUpload(type) {
		if($('#fileToUpload').val()==null){
			alert('为空')
			return ;
		}
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

function updateAD(type){
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
	$.post(basePath+"/ADAction",{type:'update'
		,id:<%=id%>
		,title:title
		,imgUrl:imgUrl
		,shortContent:shortContent
		},function(result){
			if(result=='success'){
				if(type=='back'){
					window.event.returnValue=false;
					window.location.href=basePath+"/admin/content_management/AD.jsp";
				}else if(type=='another'){
					window.event.returnValue=false;
					window.location.href=basePath+"/admin/content_management/add_AD.jsp";
				}else {
					
				}
		}else {
				alert('失败')
			}
			
		});
}

</script>


</head>
<body class="skin-blue content-body" style="">
	<input id="basePath" type="hidden" value="${basePath}">


	<div class="content-header">
		<h1>广告管理 - 修改</h1>
	</div>
	<div class="content" style="">
		<div class="box box-primary" style="">
			<form class="form-horizontal"  
				method="post" novalidate="novalidate" style="">
			
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
												<input type="file" id="fileToUpload" onchange="ajaxFileUpload()" name="fileToUpload"  accept="image/*"  style="display:none" value="#">
												<button class="btn btn-default" type="button"
													id="smallImageSwfCancel"
													onclick="" disabled="">取消</button>
											</div>
										
										</div>
										<div
											style="width: 200px; display: table-cell; vertical-align: middle; text-align: center;">
											<img id="viewImg" src="#" style="width:200px">
										</div>
									</div>
									<div id="smallImageSwfProgress"></div>
								</div>
							</div>
						</div>
				
					</div>
				
					<div class="row">
						
						
			
					</div>
				
				</div>
				<div class="box-footer">
					<button class="btn btn-primary" id="saveAndExit" onclick="updateAD('back')">保存并返回</button>
					<button class="btn btn-default" onclick="updateAD('another')">保存并新增</button>
					<button class="btn btn-default" type="button" onclick="location.href='AD.jsp'">返回</button>		
				</div>
			
			</form>
		</div>
	</div>


</body>
</html>