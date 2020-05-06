<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>用户编辑</title>
    <meta name="description" content="">
    <meta name="keywords" content="">

    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
          name="viewport">

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
    <link rel="stylesheet" href="../../plugins/bootstrap/css/bootstrap.min.css">
    <script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="../../portal/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../../portal/js/messages_zh.js" type="text/javascript"></script>
</head>

<body class="hold-transition skin-purple sidebar-mini">
<!-- 正文区域 -->
<section class="content">
    <div class="box-body">
        <!--tab页-->
        <div class="nav-tabs-custom">
            <!--tab头-->
            <ul class="nav nav-tabs col-md-10">
                <li class="active"><a href="#tab-form" data-toggle="tab">
                    基本信息
                </a></li>
            </ul>
            <!--tab头/-->
            <!--tab内容-->
            <div class="tab-content col-md-6">
                <form id="myForm" action="${pageContext.request.contextPath }/user/updateUser.html"
                      method="post">
                    <!--表单内容-->
                    <div class="tab-pane active " id="tab-form">
                        <div class="row data-type">
                            <!-- 判断当前添加还是编辑用户 -->
                            <c:if test="${!empty user }">
                                <!-- 添加隐藏域 -->
                                <input type="hidden" name="id" value="${user.id }"/>
                            </c:if>
                            <div class="col-md-3 title">用户名</div>
                            <div class="col-md-9 data">
                                <input type="text" class="form-control" readonly="readonly" name="userName"
                                       value="${user.userName }">
                            </div>

                            <div class="col-md-3 title">真实姓名</div>
                            <div class="col-md-9 data">
                                <input type="text" class="form-control" name="userRealname" id="userRealname"
                                       value="${user.userRealname }">
                            </div>

                            <div class="col-md-3 title">电话</div>
                            <div class="col-md-9 data">
                                <input type="text" class="form-control" name="userTel"
                                       value="${user.userTel }">
                            </div>

                            <div class="col-md-3 title"></div>
                            <div class="col-md-9 data text-center">
                                <button type="button" class="btn bg-maroon" onclick="updateUser()">保存</button>
                                <button type="button" class="btn bg-default"
                                        onclick="window.location.href='${pageContext.request.contextPath}/user/selfManager.html'">
                                    返回
                                </button>
                            </div>
                        </div>
                    </div>
                    <!--表单内容/-->
                </form>
            </div>
            <!--tab内容/-->
        </div>
        <!--tab页/-->
    </div>

</section>
<!-- 正文区域 /-->


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
<script
        src="../../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script
        src="../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
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
<script
        src="../../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script
        src="../../plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>

<script type="text/javascript">
    function updateUser() {
        $.post("${pageContext.request.contextPath }/user/updateUser.action",
            $("#myForm").serialize(),
            function (data) {
                if (data.status == 200) {
                    window.parent.alert("修改成功");
                } else {
                    window.parent.alert(data.msg);
                }

            },
            "json"
        );
    };
</script>
</body>
</html>
<!---->
