<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
    <%@page import="DBFunction.*,Bean.*"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
	UserImpl uImpl = new UserImpl();
	User[] users = uImpl.getAllUsers();
	pageContext.setAttribute("users", users);

%>

<html><head>

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-store">
<meta http-equiv="Expires" content="0">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>jspXCMS管理平台</title>
<meta name="renderer" content="webkit">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
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
	href="${basePath}/admin/css/process.css">
<link rel="stylesheet"
	href="${basePath}/admin/css/editormd.min.css">
<link rel="stylesheet"
	href="${basePath}/admin/css/main.css">
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

<script>
$(function() {
	$("#sortHead").headSort();
});
function confirmDelete() {
	return confirm("您确定删除吗？");
}
function confirmDeletePassword() {
	return confirm("您确定删除密码吗？");
}
function optSingle(opt) {
	if(Cms.checkeds("ids")==0) {
		alert("请选择数据！");
		return false;
	}
	if(Cms.checkeds("ids")>1) {
		alert("只能选择一条数据！");
		return false;
	}
	var id = $("input[name='ids']:checkbox:checked").val();
	location.href=$(opt+id).attr("href");
}
function optMulti(form, action, msg) {
	if(Cms.checkeds("ids")==0) {
		alert("请选择数据！");
		return false;
	}
	if(msg && !confirm(msg)) {
		return false;
	}
	form.action=action;
	form.submit();
	return true;
}
function optDelete(form) {
	if(Cms.checkeds("ids")==0) {
		alert("请选择数据！");
		return false;
	}
	if(!confirmDelete()) {
		return false;
	}
	form.action='delete.do';
	form.submit();
	return true;
}
function optDeletePassword(form) {
	if(Cms.checkeds("ids")==0) {
		alert("请选择数据！");
		return false;
	}
	if(!confirmDeletePassword()) {
		return false;
	}
	form.action='delete_password.do';
	form.submit();
	return true;
}
</script>
</head>
<body class="skin-blue content-body">


</script>

<div id="message-toggler" style="display:none;position:absolute;top:8px;background-color:#ccc;">
	<div id="message-effect" style="font-size:16px;font-weight:bold;padding:8px 20px;_width:50px;word-break:keep-all;white-space:nowrap;text-align:center;color:#00a65a;">
		
		
			
			操作成功
		
	</div>
</div>

<div class="content-header">
	<h1>用户管理 - 列表 <small>(共 3 条)</small></h1>
