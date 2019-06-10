<%@page import="Bean.Article"%>
<%@page import="DBFunction.ArticleImpl"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
	ArticleImpl aImpl = new ArticleImpl();
	String id = request.getParameter("id");
	Article a = null;
	if(id==null){
		//RequestDispatcher  rd = request.getRequestDispatcher("index.jsp?contentPage=article.jsp");  
		//rd.forward(request, response);	
		id="18";
		a = aImpl.getArticleById(id);
	}else{

		a = aImpl.getArticleById(id);
		pageContext.setAttribute("a", a);
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-store">
<meta http-equiv="Expires" content="0">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>文章修改</title>
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
	href="${basePath}/admi
	n/css/process.css">
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
<script type="text/javascript" charset="utf-8" src="editor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="editor/ueditor.all.min.js"> </script>  

<script type="text/javascript" src="${basePath}/admin/js/ajaxfileupload.js"></script>
<script type="text/javascript">
	
	$(function(){
		$('#saveAndExit').click(function(){
			ajaxFileUpload("exit")
			
		})
		
		
		$('#viewImg').attr('src','<%=a.imgUrl%>');
		$('#imgSrc').val('<%=a.imgUrl%>');
		$('#title').val('<%=a.title%>');
	
		var author = "白墨"
		var shortContent = $('#shortContent').val('<%=a.shortContent%>');
		var ue = UE.getEditor('editor');
		UE.getEditor('editor').setContent('<%=a.content%>')
		var weight = $("#weight").find("option:selected").text();;
		var tag = ''
		$('input:checkbox[name=attr]:checked').each(function(k){
		    if(k == 0){
		        tag = $(this).val();
		    }else{
		        tag += ','+$(this).val();
		    }
		})
	
	})
	function changePic(){
			var sourceId="fileToUpload";
            var url;  
            if (navigator.userAgent.indexOf("MSIE")>=1) { // IE  
                url = document.getElementById(sourceId).value;  
            } else if(navigator.userAgent.indexOf("Firefox")>0) { // Firefox  
                url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0));  
            } else if(navigator.userAgent.indexOf("Chrome")>0) { // Chrome  
                url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0));  
            }  
        
            $('#viewImg').attr('src',url); 
        
	}
	function chooseFile(){
		$('#fileToUpload').click();
	}

	function ajaxFileUpload(type) {
		$.ajaxFileUpload({
			url :'/Mooc/ajaxUpload',
			secureuri : false,
			fileElementId : 'fileToUpload',
			dataType : 'json',
			success : function(data, status) {
				if(type=='exit'){
					
					$('#imgSrc').val(data.picUrl)
					return updateArticle()
				}else{
				
					$('#imgSrc').val(data.picUrl)
				}
				
			},
			error : function(data, status, e) {
				alert('上传出错');
			}
		})

		return false;

	}
</script>





<script>

function updateArticle(){
	var basePath = $('#basePath').val();
	var imgUrl = $('#imgSrc').val();
	alert("imgSrc is "+$('#imgSrc').val())
	alert("imgUrl is "+imgUrl)
	var title = $('#title').val();
	//var author = $('#authorId').val();
	var author = "白墨"
	var shortContent = $('#shortContent').val();
	var content = UE.getEditor('editor').getContent();
	var weight = $("#weight").find("option:selected").text();;
	var tag = ''
	$('input:checkbox[name=attr]:checked').each(function(k){
	    if(k == 0){
	        tag = $(this).val();
	    }else{
	        tag += ','+$(this).val();
	    }
	})
	if(title==""||title==null){
		$('#title').focus()
		alert('请输入标题!')
		return ;
	}

	window.event.returnValue=false;
	$.post(basePath+"/ArticleAction",{type:'update'
		,id:<%=id%>
		,title:title
		,author:author
		,content:content
		,tag:tag
		,imgUrl:imgUrl
		,shortContent:shortContent
		,weight:weight
		},function(result){
			if(result=='success'){
				window.event.returnValue=false;
				window.location.href=basePath+"/admin/index.jsp?contentPage=article.jsp";
			}else {
				alert('失败')
			}
			
		}).val();

}
</script>


