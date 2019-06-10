<%@page import="DBFunction.*"%>
<%@page import="Bean.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	String id = request.getParameter("id");
	if(id==null){
		response.sendRedirect(request.getContextPath()+"/client/index.jsp");
		return;
	}
	
	User student = (User)session.getAttribute("user");
	if(student==null){
		response.sendRedirect(request.getContextPath()+"/client/login/login.jsp?role=student&message=pleaseLogin");
		return ;
	}else{
		SCImpl scImpl =new SCImpl();
		String isCheck=scImpl.getIsCheck(id, student.id);
		if(isCheck.equals("1")){
			
		}else if(isCheck.equals("0")){
			response.sendRedirect(request.getContextPath()+"/client/course/course_info.jsp?id="+id+"&message=unPass");
			return ;
		}else{
			response.sendRedirect(request.getContextPath()+"/client/course/course_info.jsp?id="+id+"&message=unApply");
			return ;
		}
	}
	
	String basePath = request.getContextPath();
	pageContext.setAttribute("basePath", basePath);
	CourseImpl cImpl =new CourseImpl();
	Course course = cImpl.getCourseById(id);
	pageContext.setAttribute("course", course);
	pageContext.setAttribute("teacher",new UserImpl().getUserById(course.teacherId));
	
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>直播间</title>

<link rel="stylesheet" href="${basePath}/client/css/style.css">
<link rel="stylesheet" href="${basePath}/client/css/comment.css">
<link rel="stylesheet" href="${basePath}/client/css/bootstrap.css">
<link href="${basePath}/client/css/header_and_footer.css"
	rel="stylesheet" />
<script src="${basePath}/client/js/jquery-3.3.1.js"></script>
<script src="${basePath}/client/js/require.js"></script>
<script src="${basePath}/client/js/bootstrap.js"></script>
<script src="${basePath}/client/js/header-and-footer.js"></script>
<script src="${basePath}/client/js/layer.js"></script>
<script src="${basePath}/client/js/ipv6.js"></script>
<script src="${basePath}/client/js/jwplayer.js"> </script>

<style>

.border{
	border:1px solid #e5e4e4;
}
.sendBtn{
	display: block;
    position:relative;
    width:20%;
    height: 51px;
    line-height: 51px;
    border-radius: 0 4px 4px 0;
    background: #f70;
    color: #fff;
    font-size: 14px;
    float: left;
    text-align: center;
    border-radius:10px;
    cursor: pointer;
}
</style>

<script type="text/javascript">
	function ipv6ok(){
		layer.closeAll()
		$('#ipv6Status').html('支持')
		var basePath='<%=request.getContextPath()%>'
		var id='<%=id%>'
	}
	function ipv6no(){
		$('#ipv6Status').html('不支持')

		var basePath='<%=request.getContextPath()%>'
		var id='<%=id%>'
	
		layer.closeAll()
	}
	_ipv6test_start()
	layer.msg("正在检测是否支持Ipv6,请稍等...",{icon:16,time:5000,shade:0.01})
	
</script>


