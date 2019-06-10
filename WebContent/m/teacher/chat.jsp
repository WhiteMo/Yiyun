<%@page import="Bean.Course"%>
<%@page import="DBFunction.CourseImpl"%>
<%@page import="Bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	String basePath = request.getContextPath();
	pageContext.setAttribute("basePath",basePath);
	User teacher  = (User)session.getAttribute("user");
	if(teacher==null){
		response.sendRedirect(basePath+"/m/teacher/login.jsp");
		return ;
	}
	String id = request.getParameter("id");
	if(id==null){
		response.sendRedirect(basePath+"/m/teacher/course.jsp");
		return ;
	}
	
	Course course = new CourseImpl().getCourseById(id);
	pageContext.setAttribute("course",course);
%>    

    

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>聊天界面</title>
<link rel="stylesheet" href="${basePath}/client/css/bootstrap.css">
<link href="${basePath}/client/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${basePath}/m/teacher/css/font-awesome.min.css">
<script src="${basePath}/client/js/jquery-3.3.1.js"></script>

    <style>
	html,body,.demo
   {
		width:100%;
		height:100%;
		font-size:1.2rem;
   }
		/**重置标签默认样式*/
        * {
            margin: 0;
            padding: 0;
            list-style: none;
            font-family: '微软雅黑'
        }
        #container {
            width: 100%;
            height: 100%;
            background: #eee;
            margin:  0;
            position: relative;
            box-shadow: 20px 20px 55px #777;
        }
        .header {
            background: #000;
            height: 8%;
            color: #fff;
            line-height: 1rem;
            font-size: 1.2rem;
            padding: 0 10px;
            
        }
        .footer {
            width: 98%;
            height: 8%;
            background: #666;
            position: fixed;
            bottom: 0;
            right:2%;
            padding: 10px;
        }
        .footer input {
            width: 63%;
            height: 70%;
            outline: none;
            font-size: 1.2rem;
            text-indent: 10px;
            position: absolute;
            top:10%;

            border-radius: 6px;
            right: 18%;
        }
        .footer span {
            display: inline-block;
            width: 14.5%;
            height: 72%;
            background: #ccc;
            font-weight: 1800;
            line-height: 2rem;
            cursor: pointer;
            font-size:1.2rem;
            text-align: center;
            position: absolute;
            right: 10px;
            border-radius: 6px;
        }
        .footer span:hover {
            color: #fff;
            background: #999;
        }
        #user_face_icon {
            display: inline-block;
            background: #666;
            width: 14%;
            height: 75%;
            border-radius: 30px;
            position: absolute;
            
            top:10%;
            left:3%;
            cursor: pointer;
            overflow: hidden;
        }
        img {
         top:5%;
         position: absolute;
            width: 100%;
            height: 100%;
        }
        .content {
            font-size: 1.2rem;
            width: 100%;
            height: 80%;
            overflow: auto;
            padding: 5px;
        }
        .content li {
            margin-top: 10px;
            padding-left: 10px;
            width: 95%;
            display: block;
            clear: both;
            overflow: hidden;
        }
        .content li img {
            float: left;
        }
        .content li span{
            padding: 10px;
            border-radius: 10px;
            margin: 6px 10px 0 10px;
            max-width: 310px;
            border: 1px solid #ccc;
            box-shadow: 0 0 3px #ccc;
        }
        .content li img.imgleft { 
            float: left; 
        }
        .content li img.imgright { 
            float: right; 
        }
        .content li span.spanleft { 
            float: left;
            background: #fff;
        }
        .content li span.spanright { 
            float: right;
            background: #7cfc00;
        }
    </style>
    <script type="text/javascript">
    
	var ws;
	//var username = getUrlParameter('username');
	var username="<%=teacher.getName()%>";
	var roomid='<%=course.getId()%>';
	var url = "ws://www.1y.net/chatSocket?username="
		+username;
	window.onload = connect;
	function connect() {
		if ('WebSocket' in window) {
			ws = new WebSocket(url);
		} else if ('MozWebSocket' in window) {
			ws = new MozWebSocket(url);
			
		} else {
			alert('该浏览器不支持websocket');
			return;
		}
		ws.onmessage = function(event) {
		eval("var result=" + event.data);
			//聊天内容	
			if (result.from != undefined) {
				var index=result.sendMsg.indexOf("@&#~");
			    var room=result.sendMsg.substring(0,index);
			    if(room==roomid)
			    {
			    	if(result.from==username){
			    	  	document.getElementById("tex").innerHTML += '<li><span style="float:right;background:#E0FFFF">'+result.from
						+ ": " +"<br/>" + result.sendMsg.substring(index+4)
						+ "<br/></span></li>";
			    	} else{
			    	document.getElementById("tex").innerHTML += '<li><span style="float:left;background:#7cfc00">'+result.from
					+ ": " +"<br/>" + result.sendMsg.substring(index+4)
					+ "<br/></span></li>";
			    }

			}
		}
	}}
	
	function wsSend() {
		var msg = document.getElementById("msg");
		
		var roomid='<%=id%>';
		//alert(msg.value);
		var message=roomid+"@&#~"+msg.value;
		ws.send(message);
		
		msg.value = "";
	}
	document.onkeydown=function(e){
		var keycode=document.all?event.keyCode:e.which;
		if(keycode==13){
			var msg = document.getElementById("msg");
			if(msg!=null&&msg.value!=""){
				wsSend()
			}
		}
	}
	//截取URL 中的传过来的值
	function getUrlParameter(name) {
		name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
		var regexS = "[\\?&]" + name + "=([^&#]*)";
		var regex = new RegExp(regexS);
		var results = regex.exec(window.parent.location.href);
		if (results == null)
			return "";
		else {
			return results[1];
		}
	}
</script>
</head>
<body>
    <div id="container">
        <div class="header">
            <span style="float: left;line-height:2rem">
            	<a style="color:#fff" onclick="location.href='./course.jsp'" href="./course.jsp">	<i class="fa fa-backward"></i> 返回 </a>
            </span>
           <center style="line-height:2rem">${course.getName()}课堂讨论</center>
            <span style="float: right;"></span>
        </div>
        <ul class="content" id="tex">
			
		</ul>
        <div class="footer">
            <div id="user_face_icon">
                <img src="${course.getImgUrl()}" alt="">
            </div>
            <input id="msg" type="text" placeholder="说点什么吧...">
            <span id="btn" style="font-size:1rem" onclick="wsSend()">发送</span>
        </div>
    </div>
</body>
</html>




