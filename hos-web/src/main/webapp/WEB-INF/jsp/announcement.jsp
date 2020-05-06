<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="font-size: 100px;">
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
<link href="/favicon.ico" type="image/x-icon" rel="shortcut icon">
<link rel="stylesheet" type="text/css"
	href="../../portal/css/global_x.css">
<link rel="stylesheet" type="text/css" href="../../portal/css/lyc_x.css">
<link rel="stylesheet" type="text/css" href="../../portal/css/slick.css">
<link rel="stylesheet" type="text/css" href="../../portal/css/page.css">
<link href="../../portal/css/global_x_m.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" type="text/css" href="../../portal/css/xf.css">
<script src="../../portal/js/global_x.js"></script>
<script src="../../portal/js/jquery.mousewheel.js"></script>
<link rel="stylesheet" type="text/css"
	href="../../portal/css/jquery.mCustomScrollbar.css">
<script src="../../portal/js/jquery.mCustomScrollbar.min.js"></script>
<script src="../../portal/js/slick.js"></script>
<link rel="stylesheet" href="../../portal/css/footer.css"
          type="text/css"/>
<style type="text/css">
.nursing .list li {
	font-size: 16px;
}
</style>
</head>
<body class="w_1366">
	<jsp:include page="header1.jsp"></jsp:include>
	<div class="body_box" style="min-height: 350px;">
		<div class="x-page4">
			<div class="bread">
				<div class="wrap">
					您现在的位置： <a
						href="${pageContext.request.contextPath}/portal/index.html">首页</a>
					&gt; <a href="javascript:void(0);">医院公告</a>
				</div>
			</div>
			<div class="wrap">
				<div class="nursing">
					<div class="t">
						<h1 class="h1">医院公告</h1>
					</div>
					<div id="datalist">
						<ul class="list">
							<c:forEach items="${pageBean.list }" var="content" varStatus="vs">
								<li>
									<a target="_blank" href="${pageContext.request.contextPath }/announcement/announcementDetails.html?id=${content.id}">
									<span class="num">${vs.count }</span>
									<span class="date">${content.updated_x }</span>${content.title }</a>
								</li>
							</c:forEach>
						</ul>
						<div class="part1">
							<div class="block">
								<div class="page">
									<c:if test="${pageBean.currentPage == 1}">
										<a class="prev disactived" href="javascript:void(0);"></a>
									</c:if>
									<c:if test="${pageBean.currentPage != 1}">
										<a class="prev"
											href="${pageContext.request.contextPath}/announcement/list.html?currentPage=${pageBean.currentPage - 1}"></a>
									</c:if>
									<c:forEach begin="1" end="${pageBean.totalPage}" var="i">
										<c:if test="${pageBean.currentPage == i}">
											<a class="now" href="javascript:void(0);">${i}</a>
										</c:if>
										<c:if test="${pageBean.currentPage != i}">
											<a
												href="${pageContext.request.contextPath}/announcement/list.html?currentPage=${i}">${i}</a>
										</c:if>
									</c:forEach>
									<c:if test="${pageBean.currentPage == pageBean.totalPage}">
										<a class="next disactived" href="javascript:void(0);"></a>
									</c:if>
									<c:if test="${pageBean.currentPage != pageBean.totalPage}">
										<a class="next"
											href="${pageContext.request.contextPath}/announcement/list.html?currentPage=${pageBean.currentPage + 1}"></a>
									</c:if>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<div class="pubc-box"></div>
		</div>
	</div>
	<div class="foot" style="position: absolute; bottom: 0px;">
	<div class="footer">
		<span>友情链接：<a href="http://www.baidu.com" target="_blank"
			style="">百度</a>
			<a href="http://www.jd.com" target="_blank"
			   style="">京东</a>
			<a href="http://www.taobao.com" target="_blank"
			   style="">淘宝</a>
			<br>地址：河北省廊坊市<br/>
			电话：0310-8888888 | 传真：021-88888888 <br>
			Copyright &copy; <a href="${pageContext.request.contextPath }/index.html">xxx医院</a> All Rights Reserved.
		</span>
	</div>
</div>
</body>
</html>