</head>
<body class="skin-blue content-body" style="">
	<input id="basePath" type="hidden" value="/Mooc">

	<div id="message-toggler"
		style="display: none; position: absolute; top: 8px; background-color: #ccc;">
		<div id="message-effect"
			style="font-size: 16px; font-weight: bold; padding: 8px 20px; _width: 50px; word-break: keep-all; white-space: nowrap; text-align: center; color: #00a65a;">
			操作成功</div>
	</div>


	<div class="content-header">
		<h1>文档管理 - 修改</h1>
	</div>
	<div class="content" style="">
		<div class="box box-primary" style="">
			<form class="form-horizontal"  
				method="post" novalidate="novalidate" style="">
				<div class="box-header with-border">
					<div class="btn-toolbar">
						<div class="btn-group">
							<button class="btn btn-default" type="button"
								onclick=""
								disabled="disabled">新增</button>
						</div>
						<div class="btn-group">
							<button class="btn btn-default" type="button"
								onclick=""
								disabled="disabled">复制</button>
							<button class="btn btn-default" type="button"
								onclick="location.href='view.do?id=&amp;queryNodeId=&amp;queryNodeType=&amp;queryInfoPermType=&amp;queryStatus=&amp;position=&amp;';"
								disabled="disabled">查看</button>
							<button class="btn btn-default" type="button"
								onclick="window.open('');" disabled="disabled">前台浏览</button>
						</div>
						<div class="btn-group">

							<button class="btn btn-default" type="button"
								onclick="if(confirmDelete()){location.href='logic_delete.do?ids=&amp;queryNodeId=&amp;queryNodeType=&amp;queryInfoPermType=&amp;queryStatus=&amp;';}"
								disabled="disabled">删除</button>


							<button class="btn btn-default" type="button"
								onclick="if(confirmDelete()){location.href='delete.do?ids=&amp;queryNodeId=&amp;queryNodeType=&amp;queryInfoPermType=&amp;queryStatus=&amp;';}"
								disabled="disabled">彻底删除</button>

						</div>
						<div class="btn-group">

							<button class="btn btn-default" type="button"
								onclick="location.href='audit_pass.do?ids=&amp;redirect=edit&amp;queryNodeId=&amp;queryNodeType=&amp;queryInfoPermType=&amp;queryStatus=&amp;position=0&amp;';"
								disabled="disabled">审核通过</button>


							<button class="btn btn-default" type="button"
								onclick="location.href='audit_reject.do?ids=&amp;redirect=edit&amp;queryNodeId=&amp;queryNodeType=&amp;queryInfoPermType=&amp;queryStatus=&amp;position=0&amp;';"
								disabled="disabled">撤销审核</button>


							<button class="btn btn-default" type="button"
								onclick="location.href='audit_return.do?ids=&amp;redirect=edit&amp;queryNodeId=&amp;queryNodeType=&amp;queryInfoPermType=&amp;queryStatus=&amp;position=0&amp;';"
								disabled="disabled">退稿</button>

						</div>
						<div class="btn-group">
							<button class="btn btn-default" type="button"
								onclick="location.href='edit.do?id=&amp;queryNodeId=&amp;queryNodeType=&amp;queryInfoPermType=&amp;queryStatus=&amp;position=-1&amp;';"
								disabled="disabled">上一条</button>
							<button class="btn btn-default" type="button"
								onclick="location.href='edit.do?id=&amp;queryNodeId=&amp;queryNodeType=&amp;queryInfoPermType=&amp;queryStatus=&amp;position=1&amp;';"
								disabled="disabled">下一条</button>
						</div>
						<div class="btn-group">
							<button class="btn btn-default" type="button"
								onclick="location.href='article.jsp'">返回</button>
						</div>
					</div>
				</div>
				<div class="box-body" style="">




					<div class="row">

						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label">栏目</label>
								<div class="col-sm-8">
									<input type="hidden" id="nodeId" name="nodeId" value="1">
									<input type="hidden" id="nodeIdNumber" value="1">
									<div class="input-group">
										<input type="text" id="nodeIdName" value="首页"
											class="form-control" readonly="readonly"> <span
											class="input-group-btn">
											<button id="nodeIdButton" type="button"
												class="btn btn-default">选择</button>
										</span>
									</div>



								</div>
							</div>
						</div>


						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label">专题</label>
								<div class="col-sm-8">

									<div id="specialIds"></div>
									<div id="specialIdsNumber"></div>
									<div id="specialIdsName"></div>
									<div class="input-group">
										<input type="text" id="specialIdsNameDisplay"
											class="form-control" readonly="readonly"> <span
											class="input-group-btn">
											<button id="specialIdsButton" type="button"
												class="btn btn-default">选择</button>
										</span>
									</div>
								</div>
							</div>
						</div>

					</div>



					<div class="row">

						<div class="col-sm-12">
							<div class="form-group">
								<label class="col-sm-2 control-label"><em
									class="required">*</em>标题</label>
								<div class="col-sm-10">


									<div class="input-group">
										<input id="title" type="text" name="title" maxlength="150"
											class="required form-control"> <span
											class="input-group-addon"> <label
											style="margin-bottom: 0; font-weight: normal;"><input
												id="linkCheck" type="checkbox"
												onclick="$('#linkDiv').toggle(this.checked);"
												style="margin-right: 2px;">转向链接</label>
										</span>
									</div>
									<div class="input-group" id="linkDiv"
										style="margin-top: 2px; display: none;">
										<input type="text" id="link" name="link" maxlength="255"
											class="form-control"> <span class="input-group-addon">
											<span class="in-prompt"
											title="x"></span>
										</span>
									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="row">

						<div class="col-sm-12">
							<div class="form-group">
								<label class="col-sm-2 control-label">关键词</label>
								<div class="col-sm-10">

									<input type="text" name="tagKeywords" maxlength="150"
										class="form-control">


								</div>
							</div>
						</div>

					</div>


					<div class="row">

						<div class="col-sm-12">
							<div class="form-group">
								<label class="col-sm-2 control-label">描述</label>
								<div class="col-sm-10">


									<textarea id="shortContent" name="metaDescription" rows="5"
										class="form-control {maxlength:450}"></textarea>

								</div>
							</div>
						</div>

					</div>





					<div class="row">

						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label">优先级</label>
								<div class="col-sm-8">

									<select name="priority" id="weight" class="form-control">
										
										<option>0</option>

										<option>1</option>

										<option>2</option>

										<option>3</option>

										<option>4</option>

										<option>5</option>

										<option>6</option>

										<option>7</option>

										<option>8</option>

										<option>9</option>

									</select>











								</div>
							</div>
						</div>





						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label">发布时间</label>
								<div class="col-sm-8">





									<div class="input-group">
										<input type="text" name="publishDate" value=""
											onclick="WdatePicker({dateFmt:'yyyy-MM-ddTHH:mm:ss'});"
											class="form-control "
											style="padding-left: 3px; padding-right: 3px;"> <span
											class="input-group-addon"
											style="padding-left: 3px; padding-right: 3px;">至</span> <input
											type="text" name="offDate" value=""
											onclick="WdatePicker({dateFmt:'yyyy-MM-ddTHH:mm:ss'});"
											class="form-control"
											style="padding-left: 3px; padding-right: 3px;">
									</div>

								</div>
							</div>
						</div>

					</div>



					<div class="row">

						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label">来源</label>
								<div class="col-sm-8">



									



								</div>
							</div>
						</div>

						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label">作者</label>
								<div class="col-sm-8">
									<input type="text" id="author" name="author" maxlength="50"
										class="form-control">
								</div>
							</div>
						</div>

					</div>

					<div class="row">

						<div class="col-sm-12">
							<div class="form-group">
								<label class="col-sm-2 control-label">属性</label>
								<div class="col-sm-10">

									<label class="checkbox-inline">    <!--多选框  -->  
       									 <input type="checkbox" name="attr" value="h" >热点推荐  
       								</label>

									<label class="checkbox-inline">    <!--多选框  -->  
       									 <input type="checkbox" name="attr" value="n" >最新课程
       								</label>

								</div>
							</div>
						</div>
					</div>
	
					<div class="row">
						<div class="col-sm-12">
							<div class="form-group">
								<label class="col-sm-2 control-label">标题图</label>
								<div class="col-sm-10">
									<div style="display: table; width: 100%;">
										<div style="display: table-cell; vertical-align: middle;">
											
											<div class="form-inline" style="margin-top: 3px;">
												<!--  <div class="input-group">
													<span class="input-group-addon">宽</span> <input type="text"
														id="w_smallImage" value="180" style="width: 70px;"
														class="form-control">
												</div>
												<div class="input-group">
													<span class="input-group-addon">高</span> <input type="text"
														id="h_smallImage" value="120" style="width: 70px;"
														class="form-control">
												</div>-->
												<button class="btn btn-default" type="button"
													onclick="return chooseFile()">选择</button>
												<input type="file" id="fileToUpload" name="fileToUpload" onchange="changePic()" accept="image/*"  style="display:none" value="#">
												<input type="hidden" id="imgSrc" name="imgSrc">
												<button class="btn btn-default" type="button" onclick="return ajaxFileUpload()">上传</button>
												<button class="btn btn-default" type="button"
													id="smallImageSwfCancel"
													onclick="" disabled="">取消</button>
											</div>
											<div>
												<label class="checkbox-inline"><input
													type="checkbox" id="s_smallImage" checked="checked">压缩</label>
												<label class="checkbox-inline"><input
													type="checkbox" id="e_smallImage">不按原图比例</label> <label
													class="checkbox-inline"><input type="checkbox"
													id="wm_smallImage">水印</label>
											</div>
										</div>
										<div
											style="width: 200px; display: table-cell; vertical-align: middle; text-align: center;">
											<img id="viewImg" src="#" style="width:200px">
										</div>
									</div>
									<div id="smallImageSwfProgress"></div>
								</div>
							</div>
						</div>

					</div>
					
					<div class="row">
					<div class="col-sm-12">
						 <script id="editor" type="text/plain" style="width:1024px;height:500px;margin-left:150px"></script>
					</div>
					
					</div>

				</div>
				<div class="box-footer">
					<button class="btn btn-primary" onclick="addArticle()">保存</button>

					
					<button class="btn btn-default" type="submit"
						onclick="addArticle()">保存为草稿</button>


					<button class="btn btn-default" id="saveAndExit">保存并返回</button>
					
					<button class="btn btn-default">保存并新增</button>

				</div>
				<textarea name="clobs_text" id="ueditor_textarea_clobs_text"
					style="display: none;"></textarea>
				<textarea name="editorValue" id="ueditor_textarea_editorValue"
					style="display: none;"></textarea>
				<textarea name="editorValue" id="ueditor_textarea_editorValue"
					style="display: none;"></textarea>
			</form>
		</div>
	</div>

	<div class="row">
	<div id="edui_fixedlayer" class="edui-default"
		style="position: fixed; left: 0px; top: 0px; width: 0px; height: 0px;">
		<div id="edui252" class="edui-popup  edui-bubble edui-default"
			onmousedown="return false;" style="display: none;">
			<div id="edui252_body" class="edui-popup-body edui-default">
				<iframe
					style="position: absolute; z-index: -1; left: 0; top: 0; background-color: transparent;"
					frameborder="0" width="100%" height="100%" src="about:blank"
					class="edui-default"></iframe>
				<div class="edui-shadow edui-default"></div>
				<div id="edui252_content" class="edui-popup-content edui-default">
				</div>
			</div>
		</div></div>
	</div>
	
<script type="text/javascript">
	  //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');


    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("已清空草稿箱")
    }
</script>
</body>
</html>