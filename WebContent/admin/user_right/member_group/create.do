<!DOCTYPE html>
<!-- saved from url=(0066)http://111.230.147.160:8080/jsp/cmscp/core/member_group/create.do? -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-store">
<meta http-equiv="Expires" content="0">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>jspXCMS管理平台</title>
<meta name="renderer" content="webkit">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link rel="stylesheet" href="./create_files/bootstrap.min.css">
<link rel="stylesheet" href="./create_files/font-awesome.min.css">
<link rel="stylesheet" href="./create_files/ionicons.min.css">
<link rel="stylesheet" href="./create_files/jquery-ui.css">
<link rel="stylesheet" href="./create_files/jquery.minicolors.css">
<link rel="stylesheet" href="./create_files/metroStyle.css">
<link rel="stylesheet" href="./create_files/AdminLTE.min.css">
<link rel="stylesheet" href="./create_files/skin-blue.min.css">
<link rel="stylesheet" href="./create_files/process.css">
<link rel="stylesheet" href="./create_files/editormd.min.css">
<link rel="stylesheet" href="./create_files/main.css">
<!--[if lt IE 9]>
<script src="/jsp/static/vendor/html5shiv/html5shiv.min.js"></script>
<script src="/jsp/static/vendor/respond/respond.min.js"></script>
<![endif]-->
<script>
CTX="/jsp";CMSCP="/cmscp";
window.UEDITOR_HOME_URL = "/jsp/static/vendor/ueditor/";
</script>
<script src="./create_files/jquery.min.js.下载"></script>
<script src="./create_files/bootstrap.min.js.下载"></script>
<script src="./create_files/jquery-ui.js.下载"></script>
<script src="./create_files/jquery-validation.min.js.下载"></script>
<script src="./create_files/jquery.validation_zh_CN.js.下载"></script>
<script src="./create_files/jquery-form.min.js.下载"></script>
<script src="./create_files/jquery-ajaxfileuploader.min.js.下载"></script>
<script src="./create_files/jquery.minicolors.min.js.下载"></script>
<script src="./create_files/jquery-cookie.min.js.下载"></script>
<script src="./create_files/jquery.ztree.all.min.js.下载"></script>
<script src="./create_files/cn_WdatePicker.js.下载"></script><link href="./create_files/WdatePicker.css" rel="stylesheet" type="text/css">
<script src="./create_files/swfupload.js.下载"></script>
<script src="./create_files/swfupload.queue.js.下载"></script>
<script src="./create_files/fileprogress.js.下载"></script>
<script src="./create_files/handlers.js.下载"></script>
<script src="./create_files/ueditor.config.js.下载"></script>
<script src="./create_files/ueditor.all.min.js.下载"></script>
<script src="./create_files/zh-cn.js.下载"></script>
<script src="./create_files/editormd.min.js.下载"></script>
<script src="./create_files/editormd.plugin.js.下载"></script>
<script src="./create_files/to-markdown.js.下载"></script>
<script src="./create_files/echarts.common.min.js.下载"></script>
<script src="./create_files/plugins.js.下载"></script>
<script src="./create_files/jspxcms_choose.js.下载"></script>
<script type="text/javascript">
$(function() {
	$("#validForm").validate();
	$("input[name='name']").focus();
});
function confirmDelete() {
	return confirm("您确定删除吗？");
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
	<h1>会员组 - 新增</h1>
</div>
<div class="content">
	<div class="box box-primary">
		<form class="form-horizontal" id="validForm" action="http://111.230.147.160:8080/jsp/cmscp/core/member_group/save.do" method="post" novalidate="novalidate">
			


			<input type="hidden" name="oid">
			<input type="hidden" name="position">
			<input type="hidden" id="redirect" name="redirect" value="edit">
			<div class="box-header with-border">
				<div class="btn-toolbar">
					<div class="btn-group">
						
						<button class="btn btn-default" type="button" onclick="location.href=&#39;create.do?&#39;;" disabled="">新增</button>
						
					</div>
					<div class="btn-group">
						
						<button class="btn btn-default" type="button" onclick="location.href=&#39;create.do?id=&amp;&#39;;" disabled="">复制</button>
						
						
						<button class="btn btn-default" type="button" onclick="if(confirmDelete()){location.href=&#39;delete.do?ids=&amp;&#39;;}" disabled="">删除</button>
						
					</div>
					<div class="btn-group">
						<button class="btn btn-default" type="button" onclick="location.href=&#39;edit.do?id=&amp;position=-1&amp;&#39;;" disabled="disabled">上一条</button>
						<button class="btn btn-default" type="button" onclick="location.href=&#39;edit.do?id=&amp;position=1&amp;&#39;;" disabled="disabled">下一条</button>
					</div>
					<div class="btn-group">
						<button class="btn btn-default" type="button" onclick="location.href=&#39;list.do?&#39;;">返回</button>
					</div>
				</div>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
	            <label class="col-sm-4 control-label"><em class="required">*</em>名称</label>
	            <div class="col-sm-8">
	            	<input type="text" name="name" class="form-control required">
	            </div>
	          </div>
	        </div>
					<div class="col-sm-6">
						<div class="form-group">
	            <label class="col-sm-4 control-label">描述</label>
	            <div class="col-sm-8">
					    	<input type="text" name="description" maxlength="255" class="form-control">
	            </div>
	          </div>
	        </div>
	      </div>
				<div class="row">
					<div class="col-sm-12">
						<div class="form-group">
	            <label class="col-sm-2 control-label">浏览权限</label>
	            <div class="col-sm-10">
	            	<span id="viewNodeIds">
						  	
						  	</span>
						  	<span id="viewNodeIdsNumber">
						  	
						  	</span>
						  	<span id="viewNodeIdsName">
						  	
						  	</span>
						  	<div class="input-group">
							    <input type="text" id="viewNodeIdsNameDisplay" class="form-control" readonly="readonly">
							    <span class="input-group-btn">
							    	<button class="btn btn-default" id="viewNodeIdsButton" type="button">选择</button>
							    </span>
						  	</div>
								<script type="text/javascript">
								$(function(){
						    	Cms.f7.nodePerms("viewNodeIds",{
						    		settings: {"title": "选择栏目"}
						    	});
						    });
								</script>
	            </div>
	          </div>
	        </div>
	      </div>
				<div class="row">
					<div class="col-sm-12">
						<div class="form-group">
	            <label class="col-sm-2 control-label">投稿权限</label>
	            <div class="col-sm-10">
	            	<span id="contriNodeIds">
						  	
						  	</span>
						  	<span id="contriNodeIdsNumber">
						  	
						  	</span>
						  	<span id="contriNodeIdsName">
						  	
						  	</span>
						  	<div class="input-group">
							    <input type="text" id="contriNodeIdsNameDisplay" class="form-control" readonly="readonly">
							    <span class="input-group-btn">
							    	<button class="btn btn-default" id="contriNodeIdsButton" type="button">选择</button>
							    </span>
						    </div>
								<script type="text/javascript">
								$(function(){
						    	Cms.f7.nodePerms("contriNodeIds",{
						    		settings: {"title": "选择栏目"}
						    	});
						    });
								</script>
	            </div>
	          </div>
	        </div>
	      </div>
				<div class="row">
					<div class="col-sm-12">
						<div class="form-group">
	            <label class="col-sm-2 control-label">评论权限</label>
	            <div class="col-sm-10">
	            	<span id="commentNodeIds">
						  	
						  	</span>
						  	<span id="commentNodeIdsNumber">
						  	
						  	</span>
						  	<span id="commentNodeIdsName">
						  	
						  	</span>
						  	<div class="input-group">
						    	<input type="text" id="commentNodeIdsNameDisplay" class="form-control" readonly="readonly">
							    <span class="input-group-btn">
							    	<button class="btn btn-default" id="commentNodeIdsButton" type="button">选择</button>
							    </span>
						    </div>
								<script type="text/javascript">
								$(function(){
						    	Cms.f7.nodePerms("commentNodeIds",{
						    		settings: {"title": "选择栏目"}
						    	});
						    });
								</script>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
			<div class="box-footer">
    		<input type="hidden" name="type" value="0">
	      <button class="btn btn-primary" type="submit">保存</button>
	      <button class="btn btn-default" type="submit" onclick="$(&#39;#redirect&#39;).val(&#39;list&#39;);">保存并返回</button>
	      
	      <button class="btn btn-default" type="submit" onclick="$(&#39;#redirect&#39;).val(&#39;create&#39;);">保存并新增</button>
     		
			</div>
		</form>
	</div>
</div>

</body></html>