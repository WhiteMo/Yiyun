<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>
<!DOCTYPE html>
<html lang="zh-CN" style="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="${basePath}/client/image/header_brand_image.png" type="image/x-icon"/>
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>选择身份进行注册</title>
    
    <!-- Bootstrap -->
    <link href="${basePath}/client/login/css/bootstrap.css" rel="stylesheet">
    <link href="${basePath}/client/login/css/sign_up.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    
    <!-- Bootstrap core CSS -->
<link href="${basePath}/client/login/css/bootstrap.min.css" rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="${basePath}/client/login/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${basePath}/client/login/css/signin.css" rel="stylesheet">
<script src="${basePath}/client/login/js/jquery-3.3.1.js"></script>
<script src="${basePath}/client/login/js/bootstrap.js"></script>
<script src="${basePath}/client/login/js/ie-emulation-modes-warning.js"></script>
<script src="${basePath}/client/js/layer.js"></script>
<link href="${basePath}/client/login/css/header_and_footer.css" rel="stylesheet" />
<style>
.kuang {
	top: 50%;
	left: 50%;
	position: absolute;
	display: block;
	transform: translate(-50%, -50%);
	width: 500px;
	height: 290px;
	background-color: #f8d6d5;
}

.biaoti {
	text-align: center;
	width: 500px;
	height: 40px;
	font-size: 40px;
	color: white;
	display: block;
	position: absolute;
	margin-top: -60px;
}

.sign {
	text-align: center;
	width: 500px;
	height: 30px;
	font-size: 18px;
	color: white;
	display: block;
	position: absolute;
	margin-top: 40px;
}

.sign a {
	color: white;
}

.sign>a :hover, .sign>a :focus {
	color: #f8d6d5;
}
</style>
</head>
<body style="">
<jsp:include page="/client/header_and_footer/header.jsp" flush="true"/><!--动态包含-->  
    <div class="main">
        <a href="${basePath}/client/login/login.jsp?role=student">
            <div id="student">
                <div id="stu_img" class="stu_img">
                    <img src="${basePath}/client/login/img/student.jpg" />
                    <div>我是学生</div>
                </div>

            </div>
        </a>
        <div id="triangle-topleft"></div>
        <div id="triangle-bottomright"></div>
        <a href="${basePath}/client/login/login.jsp?role=teacher">
            <div id="teacher">
                <div id="tea_img" class="tea_img">
                    <img src="${basePath}/client/login/img/teacher.jpg" />
                    <div>我是老师</div>
                </div>
            </div>
        </a>

    </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!--<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>-->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${basePath}/client/login/js/jquery-3.3.1.js"></script>
    <script src="${basePath}/client/login/js/bootstrap.js"></script>
    <script>
        //function outteacher() {
        //    var a = document.getElementById(student);
        //    a.style.width = calc(33.333 % - 52 - 6.667 % );
        //}
        $("#student").mouseenter(function () {
            $("#student").css({ "width": "calc(40% - 52px)" });
            $("#stu_img").attr("class","stu_big");
        });
        $("#teacher").mouseenter(function () {
            $("#student").css({ "width": "calc(26.666% - 52px)" });
            $("#tea_img").attr("class", "tea_big");
        });
        $("#student").mouseleave(function () {
            $("#student").css({ "width": "calc(33.333% - 52px)" });
            $("#stu_img").attr("class", "stu_img");
        });
        $("#teacher").mouseleave(function () {
            $("#student").css({ "width": "calc(33.333% - 52px)" });
            $("#tea_img").attr("class", "tea_img");
        });


    </script>
</body>
</html>