</div>
<div class="content">
	<div class="box box-primary">
		<div class="box-body table-responsive">
			<form action="list.do" method="get" class="form-inline ls-search">
				<div class="form-group">
				  <label for="search_CONTAIN_username">用户名</label>
				  <input class="form-control input-sm" type="text" id="search_CONTAIN_username" name="search_CONTAIN_username" value="" style="width:120px;">
				</div>
				<div class="form-group">
				  <label for="search_CONTAIN_realName">用户实名</label>
				  <input class="form-control input-sm" type="text" id="search_CONTAIN_realName" name="search_CONTAIN_realName" value="" style="width:120px;">
				</div>
				<div class="form-group">
				  <label for="search_STARTWITH_Jorg.treeNumber">学校</label>
		      <select class="form-control input-sm" id="search_STARTWITH_Jorg.treeNumber" name="search_STARTWITH_Jorg.treeNumber">
		        <option value="">---所有---</option>
		        
		        <option value="0000">集团总部</option>
		        
		      </select>
				</div>
				<div class="form-group">
				  <label for="search_EQ_JuserRoles.role.id">角色</label>
		      <select class="form-control input-sm" id="search_EQ_JuserRoles.role.id" name="search_EQ_JuserRoles.role.id">
		        <option value="">---所有---</option>
		        
		        <option value="1">管理员</option>
		        
		        <option value="17">123</option>
		        
		        <option value="19">1</option>
		        
		      </select>
				</div>
				<div class="form-group">
				  <label for="search_EQ_JuserGroups.group.id">类别</label>
		      <select class="form-control input-sm" id="search_EQ_JuserGroups.group.id" name="search_EQ_JuserGroups.group.id">
		        <option value="">---所有---</option>
		        
		        <option value="1">普通会员1</option>
		        
		      </select>
				</div>
				<div class="form-group">
				  <label for="search_EQ_status">状态</label>
		      <select class="form-control input-sm" id="search_EQ_status" name="search_EQ_status">
		        <option value="">---所有---</option>
		        <option value="0">正常</option>
		        <option value="1">锁定</option>
		        <option value="2">待验证</option>
		      </select>
				</div>
			  <button class="btn btn-default btn-sm" type="submit">搜索</button>
			</form>
			<form method="post">
				


				<div class="btn-toolbar ls-btn-bar">
					<div class="btn-group">
						
						<button class="btn btn-default" type="button" onclick="location.href='add_user.jsp';">新增</button>
						
					</div>
					<div class="btn-group">
						
						<button class="btn btn-default" type="button" onclick="return optSingle('#copy_opt_');">复制</button>
						
						
						<button class="btn btn-default" type="button" onclick="return optSingle('#edit_opt_');">修改</button>
						
						
						<button class="btn btn-default" type="button" onclick="return optMulti(this.form,'check.do');">审核</button>
						
						
						<button class="btn btn-default" type="button" onclick="return optMulti(this.form,'lock.do');">锁定</button>
						
						
						<button class="btn btn-default" type="button" onclick="return optMulti(this.form,'unlock.do');">解锁</button>
						
					</div>
					<div class="btn-group">
						
						<button class="btn btn-default" type="button" onclick="return optDeletePassword(this.form);">删除密码</button>
						
							
						<button class="btn btn-default" type="button" onclick="return optDelete(this.form);">删除</button>
						
					</div>
				</div>
				<table id="pagedTable" class="table table-condensed table-bordered table-hover ls-tb">
				  <thead id="sortHead" pagesort="" pagedir="" pageurl="list.do?page_sort={0}&amp;page_sort_dir={1}&amp;">
				  <tr class="ls_table_th">
				    <th width="25"><input type="checkbox" onclick="Cms.check('ids',this.checked);"></th>
				    <th width="150">操作</th>
				    <th width="30" class="ls-th-sort"><span class="ls-sort">ID</span></th>
				    <th class="ls-th-sort"><span class="ls-sort" >账户</span></th>
				    <th>性别</th>
				    <th class="ls-th-sort"><span class="ls-sort" >用户名</span></th>
				    <th class="ls-th-sort"><span class="ls-sort" >学校</span></th>
				    <th class="ls-th-sort"><span class="ls-sort" >电话</span></th>
				  </tr>
				  </thead>
				  <tbody>
				  <%
				  	
				  %>
				  
				  <c:forEach items="${users}" var="user" >
				  <tr >
				    <td><input type="checkbox" name="ids" value="${user.id }"></td>
				    <td align="center">	
				    <a href="${basePath}/admin/content_management/update_user.jsp?id=${user.id}" class="ls-opt">修改</a>		
					<a href="delete.do?ids=31&amp;" onclick="confirmDelete('${user.id}');" class="ls-opt">删除</a>
				     </td>
				    <td>${user.id}</td>
				    <td>${user.account}</td>
				    <td>${user.sex}</td>
				    <td>${user.name}</td>
				    <td>${user.college}</td>
				    <td>${user.teleNumber}</td>
				  </tr>
				  </c:forEach>
				  </tbody>
				</table>
				
				</form>
				<form action="list.do" method="get" class="ls-page">
					


				  


<ul class="pagination pull-left" style="margin:0;">
  <li class="disabled">
    <a href="javascript:;" aria-label="上一页">
      <span aria-hidden="true">«</span>
    </a>
  </li>
  <li class="active">
    <a href="javascript:;">
      <span>1</span>
    </a>
  </li>
   
   
  
  
  
  
  <li class="disabled">
    <a href="javascript:;" aria-label="下一页">
      <span aria-hidden="true">»</span>
    </a>
  </li>
</ul>
<input type="hidden" id="page" name="page" value="1">
<div class="pull-left" style="padding:0 6px;">
	&nbsp;每页
	<select class="form-control" id="pageSize" onchange="$.cookie('page_size',$(this).val(),{expires:36500});this.form.submit();" style="border-radius:4px;padding-left:3px;padding-right:3px;width:60px;display:inline-block;">
		<option selected="">10</option>
		<option>20</option>
		<option>50</option>
		<option>100</option>
		<option>200</option>
		<option>400</option>
		<option>800</option>
	</select>
	条 &nbsp; 共 3 条
</div>

				</form>
			
		</div>
	</div>
</div>



</body></html>