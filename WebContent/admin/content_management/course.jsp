<%@page import="DBFunction.CourseImpl,Bean.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%
	pageContext.setAttribute("basePath", request.getContextPath());
	CourseImpl cImpl = new CourseImpl();
	Course[] courses = cImpl.getAllCourses();
	pageContext.setAttribute("courses", courses);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-store">
<meta http-equiv="Expires" content="0">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>课程管理</title>
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
	href="${basePath}/admin/css/process.css">
<link rel="stylesheet"
	href="${basePath}/admin/css/editormd.min.css">
<link rel="stylesheet"
	href="${basePath}/admin/css/main.css">

<script src="${basePath}/admin/js/jquery.min.js"></script>
<script src="${basePath}/admin/js/bootstrap.min.js"></script>


<style>
.tabs {
	
}

.tabs li {
	float: left;
	background-color: #f4f4f4;
	border-left: 1px solid #e2e2e2;
	border-top: 1px solid #ddd;
	border-right: 1px solid #ddd;
	margin-right: 5px;
}

.tabs li a {
	color: #555555;
	float: left;
	text-decoration: none;
	padding: 5px 12px;
}

.tabs li a:link, .tabs li a:visited, .tabs li a:hover, .tabs li a:active
	{
	text-decoration: none;
}

.tabs li.active {
	background-color: #FFFFFF;
	border-left: 1px solid #ddd;
	border-top: 1px solid #ddd;
	border-right: 1px solid #ddd;
}

.tabs li.active a {
	color: #000;
}

.tabs li.hover {
	background-color: #e7e7e7;
	border-left: 1px solid #ddd;
	border-top: 1px solid #ddd;
	border-right: 1px solid #ddd;
}

.tabs li.hover a {
	color: #000;
}
</style>
<script>
$(function() {
	$("#radio").buttonset();

	$("#tabs li").each(function(){
		$(this).hover(function(){
			if(!$(this).hasClass("active")) {
				$(this).addClass("hover");
			}
		},function(){
			$(this).removeClass("hover");
		});
	});

});



function confirmDelete(id) {
	var flag = confirm("您确定删除吗？");
	var basePath = $('#basePath').val();
	if(flag==true){
		$.post(basePath+"/CourseAction",{type:"delete",id:id},function(result){
			if(result=='success'){
				location.reload();
			}
		})
		return true;
	}else{
		return false;
	}
}

</script>

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




