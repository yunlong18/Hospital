<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 页面头部 -->
<header class="main-header">
	<!-- Logo -->
	<a href="${pageContext.request.contextPath }/admin/index.html" class="logo">
		<span class="logo-lg"><b>数据</b>后台管理</span>
	</a>
	<nav class="navbar navbar-static-top">
		<!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button"> 
		</a>

		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<li class="dropdown user user-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <img
						src="../img/user2-160x160.jpg" class="user-image" alt="User Image">
						<span class="hidden-xs">Admin</span>
				</a>
					<ul class="dropdown-menu">
						<!-- User image -->
						<li class="user-header"><img src="../img/user2-160x160.jpg"
							class="img-circle" alt="User Image">
							<p>Admin - 数据管理员 </p>
						</li>
						<li class="user-footer">
							<div class="pull-left">
								<a target="menuFrame2" href="${pageContext.request.contextPath}/admin/changePassword.html" class="btn btn-default btn-flat">修改密码</a>
							</div>
							<div class="pull-right">
								<a href="${pageContext.request.contextPath}/adminSelf/logout.html" class="btn btn-default btn-flat">注销</a>
							</div>
						</li>
					</ul></li>
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
					href="${pageContext.request.contextPath }/admin/index.html"> <i
					class="fa fa-dashboard"></i> <span>首页</span>
			</a></li>
			<!-- 菜单 -->

			<!-- 用户管理 -->
			<li id="user-manage" >
				<a target="menuFrame2" href="${pageContext.request.contextPath }/user/list.html"> <i
					class="fa fa-user"></i> <span>用户管理</span>
			</a></li>
			<!-- 医生管理 -->
			<li id="doctor-manage" >
				<a target="menuFrame2" href="${pageContext.request.contextPath }/doctor/list.html"> <i
					class="fa fa-user-md"></i> <span>医生管理</span>
			</a></li>
			<!-- 科室管理 -->
			<li id="department-manage">
				<a target="menuFrame" href="${pageContext.request.contextPath }/admin/department.html">
					<i class="fa fa-stethoscope"></i> <span>科室管理</span>
			</a></li>
			<!-- 排班管理 -->
			<li id="schedule-manage">
				<a target="menuFrame2" href="${pageContext.request.contextPath }/scheduleManager/list.html">
					<i class="fa fa-table"></i> <span>排班管理</span>
			</a></li>
			<!-- 留言管理 -->
			<li id="message-manage">
				<a target="menuFrame2" href="${pageContext.request.contextPath }/feedbackManager/list.html"> <i
					class="fa fa-commenting"></i> <span>留言管理</span>
			</a></li>

			<!-- 预约管理 -->
			<%--<li id="order-manage">
				<a target="menuFrame2" href="${pageContext.request.contextPath }/orderManager/list.html"> <i
					class="fa fa-phone"></i> <span>预约管理</span>
				</a>
			</li>--%>
			<li class="treeview"><a href="javascript:;"> <i class="fa fa-phone"></i>
				<span>预约管理</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li id="order-manage">
						<a target="menuFrame2" href="${pageContext.request.contextPath }/orderManager/list.html?is_history=false">
							<i class="fa fa-file-text-o"></i> 预约列表 <%--fa-circle-of--%>
						</a></li>

					<li id="history-order-manage">
						<a target="menuFrame2" href="${pageContext.request.contextPath }/orderManager/list.html?is_history=true"> <i
								class="fa fa-clock-o"></i> 历史预约
						</a></li>
				</ul></li>
			<!-- 内容管理 -->
			<li class="treeview"><a href="javascript:;"> <i class="fa fa-folder"></i>
					<span>内容管理</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li id="classification-manage">
						<a target="menuFrame2" href="${pageContext.request.contextPath }/admin/content-category.html">
							<i class="fa fa-bookmark"></i> 分类管理
					</a></li>

					<li id="content-manage">
						<a target="menuFrame" href="${pageContext.request.contextPath }/admin/content.html"> <i
							class="fa fa-file-text-o"></i> 内容管理
					</a></li>
				</ul></li>
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>
<!-- 导航侧栏 /-->