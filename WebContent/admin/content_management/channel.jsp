<%@page import="DBFunction.ChannelImpl"%>
<%@page import="DBFunction.ArticleImpl,Bean.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%
	pageContext.setAttribute("basePath", request.getContextPath());
	ChannelImpl cImpl = new ChannelImpl();
	Channel[] channels = cImpl.getAllChannel();
	pageContext.setAttribute("channels", channels);
%>

<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-store">
<meta http-equiv="Expires" content="0">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>jspXCMS管理平台</title>
<meta name="renderer" content="webkit">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link rel="stylesheet" href="${basePath}/admin/css/bootstrap.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/font-awesome.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/ionicons.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/jquery-ui.css">
<link rel="stylesheet" href="${basePath}/admin/css/jquery.minicolors.css">
<link rel="stylesheet" href="${basePath}/admin/css/metroStyle.css">
<link rel="stylesheet" href="${basePath}/admin/css/AdminLTE.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/skin-blue.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/process.css">
<link rel="stylesheet" href="${basePath}/admin/css/editormd.min.css">
<link rel="stylesheet" href="${basePath}/admin/css/main.css">
<script src="${basePath}/admin/js/jquery.min.js"></script>
<script src="${basePath}/admin/js/bootstrap.min.js"></script>

<script type="text/javascript">
function deleteChannel(id){
	$.post('<%=request.getContextPath()%>/ChannelAction',{type:'delete',
		id:id},function(result){
			if(result=="success"){
				window.reload()
			}else {
				alert('删除失败')
			}
		})
}
</script>
</head>
<body class="skin-blue content-body">



<!-- 用于显示操作结果信息。配合Controller的RedirectAttributes.addFlashAttribute("message","xxx")，可以只在第一次访问页面时显示信息，刷新页面不会重复显示  -->
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

<div id="message-toggler" style="display:none;position:absolute;top:8px;background-color:#ccc;">
	<div id="message-effect" style="font-size:16px;font-weight:bold;padding:8px 20px;_width:50px;word-break:keep-all;white-space:nowrap;text-align:center;color:#00a65a;">
			操作成功
	</div>
</div>

<div class="content-header">
	<h1>栏目管理 - 列表 <small>(共 31 条)</small></h1>
</div>
<div class="content">
	<div class="box box-primary">
		<div class="box-body table-responsive">
			<form id="searchForm"  class="form-inline ls-search">
				<div class="form-group">
				  <label for="search_CONTAIN_name">名称</label>
				  <input class="form-control input-sm" type="text" id="search_CONTAIN_name" name="search_CONTAIN_name" value="">
				</div>
				<div class="form-group">
				  <label for="search_CONTAIN_number">编码</label>
				  <input class="form-control input-sm" type="text" id="search_CONTAIN_number" name="search_CONTAIN_number" value="">
				</div>
				<div class="form-group">
				  <label for="search_EQ_hidden_Boolean">前台隐藏</label>
			  	<select class="form-control input-sm" id="search_EQ_hidden_Boolean" name="search_EQ_hidden_Boolean">
			  		<option value="">---所有---</option>
			  		<option value="true">是</option>
			  		<option value="false">否</option>
			  	</select>
				</div>
			  <button class="btn btn-default btn-sm" type="submit">搜索</button>
			  <input type="hidden" name="queryParentId" value="1">
			  <input type="hidden" name="showDescendants" value="true">
			</form>
			<form class="form-inline">
				<div class="btn-toolbar ls-btn-bar">
					<div class="btn-group">
						<button class="btn btn-default" type="button" onclick="location.href='add_channel.jsp'">新增</button>
					</div>
					<div class="btn-group">	
						<button class="btn btn-default" type="submit">保存</button>
					</div>
					<div class="btn-group">
					
						
						<button class="btn btn-default" type="button" onclick="return optSingle('#edit_opt_');">修改</button>
						
					
					
						<button class="btn btn-default" type="button" onclick="return optDelete(this.form,,',');">删除</button>
						
					</div>
					<div class="btn-group">
						
					  <button class="btn btn-default" type="button" onclick=";">置顶</button>
					  <button class="btn btn-default" type="button" onclick=";">上移</button>
					  <button class="btn btn-default" type="button" onclick=";">下移</button>
					  <button class="btn btn-default" type="button" onclick=";">置底</button>
					  
					</div>
				</div>
				<table id="pagedTable" class="table table-condensed table-bordered table-hover ls-tb">
				  <thead id="sortHead">
				  <tr class="ls_table_th">
				    <th width="25"><input type="checkbox" onclick="Cms.check('ids',this.checked);"></th>
				    <th width="240">操作</th>
				    <th width="30" class="ls-th-sort"><span class="ls-sort" pagesort="id">ID</span></th>
				    <th class="ls-th-sort"><span class="ls-sort" pagesort="name">名称</span></th>
				    <th class="ls-th-sort"><span class="ls-sort" pagesort="number">跳转地址</span></th>
				   <!--<th class="ls-th-sort"><span class="ls-sort" pagesort="nodeModel">模型</span></th>  --> 
				    <th class="ls-th-sort"><span class="ls-sort" pagesort="views">权重</span></th>
				    <th>前台隐藏</th>
				    <th>HTML</th>
				  </tr>
				  </thead>
				  <tbody>
				  <c:forEach var="channel" items="${channels}">
				  <tr>
				    <td><input type="checkbox" name="ids" value="${channel.id}"></td>
				    <td align="center">
				      <a id="" href="update_channel.jsp?id=${channel.id}" class="ls-opt">修改</a>
				      <a href="" onclick="deleteChannel('${channel.id}')" class="ls-opt">删除</a>
				      
				     </td>
				    <td>${channel.id}<input type="hidden" name="id" value="${channel.id}"></td>
				    <td><span style="padding-left:0px">
				    <input type="text" name="name" value="${channel.title}" style="width:120px;" class="form-control input-sm"></span></td>
				    <td align="center"><input type="text" name="number" value="${channel.targetUrl}" style="width:120px;" class="form-control input-sm"></td>
			
				    <td align="center"><input type="text" name="views" value="${channel.weight}" style="width:60px;text-align:right;" class="form-control input-sm"></td>
				    <td align="center">
				    <input type="checkbox" onclick="$('#_chk_hidden1').val(this.checked);">
					</td>
				    <td align="center">
				      <span style="">未开启</span>
				    </td>
				  </tr>
				</c:forEach>
				  </tbody>
				</table>
				
			</form>
		</div>
	</div>
</div>
				



</body></html>