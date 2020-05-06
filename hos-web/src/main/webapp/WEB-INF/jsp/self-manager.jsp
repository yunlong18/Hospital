<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>个人中心</title>
    <script type="text/javascript" src="../../portal/js/jquery.min.js"></script>
    <script src="../../portal/js/bootstrap.min.js"></script>
    <script src="../../portal/js/jquery.SuperSlide.2.1.1.js"></script>
    <link href="../../portal/css/bootstrap.min.css" type="text/css"
          rel="stylesheet">
    <%--<link rel="stylesheet" type="text/css"
          href="../../portal/css/indexStyle.css"/>
    <link rel="stylesheet" type="text/css" media="screen"
          href="../../portal/css/footer.css">
    <link href="../../portal/css/global_z.css" rel="stylesheet"
          type="text/css">--%>
    <link rel="stylesheet" type="text/css" href="../../portal/css/global_x.css">
    <link rel="stylesheet" type="text/css" href="../../portal/css/lyc_x.css">
    <link rel="stylesheet" type="text/css" href="../../portal/css/slick.css">
    <link rel="stylesheet" type="text/css" href="../../portal/css/page.css">
    <style>
        #self-manager {
            margin: 10px auto;
        }

        a{
            text-decoration: none !important;
        }
        #menuIframe{
            border: 0px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            if(window.parent != window){
                window.parent.location.href='${pageContext.request.contextPath}/user/selfManager.html'
            }
        })
    </script>
</head>
<body style="background-color: white;">

    <jsp:include page="header1.jsp"></jsp:include>
    <div class="position">
        <div class="block">您现在的位置：
            <a href="${pageContext.request.contextPath}/portal/index.html">首页</a>
            &gt; <a href="javascript:void(0);" onclick="window.location.reload()">个人中心</a>
        </div>
    </div>
    <div id="self-manager" class="container-fluid">
        <div class="btn-group-vertical col-md-2" role="group" aria-label="...">
            <button type="button" class="btn btn-lg btn-toolbar" style="margin-left: -1px;" disabled="disabled">个人中心</button>
            <button type="button" class="btn btn-lg btn-default">
                <a target="menuIframe" href="${pageContext.request.contextPath}/user-edit.html">修改信息</a>
            </button>
            <button type="button" class="btn btn-lg btn-default">
                <a target="menuIframe" href="${pageContext.request.contextPath}/changePassword.html">修改密码</a>
            </button>
            <button type="button" class="btn btn-lg btn-default">
                <a target="menuIframe" href="${pageContext.request.contextPath}/credit/creditInfo.html">信誉积分</a>
            </button>
            
        </div>
        <div class="col-md-9" style="margin-top: -25px;">
            <iframe id="menuIframe" name="menuIframe" width="100%" height="500px" src="">

            </iframe>
        </div>
    </div>
</body>
</html>
