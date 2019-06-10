<%@page import="Bean.Comment"%>
<%@page import="DBFunction.CommentImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
   
<%
	CommentImpl cImpl = new CommentImpl();
	Comment[] comments = cImpl.getAllComments();
	pageContext.setAttribute("basePath",request.getContextPath());
	pageContext.setAttribute("comments",comments);
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
<script src="${basePath}/admin/js/bootstrap.min.js"></script>

<script src="${basePath}/admin/js/cn_WdatePicker.js"></script>
<link href="${basePath}/admin/css/WdatePicker.css" rel="stylesheet"
	type="text/css">

<script type="text/javascript">

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
function deleteComment(id){
	var b = confirm('您确定要删除吗？');
	if(b){
		var basePath =$('#basePath').val()
		$.post(basePath+"/CommentAction",{type:"delete",id:id},function(result){
			if(result=='success'){
				window.reload()
			}else {
				alert('删除失败')
			}
		})
	}else{
		
	}
	
}
</script>
<input type="hidden" id="basePath" value="${basePath}">
<div id="message-toggler" style="display:none;position:absolute;top:8px;background-color:#ccc;">
	<div id="message-effect" style="font-size:16px;font-weight:bold;padding:8px 20px;_width:50px;word-break:keep-all;white-space:nowrap;text-align:center;color:#00a65a;">	
			操作成功	
	</div>
</div>

<div class="content-header">
	<h1>评论管理 - 列表 <small>(共x条)</small></h1>
</div>
<div class="content">
	<div class="box box-primary">
		<div class="box-body table-responsive">
			<form action="list.do" method="get" class="form-inline ls-search">
				<div class="form-group">
				  <label>评论</label>
				  <input class="form-control input-sm" type="text" name="search_CONTAIN_text" value="">
				</div>
			  <button class="btn btn-default btn-sm" type="submit">搜索</button>
			</form>
			<form method="post">
				<div class="btn-toolbar ls-btn-bar">
					<div class="btn-group">
						<button class="btn btn-default" type="button" onclick="">审核</button>
						<button class="btn btn-default" type="button" onclick="">撤销审核</button>	
					</div>					
					<div class="btn-group">
						<button class="btn btn-default" type="button" onclick="location.href='update_comment.jsp'">修改</button>	
					</div>					
					<div class="btn-group">
						
						<button class="btn btn-default" type="button" onclick="">删除</button>
						
					</div>					
					
				</div>
				<table id="pagedTable" class="table table-condensed table-bordered table-hover ls-tb">
				  <thead id="sortHead" >
				  <tr class="ls_table_th">
				    <th width="25"><input type="checkbox" onclick="Cms.check('ids',this.checked);"></th>
				    <th width="180">操作</th>
				    <th width="30" class="ls-th-sort"><span class="ls-sort" pagesort="id">ID</span></th>
				    <th class="ls-th-sort"><span class="ls-sort" pagesort="creator.id">用户</span></th>
				    <th class="ls-th-sort"><span class="ls-sort" pagesort="fid">评论</span></th>
				     <th class="ls-th-sort"><span class="ls-sort" pagesort="creationDate">评分</span></th>
				    <th class="ls-th-sort"><span class="ls-sort" pagesort="creationDate">日期</span></th>
				  </tr>
				  </thead>
				  <tbody>
				  
				  <c:forEach var="comment" items="${comments}" >
				  
				  <tr ondblclick="location.href=$('#edit_opt_20').attr('href');">
				    <td><input type="checkbox" name="ids" value="20"></td>
				    <td align="center">
							
				      <a href="audit.do?ids=20&amp;" class="ls-opt" disabled="disabled">审核</a>
				      
							
				      <a href="anti_audit.do?ids=20&amp;" class="ls-opt">撤销审核</a>
				      
							
				      <a id="edit_opt_20" href="update_comment.jsp?id=${comment.id}" class="ls-opt">修改</a>
				      
							      
				      <a href="" onclick="deleteComment('${comment.id}')" class="ls-opt">删除</a>
				      
				    </td>
				    <td>${comment.getId()}</td>
				    <td>
				    	<div>${comment.getUserName()}</div>
				    	<div>已审核</div>
				    </td>
				    <td>
				    	<div><a href="">
				    	</a></div>
				    	<div>${comment.getContent()}</div>
				    </td>
				    <td>
				    	<div>0</div>
				    </td>
				
				    <td>
				    	<div>${comment.getDate()}</div>
				    	<div></div>
				    </td>
				  </tr>
				  
				</c:forEach>
				  </tbody>
				</table>
				
			</form>
			<form  method="get" class="ls-page">
				


			  


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
	条 &nbsp; 共 5 条
</div>

			</form>
		</div>
	</div>
</div>



</body></html>