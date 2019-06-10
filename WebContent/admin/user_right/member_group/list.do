<!DOCTYPE html>
<!-- saved from url=(0063)http://111.230.147.160:8080/jsp/cmscp/core/member_group/list.do -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-store">
<meta http-equiv="Expires" content="0">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>jspXCMS管理平台</title>
<meta name="renderer" content="webkit">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link rel="stylesheet" href="./list_files/bootstrap.min.css">
<link rel="stylesheet" href="./list_files/font-awesome.min.css">
<link rel="stylesheet" href="./list_files/ionicons.min.css">
<link rel="stylesheet" href="./list_files/jquery-ui.css">
<link rel="stylesheet" href="./list_files/jquery.minicolors.css">
<link rel="stylesheet" href="./list_files/metroStyle.css">
<link rel="stylesheet" href="./list_files/AdminLTE.min.css">
<link rel="stylesheet" href="./list_files/skin-blue.min.css">
<link rel="stylesheet" href="./list_files/process.css">
<link rel="stylesheet" href="./list_files/editormd.min.css">
<link rel="stylesheet" href="./list_files/main.css">
<!--[if lt IE 9]>
<script src="/jsp/static/vendor/html5shiv/html5shiv.min.js"></script>
<script src="/jsp/static/vendor/respond/respond.min.js"></script>
<![endif]-->
<script>
CTX="/jsp";CMSCP="/cmscp";
window.UEDITOR_HOME_URL = "/jsp/static/vendor/ueditor/";
</script>
<script src="./list_files/jquery.min.js.下载"></script>
<script src="./list_files/bootstrap.min.js.下载"></script>
<script src="./list_files/jquery-ui.js.下载"></script>
<script src="./list_files/jquery-validation.min.js.下载"></script>
<script src="./list_files/jquery.validation_zh_CN.js.下载"></script>
<script src="./list_files/jquery-form.min.js.下载"></script>
<script src="./list_files/jquery-ajaxfileuploader.min.js.下载"></script>
<script src="./list_files/jquery.minicolors.min.js.下载"></script>
<script src="./list_files/jquery-cookie.min.js.下载"></script>
<script src="./list_files/jquery.ztree.all.min.js.下载"></script>
<script src="./list_files/cn_WdatePicker.js.下载"></script><link href="./list_files/WdatePicker.css" rel="stylesheet" type="text/css">
<script src="./list_files/swfupload.js.下载"></script>
<script src="./list_files/swfupload.queue.js.下载"></script>
<script src="./list_files/fileprogress.js.下载"></script>
<script src="./list_files/handlers.js.下载"></script>
<script src="./list_files/ueditor.config.js.下载"></script>
<script src="./list_files/ueditor.all.min.js.下载"></script>
<script src="./list_files/zh-cn.js.下载"></script>
<script src="./list_files/editormd.min.js.下载"></script>
<script src="./list_files/editormd.plugin.js.下载"></script>
<script src="./list_files/to-markdown.js.下载"></script>
<script src="./list_files/echarts.common.min.js.下载"></script>
<script src="./list_files/plugins.js.下载"></script>
<script src="./list_files/jspxcms_choose.js.下载"></script>
<script type="text/javascript">
$(function() {
	$("#sortHead").headSort();
});
function confirmDelete() {
	return confirm("您确定删除吗？");
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
	<h1>会员组 - 列表 <small>(共 2 条)</small></h1>
</div>
<div class="content">
	<div class="box box-primary">
		<div class="box-body table-responsive">
			<form class="form-inline ls-search" action="http://111.230.147.160:8080/jsp/cmscp/core/member_group/list.do" method="get">
				<div class="form-group">
				  <label>名称</label>
			  	<input class="form-control input-sm" type="text" name="search_CONTAIN_name" value="">
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
						
					</div>
					<div class="btn-group">
						
						<button class="btn btn-default" type="button" onclick="return optDelete(this.form);">删除</button>
						
					</div>
				</div>
				<table id="pagedTable" class="table table-condensed table-bordered table-hover ls-tb">
				  <thead id="sortHead" pagesort="" pagedir="" pageurl="list.do?page_sort={0}&amp;page_sort_dir={1}&amp;">
				  <tr class="ls_table_th">
				    <th width="25"><input type="checkbox" onclick="Cms.check(&#39;ids&#39;,this.checked);"></th>
				    <th width="130">操作</th>
				    <th width="30" class="ls-th-sort"><span class="ls-sort" pagesort="id">ID</span></th>
				    <th class="ls-th-sort"><span class="ls-sort" pagesort="name">名称</span></th>
				    <th class="ls-th-sort"><span class="ls-sort" pagesort="type">类型</span></th>
				    <th class="ls-th-sort"><span class="ls-sort" pagesort="description">描述</span></th>
				  </tr>
				  </thead>
				  <tbody>
				  
				  <tr ondblclick="location.href=$(&#39;#edit_opt_0&#39;).attr(&#39;href&#39;);">
				    <td></td>
				    <td align="center">
							
				      
				        
				          <span class="disabled">复制</span>
				        
				        
				      
				      
							
				      <a id="edit_opt_0" href="http://111.230.147.160:8080/jsp/cmscp/core/member_group/edit.do?id=0&amp;position=0&amp;" class="ls-opt">修改</a>
				      
							
							
								
								  <span class="disabled">删除</span>
								
								
							
				      
				     </td>
				    <td>0</td>
				    <td>游客组</td>
				    <td>游客组</td>
				    <td></td>
				  </tr>
				  
				  <tr ondblclick="location.href=$(&#39;#edit_opt_1&#39;).attr(&#39;href&#39;);">
				    <td><input type="checkbox" name="ids" value="1"></td>
				    <td align="center">
							
				      
				        
				        
						      <a id="copy_opt_1" href="http://111.230.147.160:8080/jsp/cmscp/core/member_group/create.do?id=1&amp;" class="ls-opt">复制</a>
				        
				      
				      
							
				      <a id="edit_opt_1" href="http://111.230.147.160:8080/jsp/cmscp/core/member_group/edit.do?id=1&amp;position=1&amp;" class="ls-opt">修改</a>
				      
							
							
								
								
						      <a href="http://111.230.147.160:8080/jsp/cmscp/core/member_group/delete.do?ids=1&amp;" onclick="return confirmDelete();" class="ls-opt">删除</a>
								
							
				      
				     </td>
				    <td>1</td>
				    <td>普通会员</td>
				    <td>普通组</td>
				    <td></td>
				  </tr>
				  
				  </tbody>
				</table>
				
			</form>
		</div>
	</div>
</div>

</body></html>