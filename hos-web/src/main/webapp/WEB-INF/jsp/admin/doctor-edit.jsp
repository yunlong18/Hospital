<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>医生编辑</title>
<meta name="description" content="">
<meta name="keywords" content="">

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">

<script src="../../../plugins/jQuery/jquery-2.2.3.min.js"></script>
<link rel="stylesheet"
	href="../../../plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../../../plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="../../../plugins/ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="../../../plugins/iCheck/square/blue.css">
<link rel="stylesheet" href="../../../plugins/morris/morris.css">
<link rel="stylesheet"
	href="../../../plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet"
	href="../../../plugins/datepicker/datepicker3.css">
<link rel="stylesheet"
	href="../../../plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet"
	href="../../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet"
	href="../../../plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet"
	href="../../../plugins/treeTable/jquery.treetable.css">
<link rel="stylesheet"
	href="../../../plugins/treeTable/jquery.treetable.theme.default.css">
<link rel="stylesheet" href="../../../plugins/select2/select2.css">
<link rel="stylesheet"
	href="../../../plugins/colorpicker/bootstrap-colorpicker.min.css">
<link rel="stylesheet"
	href="../../../plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
<link rel="stylesheet" href="../../../plugins/adminLTE/css/AdminLTE.css">
<link rel="stylesheet"
	href="../../../plugins/adminLTE/css/skins/_all-skins.min.css">
<link rel="stylesheet" href="../../../css/style.css">
<link rel="stylesheet"
	href="../../../plugins/ionslider/ion.rangeSlider.css">
<link rel="stylesheet"
	href="../../../plugins/ionslider/ion.rangeSlider.skinNice.css">
<link rel="stylesheet"
	href="../../../plugins/bootstrap-slider/slider.css">
<link rel="stylesheet"
	href="../../../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
<link rel="stylesheet" href="../../../zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript" src="../../../js/jquery.ztree.all-3.5.js"></script>
<style type="text/css">
#dialog {
	background-color: #ffffff;
	border: 0px solid rgba(0, 0, 0, 0.4);
	height: 300px;
	left: 50%;
	margin: -350px 0 0 -200px;
	padding: 1px;
	position: fixed !important;
	/* 浮动对话框 */
	position: absolute;
	top: 50%;
	width: 300px;
	z-index: 5000;
	border-radius: 5px;
	display: none;
}

#fullbg {
	background-color: white;
	left: 0;
	opacity: 0.3;
	position: absolute;
	top: 0;
	z-index: 4500;
	filter: alpha(opacity = 50);
	-moz-opacity: 0.5;
	-khtml-opacity: 0.5;
}

a {
	color: #333;
	text-decoration: none !important;
}

th {
	text-align: center;
}

.ztree li span.button.add {
	margin-left: 2px;
	margin-right: -1px;
	background-position: -144px 0;
	vertical-align: top;
	*vertical-align: middle
}
</style>
</head>