</head>
<body class="skin-blue content-body">
	<div id="message-toggler"
		style="display: none; position: absolute; top: 8px; background-color: #ccc;">
		<div id="message-effect"
			style="font-size: 16px; font-weight: bold; padding: 8px 20px; _width: 50px; word-break: keep-all; white-space: nowrap; text-align: center; color: #00a65a;">
			操作成功</div>
	</div>
	<input id="basePath" value="${basePath}" type="hidden">
	<div class="content-header">
		<h1>
			文档管理 - 列表 
		</h1>
	</div>
	<div class="content">
		<div class="box box-primary">
			<div class="box-body table-responsive">

				<form id="searchForm"  method="get" class="form-inline ls-search">
					<div class="form-group">
						<label for="search_CONTAIN_detail.title">标题</label> <input class="form-control input-sm" type="text" id="search_CONTAIN_detail.title" name="search_CONTAIN_detail.title" value="" style="width: 150px;">
					</div>
					
					<div class="form-group">
						<label for="search_CONTAIN_JinfoTags.Jtag.name">关键词</label> <input class="form-control input-sm" type="text" id="search_CONTAIN_JinfoTags.Jtag.name" name="search_CONTAIN_JinfoTags.Jtag.name" value="" style="width: 100px;">
					</div>
					<div class="form-group">
						<label for="search_EQ_creator.username">发布人</label> <input class="form-control input-sm" type="text" id="search_EQ_creator.username" name="search_EQ_creator.username" value="" style="width: 100px;">
					</div>
					<div class="form-group">
						<label for="search_EQ_detail.author">作者</label> <input class="form-control input-sm" type="text" id="search_EQ_detail.author" name="search_EQ_detail.author" value="" style="width: 100px;">
					</div>
					
					
					<div class="form-group">
						<label for="search_EQ_priority">优先级</label> <select class="form-control input-sm" id="search_EQ_priority" name="search_EQ_priority">
							<option value="">---所有---</option>


							<option>0</option>


							<option>1</option>


							<option>2</option>


							<option>3</option>


							<option>4</option>


							<option>5</option>


							<option>6</option>



						</select>
					</div>
					
					
					<button class="btn btn-default btn-sm" type="submit">搜索</button>

				</form>
		
				<form method="post">

					<div class="btn-toolbar ls-btn-bar">
						<div class="btn-group">

							<button class="btn btn-default" type="button"
								onclick="location.href='add_course.jsp'">新增</button>

						</div>
						<div class="btn-group">
							<button class="btn btn-default" type="button" onclick="">修改</button>




						</div>
						<div class="btn-group">
							<button class="btn btn-default" type="button" onclick="">删除</button>
							<button class="btn btn-default" type="button" onclick="">撤销删除</button>
						</div>
						<div class="btn-group">
							<button class="btn btn-default" type="button" onclick="">审核通过</button>
							<button class="btn btn-default" type="button" onclick="">撤销审核</button>
						</div>
					</div>
					<ul id="tabs" class="tabs list-unstyled">
						<li class="active"><a href="javascript:void(0);"
							onclick="">所有</a></li>
						<li><a href="javascript:void(0);"
							onclick="">待审</a></li>
						<li><a href="javascript:void(0);"
							onclick="">退回</a></li>
						<li><a href="javascript:void(0);"
							onclick="">审核中</a></li>
						<li><a href="javascript:void(0);"
							onclick="">待发布</a></li>
						<li><a href="javascript:void(0);"
							onclick="">已发布</a></li>
						<li><a href="javascript:void(0);"
							onclick="">已过期</a></li>
						<li><a href="javascript:void(0);"
							onclick="">草稿</a></li>
						<li><a href="javascript:void(0);"
							onclick="">退稿</a></li>
						<li><a href="javascript:void(0);"
							onclick="">投稿</a></li>
						<li><a href="javascript:void(0);"
							onclick="">采集</a></li>
						<li><a href="javascript:void(0);"
							onclick="">回收站</a></li>
					</ul>
					<table id="pagedTable"
						class="table table-condensed table-bordered table-hover ls-tb">
						<thead id="sortHead">
							<tr class="ls_table_th">
								<th width="25"><input type="checkbox"
									onclick=""></th>
								<th width="180">操作</th>
								<th width="30" class="ls-th-sort"><span class="ls-sort"
									>ID</span></th>
								<th class="ls-th-sort"><span class="ls-sort"
									>課程名稱</span></th>
								<th class="ls-th-sort"><span class="ls-sort"
									>开课学校</span></th>
								<th class="ls-th-sort"><span class="ls-sort"
									pagesort="priority">优先级</span></th>
								<th class="ls-th-sort"><span class="ls-sort"
									pagesort="views">开课老师</span></th>
								<th class="ls-th-sort"><span class="ls-sort"
									pagesort="status">状态</span></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="course" items="${courses}">
								<tr>
									<td><input type="checkbox" name="ids"
										value="${course.id}"></td>
									<td align="center"><a
										href="${basePath}/admin/content_management/update_course.jsp?id=${course.id}" class="ls-opt">修改</a>
										<a href="#" onclick="confirmDelete('${course.id}');"
										class="ls-opt">删除</a></td>
									<td>${course.getId()}</td>
									<td>
										<div>
											<a href="#" title="${course.name}">${course.name}</a>
										</div>
									</td>
									<td>
										<div>${course.college}</div>
										<div>
									</td>
									<td align="right">0</td>
									<td align="right">${course.teacherName}</td>
									<td align="center">
										<div>
										<c:if test="${course.status=='0'}">
											<a href="#" class="ls-opt" style=""> 已经结束 </a>
										</c:if>
										<c:if test="${course.status=='1'}">
											<a href="#" class="ls-opt" style=""> 正在直播 </a>
										</c:if>
										<c:if test="${course.status=='2'}">
											<a href="#" class="ls-opt" style=""> 即将直播 </a>
										</c:if>
										</div>
										
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</form>
				<form method="get" class="ls-page">
					<input type="hidden" name="queryNodeId"> <input
						type="hidden" name="queryNodeType" value="0"> <input
						type="hidden" name="queryInfoPermType"> <input
						type="hidden" id="queryStatus" name="queryStatus">
					<ul class="pagination pull-left" style="margin: 0;">
						<li class="disabled"><a href="javascript:;" aria-label="上一页">
								<span aria-hidden="true">«</span>
						</a></li>
						<li class="active"><a href="javascript:;"> <span>1</span>
						</a></li>
						<li><a
							href="javascript:$(&#39;#page&#39;).val(&#39;2&#39;)[0].form.submit();"
							aria-label="下一页"> <span aria-hidden="true">»</span>
						</a></li>
					</ul>
					<input type="hidden" id="page" name="page" value="1">
					<div class="pull-left" style="padding: 0 6px;">
						&nbsp;每页 <select class="form-control" id="pageSize"
							onchange=""
							style="border-radius: 4px; padding-left: 3px; padding-right: 3px; width: 60px; display: inline-block;">
							<option selected="">10</option>
							<option>20</option>
							<option>50</option>
							<option>100</option>
							<option>200</option>
							<option>400</option>
							<option>800</option>
						</select> 条 &nbsp; 共<%=courses.length%>条
					</div>

				</form>
			</div>
		</div>
	</div>

</body>
</html>