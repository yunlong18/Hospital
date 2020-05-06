<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" type="text/css" href="../../portal/css/global_x.css">
    <link rel="stylesheet" type="text/css" href="../../portal/css/lyc_x.css">
    <link rel="stylesheet" type="text/css" href="../../portal/css/slick.css">
    <link rel="stylesheet" type="text/css" href="../../portal/css/page.css">
    <script type="text/javascript" src="../../portal/js/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../portal/css/footer.css">
</head>

<body class="w_1366">
<link rel="stylesheet" type="text/css" href="../../portal/css/global_x_m.css">
<link rel="stylesheet" type="text/css" href="../../portal/css/xf.css">
<%--<script src="/Public/static/themes/common1/js/wookmark.min.js"></script>--%>
<jsp:include page="header1.jsp"></jsp:include>
<div class="body_box" style="min-height: 49px;">
    <div class="x-page2" style="padding-bottom: 30px; background-color: white">
        <div class="bread">
            <div class="wrap">您现在的位置：
                <a href="${pageContext.request.contextPath}/portal/index.html">首页</a>
                &gt; <a href="javascript:void(0);">新闻中心</a></div>
        </div>
        <div class="dynamic nowaterfall" style="margin-bottom: -20px;">
            <div class="wrap">
                <div class="t">
                    <h1 class="h1">新闻中心</h1>
                </div>
                <ul id="datalist" class="list clearfix">
                    <c:forEach items="${pageBean.list}" var="content">
                        <li>
                            <div class="pad">
                                <div class="img scaleimg">
                                    <a href="${pageContext.request.contextPath}/news/newsDetails.html?id=${content.id}" target="_blank">
                                        <img src="${content.pic}" alt="" title=""></a>
                                </div>
                                <h3 title="${content.title}" class="h3 ellipsis">
                                    <a href="${pageContext.request.contextPath}/news/newsDetails.html?id=${content.id}" target="_blank">
                                        ${content.title}
                                    </a>
                                </h3>
                                <p class="p" style="word-wrap: break-word;"></p>
                                <p class="date">${content.updated_x}</p>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
        </div>
        <style>
            .pubc-box {
                margin-bottom: 0;
                padding-bottom: 80px;
            }
        </style>
    </div>
        <div class="part1">
            <div class="block">
                    <div class="page">
                        <c:if test="${pageBean.currentPage == 1}">
                            <a class="prev disactived" href="javascript:void(0);"></a>
                        </c:if>
                        <c:if test="${pageBean.currentPage != 1}">
                            <a class="prev" href="${pageContext.request.contextPath}/news/newCenter.html?currentPage=${pageBean.currentPage - 1}"></a>
                        </c:if>
                        <c:forEach begin="1" end="${pageBean.totalPage}" var="i">
                            <c:if test="${pageBean.currentPage == i}">
                                <a class="now" href="javascript:void(0);">${i}</a>
                            </c:if>
                            <c:if test="${pageBean.currentPage != i}">
                                <a href="${pageContext.request.contextPath}/news/newCenter.html?currentPage=${i}">${i}</a>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pageBean.currentPage == pageBean.totalPage}">
                            <a class="next disactived" href="javascript:void(0);"></a>
                        </c:if>
                        <c:if test="${pageBean.currentPage != pageBean.totalPage}">
                            <a class="next" href="${pageContext.request.contextPath}/news/newCenter.html?currentPage=${pageBean.currentPage + 1}"></a>
                        </c:if>
                        <span class="go">
                        <input type="text" id="currentPage">
                        <input value="GO" type="submit" data-max="2" onclick="jumpCurrentPage($('#currentPage').val())">
                    </span>
                        <script type="text/javascript">
                            function jumpCurrentPage(currentPage) {
                                window.location.href = '${pageContext.request.contextPath}/news/newCenter.html?currentPage=' + currentPage;
                            }
                        </script>
                    </div>
                </div>
            </div>
        </div>
</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
