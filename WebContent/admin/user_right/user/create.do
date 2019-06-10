<!DOCTYPE html>
<!-- saved from url=(0058)http://111.230.147.160:8080/jsp/cmscp/core/user/create.do? -->
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
<script>
$(function() {
	$("#validForm").validate();
	$("input[name='username']").focus();
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
	<h1>用户管理 - 新增</h1>
</div>

<div class="content">
	<div class="box box-primary">
		<form class="form-horizontal" id="validForm" action="http://111.230.147.160:8080/jsp/cmscp/core/user/save.do" method="post" novalidate="novalidate">
			


			<input type="hidden" name="oid">
			<input type="hidden" name="position">
			<input type="hidden" id="redirect" name="redirect" value="edit">
			<div class="box-header with-border">
				<div class="btn-toolbar">
					<div class="btn-group">
						
						<button class="btn btn-default" type="button" onclick="location.href=&#39;create.do?orgId=1&amp;&#39;;" disabled="disabled">新增</button>
						
						
						<button class="btn btn-default" type="button" onclick="location.href=&#39;create.do?id=&amp;&#39;;" disabled="disabled">复制</button>
						
					</div>
					<div class="btn-group">
						
						<button class="btn btn-default" type="button" onclick="if(confirmDelete()){location.href=&#39;delete.do?ids=&amp;&#39;;}" disabled="disabled">删除</button>
						
					</div>
					<div class="btn-group">
						<button class="btn btn-default" type="button" onclick="location.href=&#39;edit.do?id=&amp;position=-1&amp;&#39;;" disabled="disabled">上一条</button>
						<button class="btn btn-default" type="button" onclick="location.href=&#39;edit.do?id=&amp;position=1&amp;&#39;;" disabled="disabled">下一条</button>
					</div>
					<div class="btn-group">
						<button class="btn btn-default" type="button" onclick="location.href=&#39;main.do?&#39;;">返回</button>
					</div>
				</div>		
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
	            <label class="col-sm-4 control-label"><em class="required">*</em>组织</label>
	            <div class="col-sm-8">
								<input type="hidden" id="orgId" name="orgId" value="1">
								<input type="hidden" id="orgIdNumber" value="1">
								<div class="input-group">
									<input type="text" id="orgIdName" value="集团总部" class="form-control required" readonly="readonly">
									<span class="input-group-btn">
										<button class="btn btn-default" id="orgIdButton" type="button">选择</button>
									</span>
								</div>
								<script type="text/javascript">
								$(function(){
									Cms.f7.org("orgId","orgIdName",{
										settings: {"title": "选择组织"},
									  params:{"allowRoot":"false","treeNumber": "0000"}
									});
								});
								</script>
            	</div>
           	</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
	          	<label for="orgIdsNameDisplay" class="col-sm-4 control-label">扩展组织</label>
	            <div class="col-sm-8">
	              <div id="orgIds">
								
								
								</div>
								<div id="orgIdsNumber">
								
								</div>
								<div id="orgIdsName">
								
								</div>
								<div class="input-group">
									<input type="text" id="orgIdsNameDisplay" class="form-control" readonly="readonly">
									<span class="input-group-btn">
										<button class="btn btn-default" id="orgIdsButton" type="button">选择</button>
									</span>
								</div>
								<script type="text/javascript">
								$(function(){
									Cms.f7.orgMulti("orgIds",{
										settings: {"title": "请选择组织"},
										params: {"treeNumber": "0000"}
									});
								});
								</script>
							</div>
            </div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
	            <label for="username" class="col-sm-4 control-label"><em class="required">*</em>用户名</label>
	            <div class="col-sm-8">
	            	<input type="text" id="username" name="username" class="form-control {required:true,remote:{url:&#39;check_username.do&#39;,type:&#39;post&#39;,data:{original:&#39;&#39;}},messages:{remote:&#39;用户名已存在&#39;}}">
	            </div>
	          </div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
	            <label for="realName" class="col-sm-4 control-label">用户实名</label>
	            <div class="col-sm-8">
	              <input type="text" id="realName" name="realName" maxlength="100" class="form-control">
	            </div>
	          </div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
	            <label for="rawPassword" class="col-sm-4 control-label">密码</label>
	            <div class="col-sm-8">
	            	<input class="form-control" id="rawPassword" type="password" name="rawPassword">
	            </div>
	          </div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
	            <label for="againPassword" class="col-sm-4 control-label">确认密码</label>
	            <div class="col-sm-8">
	              <input id="againPassword" type="password" name="againPassword" class="form-control {equalTo:&#39;#rawPassword&#39;}">
	            </div>
	          </div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="form-group">
	            <label for="type" class="col-sm-2 control-label">
	            	角色
					    	<span class="in-prompt" title="角色是后台管理的权限，类型为管理员，才可赋予角色。用户只能被授予比自身等级更低或相同的角色。"></span>
					    </label>
	            <div class="col-sm-10 form-inline">
					    	<select class="form-control" id="type" name="type" onchange="$(&#39;#roles&#39;).toggle($(&#39;#type&#39;).val()==1);$(&#39;#roles input&#39;).each(function(){$(this).prop(&#39;disabled&#39;,$(&#39;#type&#39;).val()==0||$(this).attr(&#39;data-disabled&#39;)==&#39;true&#39;)});">
					    		<option value="0">会员</option>
					    		<option value="1" selected="selected">管理员</option>
					    	</select> &nbsp;
					    	<span id="roles">
					    		
					    			<label class="checkbox-inline"><input type="checkbox" name="roleIds" value="1">管理员(1)</label>
					    		
					    	</span>
	            </div>
	          </div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
	            <label for="groupId" class="col-sm-4 control-label">会员组</label>
	            <div class="col-sm-8">
					    	<select class="form-control" id="groupId" name="groupId">
					    		<option value="1">普通会员</option>
					    	</select>
	            </div>
	          </div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
	            <label for="status" class="col-sm-4 control-label">状态</label>
	            <div class="col-sm-8">
					    	<select class="form-control" id="status" name="status">
					    		<option value="0" selected="selected">正常</option>
					    		<option value="1">锁定</option>
					    		<option value="2">待验证</option>
					    	</select>
	            </div>
	          </div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="form-group">
	            <label class="col-sm-2 control-label">扩展会员组</label>
	            <div class="col-sm-10">
    						<label class="checkbox-inline"><input type="checkbox" name="groupIds" value="1">普通会员</label>
	            </div>
	          </div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
	            <label for="rank" class="col-sm-4 control-label">
	            	等级
	            	<span class="in-prompt" title="等级数越小，级别越高。用户不能提升自身等级。低级别用户不可查看高级别用户。用户只能被授予比自身等级更低或相同的角色。等级为0或1的用户才可被授予全局用户和全局组织的管理权限。"></span>
	            </label>
	            <div class="col-sm-8">
	            	<input type="text" id="rank" name="rank" value="1" class="form-control {digits:true,min:0,max:2147483647}">
	            </div>
	          </div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
	            <label class="col-sm-4 control-label">性别</label>
	            <div class="col-sm-8">
								<label class="radio-inline"><input type="radio" value="M" name="gender">男</label>
								<label class="radio-inline"><input type="radio" value="F" name="gender">女</label>
								<label class="radio-inline"><input type="radio" value="null" name="gender">保密</label>
	            </div>
	          </div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
	            <label for="qqOpenid" class="col-sm-4 control-label">QQ OPENID</label>
	            <div class="col-sm-8">
	            	<input type="text" id="qqOpenid" name="qqOpenid" maxlength="64" class="form-control">
	            </div>
	          </div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
	            <label for="weiboUid" class="col-sm-4 control-label">WEIBO UID</label>
	            <div class="col-sm-8">
								<input type="text" id="weiboUid" name="weiboUid" maxlength="64" class="form-control">
	            </div>
	          </div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
	            <label for="email" class="col-sm-4 control-label">电子邮箱</label>
	            <div class="col-sm-8">
	            	<input type="text" id="email" name="email" maxlength="100" class="form-control email">
	            </div>
	          </div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
	            <label for="mobile" class="col-sm-4 control-label">手机号码</label>
	            <div class="col-sm-8">
								<input type="text" id="mobile" name="mobile" maxlength="100" class="form-control">
	            </div>
	          </div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="form-group">
	            <label for="id" class="col-sm-2 control-label">自我介绍</label>
	            <div class="col-sm-10">
	            	<textarea id="bio" name="bio" rows="3" maxlength="255" class="form-control"></textarea>
	            </div>
	          </div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
	            <label for="comeFrom" class="col-sm-4 control-label">来自</label>
	            <div class="col-sm-8">
	            	<input type="text" id="comeFrom" name="comeFrom" maxlength="100" class="form-control">
	            </div>
	          </div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
	            <label for="weixin" class="col-sm-4 control-label">微信</label>
	            <div class="col-sm-8">
								<input type="text" id="weixin" name="weixin" maxlength="100" class="form-control">
	            </div>
	          </div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
	            <label for="qq" class="col-sm-4 control-label">QQ</label>
	            <div class="col-sm-8">
	            	<input type="text" id="qq" name="qq" maxlength="100" class="form-control">
	            </div>
	          </div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
	            <label for="msn" class="col-sm-4 control-label">MSN</label>
	            <div class="col-sm-8">
								<input type="text" id="msn" name="msn" maxlength="100" class="form-control">
	            </div>
	          </div>
					</div>
				</div>
			  
			  
				
			  
			  
			</div>
			<div class="box-footer">
				<button class="btn btn-primary" type="submit">保存</button>
      	<button class="btn btn-default" type="submit" onclick="$(&#39;#redirect&#39;).val(&#39;list&#39;);">保存并返回</button>
	      
	      <button class="btn btn-default" type="submit" onclick="$(&#39;#redirect&#39;).val(&#39;create&#39;);">保存并新增</button>
	      
			</div>
		</form>
	</div>
</div>

</body></html>