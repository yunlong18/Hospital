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
<jsp:include page="header1.jsp"></jsp:include>
<div class="body_box" style="min-height: 107px;">
    <div class="x-page3" style="padding-bottom:30px">
        <div class="bread">
        	<c:if test="${content.categoryId == 10 }">
	            <div class="wrap">您现在的位置：
	                <a href="${pageContext.request.contextPath}/portal/index.html">首页</a>
	                &gt; <a href="${pageContext.request.contextPath}/news/newCenter.html">新闻中心</a>
	                &gt; <a href="javascript:void(0);">新闻详情</a>
	            </div>
	        </c:if>
        	<c:if test="${content.categoryId == 12 }">
	            <div class="wrap">您现在的位置：
	                <a href="${pageContext.request.contextPath}/portal/index.html">首页</a>
	                &gt; <a href="${pageContext.request.contextPath}/announcement/list.html">医院公告</a>
	                &gt; <a href="javascript:void(0);">公告详情</a>
	            </div>
	        </c:if>
        </div>
        <div class="article">
            <div class="wrap clearfix" style="margin:0 250px;">
                <div class="main">
                    <div class="t">${content.title}</div>
                    <div class="tip">
                        <span>时间：<i>${content.updated_x}</i></span>
                        <span>${content.subTitle}</span>
                        <span>${content.titleDesc}</span>
                    </div>
                    <div class="text" style="font-size: 18px;">
                        ${content.content}
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
