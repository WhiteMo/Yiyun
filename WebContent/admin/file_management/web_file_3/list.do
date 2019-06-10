<!DOCTYPE html>
<!-- saved from url=(0061)http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/list.do -->
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
<script>
$(function() {
  $("#sortHead").headSort();
  $("#createDirForm").validate();
  $("#renameForm").validate();
  $("#createDirDialog").dialog({
    autoOpen: false,
    width: 300,
    height: 150,
    modal: true,
    position: { my: "center top+20", at: "center top", of: window },
    buttons: {
      "OK": function() {
        $("#createDirForm").submit();
        $(this).dialog("close");
      },
      Cancel: function() {
        $(this).dialog("close");
      }
    }
  });
  $("#renameDialog").dialog({
    autoOpen: false,
    width: 300,
    height: 150,
    modal: true,
    position: { my: "center bottom", at: "center center", of: window },
    buttons: {
      "OK": function() {
        $("#renameForm").submit();
        $(this).dialog("close");
      },
      Cancel: function() {
        $(this).dialog("close");
      }
    }
  });  
  $("span[imgUrl]").each(function(){
    var span = $(this);
    var img = null;
    span.mouseenter(function(){
      if(!img) {
        img = Bw.imageDim(span.attr("imgUrl"),{maxWidth:300,maxHeigth:200,of:span});
      } else {
        img.show();
        img.positionSideOf(span);
      }
    }).mouseleave(function(){
      if(img) {
        img.hide();
        img.offset({"left":"0","top":"0"});
      }
    });
  });
});
function optRename(id,name){
  $("#renameDialog").dialog("open");
  $("#renameForm input[name='id']").val(id);
  $("#renameForm input[name='name']").val(name).select();
}
function optMove(form) {
  if(Cms.checkeds("ids")==0) {
    alert("请选择数据！");
    return false;
  }
  
  var url = "choose_dir.do?parentId=";
  $("input[name='ids']:checkbox:checked").each(function(){
    url += "&ids="+encodeURI($(this).val());
  });
  url += "&d="+new Date()*1;
  $("<div>",{"title":"移动至..."}).appendTo(document.body).load(url, function(){
    $(this).dialog({
      width: 350,
      height: 450,
      modal: true,
      position: { my: "center top", at: "center top", of: window },
      buttons: {
        "OK": function() {
          var dest = $("#f7_id").val();
          if(dest.length<=0) {
            alert("please select dir!");
            return;
          }
          $(this).dialog("close");
          $("<input>",{
            "type":"hidden",
            "name":"dest",
            "value":dest
          }).appendTo(form);
          form.action = "move.do";
          form.submit();
        },
        Cancel: function() {
          $(this).dialog("close");
        }
      }
    });
  }); 
}
function confirmDelete() {
  return confirm("您确定删除吗？");
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
function optPost(form,action) {
  if(Cms.checkeds("ids")==0) {
    alert("请选择数据！");
    return false;
  }
  form.action=action;
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
	<h1>全站文件 - 列表 -  <small>(共 9 条)</small></h1>
</div>
<div class="content">
	<div class="box box-primary">
		<div class="box-body table-responsive">
			<form id="searchForm" action="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/list.do" method="get" class="form-inline ls-search">
				<input type="hidden" name="parentId">
				<div class="form-group">
				  <label for="search_name">文件名</label>
				  <input class="form-control input-sm" type="text" id="search_name" name="search_name" value="" style="width:150px;">
				</div>
			  <button class="btn btn-default btn-sm" type="submit">搜索</button>
			</form>
			<form class="form-inline" action="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/batch_update.do" method="post">
				<input type="hidden" name="parentId">
				<div style="margin-bottom:10px;">
				  
				  <label class="checkbox-inline" for="zipUpload"><input type="checkbox" id="zipUpload" onclick="swfupload.setFileTypes(this.checked?&#39;*.zip&#39;:&#39;*.*&#39;,this.checked?&#39;ZIP Files&#39;:&#39;All Files&#39;);swfupload.setUploadURL(this.checked?location.pathname.substring(0,location.pathname.lastIndexOf(&#39;/&#39;)+1)+&#39;zip_upload.do;jsessionid=30185BE7AAE13B531C4DE7E765D8B1C7?_site=&#39; + ($.cookie(&#39;_site&#39;)||&#39;&#39;):&#39;upload.do;jsessionid=30185BE7AAE13B531C4DE7E765D8B1C7?_site=&#39; + ($.cookie(&#39;_site&#39;)||&#39;&#39;));">ZIP上传</label>
				  
				  
				  <span id="fileSwfButton"></span><button class="btn btn-default swfbutton" type="button">上传</button>
				  <button class="btn btn-default" id="fileSwfCancel" type="button" onclick="swfupload.cancelQueue();" disabled="disabled">取消</button>
				  <script type="text/javascript">
				  var swfupload = Cms.swfUpload("file",{
					  upload_url: "upload.do;jsessionid=30185BE7AAE13B531C4DE7E765D8B1C7?_site=" + ($.cookie("_site")||""),
					  post_params: {
				      "parentId": ""
				    },
				    queue_complete_handler: function() {
				    	setTimeout(function() {
				    		  location.href=location.href;
				    	},500);
				    }
				  });
				  </script>
				  
					<div class="btn-group">
					  
					  <button class="btn btn-default" type="button" onclick="$(&#39;#createDirDialog&#39;).dialog(&#39;open&#39;);">新建文件夹</button>
					  
					  
					  <button class="btn btn-default" type="button" onclick="location.href=&#39;create.do?parentId=&amp;&#39;;">新建文档</button>
					  
					</div>
					<div class="btn-group">
					  
					  <button class="btn btn-default" type="button" onclick="return optPost(this.form,&#39;zip_download.do&#39;);">ZIP下载</button>
					  
					  
					  <button class="btn btn-default" type="button" onclick="return optPost(this.form,&#39;zip.do&#39;);">ZIP打包</button>
					  
					  
					  <button class="btn btn-default" type="button" onclick="return optMove(this.form);">移动</button>
					  
					  
					  <button class="btn btn-default" type="button" onclick="return optDelete(this.form);">删除</button>
					  
					</div>
					<div class="btn-group">
					  <button class="btn btn-default" type="button" onclick="location.href=&#39;list.do?parentId=&amp;&#39;;" disabled="disabled">上一级</button>
					</div>
					<div id="fileSwfProgress"></div>
				</div>
				<table id="pagedTable" class="table table-condensed table-bordered table-hover ls-tb">
				  <thead id="sortHead" pagesort="" pagedir="" pageurl="list.do?page_sort={0}&amp;page_sort_dir={1}&amp;parentId=&amp;">
				  <tr class="ls_table_th">
				    <th width="25"><input type="checkbox" onclick="Cms.check(&#39;ids&#39;,this.checked);"></th>
				    <th width="320">操作</th>
				    <th class="ls-th-sort"><span class="ls-sort" pagesort="name">文件名</span></th>
				    <th class="ls-th-sort"><span class="ls-sort" pagesort="lastModified">修改日期</span></th>
				    <th class="ls-th-sort"><span class="ls-sort" pagesort="type">类型</span></th>
				    <th class="ls-th-sort"><span class="ls-sort" pagesort="length">大小</span></th>
				  </tr>
				  </thead>
				  <tbody id="dblclickBody">
				  
				  <tr>
				    <td><input type="checkbox" name="ids" value="/jsp"></td>
				    <td align="center">
				      
				        
				          
				        
				        
				      
				      <a id="edit_opt_0" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/list.do?parentId=%2fjsp" class="ls-opt" style="display:none;">修改</a>
				      
				      
				      
				      
				        
				        
				        <a id="zip_download_opt_0" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/zip_download.do?ids=%2fjsp&amp;" class="ls-opt">ZIP下载</a>
				        
				      
				      
				      
				      
				      
				      
				        
				        
				        <a id="zip_opt_0" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/zip.do?ids=%2fjsp&amp;parentId=&amp;" class="ls-opt">ZIP打包</a>
				        
				      
				      
				
				      
				      
				      
				        
				        <a class="ls-opt-disabled">ZIP解压</a>
				        
				        
				      
				      
				      
				      
				      
				        
				          
				        
				        
				      
				      
				        
				        
				        <a id="open_opt_0" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/list.do?parentId=%2fjsp" class="ls-opt">打开</a>
				        
				      
				      
				      
				      
				      
				        
				        
				        <a href="javascript:void(0);" onclick="optRename(&#39;/jsp&#39;,&#39;jsp&#39;);" class="ls-opt">重命名</a>
				        
				      
				      
				      
				      
				      
				      
				        
				        
				        <a href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/delete.do?ids=%2fjsp&amp;parentId=&amp;" onclick="return confirmDelete();" class="ls-opt">删除</a>
				        
				      
				      
				      
				     </td>
				    <td onclick="location.href=&#39;list.do?parentId=%2fjsp&#39;;" style="cursor:pointer;">
				      <div id="beanname0" class="file-directory"><span>jsp</span></div>
				    </td>
				    <td onclick="location.href=&#39;list.do?parentId=%2fjsp&#39;;" style="cursor:pointer;">2018-03-15 12:45</td>
				    <td onclick="location.href=&#39;list.do?parentId=%2fjsp&#39;;" style="cursor:pointer;">文件夹</td>
				    <td align="right" onclick="location.href=&#39;list.do?parentId=%2fjsp&#39;;" style="cursor:pointer;"></td>
				  </tr>
				  
				  <tr>
				    <td><input type="checkbox" name="ids" value="/jspxcms-8.0.3-release"></td>
				    <td align="center">
				      
				        
				          
				        
				        
				      
				      <a id="edit_opt_1" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/list.do?parentId=%2fjspxcms-8.0.3-release" class="ls-opt" style="display:none;">修改</a>
				      
				      
				      
				      
				        
				        
				        <a id="zip_download_opt_1" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/zip_download.do?ids=%2fjspxcms-8.0.3-release&amp;" class="ls-opt">ZIP下载</a>
				        
				      
				      
				      
				      
				      
				      
				        
				        
				        <a id="zip_opt_1" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/zip.do?ids=%2fjspxcms-8.0.3-release&amp;parentId=&amp;" class="ls-opt">ZIP打包</a>
				        
				      
				      
				
				      
				      
				      
				        
				        <a class="ls-opt-disabled">ZIP解压</a>
				        
				        
				      
				      
				      
				      
				      
				        
				          
				        
				        
				      
				      
				        
				        
				        <a id="open_opt_1" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/list.do?parentId=%2fjspxcms-8.0.3-release" class="ls-opt">打开</a>
				        
				      
				      
				      
				      
				      
				        
				        
				        <a href="javascript:void(0);" onclick="optRename(&#39;/jspxcms-8.0.3-release&#39;,&#39;jspxcms-8.0.3-release&#39;);" class="ls-opt">重命名</a>
				        
				      
				      
				      
				      
				      
				      
				        
				        
				        <a href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/delete.do?ids=%2fjspxcms-8.0.3-release&amp;parentId=&amp;" onclick="return confirmDelete();" class="ls-opt">删除</a>
				        
				      
				      
				      
				     </td>
				    <td onclick="location.href=&#39;list.do?parentId=%2fjspxcms-8.0.3-release&#39;;" style="cursor:pointer;">
				      <div id="beanname1" class="file-directory"><span>jspxcms-8.0.3-release</span></div>
				    </td>
				    <td onclick="location.href=&#39;list.do?parentId=%2fjspxcms-8.0.3-release&#39;;" style="cursor:pointer;">2018-03-15 12:44</td>
				    <td onclick="location.href=&#39;list.do?parentId=%2fjspxcms-8.0.3-release&#39;;" style="cursor:pointer;">文件夹</td>
				    <td align="right" onclick="location.href=&#39;list.do?parentId=%2fjspxcms-8.0.3-release&#39;;" style="cursor:pointer;"></td>
				  </tr>
				  
				  <tr>
				    <td><input type="checkbox" name="ids" value="/static"></td>
				    <td align="center">
				      
				        
				          
				        
				        
				      
				      <a id="edit_opt_2" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/list.do?parentId=%2fstatic" class="ls-opt" style="display:none;">修改</a>
				      
				      
				      
				      
				        
				        
				        <a id="zip_download_opt_2" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/zip_download.do?ids=%2fstatic&amp;" class="ls-opt">ZIP下载</a>
				        
				      
				      
				      
				      
				      
				      
				        
				        
				        <a id="zip_opt_2" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/zip.do?ids=%2fstatic&amp;parentId=&amp;" class="ls-opt">ZIP打包</a>
				        
				      
				      
				
				      
				      
				      
				        
				        <a class="ls-opt-disabled">ZIP解压</a>
				        
				        
				      
				      
				      
				      
				      
				        
				          
				        
				        
				      
				      
				        
				        
				        <a id="open_opt_2" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/list.do?parentId=%2fstatic" class="ls-opt">打开</a>
				        
				      
				      
				      
				      
				      
				        
				        
				        <a href="javascript:void(0);" onclick="optRename(&#39;/static&#39;,&#39;static&#39;);" class="ls-opt">重命名</a>
				        
				      
				      
				      
				      
				      
				      
				        
				        
				        <a href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/delete.do?ids=%2fstatic&amp;parentId=&amp;" onclick="return confirmDelete();" class="ls-opt">删除</a>
				        
				      
				      
				      
				     </td>
				    <td onclick="location.href=&#39;list.do?parentId=%2fstatic&#39;;" style="cursor:pointer;">
				      <div id="beanname2" class="file-directory"><span>static</span></div>
				    </td>
				    <td onclick="location.href=&#39;list.do?parentId=%2fstatic&#39;;" style="cursor:pointer;">2018-03-15 12:45</td>
				    <td onclick="location.href=&#39;list.do?parentId=%2fstatic&#39;;" style="cursor:pointer;">文件夹</td>
				    <td align="right" onclick="location.href=&#39;list.do?parentId=%2fstatic&#39;;" style="cursor:pointer;"></td>
				  </tr>
				  
				  <tr>
				    <td><input type="checkbox" name="ids" value="/template"></td>
				    <td align="center">
				      
				        
				          
				        
				        
				      
				      <a id="edit_opt_3" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/list.do?parentId=%2ftemplate" class="ls-opt" style="display:none;">修改</a>
				      
				      
				      
				      
				        
				        
				        <a id="zip_download_opt_3" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/zip_download.do?ids=%2ftemplate&amp;" class="ls-opt">ZIP下载</a>
				        
				      
				      
				      
				      
				      
				      
				        
				        
				        <a id="zip_opt_3" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/zip.do?ids=%2ftemplate&amp;parentId=&amp;" class="ls-opt">ZIP打包</a>
				        
				      
				      
				
				      
				      
				      
				        
				        <a class="ls-opt-disabled">ZIP解压</a>
				        
				        
				      
				      
				      
				      
				      
				        
				          
				        
				        
				      
				      
				        
				        
				        <a id="open_opt_3" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/list.do?parentId=%2ftemplate" class="ls-opt">打开</a>
				        
				      
				      
				      
				      
				      
				        
				        
				        <a href="javascript:void(0);" onclick="optRename(&#39;/template&#39;,&#39;template&#39;);" class="ls-opt">重命名</a>
				        
				      
				      
				      
				      
				      
				      
				        
				        
				        <a href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/delete.do?ids=%2ftemplate&amp;parentId=&amp;" onclick="return confirmDelete();" class="ls-opt">删除</a>
				        
				      
				      
				      
				     </td>
				    <td onclick="location.href=&#39;list.do?parentId=%2ftemplate&#39;;" style="cursor:pointer;">
				      <div id="beanname3" class="file-directory"><span>template</span></div>
				    </td>
				    <td onclick="location.href=&#39;list.do?parentId=%2ftemplate&#39;;" style="cursor:pointer;">2018-03-15 12:45</td>
				    <td onclick="location.href=&#39;list.do?parentId=%2ftemplate&#39;;" style="cursor:pointer;">文件夹</td>
				    <td align="right" onclick="location.href=&#39;list.do?parentId=%2ftemplate&#39;;" style="cursor:pointer;"></td>
				  </tr>
				  
				  <tr>
				    <td><input type="checkbox" name="ids" value="/uploads"></td>
				    <td align="center">
				      
				        
				          
				        
				        
				      
				      <a id="edit_opt_4" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/list.do?parentId=%2fuploads" class="ls-opt" style="display:none;">修改</a>
				      
				      
				      
				      
				        
				        
				        <a id="zip_download_opt_4" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/zip_download.do?ids=%2fuploads&amp;" class="ls-opt">ZIP下载</a>
				        
				      
				      
				      
				      
				      
				      
				        
				        
				        <a id="zip_opt_4" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/zip.do?ids=%2fuploads&amp;parentId=&amp;" class="ls-opt">ZIP打包</a>
				        
				      
				      
				
				      
				      
				      
				        
				        <a class="ls-opt-disabled">ZIP解压</a>
				        
				        
				      
				      
				      
				      
				      
				        
				          
				        
				        
				      
				      
				        
				        
				        <a id="open_opt_4" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/list.do?parentId=%2fuploads" class="ls-opt">打开</a>
				        
				      
				      
				      
				      
				      
				        
				        
				        <a href="javascript:void(0);" onclick="optRename(&#39;/uploads&#39;,&#39;uploads&#39;);" class="ls-opt">重命名</a>
				        
				      
				      
				      
				      
				      
				      
				        
				        
				        <a href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/delete.do?ids=%2fuploads&amp;parentId=&amp;" onclick="return confirmDelete();" class="ls-opt">删除</a>
				        
				      
				      
				      
				     </td>
				    <td onclick="location.href=&#39;list.do?parentId=%2fuploads&#39;;" style="cursor:pointer;">
				      <div id="beanname4" class="file-directory"><span>uploads</span></div>
				    </td>
				    <td onclick="location.href=&#39;list.do?parentId=%2fuploads&#39;;" style="cursor:pointer;">2018-03-15 12:45</td>
				    <td onclick="location.href=&#39;list.do?parentId=%2fuploads&#39;;" style="cursor:pointer;">文件夹</td>
				    <td align="right" onclick="location.href=&#39;list.do?parentId=%2fuploads&#39;;" style="cursor:pointer;"></td>
				  </tr>
				  
				  <tr>
				    <td><input type="checkbox" name="ids" value="/WEB-INF"></td>
				    <td align="center">
				      
				        
				          
				        
				        
				      
				      <a id="edit_opt_5" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/list.do?parentId=%2fWEB-INF" class="ls-opt" style="display:none;">修改</a>
				      
				      
				      
				      
				        
				        
				        <a id="zip_download_opt_5" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/zip_download.do?ids=%2fWEB-INF&amp;" class="ls-opt">ZIP下载</a>
				        
				      
				      
				      
				      
				      
				      
				        
				        
				        <a id="zip_opt_5" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/zip.do?ids=%2fWEB-INF&amp;parentId=&amp;" class="ls-opt">ZIP打包</a>
				        
				      
				      
				
				      
				      
				      
				        
				        <a class="ls-opt-disabled">ZIP解压</a>
				        
				        
				      
				      
				      
				      
				      
				        
				          
				        
				        
				      
				      
				        
				        
				        <a id="open_opt_5" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/list.do?parentId=%2fWEB-INF" class="ls-opt">打开</a>
				        
				      
				      
				      
				      
				      
				        
				        
				        <a href="javascript:void(0);" onclick="optRename(&#39;/WEB-INF&#39;,&#39;WEB-INF&#39;);" class="ls-opt">重命名</a>
				        
				      
				      
				      
				      
				      
				      
				        
				        
				        <a href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/delete.do?ids=%2fWEB-INF&amp;parentId=&amp;" onclick="return confirmDelete();" class="ls-opt">删除</a>
				        
				      
				      
				      
				     </td>
				    <td onclick="location.href=&#39;list.do?parentId=%2fWEB-INF&#39;;" style="cursor:pointer;">
				      <div id="beanname5" class="file-directory"><span>WEB-INF</span></div>
				    </td>
				    <td onclick="location.href=&#39;list.do?parentId=%2fWEB-INF&#39;;" style="cursor:pointer;">2018-03-15 12:45</td>
				    <td onclick="location.href=&#39;list.do?parentId=%2fWEB-INF&#39;;" style="cursor:pointer;">文件夹</td>
				    <td align="right" onclick="location.href=&#39;list.do?parentId=%2fWEB-INF&#39;;" style="cursor:pointer;"></td>
				  </tr>
				  
				  <tr>
				    <td><input type="checkbox" name="ids" value="/crossdomain.xml"></td>
				    <td align="center">
				      
				        
				        
				          
				        
				      
				      <a id="edit_opt_6" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/edit.do?id=%2fcrossdomain.xml&amp;parentId=&amp;position=6&amp;" class="ls-opt" style="display:none;">修改</a>
				      
				      
				      
				      
				        
				        
				        <a id="zip_download_opt_6" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/zip_download.do?ids=%2fcrossdomain.xml&amp;" class="ls-opt">ZIP下载</a>
				        
				      
				      
				      
				      
				      
				      
				        
				        
				        <a id="zip_opt_6" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/zip.do?ids=%2fcrossdomain.xml&amp;parentId=&amp;" class="ls-opt">ZIP打包</a>
				        
				      
				      
				
				      
				      
				      
				        
				        <a class="ls-opt-disabled">ZIP解压</a>
				        
				        
				      
				      
				      
				      
				      
				        
				        
				          
				        
				      
				      
				        
				        
				        <a id="open_opt_6" href="http://111.230.147.160:8080/crossdomain.xml" target="_blank" class="ls-opt">打开</a>
				        
				      
				      
				      
				      
				      
				        
				        
				        <a href="javascript:void(0);" onclick="optRename(&#39;/crossdomain.xml&#39;,&#39;crossdomain.xml&#39;);" class="ls-opt">重命名</a>
				        
				      
				      
				      
				      
				      
				      
				        
				        
				        <a href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/delete.do?ids=%2fcrossdomain.xml&amp;parentId=&amp;" onclick="return confirmDelete();" class="ls-opt">删除</a>
				        
				      
				      
				      
				     </td>
				    <td onclick="location.href=&#39;edit.do?id=%2fcrossdomain.xml&amp;parentId=&amp;position=6&amp;&#39;;" style="cursor:pointer;">
				      <div id="beanname6" class="file-text"><span>crossdomain.xml</span></div>
				    </td>
				    <td onclick="location.href=&#39;edit.do?id=%2fcrossdomain.xml&amp;parentId=&amp;position=6&amp;&#39;;" style="cursor:pointer;">2016-12-30 12:08</td>
				    <td onclick="location.href=&#39;edit.do?id=%2fcrossdomain.xml&amp;parentId=&amp;position=6&amp;&#39;;" style="cursor:pointer;">文本文档</td>
				    <td align="right" onclick="location.href=&#39;edit.do?id=%2fcrossdomain.xml&amp;parentId=&amp;position=6&amp;&#39;;" style="cursor:pointer;">1 KB</td>
				  </tr>
				  
				  <tr>
				    <td><input type="checkbox" name="ids" value="/favicon.ico"></td>
				    <td align="center">
				      
				        
				        
				          
				        
				      
				      <a id="edit_opt_7" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/edit.do?id=%2ffavicon.ico&amp;parentId=&amp;position=7&amp;" class="ls-opt" style="display:none;">修改</a>
				      
				      
				      
				      
				        
				        
				        <a id="zip_download_opt_7" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/zip_download.do?ids=%2ffavicon.ico&amp;" class="ls-opt">ZIP下载</a>
				        
				      
				      
				      
				      
				      
				      
				        
				        
				        <a id="zip_opt_7" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/zip.do?ids=%2ffavicon.ico&amp;parentId=&amp;" class="ls-opt">ZIP打包</a>
				        
				      
				      
				
				      
				      
				      
				        
				        <a class="ls-opt-disabled">ZIP解压</a>
				        
				        
				      
				      
				      
				      
				      
				        
				        
				          
				        
				      
				      
				        
				        
				        <a id="open_opt_7" href="http://111.230.147.160:8080/favicon.ico" target="_blank" class="ls-opt">打开</a>
				        
				      
				      
				      
				      
				      
				        
				        
				        <a href="javascript:void(0);" onclick="optRename(&#39;/favicon.ico&#39;,&#39;favicon.ico&#39;);" class="ls-opt">重命名</a>
				        
				      
				      
				      
				      
				      
				      
				        
				        
				        <a href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/delete.do?ids=%2ffavicon.ico&amp;parentId=&amp;" onclick="return confirmDelete();" class="ls-opt">删除</a>
				        
				      
				      
				      
				     </td>
				    <td onclick="location.href=&#39;edit.do?id=%2ffavicon.ico&amp;parentId=&amp;position=7&amp;&#39;;" style="cursor:pointer;">
				      <div id="beanname7" class="file-file"><span>favicon.ico</span></div>
				    </td>
				    <td onclick="location.href=&#39;edit.do?id=%2ffavicon.ico&amp;parentId=&amp;position=7&amp;&#39;;" style="cursor:pointer;">2017-04-05 10:36</td>
				    <td onclick="location.href=&#39;edit.do?id=%2ffavicon.ico&amp;parentId=&amp;position=7&amp;&#39;;" style="cursor:pointer;">文件</td>
				    <td align="right" onclick="location.href=&#39;edit.do?id=%2ffavicon.ico&amp;parentId=&amp;position=7&amp;&#39;;" style="cursor:pointer;">10 KB</td>
				  </tr>
				  
				  <tr>
				    <td><input type="checkbox" name="ids" value="/jspxcms-8.0.3-release.zip"></td>
				    <td align="center">
				      
				        
				        
				          
				        
				      
				      <a id="edit_opt_8" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/edit.do?id=%2fjspxcms-8.0.3-release.zip&amp;parentId=&amp;position=8&amp;" class="ls-opt" style="display:none;">修改</a>
				      
				      
				      
				      
				        
				        
				        <a id="zip_download_opt_8" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/zip_download.do?ids=%2fjspxcms-8.0.3-release.zip&amp;" class="ls-opt">ZIP下载</a>
				        
				      
				      
				      
				      
				      
				      
				        
				        
				        <a id="zip_opt_8" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/zip.do?ids=%2fjspxcms-8.0.3-release.zip&amp;parentId=&amp;" class="ls-opt">ZIP打包</a>
				        
				      
				      
				
				      
				      
				      
				        
				        
				        <a id="unzip_opt_8" href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/unzip.do?ids=%2fjspxcms-8.0.3-release.zip&amp;parentId=&amp;" class="ls-opt">ZIP解压</a>
				        
				      
				      
				      
				      
				      
				        
				        
				          
				        
				      
				      
				        
				        
				        <a id="open_opt_8" href="http://111.230.147.160:8080/jspxcms-8.0.3-release.zip" target="_blank" class="ls-opt">打开</a>
				        
				      
				      
				      
				      
				      
				        
				        
				        <a href="javascript:void(0);" onclick="optRename(&#39;/jspxcms-8.0.3-release.zip&#39;,&#39;jspxcms-8.0.3-release.zip&#39;);" class="ls-opt">重命名</a>
				        
				      
				      
				      
				      
				      
				      
				        
				        
				        <a href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/delete.do?ids=%2fjspxcms-8.0.3-release.zip&amp;parentId=&amp;" onclick="return confirmDelete();" class="ls-opt">删除</a>
				        
				      
				      
				      
				     </td>
				    <td onclick="location.href=&#39;edit.do?id=%2fjspxcms-8.0.3-release.zip&amp;parentId=&amp;position=8&amp;&#39;;" style="cursor:pointer;">
				      <div id="beanname8" class="file-zip"><span>jspxcms-8.0.3-release.zip</span></div>
				    </td>
				    <td onclick="location.href=&#39;edit.do?id=%2fjspxcms-8.0.3-release.zip&amp;parentId=&amp;position=8&amp;&#39;;" style="cursor:pointer;">2018-03-13 18:39</td>
				    <td onclick="location.href=&#39;edit.do?id=%2fjspxcms-8.0.3-release.zip&amp;parentId=&amp;position=8&amp;&#39;;" style="cursor:pointer;">ZIP压缩文件</td>
				    <td align="right" onclick="location.href=&#39;edit.do?id=%2fjspxcms-8.0.3-release.zip&amp;parentId=&amp;position=8&amp;&#39;;" style="cursor:pointer;">70,565 KB</td>
				  </tr>
				  
				  </tbody>
				</table>
			</form>
		</div>
	</div>
</div>

<div class="ui-dialog ui-widget ui-widget-content ui-corner-all ui-draggable ui-resizable ui-dialog-buttons" tabindex="-1" role="dialog" aria-labelledby="ui-id-1" style="display: none; outline: 0px; z-index: 1000; position: absolute;"><div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix"><span id="ui-id-1" class="ui-dialog-title">新建文件夹</span><a href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/list.do#" class="ui-dialog-titlebar-close ui-corner-all" role="button"><span class="ui-icon ui-icon-closethick">close</span></a></div><div id="createDirDialog" style="" class="ui-dialog-content ui-widget-content">
  <form id="createDirForm" action="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/mkdir.do" method="post" novalidate="novalidate">
    <input type="hidden" name="parentId" value="">
    <label><input type="text" name="dir" class="required" maxlength="150" style="width:180px;"></label>
  </form>
</div><div class="ui-resizable-handle ui-resizable-n" style="z-index: 1000;"></div><div class="ui-resizable-handle ui-resizable-e" style="z-index: 1000;"></div><div class="ui-resizable-handle ui-resizable-s" style="z-index: 1000;"></div><div class="ui-resizable-handle ui-resizable-w" style="z-index: 1000;"></div><div class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se" style="z-index: 1000;"></div><div class="ui-resizable-handle ui-resizable-sw" style="z-index: 1000;"></div><div class="ui-resizable-handle ui-resizable-ne" style="z-index: 1000;"></div><div class="ui-resizable-handle ui-resizable-nw" style="z-index: 1000;"></div><div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"><div class="ui-dialog-buttonset"><button type="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" role="button" aria-disabled="false"><span class="ui-button-text">OK</span></button><button type="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" role="button" aria-disabled="false"><span class="ui-button-text">Cancel</span></button></div></div></div><div class="ui-dialog ui-widget ui-widget-content ui-corner-all ui-draggable ui-resizable ui-dialog-buttons" tabindex="-1" role="dialog" aria-labelledby="ui-id-2" style="display: none; outline: 0px; z-index: 1000; position: absolute;"><div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix"><span id="ui-id-2" class="ui-dialog-title">重命名</span><a href="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/list.do#" class="ui-dialog-titlebar-close ui-corner-all" role="button"><span class="ui-icon ui-icon-closethick">close</span></a></div><div id="renameDialog" style="" class="ui-dialog-content ui-widget-content">
  <form id="renameForm" action="http://111.230.147.160:8080/jsp/cmscp/core/web_file_3/rename.do" method="post" novalidate="novalidate">
    <input type="hidden" name="parentId" value="">
    <input type="hidden" name="id">
    <label><input type="text" name="name" class="required" maxlength="150" style="width:180px;"></label>
  </form>
</div><div class="ui-resizable-handle ui-resizable-n" style="z-index: 1000;"></div><div class="ui-resizable-handle ui-resizable-e" style="z-index: 1000;"></div><div class="ui-resizable-handle ui-resizable-s" style="z-index: 1000;"></div><div class="ui-resizable-handle ui-resizable-w" style="z-index: 1000;"></div><div class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se" style="z-index: 1000;"></div><div class="ui-resizable-handle ui-resizable-sw" style="z-index: 1000;"></div><div class="ui-resizable-handle ui-resizable-ne" style="z-index: 1000;"></div><div class="ui-resizable-handle ui-resizable-nw" style="z-index: 1000;"></div><div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"><div class="ui-dialog-buttonset"><button type="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" role="button" aria-disabled="false"><span class="ui-button-text">OK</span></button><button type="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" role="button" aria-disabled="false"><span class="ui-button-text">Cancel</span></button></div></div></div></body></html>