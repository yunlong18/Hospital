<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020/4/14
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html style="font-size: 100px;"><!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="author" content="www.fractal-technology.com">
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta name="referrer" content="no-referrer">

    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>xxx医院</title>
    <link rel="stylesheet" type="text/css" href="../../portal/css/global_x.css">
    <link rel="stylesheet" type="text/css" href="../../portal/css/lyc_x.css">
    <link rel="stylesheet" type="text/css" href="../../portal/css/slick.css">
    <link rel="stylesheet" type="text/css" href="../../portal/css/page.css">
    <script src="../../portal/js/jquery.min.js"></script>
    <script src="../../portal/js/global_x.js"></script>
    <script src="../../portal/js/jquery.mousewheel.js"></script>
    <link rel="stylesheet" type="text/css" href="../../portal/css/jquery.mCustomScrollbar.css">
    <script src="../../portal/js/jquery.mCustomScrollbar.min.js"></script>
    <script src="../../portal/js/slick.js"></script>
    <link href="../../portal/css/footer.css" type="text/css" rel="stylesheet">
</head>

<body class="w_1366">
<link rel="stylesheet" type="text/css" href="../../portal/css/global_x_m.css">
<div class="body_box department dorctorlist1" style="min-height: 16px;">
    <jsp:include page="header1.jsp"></jsp:include>
    <div class="position">
        <div class="block">您现在的位置：
            <a href="${pageContext.request.contextPath}/portal/index.action">首页</a>
            &gt; <a href="javascript:void(0);" onclick="window.location.reload()">医生介绍</a></div>
    </div>
    <div class="part1">
        <div class="block">
            <div class="title1">医生介绍</div>
            <div class="box clearfix">
                <div class="deleft">
                    <c:forEach items="${parentDepartment}" var="department" varStatus="vs">
                        <a href="#m${vs.count}" class="a${vs.count}">${department.depName}</a>
                    </c:forEach>
                </div>
                <%--<div class="search-box">
                    <div class="block">
                        <span class="label">出诊信息查询</span>
                        <div class="input">
                            <input id="techang" value="疾病名称" type="text">
                        </div>
                        <div class="input">
                            <input id="keshiname" value="科室名称" type="text">
                        </div>
                        <div class="input">
                            <input id="title" value="医师名称" type="text">
                        </div>
                        <a href="javascript:;" id="search-btn" class="butn1">查询</a>
                    </div>
                </div>--%>
                <script>

                </script>
            </div>
        </div>
    </div>
    <assign name="empty" value="<a></a><a>暂无数据</a>">
        <c:forEach items="${departmentDoctors}" var="departmentDoctor" varStatus="vs1">
        <div class="part2 p${vs1.count}" id="m${vs1.count}">
            <div class="block">
                <div class="caption">${departmentDoctor.key}</div>
                <div class="box clearfix">
                    <c:forEach items="${departmentDoctor.value}" var="department2">
                        <div class="item">
                            <div class="inner">
                                <div class="h2">
                                    <a href="${pageContext.request.contextPath}/doctor/doctorTeam.html?depId=${department2.key.id}">${department2.key.depName}</a>
                                </div>
                                <div class="inner-box clearfix">
                                    <c:forEach items="${department2.value}" var="doctor">
                                        <a class="ellipsis" target="_blank"
                                           href="${pageContext.request.contextPath}/doctor/doctorInfo.html?id=${doctor.id}">${doctor.doctorRealname}</a>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        </c:forEach>
        <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
