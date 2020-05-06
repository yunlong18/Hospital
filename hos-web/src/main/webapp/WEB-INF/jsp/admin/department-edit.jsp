<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>xxx医院</title>
<meta name="description" content="">
<meta name="keywords" content="">

<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">

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
<link href="../../../plugins/clockpicker/clockpicker.css"
	rel="stylesheet">
<script type="text/javascript"
	src="../../../plugins/clockpicker/clockpicker.js"></script>
<style type="text/css">
.data-type .title {
	width: 100px;
	float: left;
}
</style>
</head>

<body class="hold-transition skin-purple sidebar-mini">
	<section class="content">
		<!--tab页-->
		<div class="nav-tabs-custom">
			<!--tab头-->
			<ul class="nav nav-tabs">
				<li class="active"><a href="#tab-form" data-toggle="tab">修改信息</a>
				</li>
			</ul>
			<!--tab头/-->

			<!--tab内容-->
			<div class="tab-content">
				<!--表单内容-->
				<div class="tab-pane active" id="tab-form">
					<div class="row data-type">
						<form id="departmentForm"
							action="${pageContext.request.contextPath }/department/saveDepartment.html"
							method="post" enctype="multipart/form-data">
							<!-- 添加隐藏域 -->
							<input type="hidden" id="id" name="id" value="${department.id }" />

							<div class="col-md-2 title">科室名称</div>
							<div class="col-md-10 data">
								<input disabled="disabled" type="text" class="form-control" placeholder="科室名称"
									name="depName" value="${department.depName }">
							</div>

							<div class="col-md-2 title" style="height: 150px">图片</div>
							<div class="col-md-10 data" style="height: 150px">
								<img width="90px" height="120px" alt="暂无照片"
									src="${department.pic }"> <input type="file"
									name="upload" value="上传照片" />
							</div>

							<div class="col-md-2 title">出诊时间</div>
							<div class="col-md-10 data clockpicker">
								<input type="text" class="form-control" autocomplete="off" name="fromDate" value="${department.fromDate }">
								<span class="input-group-addon"> 
									<span class="glyphicon glyphicon-time"></span>
								</span>
							</div>

							<div class="col-md-2 title">下班时间</div>
							<div class="col-md-10 data clockpicker">
								<input type="text" class="form-control" autocomplete="off" name="toDate" value="${department.toDate }">
								<span class="input-group-addon"> 
									<span class="glyphicon glyphicon-time"></span>
								</span>
							</div>

							<div class="col-md-2 title">科室介绍</div>
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
										<textarea id="departmentDesc" name="depDesc" rows="10" cols="80">
                                            ${department.depDesc }
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
			CKEDITOR.replace('departmentDesc');
			$('.clockpicker').clockpicker();
		});
	</script>
</body>
</html>
