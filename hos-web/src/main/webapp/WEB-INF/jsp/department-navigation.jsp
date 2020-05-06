<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="font-size: 100px;">
	<!--<![endif]-->
	<head>
		<meta charset="utf-8">
		<meta http-equiv="Cache-Control" content="no-cache">
		<meta name="format-detection" content="telephone=no">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="renderer" content="webkit">
		<meta name="author" content="www.fractal-technology.com">
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
		<meta name="referrer" content="no-referrer">

		<title>xxx医院</title>
		<meta name="description" content="">
		<meta name="keywords" content="">
		<link rel="stylesheet" type="text/css" href="../../portal/css/global_x.css">
		<link rel="stylesheet" type="text/css" href="../../portal/css/lyc_x.css">
		<link rel="stylesheet" type="text/css" href="../../portal/css/slick.css">
		<link rel="stylesheet" type="text/css" href="../../portal/css/page.css">
		<script src="../../portal/js/jquery.min.js"></script>
		<script src="../../portal/js/global.js"></script>
		<script src="../../portal/js/jquery.mousewheel.js"></script>
		<link rel="stylesheet" type="text/css" href="../../portal/css/jquery.mCustomScrollbar.css">
		<script src="../../portal/js/jquery.mCustomScrollbar.min.js"></script>
		<script src="../../portal/js/slick.js"></script>
		<link rel="stylesheet" type="text/css" href="../../portal/css/footer.css">
	</head>

	<body class="w_1366">
<%--		<link href="../../portal/css/global1.css" rel="stylesheet" type="text/css">--%>
		<style>
			.pubc-box1 li a {
				padding-right: 10px;
			}
		</style>
		<jsp:include page="header1.jsp"></jsp:include>
		<div class="body_box department" style="min-height: 318px;">
			<div class="position">
				<div class="block">您现在的位置：
					<a href="${pageContext.request.contextPath}/portal/index.html" class="crumb">首页</a> &gt;
					<a href="javascript:void(0);" onclick="window.location.reload()">科室导航</a> </div>
			</div>
			<div class="part1">
				<div class="block" style="padding-bottom:40px;">
					<div class="title1">科室导航</div>
					<div class="box clearfix">
						<div class="deleft">
							<c:forEach items="${parentDeparment}" var="department" varStatus="vs">
								<a href="#m${vs.index + 1}" class="a${vs.index + 1}">${department.depName}</a>
							</c:forEach>
						</div>
						<%--<div class="search-box">
							<div class="block">
								<span class="label">出诊信息查询</span>
								<div class="input">
									<input id="techang" value="疾病名称" type="text">
								</div>
								<div class="input">
									<input id="keshiname" value="科室名称" type="text">
								</div>
								<div class="input">
									<input id="title" value="医师名称" type="text">
								</div>
								<a href="javascript:;" id="search-btn" class="butn1">查询</a>
							</div>
						</div>
						<script>
							$('#techang,#keshiname,#title').on('keyup', function(e){
								if(e.keyCode==13){
									$('#search-btn').click();
								}
							});

							$('#search-btn').click(function(){
								var techang = $('#techang').val();
								var keshiname = $('#keshiname').val();
								var title = $('#title').val();

								techang = (techang != '疾病名称') ? techang : '';
								keshiname = (keshiname != '科室名称') ? keshiname : '';
								title = (title != '医师名称') ? title : '';

								if( keshiname == '国际医疗' || keshiname == '国际医疗部' || keshiname == '国际医疗部门诊' ) {
									var _url = '/visitinfo.html' + '?searctabs=' + keshiname;
									window.location.href = _url;
								}else{
									var _url = '/visitsearch.html';
									_url = _url + '?techang=' + encodeURI(techang) + '&keshiname=' + encodeURI(keshiname) + '&title=' + encodeURI(title);

									window.location.href = _url;
								}
							});
						</script>--%>

					</div>
					<c:forEach items="${childDepartments}" var="childDeparment" varStatus="vs2">
						<div class="box1" id="m${vs2.index + 1}">
							<div class="caption">${childDeparment.key}</div>
							<div class="pubc-box1">
								<ul class="clearfix">
									<c:forEach items="${childDeparment.value}" var="department2">
										<li>
											<a class="ellipsis" title="${department2.depName}"
											   href="${pageContext.request.contextPath }/department/department-Info.html?id=${department2.id}" target="_blank">
												<i></i>${department2.depName}
											</a>
										</li>
									</c:forEach>

								</ul>
							</div>
						</div>

					</c:forEach>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>
