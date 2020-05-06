<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="header guke">
	<div class="nav" style="background-color: white;">
		<div class="wrap cf">
			<div class="logo">
				<a href="${pageContext.request.contextPath }/portal/index.html"> 
					<img title="xxx医院" alt="" src="../../portal/images/logom.png">
				</a>
			</div>
			<div class="navList">
				<style type="text/css">
					a{
						color: #0061ff;
					}
				</style>
				<ul class="cf">
					<li class="on">
						<a href="${pageContext.request.contextPath }/department/department-Info.html?id=${depId }" 
							class="one" id="depName1">${department.depName }</a>
					</li>
					<li class="on">
						<a href="${pageContext.request.contextPath }/announcement/list.html" style="color: #0061ff;line-height: 4;"
							class="one on">预约须知 </a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/department/department-navigation.html" class="one">科室导航</a>
					</li>
					<li>
						<a class="one" href="${pageContext.request.contextPath }/doctor/doctorNavigation.html">医师介绍</a>
					</li>

					<li>
						<a href="${pageContext.request.contextPath }/announcement/list.html" class="one">医院公告</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/news/newCenter.html" class="one">新闻中心</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/user/selfManager.html" class="one">个人中心</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/feedback.html" class="one">
							意见反馈
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
