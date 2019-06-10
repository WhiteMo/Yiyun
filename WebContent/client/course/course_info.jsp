<%@page import="Bean.*,DBFunction.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
	String id=request.getParameter("id");
	CourseImpl cImpl  =new CourseImpl();
	User user =null;
	if(session.getAttribute("user")==null){
		response.setCharacterEncoding("UTF-8");
		response.sendRedirect(request.getContextPath()+"/client/login/login.jsp?role=student&message=pleaseLogin");
		return ;
	}else{
		 user = (User)session.getAttribute("user");
		pageContext.setAttribute("user", user);
	};
	Course course=null;
	if(id==null){
		response.sendRedirect(request.getContextPath()+"/client/index.jsp");
		return ;
	}else{
		course = cImpl.getCourseById(id);
		pageContext.setAttribute("course", course);
	}
	String isCheck = new SCImpl().getIsCheck(id, user.id);
	pageContext.setAttribute("isCheck", isCheck);
	String message=request.getParameter("message");
	Comment[] comment = new CommentImpl().getCommentsByCourseId(id);
	pageContext.setAttribute("comments", comment);
%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>course-info</title>

    <link href="${basePath}/client/css/bootstrap.css" rel="stylesheet" />
    <link href="${basePath}/client/css/header_and_footer.css" rel="stylesheet" />
    <link rel="stylesheet" href="${basePath}/client/css/style.css">
    <link rel="stylesheet" href="${basePath}/client/css/comment.css">
      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${basePath}/client/js/jquery-3.3.1.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${basePath}/client/js/bootstrap.js"></script>

    <script src="${basePath}/client/js/header-and-footer.js"></script>
    <script src="${basePath}/client/js/jquery.flexText.js"></script>
    <script src="${basePath}/client/js/layer.js"></script>

    <style>
        #course-info-title {
            background-color: #f6f6f6;
        }
    </style>
    <script type="text/javascript">
    function applyCourse(){
    	var courseId='<%=id%>'
    	var studentId ='<%=user.id%>'
    	var basePath = '<%=request.getContextPath()%>'
    	var isOpen = '<%=course.isOpen%>'
    	$.post(basePath+"/SCAction",{type:"apply"
    		,studentId:studentId
    		,courseId:courseId,isOpen:isOpen},function(result){
    			if(result=='success'){
    				layer.msg("申请成功",{icon:1,time:1000});
    				$('#applyBtn').attr("disabled",true);
    				$('#applyBtn').html('正在申请')
    			}else{
    				layer.msg("申请失败",{icon:2,time:1000});
    			}
    		})
    }
    $(function(){
    	<%
    		if(message!=null){
    			if(message.equals("unPass")){
    				out.write("layer.msg('您正在申请课程中',{icon:3,time:2000})");
    			}else if(message.equals("unApply")){
    				out.write("layer.msg('请先申请',{icon:3,time:2000})");
    			}
    		}
    	%>
    })
    
    function addComment(){
    	var basePath="<%=request.getContextPath()%>"
        var courseId ="<%=id%>"
        var userId = '<%=user.id%>'
	     var content=$('#content').val()
	    
        $.post(basePath+'/CommentAction',{type:"add"
        	,targetId:courseId
        	,userId:userId
        	,content:content
        	,commentType:"course"},function(result){
        		alert(result)
    			var re = JSON.parse(result)
        		if(re.result=="success"){
        			
        			layer.msg("发表成功",{icon:1,time:1500})
        			var oHtml = '<div class="comment-show-con clearfix">'
        					+'<div class="comment-show-con-list pull-left clearfix">'
        					+'<div class="pl-text clearfix"> '
        					+'<a href="#" class="comment-size-name">'
        					+"我"+'</a> <span class="my-pl-con">&nbsp;'+ re.content +'</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+re.date+'</span>'
							+' </div><div class="hf-list-con"></div></div> </div>';
        			$('.comment-show').append(oHtml);
        			
        		}else{
        			layer.msg("发表失败",{icon:2,time:1500})
        		}
        	})
    }
    function updateComment(){
    	var basePath="<%=request.getContextPath()%>"
    	var courseId ="<%=id%>"
    	$.post(basePath+"/CommentAction",{type:'getCommentsByCourseId'
    		,courseId:courseId},function(result){
    		
    	})
    }
    
    </script>
    
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body style="padding-top:60px; margin-top:60px; margin:8px 0 0 0;">
   <jsp:include page="/client/header_and_footer/header.jsp" flush="true"/><!--动态包含-->  
    <div class="container">

        <div id="course-info-title" class="row clearfix" style="position:relative">
            <!--大标题-->
            <div class="list-title">
                <br>
                <h2 style="padding-left:30px">${course.name}</h2>
                <br>
            </div>
            <!--课程信息（简）-->
            <div class="row">
                <div class="col-md-6 col-lg-6 pull-left">
                    <img src="${course.imgUrl}" class="media-object" style="padding-left:30px" width="534" height="308" alt='' />
                </div>
                <div class="col-md-6 col-lg-6">
                    <h4 class="title">课程描述</h4>
                    <p class="text">${course.shortContent} </p>
                    <!-- 
                    <hr class="line">
                    <p class="text-muted">课程分类：<span id="course-type"></span></p>
                    <p class="text-muted">课程时长：<span id="course-lasting"></span></p>
                    <p class="text-muted">开课时间：<span id="course-startingtime"></span></p>
                    <p class="text-muted">教学进度：<span id="course-plan"></span></p>
                    -->
                    <hr class="line">
                    <c:if test="${course.isOpen eq '1'}">
                   	 <p>
                        <a href="${basePath}/client/course/course_live.jsp?id=${course.id}" class="btn btn-default btn-large col-md-5" style="background-color:rgba(255, 147, 38,0.8);color:white;" href="#">
							 观看直播
						</a>
                        <span class="col-md-1"></span>
                        <!-- <a onclick="javasript:layer.msg('暂时没有回放功能，请稍等哦~',{icon:2,time:1000});" class="btn btn-default btn-large col-md-5" style="background-color:rgba(255, 147, 38,0.8);color:white;" href="#">
							 观看回放
						</a> -->
                   	 </p>
                    </c:if>
                    <c:if test="${isCheck eq 'unApply'}">
                    	<p>
                        <a onclick="applyCourse()" id="applyBtn" class="btn btn-default btn-large col-md-5" style="background-color:rgba(255, 147, 38,0.8);color:white;">
							申请听课
						</a>
                   	 </p>
                    </c:if>
                    <c:if test="${isCheck eq '0'}">
                    	<p>
                        <a  class="btn btn-default btn-large col-md-5"  disabled="disabled" style="background-color:rgba(255, 147, 38,0.8);color:white;" href="#">
							正在申请
						</a>
                   	 </p>
                    </c:if>
                    <c:if test="${isCheck eq '1' and (course.isOpen eq '0')}">
                    	<p>
                        <a href="${basePath}/client/course/course_live.jsp?id=${course.id}" class="btn btn-default btn-large col-md-5" style="background-color:rgba(255, 147, 38,0.8);color:white;" href="#">
							 观看直播
						</a>
                        <span class="col-md-1"></span>
                       <!--   <a onclick="#" class="btn btn-default btn-large col-md-5" style="background-color:rgba(255, 147, 38,0.8);color:white;" href="#">
							 观看回放
						</a>-->
							 <a href="${basePath}/client/course/course_info_student.jsp?id=${course.id}" class="btn btn-default btn-large col-md-5" style="background-color:rgba(255, 147, 38,0.8);color:white;" href="#">
							 进入我的课堂
						</a>
                   	 </p>
                   	  <hr class="line">
                   
                    </c:if>
                    
                </div>
            </div>
            <br>
        </div>
        <br>
        <!--选项卡-->
        <div class="row clearfix">
            <ul class="nav nav-tabs" id="myTab">
                <li class="col-md-2 col-lg-2 active">
                    <a class="text-center" href="#course-introduction" data-toggle="tab">课程介绍</a>
                </li>
                <li class="col-md-2 col-lg-2">
                    <a class="text-center" href="#course-teacher" data-toggle="tab">授课教师</a>
                </li>
                <li class="col-md-2 col-lg-2">
                    <a class="text-center" href="#course-source" data-toggle="tab">课程资源</a>
                </li>
                <li class="col-md-2 col-lg-2">
                    <a class="text-center" href="#course-homework" data-toggle="tab">课程作业</a>
                </li>
                <li class="col-md-4 col-lg-4">
                    <a class="text-center" href="#course-question" data-toggle="tab">课程问题与讨论</a>
                </li>
            </ul>
        </div>

        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active" id="course-introduction">
                <br>
                <section>
                    <h4 class="second-title">课程简介</h4>
                    <dl class="course-description">
                       ${course.shortContent}
                    </dl>   
                </section>
            </div>

            <div class="tab-pane fade" id="course-teacher">
                <section>
                    <br>
                    <div class="col-md-12 column">
                        <div class="media">
                            <a href="#" class="pull-left"><img src="../image/course-teacher.png" class="media-object" width="128" height="128" alt='' /></a>
                            <div class="media-body">
                                <h4 class="second-title media-heading">${course.teacherName}</h4>
                                <p class="course-teacher-desc">一些介绍</p>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

            <div class="tab-pane fade" id="course-source">
               <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-337455" href="#panel-element-697264">课件1</a>
                        </div>
                        <div id="panel-element-697264" class="panel-collapse collapse">
                            <div class="panel-body">
                                				一些作业...
                                <div class="form-group">
                                    <label for="exampleInputFile">提交作业</label><input id="exampleInputFile" type="file" />
                                    <p class="help-block">
                                        Example block-level help text here.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>

            <div class="tab-pane fade col-md-12" id="course-homework">
                <br>
                <div class="panel-group" id="panel-337455">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-337455" href="#panel-element-697264">作业1</a>
                        </div>
                        <div id="panel-element-697264" class="panel-collapse collapse">
                            <div class="panel-body">
                                一些作业...
                                <div class="form-group">
                                    <label for="exampleInputFile">提交作业</label><input id="exampleInputFile" type="file" />
                                    <p class="help-block">
                                        Example block-level help text here.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-337455" href="#panel-element-827581">作业2</a>
                        </div>
                        <div id="panel-element-827581" class="panel-collapse collapse">
                            <div class="panel-body">
                                另一些作业...
                                <div class="form-group">
                                    <label for="exampleInputFile">提交作业</label><input id="exampleInputFile" type="file" />
                                    <p class="help-block">
                                        Example block-level help text here.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="tab-pane fade" id="course-question">
                <div class="commentAll">
                    <!--评论区域 begin-->
                    <div class="reviewArea clearfix">
                        <textarea id="content" class="content comment-input" placeholder="Please enter a comment&hellip;" ></textarea>
                        <button  type="button" class="plBtn" onclick="addComment()">评论</button>
                    </div>
                    <!--评论区域 end-->
                    <!--回复区域 begin-->
                    <div class="comment-show">
                      <c:forEach var="comment" items="${comments}">
                        <div class="comment-show-con clearfix">
                     
                       	 <div class="comment-show-con-list pull-left clearfix">
                                <div class="pl-text clearfix">
                                    <a href="#" class="comment-size-name">${comment.getUserName()}</a>
                                    <span class="my-pl-con">&nbsp;${comment.getContent()}</span>
                                </div>
                                <div class="date-dz">
                                    <span class="date-dz-left pull-left comment-time">${comment.getDate() }</span>
                                    <div class="date-dz-right pull-right comment-pl-block">
                                        <!-- <a href="javascript:;" class="date-dz-z pull-left">
                                        <i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a> -->
                                    </div>
                                </div>
                                <div class="hf-list-con"></div>
                            </div>
                        </div>     </c:forEach>
                    </div>
                    <!--回复区域 end-->
                </div>
            </div>
        </div>
    </div>
	<jsp:include page="/client/header_and_footer/shouyewei.jsp"
		flush="true" /><!--动态包含-->

  

</body>

</html>