<body class="hold-transition skin-purple sidebar-mini">
	<div id="fullbg"></div>
	<!-- 内容头部 -->
	<section class="content-header">
		<h1>
			医生管理 <small><c:if test="${empty doctor }">添加</c:if><c:if
							test="${!empty doctor }">修改</c:if>信息</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="all-admin-index.html"><i
					class="fa fa-dashboard"></i> 首页</a></li>
			<li><a href="all-travellog-review-list.html">医生管理</a></li>
			<li class="active"><c:if test="${empty doctor }">添加</c:if> <c:if
							test="${!empty doctor }">修改</c:if>消息</li>
		</ol>
	</section>
	<!-- 内容头部 /-->

	<!-- 正文区域 -->
	<section class="content">
		<!--tab页-->
		<div class="nav-tabs-custom">
			<!--tab头-->
			<ul class="nav nav-tabs">
				<li class="active"><a href="#tab-form" data-toggle="tab"><c:if test="${empty doctor }">添加</c:if> <c:if
										test="${!empty doctor }">修改</c:if>列表</a>
				</li>
			</ul>
			<!--tab头/-->

			<!--tab内容-->
			<div class="tab-content">
				<!--表单内容-->
				<div class="tab-pane active" id="tab-form">
					<div class="row data-type">
						<form id="doctorForm" action="${pageContext.request.contextPath }/doctor/saveDoctor.html" method="post" enctype="multipart/form-data">
							<c:if test="${!empty doctor }">
								<!-- 添加隐藏域 -->
								<input type="hidden" id="doctorId" name="id" value="${doctor.id }" />
							</c:if>
							<c:if test="${empty doctor }">
								<!-- 添加隐藏域 -->
								<input type="hidden" id="doctorId" name="id" value="" />
							</c:if>
							<div class="col-md-2 title" style="height: 150px">照片</div>
							<div class="col-md-10 data" style="height: 150px">
								<img width="90px" height="120px" alt="暂无照片"
									src="${doctor.image }"> 
								<input type="file" name="upload" value="上传照片" />
							</div>
							<div class="col-md-2 title">用户名</div>
							<div class="col-md-10 data">
								<input type="text" class="form-control" placeholder="用户名"
									name="userName" value="${doctor.userName }">
							</div>

							<div class="col-md-2 title">密码</div>
							<div class="col-md-10 data">
								<input type="text" class="form-control" placeholder="密码"
									name="userPassword" value="${doctor.userPassword }">
							</div>

							<div class="col-md-2 title">真实姓名</div>
							<div class="col-md-10 data">
								<input type="text" class="form-control" placeholder="真实姓名"
									name="doctorRealname" value="${doctor.doctorRealname }">
							</div>
							<div class="col-md-2 title">联系方式</div>
							<div class="col-md-10 data">
								<input type="text" class="form-control" placeholder="联系方式"
									name="doctorTel" value="${doctor.doctorTel }">
							</div>

							<div class="col-md-2 title">年龄</div>
							<div class="col-md-10 data">
								<input type="text" class="form-control" placeholder="年龄"
									name="age" value="${doctor.age }">
							</div>

							<div class="col-md-2 title">职称</div>
							<div class="col-md-10 data">
								<input type="text" class="form-control" placeholder="职称"
									name="title" value="${doctor.title }">
							</div>
							<div class="col-md-2 title">医龄</div>
							<div class="col-md-10 data">
								<input type="text" name="workAge" class="form-control"
									placeholder="医龄" value="${doctor.workAge }">
							</div>
							<div class="col-md-2 title">性别</div>
							<div class="col-md-10 data">
								<select class="form-control" name="sex">
									<option value="1"
										<c:if test="${doctor.sex == 1 }">selected</c:if>>男</option>
									<option value="2"
										<c:if test="${doctor.sex == 2 }">selected</c:if>>女</option>
								</select>
							</div>

							<div class="col-md-2 title">科室</div>
							<div class="col-md-10 data">
								<input type="hidden" id="depId" name="depId"
									value="${doctor.depId }">
								<button id="cross_line" type="button" class="btn btn-default">选择</button>
								<span id="depName"></span>
							</div>
							<div class="container" id="dialog"
								style="width: 400px; height: 450px;">
								<div class="row">
									<div class="col-md-1"></div>
									<div class="zTreeDemoBackground left col-md-2 ">
										<ul id="treeDemo" class="ztree"></ul>
									</div>
									<div class="col-md-9"></div>
								</div>
								
							</div>

							<div class="col-md-2 title">医生简介</div>
							<div class="col-md-10 data" style="height: 100%">
								<div class="box box-info">
									<div class="box-header">
										<!-- tools box -->
										<div class="pull-right box-tools">
											<button type="button" class="btn btn-info btn-sm"
												data-widget="collapse" data-toggle="tooltip"
												title="Collapse">
												<i class="fa fa-minus"></i>
											</button>
										</div>
										<!-- /. tools -->
									</div>
									<!-- /.box-header -->
									<div class="box-body pad">
										<textarea id="doctorInfo" name="doctorInfo" rows="10"
											cols="80">
											${doctor.doctorInfo }
									</textarea>
									</div>
								</div>
							</div>


							<div class="col-md-2 title">详情介绍</div>
							<div class="col-md-10 data" style="height: 100%">
								<div class="box box-info">
									<div class="box-header">
										<!-- tools box -->
										<div class="pull-right box-tools">
											<button type="button" class="btn btn-info btn-sm"
												data-widget="collapse" data-toggle="tooltip"
												title="Collapse">
												<i class="fa fa-minus"></i>
											</button>
										</div>
										<!-- /. tools -->
									</div>
									<!-- /.box-header -->
									<div class="box-body pad">
										<textarea id="doctorDetails" name="doctorDetails" rows="10" cols="80">
                                            
									</textarea>
									</div>
								</div>
							</div>

							<div class="col-md-2 title"></div>
							<div class="col-md-10 data text-center">
								<button type="submit" class="btn bg-maroon">保存</button>
								<button type="button" class="btn bg-default"
									onclick="history.back(-1);">返回</button>
							</div>
						</form>
					</div>

				</div>
				<!--表单内容/-->
			</div>
			<!--tab内容/-->
		</div>

	</section>
	<!-- 正文区域 /-->
	<script src="../../../plugins/jQueryUI/jquery-ui.min.js"></script>
	<script src="../../../plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../../plugins/raphael/raphael-min.js"></script>
	<script src="../../../plugins/morris/morris.min.js"></script>
	<script src="../../../plugins/sparkline/jquery.sparkline.min.js"></script>
	<script
		src="../../../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="../../../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script src="../../../plugins/knob/jquery.knob.js"></script>
	<script src="../../../plugins/daterangepicker/moment.min.js"></script>
	<script src="../../../plugins/daterangepicker/daterangepicker.js"></script>
	<script src="../../../plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
	<script src="../../../plugins/datepicker/bootstrap-datepicker.js"></script>
	<script
		src="../../../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script
		src="../../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<script src="../../../plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<script src="../../../plugins/fastclick/fastclick.js"></script>
	<script src="../../../plugins/iCheck/icheck.min.js"></script>
	<script src="../../../plugins/adminLTE/js/app.min.js"></script>
	<script src="../../../plugins/treeTable/jquery.treetable.js"></script>
	<script src="../../../plugins/select2/select2.full.min.js"></script>
	<script src="../../../plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	<script
		src="../../../plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
	<script
		src="../../../plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
	<script
		src="../../../plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
	<script src="../../../plugins/bootstrap-markdown/js/markdown.js"></script>
	<script src="../../../plugins/bootstrap-markdown/js/to-markdown.js"></script>
	<script src="../../../plugins/ckeditor/ckeditor.js"></script>
	<script src="../../../plugins/input-mask/jquery.inputmask.js"></script>
	<script
		src="../../../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script
		src="../../../plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<script src="../../../plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="../../../plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script src="../../../plugins/chartjs/Chart.min.js"></script>
	<script src="../../../plugins/flot/jquery.flot.min.js"></script>
	<script src="../../../plugins/flot/jquery.flot.resize.min.js"></script>
	<script src="../../../plugins/flot/jquery.flot.pie.min.js"></script>
	<script src="../../../plugins/flot/jquery.flot.categories.min.js"></script>
	<script src="../../../plugins/ionslider/ion.rangeSlider.min.js"></script>
	<script src="../../../plugins/bootstrap-slider/bootstrap-slider.js"></script>
	<script
		src="../../../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
	<script
		src="../../../plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script>
		$(function() {
			CKEDITOR.replace('doctorInfo');
			CKEDITOR.replace('doctorDetails');
			
			if($("#doctorId").val() != ""){
				$.post("${pageContext.request.contextPath }/doctor/doctorDesc.action",
				{"doctorId":$("#doctorId").val()},
				function(data){
					$("#doctorDetails").text(data.data);		
				},
				"json");
			}
			if($("#depId").val() != ""){
				$.post("${pageContext.request.contextPath }/department/getDepartmentToJson.action",
				{"id":$("#depId").val()},
				function(data){
					$("#depName").html(data.depName);		
				},
				"json");
			}
			
		});

		//cross_line为点击事件的目标id
		$('#cross_line').on('click', function() {
			var bh = $('body').height();
			var bw = $('body').width();
			$('#fullbg').css({
				height : bh,
				width : bw,
				display : "block"
			})
			$('#dialog').slideDown();
		});
		
	</script>
	<SCRIPT type="text/javascript">
		var setting = {
			data : {
				simpleData : {
					enable : true
				}
			},
			callback : {
				beforeClick : beforeClick,
				onClick : selectDepartment
			}
		};
	
		function beforeClick(treeId, treeNode,
				clickFlag) {
			if (!treeNode.parent)
				return true;
			else
				return false;
		}
	
		function selectDepartment(event, treeId, treeNode) {
			$("#depName").html(treeNode.name);
			$("#depId").val(treeNode.id);
			$("#dialog,#fullbg").hide();
		};
		$(document).ready(function() {
			$.ajax({
				async:false,
				   type: "POST",
				   url: "${pageContext.request.contextPath}/department/nodeList.action",
				   success: function(data){
					   $.fn.zTree.init(
								$("#treeDemo"),
								setting,
								data);
				   },
				   dataType:"json"
				});
		});
		
	</SCRIPT>
</body>

</html>
<!---->
