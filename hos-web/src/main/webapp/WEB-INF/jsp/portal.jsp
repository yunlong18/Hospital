<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"> -->
<script type="text/javascript" src="../../portal/js/jquery.min.js"></script>
<script src="../../portal/js/bootstrap.min.js"></script>
<script src="../../portal/js/jquery.SuperSlide.2.1.1.js"></script>
<link href="../../portal/css/bootstrap.min.css" type="text/css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="../../portal/css/indexStyle.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="../../portal/css/footer.css">
<%--<link href="../../portal/css/global_z.css" rel="stylesheet"--%>
<%--	type="text/css">--%>
	<link rel="stylesheet" type="text/css" href="../../portal/css/global_x.css">
	<link rel="stylesheet" type="text/css" href="../../portal/css/lyc_x.css">
	<link rel="stylesheet" type="text/css" href="../../portal/css/slick.css">
	<link rel="stylesheet" type="text/css" href="../../portal/css/page.css">
<title>xxx医院官网</title>

<style type="text/css">
.nav>li.on1>ul {
	display: block;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<!-- 页面头部 -->
		<div id="top" class="center-block">
			<!-- 登录和注册 -->
			<div
				style="background-color: ghostwhite; line-height: 30px; text-align: center;">
				<span>欢迎来到优爱医院</span>
				<div class="pull-right">
					<ol class="list-inline">
						<c:if test="${empty user }">
							<li><a href="${pageContext.request.contextPath }/login.html">登录</a></li>
							<li><a href="${pageContext.request.contextPath }/register.html">注册</a></li>
						</c:if>
						<c:if test="${!empty user }">
							<li>
								<a href="${pageContext.request.contextPath}/user/selfManager.html"><span style="color: #008d4c">您好${user.userRealname }!</span></a>
								<a href="javascript:void(0);" onclick="logout()">退出</a>
							</li>
						</c:if>
						<li><a href="${pageContext.request.contextPath }/order/orderDetail.html?is_history=false"
							target="_blank">预约详情</a></li>
					</ol>
				</div>
			</div>
			<jsp:include page="header2.jsp"></jsp:include>
		</div>
		<!-- 轮播图 -->
		<div id="myCarousel" class="carousel slide" data-ride="carousel" >
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<c:forEach items="${contentList }" var="content" varStatus="status">
					<c:if test="${status.index == 0 }">
						<li data-target="#myCarousel" data-slide-to="${status.index }"
							class="active"></li>
					</c:if>
					<c:if test="${status.index != 0 }">
						<li data-target="#myCarousel" data-slide-to="${status.index }"></li>
					</c:if>
				</c:forEach>
			</ol>
			<div class="carousel-inner" role="listbox">
				<c:forEach items="${contentList }" var="content" varStatus="status">
					<c:if test="${status.index == 0 }">
						<div class="item active">
							<a target="_blank" href="${content.url }">
								<img style="width: 1319px; height: 413px;" src="${content.pic }" alt="..." />
							</a>
						</div>
					</c:if>
					<c:if test="${status.index != 0 }">
						<div class="item">
							<a target="_blank" href="${content.url }">
								<img src="${content.pic }" alt="..." style="width: 1319px; height: 413px;" />
							</a>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!-- 轮播结束 -->
		<!-- 新闻中心 -->
		<div style="background-color: #fafafa;">
			<!-- 新闻头 -->
			<div style="margin-left: 450px;">
				<img src="../../portal/images/title1.jpg" />
			</div>
			<!-- 新闻体 -->
			<div >
				<!-- 新闻体左 -->
				<div class="pull-left">
					<!-- 小轮播图 -->
					<div id="myCarousela" class="carousel slide"
						style="width: 550px; height: 350px; margin-left: 50px;"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<c:forEach items="${contentList1}" var="content" varStatus="vs">
								<c:if test="${vs.index == 0}">
									<li data-target="#myCarousela" data-slide-to="${vs.index}" class="active"></li>
								</c:if>
								<c:if test="${vs.index != 0}">
									<li data-target="#myCarousela" data-slide-to="${vs.index}"></li>
								</c:if>
							</c:forEach>
							<%--<li data-target="#myCarousela" data-slide-to="1"></li>
							<li data-target="#myCarousela" data-slide-to="2"></li>--%>
						</ol>
						<div class="carousel-inner" style="width: 550px; height: 350px;" role="listbox">
							<c:forEach items="${contentList1}" var="content" varStatus="vs1">
								<c:if test="${vs1.index  == 0}">
									<div class="item active">
										<a href="${pageContext.request.contextPath }/news/newsDetails.html?id=${content.id}" target="_blank">
											<img src="${content.pic}" style="width: 550px; height: 350px;" alt="loading">
										</a>
										<div class="carousel-caption">
											<p>${content.title}</p>
										</div>
									</div>
								</c:if>
								<c:if test="${vs1.index  != 0}">
									<div class="item">
										<a href="${pageContext.request.contextPath }/news/newsDetails.html?id=${content.id}" target="_blank">
											<img src="${content.pic}"
												style="width: 550px; height: 350px;" alt="loading">
										</a>
										<div class="carousel-caption">
											<p>${content.title}</p>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- 新闻体右 -->
				<div class="list-group pull-left set-hover"
					style="width: 550px; height: 350px; margin-left: 30px; background-color: #fafafa;" >
					<a href="${pageContext.request.contextPath}/news/newCenter.html" style="text-align: right;" class="list-group-item">
						更多&gt;&gt; </a>
					<c:forEach items="${contentList2}" var="content" varStatus="vs">
						<a href="${pageContext.request.contextPath }/news/newsDetails.html?id=${content.id}"
						   target="_blank" class="list-group-item">
							<strong>[${vs.count}]&nbsp;&nbsp;&nbsp;<strong>${content.title}</strong></strong>
						</a>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="clearfix" style="background-color: #fafafa;"></div>
		<!-- 科室导航 -->
		<div class="index_4" style="background-color: #fafafa;">
			<!-- 导航头 -->
			<div style="margin-left: 450px;">
				<img src="../../portal/images/title2.png" />
			</div>
			<!-- 导航体 -->
			<div class="ind_4_cont cf" style="margin-left: 50px;">
				<div class="img ratio-img" style="height: 311px;" data-ratio="0.735">
					<a class="tan_scale a" href="" target="_blank">
						<img title="" alt="" src="">
						<div class="tit">
							<div class="con">
								<h2></h2>
								<p></p>
							</div>
						</div>
					</a>
				</div>
				<div class="r">
					<div class="tabClick cf">
						<c:forEach items="${parentDepartment }" var="department" varStatus="vs">
							<c:if test="${vs.index == 0 }">
								<a class="a a${(vs.index % 3) + 1} on" href="javascript:;">${department.depName }<i></i></a>
							</c:if>
							<c:if test="${vs.index != 0 }">
								<a class="a a${(vs.index % 3) + 1}" href="javascript:;">${department.depName }<i></i></a>
							</c:if>
						</c:forEach>
						<a class="a a10" href="${pageContext.request.contextPath}/department/department-navigation.html">更多科室<i></i></a>
					</div>
					<div class="i4-list">

						<c:forEach items="${childDepartments }" var="childDepartment" varStatus="vs">
							<c:if test="${vs.index == 0 }">
								<div class="child cf on">
									<ul>
										<c:forEach items="${childDepartment }" var="department1" varStatus="vs1">
											<c:if test="${vs1.index == 0 }">
												<li class="on">
													<a class="ellipsis" href="${pageContext.request.contextPath }/department/department-Info.html?id=${department1.id}"
														data-p="${department1.depDesc }"
														data-h="${department1.depName }" data-alt="" data-title=""
														data-src="${department1.pic }"><i></i>
														${department1.depName }
													</a>
												</li>
											</c:if>
											<c:if test="${vs1.index != 0 }">
												<li>
													<a class="ellipsis" href="${pageContext.request.contextPath }/department/department-Info.html?id=${department1.id}"
														data-p="${department1.depDesc }"
														data-h="${department1.depName }" data-alt="" data-title=""
														data-src="${department1.pic }"><i></i>
														${department1.depName }
													</a>
												</li>
											</c:if>
										</c:forEach>

									</ul>
								</div>
							</c:if>
							<c:if test="${vs.index != 0 }">
								<div class="child cf">
									<ul>
										<c:forEach items="${childDepartment }" var="department2" varStatus="vs2">
											<c:if test="${vs2.index == 0 }">
												<li class="on">
													<a class="ellipsis" href="${pageContext.request.contextPath }/department/department-Info.html?id=${department2.id}"
														data-p="${department2.depDesc }"
														data-h="${department2.depName }" data-alt="" data-title=""
														data-src="${department2.pic }"><i></i>
														${department2.depName }
													</a>
												</li>
											</c:if>
											<c:if test="${vs2.index != 0 }">
												<li>
													<a class="ellipsis" href="${pageContext.request.contextPath }/department/department-Info.html?id=${department2.id}"
														data-p="${department2.depDesc }"
														data-h="${department2.depName }" data-alt="" data-title=""
														data-src="${department2.pic }"><i></i>
														${department2.depName }
													</a>
												</li>
											</c:if>
										</c:forEach>

									</ul>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script>
	
		// 退出登录
		function logout(){
			$.get("${pageContext.request.contextPath }/user/logout.action",
				function(data){
					window.location.reload();
				},
				"json"
			);
		}
		
		$(function() {
			// 为被点击的超链接添加class属性
			$(".tabClick .a").not(".a10").on(
					"click",
					function() {
						var i = $(this).index();
						$(this).addClass("on").siblings().removeClass("on");
						$(".i4-list .child").eq(i).addClass("on").siblings()
								.removeClass("on");
						$(".i4-list .child").eq(i).find("li").eq(0).find("a")
								.mouseover()
					});

			// 当鼠标放在选中元素上时，修改左边元素信息			
			$(document).on(
					"mouseover",
					".i4-list li a",
					function(e) {
						//e.preventDefault();
						var i = $(this).closest("li").index();
						$(this).closest("li").addClass("on").siblings()
								.removeClass("on");

						var _title = $(this).data("title");
						var _alt = $(this).data("alt");
						var _h = $(this).data("h");
						var _p = $(this).data("p");
						var _src = $(this).data("src");
						var _href = $(this).attr("href");

						$(".ind_4_cont .img .a").attr({
							"href" : _href
						});
						$(".ind_4_cont .img img").attr({
							"src" : _src
						});
						$(".ind_4_cont .img img").attr({
							"title" : _title
						});
						$(".ind_4_cont .img img").attr({
							"alt" : _alt
						});
						$(".ind_4_cont .img .con h2").html(_h);
						$(".ind_4_cont .img .con p").html(_p);

					});

			$(".tabClick .a1").click();
			$(".nav li").hover(function() {
				$(this).addClass("on1");
			}, function() {
				$(this).removeClass("on1");
			});
		});
	</script>
</body>

</html>
