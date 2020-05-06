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
        .selectMargin{
            margin-left: -3px;
        }
    </style>
</head>

<body class="hold-transition skin-purple sidebar-mini">
<div id="fullbg"></div>
<!-- 内容头部 -->
<section class="content-header">
    <h1>
        订单管理 <small><c:if test="${empty order }">添加</c:if><c:if
            test="${!empty order }">修改</c:if>订单</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="all-admin-index.html"><i
                class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="all-travellog-review-list.html">订单管理</a></li>
        <li class="active"><c:if test="${empty order }">添加</c:if> <c:if
                test="${!empty order }">修改</c:if>订单</li>
    </ol>
</section>
<!-- 内容头部 /-->

<!-- 正文区域 -->
<section class="content">
    <!--tab页-->
    <div class="nav-tabs-custom">
        <!--tab头-->
        <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-form" data-toggle="tab"><c:if test="${empty order }">添加</c:if><c:if
                    test="${!empty order }">修改</c:if>列表</a>
            </li>
        </ul>
        <!--tab头/-->

        <!--tab内容-->
        <div class="tab-content">
            <!--表单内容-->
            <div class="tab-pane active" id="tab-form">
                <div class="row data-type">
                    <form id="orderForm" action="${pageContext.request.contextPath }/orderManager/saveOrder.html" method="post">
                        <c:if test="${!empty order }">
                            <!-- 添加隐藏域 -->
                            <input type="hidden" name="id" value="${order.id }" />
                        </c:if>
                        <div class="col-md-2 title">医师姓名</div>
                        <div class="col-md-4 data">
                            <button type="button" class="btn btn-default" onclick="selectDoctor()">选择</button>
                            <span id="doctorName">${order.doctorRealname}</span>
                            <input type="hidden" id="doctorId" name="doctorId" value="${order.doctorId}">
                            <input type="hidden" id="doctorRealname" name="doctorRealname" value="${order.doctorRealname}">
                            <%--<input type="text" class="form-control" placeholder="医师姓名"
                                   name="doctorRealname" value="${order.doctorRealname }">--%>
                        </div>

                        <div class="col-md-2 title">医师电话</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" placeholder="医师电话" id="doctorTel"
                                   name="doctorTel" value="${order.doctorTel }">
                        </div>

                        <div class="col-md-2 title">患者姓名</div>
                        <div class="col-md-4 data">
                            <button type="button" class="btn btn-default" onclick="selectUser()">选择</button>
                            <span id="userName">${order.userRealname}</span>
                            <input type="hidden" id="userId" name="userId" value="${order.userId}">
                            <input type="hidden" id="userRealname" name="userRealname" value="${order.userRealname}">
                        </div>
                        <div class="col-md-2 title">患者电话</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" placeholder="患者电话" id="userTel"
                                   name="userTel" value="${order.userTel }">
                        </div>

                        <div class="col-md-2 title">预约日期</div>
                        <div class="col-md-4 data">
                            <input type="text" autocomplete="off" class="form-control" placeholder="预约日期" id="orderDate"
                                   name="orderDate" value="${order.orderDate_x }">
                        </div>

                        <div class="col-md-2 title">预约状态</div>
                        <div class="form-group form-inline col-md-4">
                            <select class="form-control selectMargin" name="state">
                                <option value="0"
                                        <c:if test="${order.state == 0 }">selected</c:if>>预约中</option>
                                <option value="1"
                                        <c:if test="${order.state == 1 }">selected</c:if>>预约成功</option>
                                <option value="2"
                                        <c:if test="${order.state == 2 }">selected</c:if>>预约失败</option>
                            </select>
                        </div>

                        <div class="col-md-2 title">就诊状态</div>
                        <div class="form-group form-inline col-md-4" >
                            <select class="form-control selectMargin" name="visitState">
                                <option value="0"
                                        <c:if test="${order.visitState == 0 }">selected</c:if>>未就诊</option>
                                <option value="1"
                                        <c:if test="${order.visitState == 1 }">selected</c:if>>已就诊</option>
                                <option value="2"
                                        <c:if test="${order.visitState == 2 }">selected</c:if>>已过期</option>
                            </select>
                        </div>

                        <div class="col-md-2 title">订单状态</div>
                        <div class="form-group form-inline col-md-4" >
                            <select class="form-control selectMargin" name="historyState">
                                <option value="0"
                                        <c:if test="${order.historyState == true}">selected</c:if>>有效</option>
                                <option value="1"
                                        <c:if test="${order.historyState == false}">selected</c:if>>无效</option>

                            </select>
                        </div>

                        <div class="col-md-2 title">病情简述</div>
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
                                </div>
                                <div class="box-body pad">
										<textarea id="illnessDesc" name="illnessDesc" rows="10" cols="80">
                                            ${order.illnessDesc}
									    </textarea>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2 title">医师留言</div>
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
                                </div>
                                <div class="box-body pad">
										<textarea id="doctorMessage" name="doctorMessage" rows="10" cols="80">
                                            ${order.doctorMessage}
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
        CKEDITOR.replace('illnessDesc');
        CKEDITOR.replace('doctorMessage');

        $("#orderDate").datepicker({
            format : 'yyyy-mm-dd',
            autoclose : true
        });
    });

    function selectUser(){
        window.open('${pageContext.request.contextPath}/user/list1.html','',
            'width=800,height=450,top=' + window.outerHeight/4 + ',left=' + window.outerWidth/4);
    }

    function selectDoctor(){
        window.open('${pageContext.request.contextPath}/doctor/list1.html','',
            'width=1000,height=450,top=' + window.outerHeight/4 + ',left=' + window.outerWidth/7);
    }
</script>
</body>
</html>
