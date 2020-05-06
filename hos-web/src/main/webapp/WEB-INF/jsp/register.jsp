<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">


    <title>用户注册</title>

    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="../../plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="../../plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="../../plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="../../plugins/iCheck/square/blue.css">
    <script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="../../portal/js/jquery.validate.min.js" type="text/javascript"></script>
	<script src="../../portal/js/messages_zh.js" type="text/javascript"></script>
	<script type="text/javascript">
	// 自定义校验规则
	// $.validator.addMethod("checkUsername",function(value,element,params){});
	// 异步校验用户名是否已经存在
	$.validator.addMethod(
		// 校验规则的名称
		"checkUsername",
		// 判断的函数
		function(value, element, params) {
			var flag = false;
			$.ajax({
				"async" : false,
				"data" : {
					userName : value
				},
				"dataType" : "json",
				"url" : "${pageContext.request.contextPath}/user/checkUserName.action",
				"type" : "POST",
				"success" : function(data) {
					flag = data.data;
				}
			});
			return !flag;
		});
		// 自定义手机号验证
		$.validator.addMethod("isPhone",function(value,element,params){
			 var length = value.length;  
			 var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;  
			 return this.optional(element) || (length == 11 && mobile.test(value));  
		});
		
		// 用于校验表单数据
		$(function() {
			$("#userForm").validate({
				rules : {
					userName : {
						"required" : true,
						"checkUsername" : true
					},
					userTel : {
						"required" : true,
						"isPhone" : true
					},
					userRealname : {
						"required" : true,
						"minlength" : 2
					},
					userPassword : {
						"required" : true,
						"rangelength" : [ 6, 12 ]
					},
					repassword : {
						"required" : true,
						"equalTo" : "#password"
					}
				},
				messages : {
					userName : {
						"required" : "用户名不能为空",
						"checkUsername" : "用户已存在"
					},
					userTel : {
						"required" : "手机号不能为空",
						"isPhone" : "请输入正确的手机号"
					},
					userRealname : {
						"required" : "姓名不能为空",
						"minlength" : "长度不能小于两位"
					},
					userPassword : {
						"required" : "密码不能为空",
						"rangelength" : "密码必须在6-12位之间"
					},
					repassword : {
						"required" : "密码不能为空",
						"equalTo" : "两次密码不一致"
					}
				}
			});
		});
</script>

<style type="text/css">
	.error{
		color: red;
	}
</style>
</head>

<body class="hold-transition register-page">
    <div class="register-box">
        <div class="register-logo">
            	欢迎注册
        </div>

        <div class="register-box-body">
            <p class="login-box-msg">新用户注册</p>

            <form action="${pageContext.request.contextPath }/user/register.html" method="post" id="userForm">
                <div class="form-group has-feedback">
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                    <input type="text" class="form-control" placeholder="用户名" name="userName" id="username">
                </div>
                <div class="form-group has-feedback">
                    <span class="glyphicon glyphicon-phone-alt form-control-feedback"></span>
                    <input type="text" class="form-control" placeholder="手机号" name="userTel" id="usertel">
                </div>
                <div class="form-group has-feedback">
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                    <input type="text" class="form-control" placeholder="真实姓名" name="userRealname" id="userrealname">
                </div>
                <div class="form-group has-feedback">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    <input placeholder="密码长度必须在6-12位之间" type="password" class="form-control" placeholder="密码" name="userPassword" id="password">
                </div>
                <div class="form-group has-feedback">
                    <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
                    <input type="password" class="form-control" placeholder="确认密码" name="repassword" id="repassword">
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <button type="submit" class="btn btn-primary btn-block btn-flat">注册</button>
                    </div>
                    <span style="color: red;">${error }</span>
                </div>
            </form>
            <span>已有帐号？</span><a href="${pageContext.request.contextPath }/login.html" class="text-center">登录</a>
        </div>
        <!-- /.form-box -->
    </div>
    <!-- /.register-box -->

    <!-- jQuery 2.2.3 -->
    <!-- Bootstrap 3.3.6 -->
    <!-- iCheck -->
    <script src="../../plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../plugins/iCheck/icheck.min.js"></script>
    <script>
        $(function() {
            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });
        });
    </script>
</body>

</html>