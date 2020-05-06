<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>xxx医院</title>

<link rel="stylesheet" type="text/css" href="../../index/normalize.css">
<link rel="stylesheet" type="text/css" href="../../index/demo.css">
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="../../index/component.css">

<style type="text/css">
#Layer1 {
	position: absolute;
	width: 100%;
	z-index: 2;
	top: 60%;
}

.STYLE3 {
	font-size: medium
}
</style>

</head>
<body>

	<div class="container demo-1">
		<div class="content">
			<div id="large-header" class="large-header">
				<canvas id="demo-canvas" width="1590" height="711"></canvas>
				<h1 class="main-title">
					优爱医院<br>
					<span class="STYLE3">欢迎您 </span>
				</h1>
			</div>
			<div id="Layer1">
				<nav class="codrops-demos"> 
					<a href="${pageContext.request.contextPath }/portal/index.html">患者版</a>
					<a href="${pageContext.request.contextPath }/doctorIndex/index.action">员工版</a>
					<a href="${pageContext.request.contextPath }/adminIndex/index.html">管理员</a>
				</nav>
			</div>
		</div>
	</div>


	<script src="../../index/TweenLite.min.js"></script>
	<script src="../../index/EasePack.min.js"></script>
	<script src="../../index/rAF.js"></script>
	<script src="../../index/demo-1.js"></script>

	<!--下雪-->
	<!-- <script src="xdxuehua.js" type="text/javascript"></script>
		<script>
			createSnow('', 80);
		</script> -->

	<!-- <audio style="width:0px;height:0px;" controls autoplay="autoplay" loop src="http://music.baidutt.com/up/kwcawukm/updcmc.mp3" type="audio/mpeg"></audio> -->

</body>
</html>
