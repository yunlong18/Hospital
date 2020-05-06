<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="header guke">
	<div class="nav" style="border-bottom: 1px solid lightgrey">
		<div class="wrap cf">
			<div class="logo">
				<a href="${pageContext.request.contextPath }/portal/index.html">
					<img title="xxx医院" alt="" src="../../portal/images/logom.png">
				</a>
			</div>
			<div class="navList" style="">
				<ul class="cf">
					<li class="on"><a
						href="${pageContext.request.contextPath }/department/department-Info.html?id=${depId }" style="line-height: 91px;"
						class="one" id="depName1"> ${department.depName } </a></li>
					<li>
						<a href="${pageContext.request.contextPath }/announcement/list.html" 
							class="one">预约须知 </a>
					</li>
					<li><a
						href="${pageContext.request.contextPath}/department/department-navigation.html"
						class="one"> 科室导航 </a></li>
					<li><a class="one"
						href="${pageContext.request.contextPath }/doctor/doctorNavigation.html">
							医师介绍 </a></li>
					<li><a href="${pageContext.request.contextPath }/announcement/list.html" class="one">医院公告</a></li>
					<li><a
						href="${pageContext.request.contextPath}/news/newCenter.html"
						class="one">新闻中心</a></li>
					<li><a
						href="${pageContext.request.contextPath}/user/selfManager.html"
						class="one">个人中心</a></li>
					<li><a href="${pageContext.request.contextPath}/feedback.html"
						class="one"> 意见反馈 </a></li>
					<li><a
						href="${pageContext.request.contextPath }/order/orderDetail.html?is_history=false"
						class="one"> ${flag ? "" : "预约详情"} </a></li>
					<li><a
						href="${pageContext.request.contextPath }/order/orderDetail.html?is_history=true"
						class="one"> ${flag ? "历史详情" : ""} </a></li>
				</ul>
			</div>
			<div class="return">
				<a href="${pageContext.request.contextPath }/portal/index.html">返回首页</a>
			</div>
		</div>
	</div>
</div>
