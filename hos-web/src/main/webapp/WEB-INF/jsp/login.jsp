<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户登录</title>
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="../../plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="../../plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="../../plugins/iCheck/square/blue.css">
    <script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="../../portal/js/jquery.validate.min.js" type="text/javascript"></script>
	<script src="../../portal/js/messages_zh.js" type="text/javascript"></script>
	
	<script type="text/javascript">
		$(function(){
			$("#userLoginForm").validate({
				rules :{
					userName : {
						"required" : true
					},
					userPassword : {
						"required" : true,
						"rangelength" : [ 6, 12 ]
					}
				},
				messages : {
					userName : {
						"required" : "请输入用户名"
					},
					userPassword : {
						"required" : "请输入密码",
						"rangelength" : "密码必须在6-12位之间"
					}
				}
			});
		});
	</script>
	<style type="text/css">
		.error{
			color : red;
		}
	</style>
</head>

<body class="hold-transition login-page">
    <div class="login-box">
        <div class="login-logo">
           	 优爱医院欢迎您
        </div>
        <!-- /.login-logo -->
        <div class="login-box-body">
            <p class="login-box-msg">登录系统</p>

            <form action="${pageContext.request.contextPath }/user/login.html" method="post" id="userLoginForm">
                <div class="form-group has-feedback">
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                    <input type="text" class="form-control" placeholder="用户名" 
                    	name="userName" id="username" value="${username }">
                </div>
                <div class="form-group has-feedback">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    <input type="password" class="form-control" placeholder="密码" 
                    	name="userPassword" id="password" value="${userPassword }">
                </div>
                <span style="color:red;">${error }</span>
<!--                 <div class="row"> -->
<!--                 	<div class="col-xs-8"></div> -->
<!--                     <div class="col-xs-4"> -->
<!--                         <div class="checkbox icheck"> -->
<!--                             <label><input type="checkbox"> 记住密码</label> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
                <div class="row">
                    <div class="col-xs-12">
                        <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
                    </div>
                </div>
            </form>

           	<span>没有帐号?</span><a href="${pageContext.request.contextPath }/register.html" class="text-center">立即注册</a>

        </div>
        <!-- /.login-box-body -->
    </div>
    <!-- /.login-box -->

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