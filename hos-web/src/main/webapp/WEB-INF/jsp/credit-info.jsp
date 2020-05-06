<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>信誉积分</title>
    <meta name="description" content="">
    <meta name="keywords" content="">

    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
            name="viewport">
    <link rel="stylesheet"
          href="../../plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="../../plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="../../plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="../../plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="../../plugins/morris/morris.css">
    <link rel="stylesheet"
          href="../../plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="../../plugins/datepicker/datepicker3.css">
    <link rel="stylesheet"
          href="../../plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet"
          href="../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet"
          href="../../plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet"
          href="../../plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet"
          href="../../plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="../../plugins/select2/select2.css">
    <link rel="stylesheet"
          href="../../plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet"
          href="../../plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="../../plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet"
          href="../../plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet"
          href="../../plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet"
          href="../../plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="../../plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet"
          href="../../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
    <script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
</head>

<body class="hold-transition skin-purple sidebar-mini">
<!-- 内容区域 -->
<section class="content">
    <!-- row -->
    <div class="row">
        <div class="col-xs-12">
            <div class="box box-solid">
                <div class="box-body">
                    <div class="row">
                        <div class="col-xs-6 col-md-6 text-center" style="margin-top: 43px;">
                            <input type="text" disabled="disabled" class="knob" value="${credit.creditScore }" data-width="90" data-height="90" data-fgcolor="#3c8dbc">
                            <c:if test="${credit.state == 1}">
	                            <div class="knob-label" style="font-size: 20px;">您的信誉良好，请继续保持</div>
                            </c:if>
                            <c:if test="${credit.state == 0}">
	                            <div class="knob-label" style="font-size: 20px;">注意按时完成就诊</div>
                            </c:if>
                        </div>
                        <div class="col-xs-6 col-md-6 " style="margin-top: -29px;">
                            <h3 style="text-align: center;">积分说明</h3>
                           		积分奖罚：
                           		<ul>
                           			<li>预约成功后,完成就诊<strong>+10</strong>分</li>
                           			<li>预约成功后,未及时就诊<strong>-10</strong>分</li>
                           			<li>每月月初积分会自动<strong>+10</strong>分</li>
                           		</ul>
                           		积分说明:
                           		<ul>
                           			<li>积分低于<strong>80</strong>分将不可再进行预约</li>
                           		</ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="../../plugins/jQueryUI/jquery-ui.min.js"></script>
<script src="../../plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="../../plugins/raphael/raphael-min.js"></script>
<script src="../../plugins/morris/morris.min.js"></script>
<script src="../../plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="../../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script
        src="../../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="../../plugins/knob/jquery.knob.js"></script>
<script src="../../plugins/daterangepicker/moment.min.js"></script>
<script src="../../plugins/daterangepicker/daterangepicker.js"></script>
<script src="../../plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="../../plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="../../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="../../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="../../plugins/fastclick/fastclick.js"></script>
<script src="../../plugins/iCheck/icheck.min.js"></script>
<script src="../../plugins/adminLTE/js/app.min.js"></script>
<script src="../../plugins/treeTable/jquery.treetable.js"></script>
<script src="../../plugins/select2/select2.full.min.js"></script>
<script src="../../plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script
        src="../../plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="../../plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script
        src="../../plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="../../plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="../../plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="../../plugins/ckeditor/ckeditor.js"></script>
<script src="../../plugins/input-mask/jquery.inputmask.js"></script>
<script
        src="../../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="../../plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../../plugins/chartjs/Chart.min.js"></script>
<script src="../../plugins/flot/jquery.flot.min.js"></script>
<script src="../../plugins/flot/jquery.flot.resize.min.js"></script>
<script src="../../plugins/flot/jquery.flot.pie.min.js"></script>
<script src="../../plugins/flot/jquery.flot.categories.min.js"></script>
<script src="../../plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="../../plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="../../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="../../plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
</body>
 <script>
        $(function() {
            $(".knob").knob({
                draw: function() {}
            });
        });
    </script>
</html>
