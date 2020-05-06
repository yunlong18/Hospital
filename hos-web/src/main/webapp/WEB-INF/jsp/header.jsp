<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- logo和搜索 -->
<div class="row" style="height: 80px; background-color: white;">
	<div id="top_logo" class="col-md-5 pull-left">
		<a href="index.html" target="_blank"> <img src="../../portal/images/logom.png" />
		</a>
	</div>
	<div class="input-group pull-left col-md-3" style="margin-top: 25px;">
		<input type="text" class="form-control" placeholder="请输入您要查找的内容">
		<span class="input-group-btn">
			<button class="btn btn-default" type="button">搜索</button>
		</span>
	</div>
</div>
<!-- 导航栏 -->
<div role="navigation">
	<ul class="nav nav-pills nav-justified" style="background-color: #386ed3;">
		<li role="presentation" class="daohang" style="background-color: #0055ff;">
			<a href="${pageContext.request.contextPath }/portal/index.html" target="_self">
				<span class="setWhite">首页</span>
			</a>
		</li>
		<li role="presentation" class="daohang"><a
			href="${pageContext.request.contextPath}/department/department-navigation.html"> <span class="setWhite">科室导航</span></a></li>
		<li role="presentation" class="daohang"><a href="${pageContext.request.contextPath }/doctor/doctorNavigation.html"><span
				class="setWhite">医师介绍</span></a></li>
		<li role="presentation" class="daohang">
			<a href="#"> 
				<span class="setWhite">意见反馈</span>
			</a>
		</li>
		<li role="presentation" class="dropdown daohang"><a
			class="dropdown-toggle" data-toggle="dropdown" href="#" role="button"
			aria-haspopup="true" aria-expanded="false"> <span
				class="setWhite">医院概况</span><span class="caret setWhite"></span>
		</a>
			<ul class="dropdown-menu">
				<li><a href="#"><span class="setWhite">医院简介</span></a></li>
				<!-- <li role="separator" class="divider"></li> -->
				<li><a href="#"><span class="setWhite">医院文化</span></a></li>
				<!-- <li role="separator" class="divider"></li> -->
				<li><a href="#"><span class="setWhite">发展历程</span></a></li>
				<!-- <li role="separator" class="divider"></li> -->
				<li><a href="#"><span class="setWhite">领导信息</span></a></li>
			</ul></li>
		<li role="presentation" class="dropdown daohang"><a
			class="dropdown-toggle" data-toggle="dropdown" href="#" role="button"
			aria-haspopup="true" aria-expanded="false"> <span
				class="setWhite">新闻动态</span> <span class="caret setWhite"></span>
		</a>
			<ul class="dropdown-menu">
				<li><a href="#"><span class="setWhite">公司新闻</span></a></li>
				<!-- <li role="separator" class="divider"></li> -->
				<li><a href="#"><span class="setWhite">行业新闻</span></a></li>
			</ul></li>
		<li role="presentation" class="daohang"><a href="${pageContext.request.contextPath}/user/selfManager.html"><span
				class="setWhite">个人中心</span></a></li>
	</ul>
</div>
