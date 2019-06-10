<%@page import="DBFunction.*"%>
<%@page import="Bean.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
	String id = request.getParameter("id");
	if(id==null){
		response.sendRedirect(request.getContextPath()+"/client/login/login.jsp");  
		return;
		
	}
	UserImpl uImpl =new UserImpl();
	User u = uImpl.getUserById(id);
	pageContext.setAttribute("user", u);
%>
<!DOCTYPE html>  
<html lang="zh-CN">  
<head>  
    <meta charset="UTF-8">  
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>personal</title>  
	 <!-- css -->
    <link href="${basePath}/client/css/PC.css" rel="stylesheet" />
    <link href="${basePath}/client/css/bootstrap.css" rel="stylesheet" />
    <link href="${basePath}/client/css/header_and_footer.css" rel="stylesheet" />
	<link href="${basePath}/client/css/personal.css" rel="stylesheet"> 
    <!--javascript-->
    <script src="${basePath}/client/js/jquery.min.js"></script>
    <script src="${basePath}/client/js/bootstrap.js"></script>
   <script src="${basePath}/client/js/layer.js"></script>
    <link href="${basePath}/client/css/header_and_footer.css" rel="stylesheet" />
	
   	 <script type="text/javascript"
	src="${basePath}/client/js/ajaxfileupload.js"></script>
    <script language="javascript">  
	$(function(){
		
		 $("input[name='sex']").each(function () {                

	            if ($(this).val() == "male") { 
	            	$(this).attr("checked", "checked"); 
	            }
	            
	       });
	})
    function chooseFile(){
		$('#fileToUpload').click();
	}

	function ajaxFileUpload() {
		$.ajaxFileUpload({
			url :'<%=request.getContextPath()%>/ajaxUpload',
			secureuri : false,
			fileElementId : 'fileToUpload',
			dataType : 'json',
			success : function(data, status) {
				$('#viewImg').attr('src',data.picUrl)
			},
			error : function(data, status, e) {
				alert('上传出错');
			}
		})

		return false;

	}

 	function saveInfo(){
 		var basePath = '<%=request.getContextPath()%>';
 		var headImgUrl = $('#viewImg').attr('src');
 		var sex = $("input[name='sex']:checked").val();
 		var id='<%=id%>'
 		var name = $('#name').val()
 		var college = $('#college').val();

 		$.post(basePath+"/UserAction",{type:"update"
 			,headImgUrl:headImgUrl
 			,sex:sex
 			,college:college
 			,name:name
 			,id:id},function(result){
 				if(result=="success"){
 					layer.open({
 						icon:1,
 						content:"更新成功"
 					})
 				}else{
 					layer.open({
 						icon:2,
 						content:"更新失败"
 					})
 				}
 			})
 	}
</script> 

