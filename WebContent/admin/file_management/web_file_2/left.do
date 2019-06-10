<!DOCTYPE html>
<!-- saved from url=(0061)http://111.230.147.160:8080/jsp/cmscp/core/web_file_2/left.do -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-store">
<meta http-equiv="Expires" content="0">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>jspXCMS管理平台</title>
<meta name="renderer" content="webkit">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link rel="stylesheet" href="./left_files/bootstrap.min.css">
<link rel="stylesheet" href="./left_files/font-awesome.min.css">
<link rel="stylesheet" href="./left_files/ionicons.min.css">
<link rel="stylesheet" href="./left_files/jquery-ui.css">
<link rel="stylesheet" href="./left_files/jquery.minicolors.css">
<link rel="stylesheet" href="./left_files/metroStyle.css">
<link rel="stylesheet" href="./left_files/AdminLTE.min.css">
<link rel="stylesheet" href="./left_files/skin-blue.min.css">
<link rel="stylesheet" href="./left_files/process.css">
<link rel="stylesheet" href="./left_files/editormd.min.css">
<link rel="stylesheet" href="./left_files/main.css">
<!--[if lt IE 9]>
<script src="/jsp/static/vendor/html5shiv/html5shiv.min.js"></script>
<script src="/jsp/static/vendor/respond/respond.min.js"></script>
<![endif]-->
<script>
CTX="/jsp";CMSCP="/cmscp";
window.UEDITOR_HOME_URL = "/jsp/static/vendor/ueditor/";
</script>
<script src="./left_files/jquery.min.js.下载"></script>
<script src="./left_files/bootstrap.min.js.下载"></script>
<script src="./left_files/jquery-ui.js.下载"></script>
<script src="./left_files/jquery-validation.min.js.下载"></script>
<script src="./left_files/jquery.validation_zh_CN.js.下载"></script>
<script src="./left_files/jquery-form.min.js.下载"></script>
<script src="./left_files/jquery-ajaxfileuploader.min.js.下载"></script>
<script src="./left_files/jquery.minicolors.min.js.下载"></script>
<script src="./left_files/jquery-cookie.min.js.下载"></script>
<script src="./left_files/jquery.ztree.all.min.js.下载"></script>
<script src="./left_files/cn_WdatePicker.js.下载"></script><link href="./left_files/WdatePicker.css" rel="stylesheet" type="text/css">
<script src="./left_files/swfupload.js.下载"></script>
<script src="./left_files/swfupload.queue.js.下载"></script>
<script src="./left_files/fileprogress.js.下载"></script>
<script src="./left_files/handlers.js.下载"></script>
<script src="./left_files/ueditor.config.js.下载"></script>
<script src="./left_files/ueditor.all.min.js.下载"></script>
<script src="./left_files/zh-cn.js.下载"></script>
<script src="./left_files/editormd.min.js.下载"></script>
<script src="./left_files/editormd.plugin.js.下载"></script>
<script src="./left_files/to-markdown.js.下载"></script>
<script src="./left_files/echarts.common.min.js.下载"></script>
<script src="./left_files/plugins.js.下载"></script>
<script src="./left_files/jspxcms_choose.js.下载"></script>
<style>
body{overflow-x:auto;}
.ztree li span.button.switch.level0 {visibility:hidden; width:1px;}
.ztree li ul.level0 {padding:0; background:none;}
</style>

<script>
function dblClickExpand(treeId, treeNode) {
	return treeNode.level > 0;
}
function onClick(event, treeId, treeNode, clickFlag) {
	$.cookie('select_id',treeNode.id);
	var url = "update.do?" + $.param({"parentId":treeNode.id});	
	parent.frames["center"].location.href = url;
	//用windows.open在ie8下会导致界面闪烁，不知为何。
}
function openIdsToCookie() {
	var treeObj = $.fn.zTree.getZTreeObj("tree");	
	var root = treeObj.getNodeByTId("tree_1");
	if(!root) {
		return;
	}
	var nodeArr = [root];
	var start = 0, end = nodeArr.length;
	var openIds = "";
	while(start<end) {
		var node = nodeArr[start++];
		if(node.open) {
			openIds += node.id + ",";
			var children = node.children;
			if(children && children.length>0) {
				for(var i = 0,len=children.length;i<len;i++) {
					if(children[i].open) {
						nodeArr[end++] = children[i];						
					}
				}
			}
		}
	}
	if(openIds.length>0) {
		openIds = openIds.substring(0,openIds.length-1);
		$.cookie('open_ids',openIds);
	} else {
		$.cookie('open_ids',null);
	}
}
function onExpand(event, treeId, treeNode) {
	openIdsToCookie();
}
function onCollapse(event, treeId, treeNode) {
	openIdsToCookie();
}
var setting = {
	async: {
		enable: true,
		url:"left_tree.do",
		autoParam:["id=parentId"]
	},
	view: {
		expandSpeed: "",
		dblClickExpand: dblClickExpand
	},
	callback: {
		onClick: onClick,
		onExpand: onExpand,
		onCollapse: onCollapse
	},
	data: {
		simpleData: {
			enable: true
		}
	}
};
var zNodes =[
  {"id":"/1","pId":null,"name":"uploads","open":true},
  
];
function reload() {
	location.href = "left.do";
}
function fireClick(){
	var treeObj = $.fn.zTree.getZTreeObj("tree");
	var treeNodeArr = treeObj.getSelectedNodes();
	if(treeNodeArr.length>0) {
		onClick(null,"tree",treeNodeArr[0],null);
	}
}
$(function(){
	var treeObj = $.fn.zTree.init($("#tree"), setting, zNodes);
	
	
	
		//保持展开
		var openIds = $.cookie("open_ids");
		if(openIds) {
			var idArr = openIds.split(",");
			for(var i=0,len=idArr.length;i<len;i++) {
				var nodeObj = treeObj.getNodeByParam("id",idArr[i]);
				if(nodeObj) {
					treeObj.expandNode(nodeObj,true,false,false,false);
				}
			}			
		}
		//保持选择
		var selectId = $.cookie("select_id");
		if(selectId) {
			var nodeObj = treeObj.getNodeByParam("id",selectId);
			if(nodeObj) {
				treeObj.selectNode(nodeObj);			
			}
		}
	
	
});
</script>
</head><body class="skin-blue content-body">
<div style="padding:16px 0 2px 12px;font-size:16px;">上传文件夹</div>
<ul id="tree" class="ztree" style="margin:7px 0 0 7px;"><li id="tree_1" class="level0" tabindex="0" hidefocus="true" treenode=""><span id="tree_1_switch" title="" class="button level0 switch root_docu" treenode_switch=""></span><a id="tree_1_a" class="level0 curSelectedNode" treenode_a="" onclick="" target="_blank" style="" title="uploads"><span id="tree_1_ico" title="" treenode_ico="" class="button ico_docu" style=""></span><span id="tree_1_span" class="node_name">uploads</span></a></li></ul>

</body></html>