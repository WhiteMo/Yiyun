<!DOCTYPE html>
<!-- saved from url=(0055)http://111.230.147.160:8080/jsp/cmscp/core/user/list.do -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-store">
<meta http-equiv="Expires" content="0">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>jspXCMS管理平台</title>
<meta name="renderer" content="webkit">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link rel="stylesheet" href="./main_files/bootstrap.min.css">
<link rel="stylesheet" href="./main_files/font-awesome.min.css">
<link rel="stylesheet" href="./main_files/ionicons.min.css">
<link rel="stylesheet" href="./main_files/jquery-ui.css">
<link rel="stylesheet" href="./main_files/jquery.minicolors.css">
<link rel="stylesheet" href="./main_files/metroStyle.css">
<link rel="stylesheet" href="./main_files/AdminLTE.min.css">
<link rel="stylesheet" href="./main_files/skin-blue.min.css">
<link rel="stylesheet" href="./main_files/process.css">
<link rel="stylesheet" href="./main_files/editormd.min.css">
<link rel="stylesheet" href="./main_files/main.css">
<!--[if lt IE 9]>
<script src="/jsp/static/vendor/html5shiv/html5shiv.min.js"></script>
<script src="/jsp/static/vendor/respond/respond.min.js"></script>
<![endif]-->
<script>
CTX="/jsp";CMSCP="/cmscp";
window.UEDITOR_HOME_URL = "/jsp/static/vendor/ueditor/";
</script>
<script src="./main_files/jquery.min.js.下载"></script>
<script src="./main_files/bootstrap.min.js.下载"></script>
<script src="./main_files/jquery-ui.js.下载"></script>
<script src="./main_files/jquery-validation.min.js.下载"></script>
<script src="./main_files/jquery.validation_zh_CN.js.下载"></script>
<script src="./main_files/jquery-form.min.js.下载"></script>
<script src="./main_files/jquery-ajaxfileuploader.min.js.下载"></script>
<script src="./main_files/jquery.minicolors.min.js.下载"></script>
<script src="./main_files/jquery-cookie.min.js.下载"></script>
<script src="./main_files/jquery.ztree.all.min.js.下载"></script>
<script src="./main_files/cn_WdatePicker.js.下载"></script><link href="./main_files/WdatePicker.css" rel="stylesheet" type="text/css">
<script src="./main_files/swfupload.js.下载"></script>
<script src="./main_files/swfupload.queue.js.下载"></script>
<script src="./main_files/fileprogress.js.下载"></script>
<script src="./main_files/handlers.js.下载"></script>
<script src="./main_files/ueditor.config.js.下载"></script>
<script src="./main_files/ueditor.all.min.js.下载"></script>
<script src="./main_files/zh-cn.js.下载"></script>
<script src="./main_files/editormd.min.js.下载"></script>
<script src="./main_files/editormd.plugin.js.下载"></script>
<script src="./main_files/to-markdown.js.下载"></script>
<script src="./main_files/echarts.common.min.js.下载"></script>
<script src="./main_files/plugins.js.下载"></script>
<script src="./main_files/jspxcms_choose.js.下载"></script>
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
		$("#message-effect").do(message);
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
	<h1>用户管理 - 列表 <small>(共 2 条)</small></h1>
