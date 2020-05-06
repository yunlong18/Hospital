<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 页面头部 -->
<header class="main-header">
	<!-- Logo -->
	<a href="${pageContext.request.contextPath }/doctor/index.html" class="logo">
		<span class="logo-lg">预约管理</span>
	</a>
	<nav class="navbar navbar-static-top">
		<!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button"> 
		</a>

		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<li class="dropdown user user-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <img
						src="${doctorUser.image}" class="user-image" alt="User Image">
						<span class="hidden-xs">${doctorUser.doctorRealname}</span>
				</a>
					<ul class="dropdown-menu">
						<!-- User image -->
						<li class="user-header"><img src="${doctorUser.image}"
							class="img-circle" alt="User Image">
							<p>${doctorUser.doctorRealname} - ${doctorUser.title} </p>
						</li>
						<li class="user-footer">
							<div class="pull-left">
								<a target="menuFrame" href="${pageContext.request.contextPath}/doctor/changePassword.html" class="btn btn-default btn-flat">修改密码</a>
							</div>
							<div class="pull-right">
								<a href="${pageContext.request.contextPath}/doctorSelf/logout.html" class="btn btn-default btn-flat">注销</a>
							</div>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
</header>
<!-- 页面头部 /-->
<!-- 导航侧栏 -->
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<ul class="sidebar-menu">
			<li class="header">菜单</li>

			<li id="admin-index"><a
					href="${pageContext.request.contextPath }/doctor/index.html"> <i
					class="fa fa-dashboard"></i> <span>首页</span>
			</a></li>
			<!-- 菜单 -->
			<!-- 预约管理 -->
			<li class="treeview" id="order-manage"><a href="javascript:;"> <i class="fa fa-phone"></i>
				<span>预约管理</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li id="classification-manage">
						<a target="menuFrame" href="${pageContext.request.contextPath }/doctorOrder/list.html?doctorId=${doctorUser.id}&is_history=false">
							<i class="fa fa-file-text-o"></i> 预约列表
						</a></li>

					<li id="content-manage">
						<a target="menuFrame" href="${pageContext.request.contextPath }/doctorOrder/list.html?doctorId=${doctorUser.id}&is_history=true">
							<i class="fa fa-clock-o"></i> 历史预约
						</a></li>
				</ul>
			</li>
			<li id="schedule-info">
				<a target="menuFrame" href="${pageContext.request.contextPath}/doctorSchedule/list.html?doctorId=${doctorUser.id }"> <i
						class="fa  fa-user-md"></i> <span>排班信息</span>
				</a>
			</li>
			<li id="self-manage">
				<a target="menuFrame" href="${pageContext.request.contextPath}/doctorSelf/toEdit.html?doctorId=${doctorUser.id }"> <i
						class="fa  fa-user-md"></i> <span>个人中心</span>
				</a>
			</li>
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>
<!-- 导航侧栏 /-->