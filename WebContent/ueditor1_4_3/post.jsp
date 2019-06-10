<%@page import="Bean.User"%>
<%@page import="DBFunction.UserImpl"%>
<%@page import="Bean.Article"%>
<%@page import="DBFunction.ArticleImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	String basePath=request.getContextPath();
	pageContext.setAttribute("basePath", request.getContextPath());
	String authorId = request.getParameter("id");
	if(authorId==null){
		response.sendRedirect(request.getContextPath()+"/client/login/login.jsp");  
		return;
	}
%>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>发表文章</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">

<meta http-equiv="Access-Control-Allow-Origin" content="*">
<meta http-equiv="Cache-Control" content="no-transform ">
<meta http-equiv="Cache-Control" content="no-siteapp">
<link rel="stylesheet" href="${basePath}/client/article/css/moco.css" type="text/css">
<link rel="stylesheet" href="${basePath}/client/article/css/swiper-3.css">
<link href="${basePath}/client/article/css/captcha.css" rel="stylesheet">
<link rel="stylesheet" href="${basePath}/client/article/css/a.css" type="text/css">
<link charset="utf-8" rel="stylesheet" href="${basePath}/client/article/css/prettify.css">
<link rel="stylesheet" href="${basePath}/client/css/bootstrap.css">
<link href="${basePath}/client/css/header_and_footer.css"
	rel="stylesheet" />
<script type="text/javascript" charset="utf-8" src="${basePath}/ueditor1_4_3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}/ueditor1_4_3/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="${basePath}/ueditor1_4_3/lang/zh-cn/zh-cn.js"></script>
</head>

<body>
	<jsp:include page="/client/header_and_footer/header.jsp"></jsp:include>
	<br>
	<div id="main" style="margin-top:50px;margin-left:200px">
		<form action="news.jsp" method="post">
    	<h1>发表文章</h1> <br> <br>
    	<p style="font-size:1em;">标题：           <input type="text" name="title"  style="font-size:0.5em;height:1.8em;border-radius:4px;border:1px solid #c8cccf;color:#6a6f77;outline:0;"> </p>  <br> <br>
    	<p style="font-size:1em;">简介：          <textarea name="ShortContent" rows="50" cols="50" style="font-size:1.5em;height:3.9em;border-radius:4px;border:1px solid #c8cccf;color:#6a6f77;outline:0;"></textarea> </p>  <br> <br>
    	<p style="font-size:1em;">Tag：           <input type="text" name="Tag"  style="font-size:0.5em;height:1.8em;border-radius:4px;border:1px solid #c8cccf;color:#6a6f77;outline:0;"> </p>  <br> <br>
    	<input type="text" name="authorId" type="hidden" value="<%=authorId%>">
    	
    	<script id="editor" type="text/plain" style="width:1024px;height:500px;">
		</script>
		<br><br><input type="submit" value="编辑完成" style="font-size:0.5em;height:1.8em;border-radius:4px;border:1px solid #c8cccf;color:#6a6f77;outline:0;">
	</form>
		
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


	

</body></html>