<script type="text/javascript">
	var ws;
	//var username = getUrlParameter('username');
	var username='<%=student.name%>';
	var roomid='<%=id%>';
	var basePath = '<%=request.getContextPath()%>'
	var url = "ws://www.1y.net/chatSocket?username="
	+username;
	$(function(){
		connect();
	});
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
			
		    //var index=result.sendMsg.indexOf("@&#~");
		    //var room=result.sendMsg.substring(0,index);
		    //alert(index);
			eval("var result=" + event.data);
			
			//欢迎语言
			//if (result.alert != undefined) {
				//document.getElementById("content").innerHTML += result.alert
					//	+ "<br/>";
			//}
			//列表
			//alert(result.sendMsg);
			/*if (result.names != undefined) {
				document.getElementById("userList").innerHTML = "";
				var arr = result.names;
				for (var i = 0; i < arr.length; i++) {
					document.getElementById("userList").innerHTML += arr[i]
							+ "<br/>";
				}
			}*/
			//聊天内容
			
			if (result.from != undefined) {
				var index=result.sendMsg.indexOf("@&#~");
			    var room=result.sendMsg.substring(0,index);
			    if(room==roomid)
				document.getElementById("content").innerHTML += result.from
						+ " " + result.date + " 说：<br/>" + result.sendMsg.substring(index+4)
						+ "<br/>";
			}
		};
	}

	function wsSend() {

		var msg = document.getElementById("msg");
		var roomid='<%=id%>';
		msg.value=roomid+"@&#~"+msg.value;
		ws.send(msg.value);
		
		msg.value = "";
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
<body style="padding-top: 60px; margin-top: 60px; margin: 8px 0 0 0;">
	<jsp:include page="/client/header_and_footer/header.jsp" flush="true" /><!--动态包含-->
	<br />
	<br />
	<div class="container">
		<!--标题-->
		<div class="row clearfix" style="height:135px">
			<div class="col-sm-12 col-md-12 col-lg-12" style="height:135px">
				<div class="page-header" style="height:135px;margin: 0px 0 0px;">
					<div class="anchor-pic fl" style="position: absolute !important; left: 0; top: 0; width: 124px; height: 124px;"> 
						
						<c:if test="${teacher.getHeadImgUrl() eq '#'}">
							<c:if test="${teacher.getSex() eq 'female'}">
								<img src = "${basePath}/client/image/female_teacher.png" style="width: 100px; height: 100px; border-radius: 4px; vertical-align: middle;">
							</c:if>
							<c:if test="${teacher.getSex() ne 'female'}">
								<img src = "${basePath}/client/image/male_teacher.png" style="width: 100px; height: 100px; border-radius: 4px; vertical-align: middle;">
							</c:if>
						</c:if>
						<c:if test="${teacher.getHeadImgUrl() ne '#'}">
							<img src = "${teacher.getHeadImgUrl()}" style="width: 100px; height: 100px; border-radius: 4px; vertical-align: middle;">
						</c:if>
					</div>
					<div class="relate-text fl" style="margin-left: 130px; float: left; display: inline; height:130px;"> 
						<div class="headline clearfix" style="width: 500px; display:block;">
							<h1 style="max-width: 500px;"> 
								${course.name}
								<c:if test="${course.getIsIpv6() eq '1' }">
									<font size="1" style="color:#838c9a">课程同时支持Ipv6和Ipv4</font>
								</c:if>
								<c:if test="${course.getIsIpv6() ne '1' }">
									<font size="1" style="color:#838c9a">课程仅Ipv4</font>
								</c:if>
							</h1>
						</div>
						<div class="tag-fs-con clearfix" style="display:block;    padding-top: 6px;color: #555;font-size: 12px;overflow: hidden;height: 20px;float: left;" >
							<a href="" style=" display: inline-block;vertical-align: top;height: 18px;line-height: 18px;font-size: 11px;color: #838c9a;cursor: pointer;"> 
    							您的网络是否支持ipv6:<font id="ipv6Status"></font>
    						</a>
    						<br>
    						
						</div>
						
				
						
					<br>
						<div style="display:block;    padding-top: 6px;color: #555;font-size: 25px;overflow: hidden;height: 20px;float: left; margin: 10px 0 0px;" >
							<a href="" style=" display: inline-block;vertical-align: top;height: 18px;line-height: 18px;font-size: 11px;color: #838c9a;cursor: pointer;"> 
    							教师:${teacher.name}
    						</a>
						</div>
					</div>
				</div>
			</div>
		</div>
				
		<div class="row clearfix">
			<div class="col-sm-8 col-md-8 col-lg-8 ">
				<div id="willesPlay">
					<!--播放器头部-->
					<!--播放器内容-->
					<div class="playContent" width="100%" height="600px">
							<div id="player">
							
							<script type="text/javascript">
							function a()
							{
							jwplayer("player").setup({
							flashplayer:"http://[2001:da8:270:2018:f816:3eff:fe9e:c5b6]/client/course/player.swf",
							image:"<%=course.imgUrl%>",
							file:"<%=course.id%>",
							height:"570px",
							width:"100%",
							streamer:"rtmp://[2001:da8:270:2018:f816:3eff:fe9e:c5b6]:1935/rtmplive"
							});
							}
							a()
							</script>
							</div>
					</div>
				</div>
			</div>
			<div id="Playercase" class="border col-sm-4 col-md-4 col-lg-4" style="height:575px">
			<div id ="content"  style="height:500px;overflow:auto">
			
			</div>
       		 <div style="position: relative; zoom:1; width:100%;top:20px">
      			  <textarea style="float:left;padding-left: 0px;
  					  width:78%;resize:none;height:51px;" id="msg" maxlength="50"
						placeholder="和大家一起聊天吧" tabindex="1" data-type="cont"
						style="color: rgb(169, 169, 169);"></textarea>
       			 <div style="" class="sendBtn" onclick="wsSend()">发送</div>
        	</div>
		</div>
		<!--  <input id="msg" />
		<button onclick="wsSend()">send</button>-->

			</div>
			</div>
			</div>

	</div>
	<jsp:include page="/client/header_and_footer/shouyewei.jsp"
		flush="true" /><!--动态包含-->

</body>
</html>