</div>
<div class="content">
	<div class="box box-primary">
		<div class="box-body table-responsive">
			<form action="http://111.230.147.160:8080/jsp/cmscp/core/user/list.do" method="get" class="form-inline ls-search">
				<div class="form-group">
				  <label for="search_CONTAIN_username">用户名</label>
				  <input class="form-control input-sm" type="text" id="search_CONTAIN_username" name="search_CONTAIN_username" value="" style="width:120px;">
				</div>
				<div class="form-group">
				  <label for="search_CONTAIN_realName">用户实名</label>
				  <input class="form-control input-sm" type="text" id="search_CONTAIN_realName" name="search_CONTAIN_realName" value="" style="width:120px;">
				</div>
				<div class="form-group">
				  <label for="search_STARTWITH_Jorg.treeNumber">组织</label>
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
		        
		      </select>
				</div>
				<div class="form-group">
				  <label for="search_EQ_JuserGroups.group.id">会员组</label>
		      <select class="form-control input-sm" id="search_EQ_JuserGroups.group.id" name="search_EQ_JuserGroups.group.id">
		        <option value="">---所有---</option>
		        
		        <option value="1">普通会员</option>
		        
		      </select>
				</div>
				<div class="form-group">
				  <label for="search_EQ_type">类型</label>
		      <select class="form-control input-sm" id="search_EQ_type" name="search_EQ_type">
		        <option value="">---所有---</option>
		        <option value="0">会员</option>
		        <option value="1">管理员</option>
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
						
						<button class="btn btn-default" type="button" onclick="location.href=&#39;create.do?&#39;;">新增</button>
						
					</div>
					<div class="btn-group">
						
						<button class="btn btn-default" type="button" onclick="return optSingle(&#39;#copy_opt_&#39;);">复制</button>
						
						
						<button class="btn btn-default" type="button" onclick="return optSingle(&#39;#edit_opt_&#39;);">修改</button>
						
						
						<button class="btn btn-default" type="button" onclick="return optMulti(&#39;this.form,&#39;check.do);">审核</button>
						
						
						<button class="btn btn-default" type="button" onclick="return optMulti(#39;this.form,&#39;lock.do&);">锁定</button>
						
						
						<button class="btn btn-default" type="button" onclick="return optMulti(&#39;this.form,&#39;unlock.do);">解锁</button>
						
					</div>
					<div class="btn-group">
						
						<button class="btn btn-default" type="button" onclick="return optDeletePassword(this.form);">删除密码</button>
						
							
						<button class="btn btn-default" type="button" onclick="return optDelete(this.form);">删除</button>
						
					</div>
				</div>
				<table id="pagedTable" class="table table-condensed table-bordered table-hover ls-tb">
				  <thead id="sortHead" pagesort="" pagedir="" pageurl="list.do?page_sort={0}&amp;page_sort_dir={1}&amp;">
				  <tr class="ls_table_th">
				    <th width="25"><input type="checkbox" onclick="Cms.check(&#39;ids&#39;,this.checked);"></th>
				    <th width="150">操作</th>
				    <th width="30" class="ls-th-sort"><span class="ls-sort" pagesort="id">ID</span></th>
				    <th class="ls-th-sort"><span class="ls-sort" pagesort="username">用户名</span></th>
				    <th class="ls-th-sort"><span class="ls-sort" pagesort="org.treeNumber">组织</span></th>
				    <th>角色</th>
				    <th class="ls-th-sort"><span class="ls-sort" pagesort="group.id">会员组</span></th>
				    <th class="ls-th-sort"><span class="ls-sort" pagesort="type">类型</span></th>
				    <th class="ls-th-sort"><span class="ls-sort" pagesort="rank">等级</span></th>
				    <th class="ls-th-sort"><span class="ls-sort" pagesort="status">状态</span></th>
				  </tr>
				  </thead>
				  <tbody>
				  
				  <tr ondblclick="location.href=$(&#39;#edit_opt_1&#39;).attr(&#39;href&#39;);">
				    <td><input type="checkbox" name="ids" value="1"></td>
				    <td align="center">
							
				      <a id="copy_opt_1" href="create.do?id=1&amp;" class="ls-opt" style="display:none;">复制</a>
				      <!--后面记得改这块-->
							
				      <a id="edit_opt_1" href="main.do?id=1&amp;position=0&amp;" class="ls-opt">修改</a>
				      
							
				      <a href="main.do?ids=1&amp;" onclick="return confirmDeletePassword();" class="ls-opt">删除密码</a>
				      
							
							
							
							
								<a class="ls-opt-disabled">删除</a>
							
							      
				      
				     </td>
				    <td>1</td>
				    <td>admin (管理员)</td>
				    <td>集团总部</td>
				    <td>
					    
					    管理员
					    
						</td>
				    <td>普通会员</td>
				    <td>管理员</td>
				    <td align="right">0</td>
				    <td align="center">正常</td>
				  </tr>
				  
				  <tr ondblclick="location.href=$(&#39;#edit_opt_0&#39;).attr(&#39;href&#39;);">
				    <td><input type="checkbox" name="ids" value="0"></td>
				    <td align="center">
							
				      <a id="copy_opt_0" href="create.do?id=0&amp;" class="ls-opt" style="display:none;">复制</a>
				      
							
				      <a id="edit_opt_0" href="main.do?id=0&amp;position=1&amp;" class="ls-opt">修改</a>
				      
							
				      <a href="main.do?ids=0&amp;" onclick="return confirmDeletePassword();" class="ls-opt">删除密码</a>
				      
							
							
							
							
								<a class="ls-opt-disabled">删除</a>
							
							      
				      
				     </td>
				    <td>0</td>
				    <td>anonymous</td>
				    <td>集团总部</td>
				    <td>
					    
						</td>
				    <td>普通会员</td>
				    <td>管理员</td>
				    <td align="right">1</td>
				    <td align="center"><strong>锁定</strong></td>
				  </tr>
				  
				  </tbody>
				</table>
				
				</form>
				<form action="main.do" method="get" class="ls-page">
					


				  


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
	<select class="form-control" id="pageSize" onchange="$.cookie(&#39;page_size&#39;,$(this).val(),{expires:36500});this.form.submit();" style="border-radius:4px;padding-left:3px;padding-right:3px;width:60px;display:inline-block;">
		<option selected="">10</option>
		<option>20</option>
		<option>50</option>
		<option>100</option>
		<option>200</option>
		<option>400</option>
		<option>800</option>
	</select>
	条 &nbsp; 共 2 条
</div>
<script type="text/javascript">
$(function(){
	
});
</script>
				</form>
			
		</div>
	</div>
</div>



</body></html>