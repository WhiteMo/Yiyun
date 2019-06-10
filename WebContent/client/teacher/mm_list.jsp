<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<a
	href="${basePath}/client/teacher/mumber_management.jsp?id=${course.id}"><li>课程人员</li></a>
<a href="${basePath}/client/teacher/myMessage.jsp?id=${course.id}"><li>课程申请</li></a>
<a href="${basePath}/client/course/publish.jsp?id=${course.id}"><li>开始直播</li></a>
<a href="${basePath}/client/teacher/rtmp.jsp?id=${course.id}"><li>推流地址</li></a>
<a href="${basePath}/client/teacher/course.jsp?id=${course.teacherId}"><li>返回课堂管理</li></a>