</head>  
<body>  

	 <jsp:include page="/client/header_and_footer/header.jsp" flush="true"/><!--动态包含-->  
  <!--选项卡-->  
    <div id="tab">  
        <!--选项的头部-->  
        <div id="tab-header">  
            <ul>  
                <li class="selected">资料设置</li>  
                <li>账号设置</li>  
                <li>消息设置</li>  
                 
                <!--<li>技术</li>-->  
            </ul>  
        </div>  
        <!--主要内容-->  
        <div id="tab-content">  
            <div class="part" style="display: block;">  
                
				<div id="avatar">
				    <div class="type">
				   		   头像
				    </div>
				    <div class="content">
				            <p>
                                <a  onclick="chooseFile()">
                                <c:if test="${user.headImgUrl eq '#'}">
                               		 <img class="avatar-picture" id="viewImg" src="${basePath}/client/image/anonymous.png"></img>
                                </c:if>
                                 <c:if test="${user.headImgUrl ne '#'}">
                               		 <img class="avatar-picture" id="viewImg" src="${user.headImgUrl}"></img>
                                </c:if>
				                </a>
				                <input type="file" id="fileToUpload" name="fileToUpload" onchange="ajaxFileUpload()">	
				            </p>   
                            <div id="light1" class="white_content1">
							    <div style="float:left">
									    上传图片
								</div>
                                 <div id="msgShut1" onclick = "document.getElementById('light1').style.display = 'none';document.getElementById('fade1').style.display='none'">
		                            <a href=""><h2>×</h2></a>
		                         </div>	
								 <div class="PictureButton">
								   <a href="">选择图片</a>
								 </div>
								 <div class="PictureDemand">
								   支持jpg、png或bmp格式的图片
								   <br>
                               			    图片需大于180*180像素，小于20M 
								 </div>
								 
                            </div>   
                            <div id="fade1" class="black_overlay1">
                            </div>	
				 <!--
					        <a href="#"><img class="avatar-picture" src="image/avatar1.jpg"></img></a>
					        -->
							<!--
							<iframe class="avatar-picture" src="avatar.html" >
							</iframe>
							-->
				    </div> 
				</div>
				
				<div id="nickname">
				    <div class="type">
				     		 昵称
				    </div>
				    <div class="content">
					  <input type="text" name="firstname" id="name" value="${user.name}" class="inputName">
				    </div>
		
				</div>
				
				<div id="email">
				    <div class="type">
				 		 邮箱
				  	</div>
				  <div class="content">
				       <span></span>
				       <span>未验证</span>
				       <span class="EmailChange"><a href="#">修改邮箱</a></span>
					   <br>
					   <br>
					   <h5 style="color:gray">用于接收课程通知与电子证书。</h5>
					   <br>
					   
					   <div class="EmailLog">
					   
					      <div class="EmailIcon">
						     <span class="glyphicon glyphicon-paperclip" aria-hidden="true"></span>
						  </div>
						  <div class="EmailLog1">
						     <div class="EmailLog2">
							    <div class="EmailNotice"><h5>验证邮件已发送至您填写的邮箱，请查收并验证</h5></div>
								<a href="#"><div class="EmailLog3">立即登录邮箱验证</div></a>
						     </div>
							 
							 <div class="EmailLog4">
							   
							  <h5>如已验证，请刷新页面</h5>
							  
							  <h5>如果没有收到验证邮件，① 确认邮箱填写正确；② 确认该邮箱已激活；③ 检查垃圾箱；</h5>
                                <h5>   如邮件中链接失效，请点击 &nbsp <a href="#">再次发送验证邮件</a></h5>
							 </div>
						  </div>
					   </div>
				  </div>
				
				</div>
				
				<div id="nickname">
				   <div class="type">
				   真实姓名
				   </div>
				   <div class="content">
				    <input type="text" name="firstname" value="" class="input1"><br>
					 <h5 style="color:gray">用于证书上的名称，如不填写，则默认为昵称</h5>
				   </div>
				</div>
				
				<br>
				<br>
				
				<div id="nickname">
				   <div class="type">
				  性别
				  </div>
				  <div class="content">
				      <input type="radio" name="sex" id="male" value="male" />
				      <label class="SelectLabel" for="male">男</label>
					  <input type="radio" name="sex" id="female" value="female"/>
				      <label class="SelectLabel" for="female">女</label>
				  </div>
				</div>
				
				<div id="nickname">
				   <div class="type">
				    生日
				   </div>
				   <div class="content">
				    <input type="text" name="firstname" value="2000-01-01" class="input2"/>
				   </div>
				</div>
				<!-- 
				<div id="nickname">
				   <div class="type">
				   身份证号
				   </div>
				   <div class="content">
				    <input type="text" name="firstname" value="" class="input3">
					<h5 style="color:gray">请填写你的18位身份证号</h5>
				   </div>
				</div>
				<br>
				 -->
				<div id="nickname">
				  <div class="type">
						  学校
				  </div>
				  <div class="content">
				  <!--
				       <div id="msgDiv">
	                      <div id="msgShut">
		              			      关闭
						  </div>
	                      <div id="msgDetail">
	                      </div>
                       </div>
                       <div id="bgDiv">
                       </div>
                       <a href="#" onClick="showDetail()">点击这里</a></p>
					   -->
					  
					
                    <select id="college" style="height:20px;margin-bottom:1%;padding-top:0">
                    	<option>中国人民大学</option>
                    </select>
				 			 
				</div>
				</div>
				
				
				
				<div id="introduction">
				  <div class="type">
						  个性签名
				  </div>
				  <div class="content">
				     <textarea style="margin: 0px; width: 370px;
				     resize:none;overflow:scroll;overflow-x:hidden; height: 123px;"></textarea>				 
				  </div>
				 
				</div>
				<Button class="SaveButton" onclick="saveInfo()">
					 保存
				</Button>
				
				
				
            </div> 
			
		
			
			
            <div class="part">  
                <div id="current">
				    <div class="type2">当前登录账号</div>
					<div class="content">
					   <h5>ipv6直播课堂001</h5><br>
					   <h5 style="color:gray">学习记录以当前登录账号为准</h5>
					</div>
				</div>
				<div id="other">
				   <div class="type2">第三方账号</div>
					<div class="content">
					   <h5>绑定后可使用以下帐号直接登录当前帐户</h5><br>
					   <div class="OtherChannel">微信/<a href="#">绑定</a></div>
					   <div class="OtherChannel">微博/<a href="#">绑定</a></div>
					   <div class="OtherChannel">腾讯qq/<a href="#">绑定</a></div>
					   <br>
					   <div class="OtherChannel">人人网/<a href="#">绑定</a></div>
					   <div class="OtherChannel">依云/<a href="#">绑定</a></div>
					</div>
				</div>
            </div>  
            <div class="part">  
			    <br>
			    <br>
			    <br>
				
				 <div class="SelectType">
				    <p><input type="checkbox" name="vehicle" value="Bike" checked="checked"/> 订阅平台精品内容推荐</p>
				 </div>
				 <div class="SelectContent">
				    <h5>直播提醒，小编精选内容推荐，好课不容错过！</h5>
				 </div>
				 <br>
				 <div class="SelectType">
				    <p><input type="checkbox" name="vehicle" value="Bike" checked="checked"/> 订阅课程进度邮件</p>
				 </div>
				 <div class="SelectContent">
				    <h5>报名课程的更新和截止日期通知，完成课程的必备利器。</h5>
				 </div>
				 <br>
				 <div class="SelectType">
				    <p><input type="checkbox" name="vehicle" value="Bike" checked="checked"/> 订阅平台自动邮件</p>
				 </div>
				 <div class="SelectContent">
				    <h5>根据个人的操作行为，自动触发邮件进行状态提醒。</h5>
				 </div>
				 <br>
				 
				 <a href="#" style="text-decoration:none;color:white"><div class="SaveButton"><h2>保存</h2></div></a>
            </div>  
            
            
        </div>  
    </div> 
    <div style="height:50px">
    </div>
	    <iframe src="${basePath}/client/header_and_footer/footer.html" id="iframe-footer"></iframe>
</body>  
</html>  