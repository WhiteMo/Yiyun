<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    pageContext.setAttribute("basePath", request.getContextPath());
    String role = request.getParameter("role");
    if(role==null){
        response.sendRedirect(request.getContextPath()+"/client/login/role_select.jsp");
        return ;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>注册界面</title>
<link href="${basePath}/client/login/css/bootstrap.min.css" rel="stylesheet">
<script src="${basePath}/client/js/jquery.min.js"></script>
<link href="${basePath}/client/login/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
<!-- Custom styles for this template -->
<script src="yourUrl/md5.min.js"></script>
<script src="http://cdn.bootcss.com/blueimp-md5/1.1.0/js/md5.js"></script> 
<script src="http://cdn.bootcss.com/blueimp-md5/1.1.0/js/md5.min.js"></script>
<script src="yourUrl/md5.min.js"></script>
<script src="http://cdn.bootcss.com/blueimp-md5/1.1.0/js/md5.js"></script> 
<script src="http://cdn.bootcss.com/blueimp-md5/1.1.0/js/md5.min.js"></script>
<link href="${basePath}/client/login/css/signin.css" rel="stylesheet">
<script src="${basePath}/client/login/js/jquery-3.3.1.js"></script>
<script src="${basePath}/client/login/js/bootstrap.js"></script>
<script src="${basePath}/client/login/js/ie-emulation-modes-warning.js"></script>
<script src="${basePath}/client/js/layer.js"></script>
<link href="${basePath}/client/login/css/header_and_footer.css" rel="stylesheet" />
<style type="text/css">
.form-control{
    width:80%
}
</style>
<script>
    
    var au_code = null;
    $(function(){
        $('#sendAuCode').click(function(){
            sendAuCode()
        })
    })
    
    function buttonStatus(count){
        count = parseInt(count);
        if(count>0){
            count=count-1;
            $('#sendAuCode').html(count+'s后重新发送');
            setTimeout("buttonStatus("+count+")",1000)
        }else{
            $('#sendAuCode').attr("disabled", false); 
            $('#sendAuCode').html('点击获取验证码');
        }
    }
    function sendAuCode(){
        var basePath = '<%=request.getContextPath()%>';
        var toMail = $('#toMail').val()
        if(toMail==null||toMail==""){
            alert("请输入邮箱")
        }
        $.post(basePath+"/ValidateAction",{toMail:toMail,type:"getAuCode"},function(result){
            var o = JSON.parse(result);
            
            if(o.result=="success"){
                //layer.msg("验证码已发送",{time:1500});
                au_code = o.au_code;
                
                $('#buttonStatus').attr('disabled',true);
                buttonStatus(15);
            }
        })
    }
    
    
    function adduser() {
        var basePath = '<%=request.getContextPath()%>';
        var name = $("#username").val();
        var password = $("#password").val();
        
        var againpassword = $("#againpassword").val();
        var college = $("#college").find("option:selected").text();
        var teleNumber = $("#teleNumber").val();
        var account=$("#account").val();
        var contract = $("input[type='checkbox']").is(':checked');
        var sex = null;
        var email = $('#toMail').val();
        var obj = document.getElementsByName("gender")
        for (var i = 0; i < obj.length; i++) { //遍历Radio 
            if (obj[i].checked) {
                sex = obj[i].value;
            }
        }
        if(name==null)alert("请输入用户名！");
        else if(contract==false){alert("请阅读用户协议！");}
        else if(college=="请选择"){alert("请选择您的学校！");}
        else if(password!=againpassword) alert("密码不一致！");
        else if(au_code==null||au_code!=$('#au_code').val()){
            alert("请输入正确的验证码");
        }else if(email==null||email==""){
            alert("请输入邮箱");
        }else if(sex==null||sex==""){
            alert("请选择性别");
        }else {
        	password=md5(password);
        	
            $.post(basePath+"/UserAction", {
                name : name,
                password : password,
                sex : sex,
                college : college,
                account:account,
                role:"<%=role%>",
                email:email,
                type : "signup"
            }, function(result) {
                if (result == "success") {
                        window.event.returnValue = false;
                        window.location.href = basePath+"/client/login/login.jsp?role=<%=role%>&message=signsuccess";
                    }
                 else if(result == "failed1"){
                    alert("账户名已注册");
                }
                 else if(result =="failed2")
                     {
                     alert("电话号码已注册");
                     }
                 else if(result=="failed3")
                     {
                     alert("邮箱已注册");
                     }
                 else alert("注册失败");
                
                
            })
        }
    }
</script>
    
<style type="text/css">
body {
    background: url('<%=request.getContextPath()%>/client/login/img/4.jpg')
        no-repeat;
    background-size: cover;
    font-size: 16px;
    background-color: #ab2526
}
.form {
    background: rgba(255, 255, 255, 0.2);
    width: 100%;
    margin: 50px auto;
}
#register_form {
    display: block;
}
input[type="text"], input[type="password"] {
    padding-left: 26px;
}
.checkbox {
    padding-top: 10px;
}
</style>
</head>
<body>
    <c:if test="${empty role}">
        <c:redirect url="/client/login/role_select.jsp"/>
    </c:if>
    <jsp:include page="/client/header_and_footer/header.jsp" flush="true"/><!--动态包含-->  
    <div class="container">
        <div class="form row">
            <form class="col-sm-3 col-md-3 col-lg-3" ></form>
            <form class="form-horizontal col-sm-6 col-md-6 col-lg-6">
                <h3 class="form-title" style="; font-weight:bold">注册账号</h3>
                <div class="col-sm-12 col-md-12 col-md-12">
                 <div class="form-group">
                                <label class="col-sm-4 control-label">性别</label>
                                <div class="col-sm-8">
                                    <label class="radio-inline"><input type="radio"
                                        value="M" name="gender">男</label> <label class="radio-inline"><input
                                        type="radio" value="F" name="gender">女</label> <label
                                        class="radio-inline"><input type="radio" value="null"
                                        name="gender">保密</label>
                                </div>
                </div>
                    <div class="form-group">
                        <h5 class="form_hint">请选择您所在的学校：</h5>
                            <!-- 后台获取数据 -->
                            <select id="college" class="form-control">
                                <option>请选择</option>
                                <option>中国人民大学</option>
                                <option>北京大学</option>
                                <option>清华大学</option>
                                <option>中国政法大学</option>
                                <option>北京理工大学</option>
                                <option>其他</option>
                            </select>
                    </div>
                    <div class="form-group">
                        <h5 class="form_hint">请输入您的学工号（登录账号）：</h5>
                        <input class="form-control required" id="account" type="text"
                            placeholder="可使用英文字符、下划线，最多16个字符" name="account"
                            autofocus="autofocus" />
                    </div>
                  	<div class="form-group">
                        <h5 class="form_hint">请输入您的昵称：</h5>
                        <input class="form-control required" id="username" type="text"
                            placeholder="可使用汉字、英文字符、下划线，最多5个字符" name="username"
                            autofocus="autofocus" />
                    </div>
                    <!-- 
                    <div class="form-group">
                        <h5 class="form_hint">请输入您的手机号：</h5>
                        <input class="form-control required" id="teleNumber" type="text"
                            placeholder="手机号" name="username" autofocus="autofocus" />
                    </div> -->
                    <div class="form-group">
                        <h5 class="form_hint">请输入您的邮箱：</h5>
                        <input class="form-control required" id="toMail" type="email"
                            placeholder="电子邮箱" name="toMail" autofocus="autofocus" />
                    </div>
                    <div class="form-group">
                        <h5 class="form_hint">请输入您的密码：</h5>
                        <input class="form-control required" id="password" type="password"
                            placeholder="建议包含数字、字母、符号，请勿使用过于简单的密码" id="register_password"
                            name="password" />
                    </div>
                    <div class="form-group">
                        <h5 class="form_hint">请确认您的密码：</h5>
                        <input class="form-control required" id="againpassword"
                            type="password" placeholder="需和刚才输入的密码一致" name="rpassword" />
                    </div>
                    <div class="form-group row">
                        <h5 class="form_hint">请输入验证码：</h5>
                        
                            <input class="checknumber" id="au_code" style="width:400px;height:33px;" type="text"  />
                
                            <button type="button" id="sendAuCode" class="btn btn-default" 
                            style="float:right" >点击获取验证码</button>
                        
                    </div>
                    <div class="checkbox">
                        <label> <input type="checkbox" value="1"> 同意协议
                        </label>
                    </div>
                    <div class="form-group">
                        <button  type="button" class="btn btn-md pull-right"
                            onclick="adduser()">注册</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>