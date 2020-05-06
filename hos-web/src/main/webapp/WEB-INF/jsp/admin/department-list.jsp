<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title></title>
<meta name="description" content="">
<meta name="keywords" content="">
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
.wrap {
	width: 100px;
	height: 20px;
	/*white-space: nowrap;*/
	overflow:hidden;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 1;
}
</style>
</head>

<body class="hold-transition skin-purple sidebar-mini">
	<!-- 正文区域 -->
	<section class="content">

		<div class="box box-primary">
			<!-- 						<div id="contentDetail"> -->
			<div class="box-header with-border">
				<h3 class="box-title">科室详情</h3>
			</div>

			<div class="box-body">
				<!-- 数据表格 -->
				<div class="table-box">
					<!--数据列表-->
					<table id="dataList"
						class="table table-bordered table-striped table-hover dataTable">
						<thead>
							<tr>
								<th>科室名称</th>
								<th>出诊时间</th>
								<th>下班时间</th>
								<th>科室介绍</th>
								<th>图片</th>
								<th class="text-center">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<div title="${department.depName }" class="wrap">${department.depName }</div>
								</td>
								<td>
									<div title="${department.fromDate }" class="wrap">${department.fromDate }</div>
								</td>
								<td>
									<div title="${department.toDate }" class="wrap">${department.toDate }</div>
								</td>
								<td>
									<div title="${department.depDesc }"  class="wrap">
										${department.depDesc }
									</div>
								</td>
								<td>
									<div class="wrap" style="width: 80px;" title="${department.pic }" >
										${department.pic }
									</div>
								</td>

								<td class="text-center">
									<button type="button" class="btn bg-olive btn-xs"
										onclick='location.href="${pageContext.request.contextPath }/department/toEdit.html?id=${department.id}"'>编辑</button>
								</td>
							</tr>
						</tbody>
					</table>
					<!--数据列表/-->
				</div>
				<!-- 数据表格 /-->
			</div>
			<!-- /.box-body -->
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
			$(function(){
				$(window.parent.document.getElementById("mainiframe")).css("display","block");
// 				$(window.parent.document.getElementById("mainiframe1")).css("display","block");
				$(window.parent.document.getElementById("mainiframe1")).css("visibility","visible");
				$(window.parent.document.getElementById("mainiframe2")).css("display","none");
			});
		</script>
</body>

</html>
