<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html style="font-size: 100px;">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="author" content="www.fractal-technology.com">
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta name="referrer" content="no-referrer">

    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>xxx医院</title>
    <!-- <link href="/favicon.ico" type="image/x-icon" rel="shortcut icon"> -->
    <link rel="stylesheet" type="text/css"
          href="../../portal/css/global_x.css">
    <link rel="stylesheet" type="text/css" href="../../portal/css/xf.css">
    <link rel="stylesheet" type="text/css" href="../../portal/css/lyc_x.css">
    <script src="../../portal/js/jquery.min.js"></script>
    <script src="../../portal/js/global_x.js"></script>
    <script src="../../portal/js/jquery.mousewheel.js"></script>
    <link rel="stylesheet" type="text/css"
          href="../../portal/css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" type="text/css" media="screen"
          href="../../portal/css/footer.css">
    <script src="../../portal/js/jquery.mCustomScrollbar.min.js"></script>
    <script src="../../portal/js/jquery.mScroll.js"></script>

</head>

<body class="w_1366">
<jsp:include page="header1.jsp"></jsp:include>
<div class="body_box dorctorlist">
    <div class="examination bone">
        <div class="block clearfix">
            <div class="video">
                <img src="${department.pic }" width="493" title="" alt="图片加载失败">
            </div>
            <div class="boxleft">
                <div class="inner">
                    <div id="part1_title" class="part1">
                        <div class="pubc-title1 clearfix">
                            <span class="span1">科室介绍</span>
                            <a href="javascript:;" class="pubc-more">更多内容</a>
                            <div class="ksjj" style="display: none;">
                                <p>${department.depDesc}</p>
                            </div>
                        </div>
                        <div class="desc">
                            <div id="myDesc" style="overflow:hidden;display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 4;">
                                ${department.depDesc }
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="part1">
        <div class="block">
            <div class="caption">
                <span class="s1">专家团队</span>
                <a href="${pageContext.request.contextPath}/doctor/doctorTeam.html?depId=${depId}" class="pubc-more">其他医生</a>
            </div>
            <div id="datalist">
                <div class="list clearfix">
                    <c:forEach items="${pageBean.list }" var="doctor">
                        <div class="item">
                            <a target="_blank"
                               href="${pageContext.request.contextPath }/doctor/doctorInfo.html?id=${doctor.id}">
                                <img title="" src="${doctor.image }">
                                <div class="info">
                                    <div class="inline">
                                        <div class="h2">${doctor.doctorRealname }</div>
                                        <div class="p">${doctor.title }</div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>

            </div>
        </div>
    </div>
    <div class="pubc-box"></div>
</div>
<div class="mask50" style="display: none;">
</div>
<div class="win_alert" style="display: none;">
    <a href="" class="close"></a>
    <div class="win_alert" style="display: none;">
        <a href="" class="close"></a>
        <div class="inner">
            <div class="title1"></div>
            <div class="scroll mCustomScrollbar _mCS_1 mCS_no_scrollbar">
                <div id="mCSB_1" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: 346px;"
                     tabindex="0">
                    <div id="mCSB_1_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
                         style="position: relative; top: 0px; left: 0px;" dir="ltr">
                        <div class="desc" style="overflow-y:scroll; height: 344px; overflow-y:auto; ">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    $(function () {
        var mask50 = $('.mask50'),
            winAlert = $('.win_alert'),
            ksjj = $('#part1_title .ksjj'),
            bland = $("#part1_title .pubc-more");
        $(".win_alert .close").add(mask50).bind('click',function(){
            winAlert.add(mask50).fadeOut();
            return false;
        })

        bland.bind('click',function(){
            winAlert.find('.title1').html($('#part1_title .span1').html());
            winAlert.find('.desc').html(ksjj.html());
            winAlert.add(mask50).fadeIn();
            return false;
        });

        $("#myDesc p:not(:first)").css("display", "none");

    })
</script>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
