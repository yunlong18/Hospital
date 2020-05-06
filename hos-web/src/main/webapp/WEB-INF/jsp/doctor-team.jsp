<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    <meta name="description"
          content="">
    <title>xxx医院</title>
    <link href="/favicon.ico" type="image/x-icon" rel="shortcut icon">
    <link rel="stylesheet" type="text/css" href="../../portal/css/global_x.css">
    <link rel="stylesheet" type="text/css" href="../../portal/css/xf.css">
    <link rel="stylesheet" type="text/css" href="../../portal/css/lyc_x.css">
    <link rel="stylesheet" type="text/css" href="../../portal/css/footer.css">
    <script src="../../portal/js/global.js"></script>
    <script src="../../portal/js/jquery.min.js"></script>
    <script src="../../portal/js/jquery.mousewheel.js"></script>
    <link rel="stylesheet" type="text/css" href="../../portal/css/jquery.mCustomScrollbar.css">
    <script src="../../portal/js/jquery.mCustomScrollbar.min.js"></script>
    <script src="../../portal/js/jquery.mScroll.js"></script>
</head>

<body class="w_1366">
<jsp:include page="header1.jsp"></jsp:include>
<div class="body_box dorctorlist" style="min-height: 3px;">
    <div class="position">
        <div class="block">您现在的位置：
            <a href="${pageContext.request.contextPath}/portal/index.html">首页</a>
            &gt;<a href="javascript:void(0);" onclick="window.location.reload()">专家团队</a></div>
    </div>
    <div class="part1">
        <div class="block">
            <div class="caption">
                <span class="s1">专家团队</span>共<span class="s2">${pageBean.totalCount}</span>名医生
                <a href="${pageContext.request.contextPath}/doctor/doctorNavigation.html" class="pubc-more">其他医生</a>
            </div>
            <div id="datalist">
                <div class="list clearfix">
                    <c:forEach items="${pageBean.list}" var="doctor">
                        <div class="item">
                            <a target="_blank" href="${pageContext.request.contextPath}/doctor/doctorInfo.html?id=${doctor.id}">
                                <img title="" src="${doctor.image}">
                                <div class="info">
                                    <div class="inline">
                                        <div class="h2">${doctor.doctorRealname}</div>
                                        <div class="p">${doctor.title}</div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
                <div class="loading">
                    <a href="javascript:void(0);">加载更多</a>
                </div>
                <div class="page">
                    <c:if test="${pageBean.currentPage == 1}">
                        <a class="prev disactived" href="javascript:void(0);"></a>
                    </c:if>
                    <c:if test="${pageBean.currentPage != 1}">
                        <a class="prev" href="${pageContext.request.contextPath}/doctor/doctorTeam.html?currentPage=${pageBean.currentPage - 1}&depId=${depId}"></a>
                    </c:if>
                    <c:forEach begin="1" end="${pageBean.totalPage}" var="i">
                        <c:if test="${pageBean.currentPage == i}">
                            <a class="now" href="javascript:void(0);">${i}</a>
                        </c:if>
                        <c:if test="${pageBean.currentPage != i}">
                            <a href="${pageContext.request.contextPath}/doctor/doctorTeam.html?currentPage=${i}&depId=${depId}">${i}</a>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageBean.currentPage == pageBean.totalPage}">
                        <a class="next disactived" href="javascript:void(0);"></a>
                    </c:if>
                    <c:if test="${pageBean.currentPage != pageBean.totalPage}">
                        <a class="next" href="${pageContext.request.contextPath}/doctor/doctorTeam.html?currentPage=${pageBean.currentPage + 1}&depId=${depId}"></a>
                    </c:if>
                    <span class="go">
                        <input type="text" id="currentPage">
                        <input value="GO" type="submit" data-max="2" onclick="jumpCurrentPage($('#currentPage').val())">
                    </span>
                    <script type="text/javascript">
                        function jumpCurrentPage(currentPage) {
                            window.location.href = '${pageContext.request.contextPath}/doctor/doctorTeam.html?currentPage=' + currentPage + '&depId=${depId}';
                        }
                    </script>
                </div>
            </div>
        </div>
    </div>
    <div class="pubc-box">
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>