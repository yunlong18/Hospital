<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<title>医师介绍</title>
<!-- <link href="/favicon.ico" type="image/x-icon" rel="shortcut icon"> -->
<link rel="stylesheet" type="text/css"
	href="../../portal/css/global_x.css">
<link rel="stylesheet" type="text/css" href="../../portal/css/xf.css">
<link rel="stylesheet" type="text/css"
	href="../../portal/css/lyc_x.css">
<script src="../../portal/js/jquery.min.js"></script>
<link rel="stylesheet" href="../../portal/css/bootstrap.min.css"
	type="text/css" />
<script src="../../portal/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../../portal/js/global_x.js"></script>
<script src="../../portal/js/jquery.mousewheel.js"></script>
<link rel="stylesheet" type="text/css"
	href="../../portal/css/jquery.mCustomScrollbar.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="../../portal/css/footer.css">
<script src="../../portal/js/jquery.mCustomScrollbar.min.js"></script>
<script src="../../portal/js/jquery.mScroll.js"></script>
 <link rel="stylesheet" href="../../plugins/datepicker/datepicker3.css">
 <script src="../../plugins/datepicker/bootstrap-datepicker.js"></script>
<style type="text/css">
#dialog {
	background-color: #ffffff;
/* 	border: 5px solid rgba(0, 0, 0, 0.4); */
	height: 300px;
	left: 50%;
	margin: -200px 0 0 -200px;
	padding: 1px;
	position: fixed !important;
	/* 浮动对话框 */
	position: absolute;
	top: 50%;
	width: 300px;
	z-index: 10000;
	border-radius: 5px;
	display: none;
}

#fullbg {
	background-color: #0a0b0c;
	left: 0;
	opacity: 0.5;
	position: absolute;
	top: 0;
	z-index: 10000;
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
.setWidth {
	width: auto !important;
	float: none !important;
}

</style>
</head>

<body class="w_1366">
	<div id="fullbg"></div>
	<jsp:include page="header1.jsp"></jsp:include>
	<div class="body_box dorctordtail" style="min-height: 318px;">
		<div class="position">
			<div class="block">
				您现在的位置： <a href="${pageContext.request.contextPath}/portal/index.html">首页</a> &gt;<a
					href="javascript:void(0);" onclick="window.location.reload()">医师介绍</a>
			</div>
		</div>
		<div class="part1">
			<div class="block clearfix">
				<div class="img">
					<img src="${doctor.image }">
				</div>
				<div class="text-box">
					<div class="dorname">
						<div class="title1">
							${doctor.doctorRealname }
							<a href="${pageContext.request.contextPath}/doctor/doctorTeam.html?depId=${doctor.depId}" class="pubc-more">查看科室更多医生</a>
						</div>
						<div class="title2">${doctor.title }</div>
						<div class="title2">
							${doctor.doctorInfo }
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="docker-visit" class="part2">
			<div class="block">
				<div class="title1">
					<span>出诊信息</span>
					<!-- <a href="/visitinfo.html" class="pubc-more">查看更多</a> -->
				</div>
				<div class="table">
					<table>
						<tbody>
							<tr class="trth">
								<th class="col-md-1">医生</th>
								<th class="col-md-2">科室</th>
								<th class="col-md-1">医龄</th>
								<th class="col-md-8">排班信息</th>
<!-- 								<th class="th6">操作</th> -->
							</tr>
							<tr class="tr1">
								<td class="td1">
									<div class="td">${doctor.doctorRealname }</div>
								</td>
								<td class="td1">
									<div class="td" id="depName"></div>
								</td>
								<td class="td1">
									<div class="td">${doctor.workAge }</div>
								</td>
								<td class="tab-box table1 td1">
									<c:if test="${empty scheduleList }">
										<span style="font-size: 20px; line-height: 67px;">暂无预约信息</span>
									</c:if>
									<c:if test="${!empty scheduleList }">
				                        <div class="table2-box">
				                            <table class="table2">
				                                <tbody>
					                                <tr>
					                                    <c:forEach items="${scheduleList }" var="schedule"> 
					                                    	<th class="tb2-th2">
					                                    		<strong>${schedule.workDate_x } <br/>
					                                    		${schedule.workTime_x }</strong>
					                                    	</th>
					                                    </c:forEach>
					                                </tr>
					                                <tr>
					                                    <c:forEach items="${scheduleList }" var="schedule" varStatus="vs">
					                                    	<c:if test="${empty credit }">
							                                    <td>
							                                    	<a href="javascript:;" id="selectNumberm${vs.index }" class="pubc-more setWidth"
							                                    		onclick="selectSourceNumber('selectNumberm${vs.index }', ${schedule.id })" >选号</a>
							                                    </td>	
					                                    	</c:if>
					                                    	<c:if test="${!empty credit }">
						                                    	<c:if test="${credit.state == 1 }">
								                                    <td>
								                                    	<a href="javascript:;" id="selectNumberm${vs.index }" class="pubc-more setWidth"
								                                    		onclick="selectSourceNumber('selectNumberm${vs.index }', ${schedule.id })" >选号</a>
								                                    </td>	
						                                    	</c:if>
						                                    	<c:if test="${credit.state == 0 }">
								                                    <td>
								                                    	<a href="javascript:;" class="pubc-more setWidth"
								                                    		onclick="alert('您的信誉积分不足')" >选号</a>
								                                    </td>	
						                                    	</c:if>
					                                    	</c:if>
					                                    </c:forEach>
					                                </tr>
				                            	</tbody>
				                            </table>
				                        </div>
				                    </c:if>
				                </td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="container" id="dialog"
			style="width: 400px; height: 450px;">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-11">
					<form id="myform" action="${pageContext.request.contextPath }/order/createOrder.html"
						class="form-horizontal" style="margin-top: 5px;" method="post">
						
						<!-- 添加隐藏域 -->
						<input type="hidden" name="doctorId" value="${doctor.id }">
						<input type="hidden" name="doctorRealname" value="${doctor.doctorRealname }">
						<input type="hidden" name="doctorTel" value="${doctor.doctorTel }">
						<input type="hidden" name="scheduleId" id="scheduleIdInput">
						<div style="height: 20px;"></div>
						<div class="form-group">
							<label for="username" class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="username"
									name="userRealname" placeholder="请输入用户名" value="${user.userRealname }">
							</div>
						</div>
						<div class="form-group">
							<label for="usertel" class="col-sm-2 control-label">手机号</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="usertel"
									name="userTel" placeholder="请输入手机号" value="${user.userTel }">
							</div>
						</div>
						<div class="form-group">
							<label for="orderDate" class="col-sm-2 control-label">预约日期</label>
							<div class="col-sm-6">
								<input type="text" readonly="readonly" class="form-control" id="orderDate"
									name="orderDate1" autocomplete="off" >
							</div>
						</div>
						<div class="form-group">
							<label for="illnessDesc" class="col-sm-2 control-label">病情简述</label>
							<div class="col-sm-6">
								<textarea id="illnessDesc" name="illnessDesc" class="form-control" style="height: 150px; overflow: hidden">
								
								</textarea>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10"
								style="padding-left: 80px;">
								<button type="submit" class="btn btn-primary">确认</button>
								<button type="button" class="btn btn-default" id="closeDiv"
									style="margin-left: 10px;">取消</button>
							</div>
						</div>
					</form>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
		<div class="part3">
			<div class="block">
				<div class="title1">详细介绍</div>
				<div class="desc">
					${doctorDesc }
				</div>
			</div>
		</div>
		<input type="hidden" id="depId" value="${doctor.depId }"/>
		<input type="hidden" id="userId" value="${user.id }">
	</div>
	<div class="mask50" style="display: none;">
</div>
<div class="win_alert" style="display: none;">
    <a href="" class="close"></a>
    <div class="win_alert" style="display: none;">
        <a href="" class="close"></a>
        <p style="font-size: 20px;padding-left: 30px;padding-top: 30px;">选择号源</p>
        <div class="inner" id="showSourceNumber" style="padding:10px;">
        	
        </div>
    </div>
</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript">
		//点击button按钮关闭遮罩层和弹框
		$("#closeDiv").on('click', function() {
			$("#dialog,#fullbg").hide();
		});
		
		$(function(){
			var depId = $("#depId").val();
			$.post("${pageContext.request.contextPath}/doctor/department.action",
				{"id" : depId},
				function(data){
					$("#depName").text(data.data.depName);
					$("#depName1").text(data.data.depName);
				},
				"json"
			);
			
           /*  $('#orderDate').datepicker({
                autoclose: true,
                format: 'yyyy-mm-dd'
            }); */
            
            var mask50 = $('.mask50'),
            winAlert = $('.win_alert'),
            bland = $(".pubc-more");
	        $(".win_alert .close").add(mask50).bind('click',function(){
	            winAlert.add(mask50).fadeOut();
	            return false;
	        });
	        
		});
		
		function selectSourceNumber(domId, id){
			if($("#userId").val() == ""){
				alert("请先登录");
				return ;
			} 
			var mask50 = $('.mask50');
			var winAlert = $('.win_alert');
			
			$.ajax({
			   type: "POST",
			   url: "${pageContext.request.contextPath}/scheduleManager/sourceNumber.action",
			   data: {
					"scheduleId" : id
				},
			   success: function(data){
            		$("#showSourceNumber").text("");
            		if(data.data.length <= 0){
            			alert("今日号源已预约完");
            		}
            		var content = '<input type="hidden" id="initDate" value="' + data.data[0].date_x + '"/>';
            		content += '<input type="hidden" id="scheduleId" value="' + data.data[0].scheduleId + '"/>';
            		for (var i = 0; i < data.data.length; i++) {
            			content += '<div class="col-md-2" style="margin-top:20px;">';
            			content += '<button type="button" onclick="ackNumber($(this).text())" class="btn btn-link btn-lg">';
            			content += data.data[i].startTime_x + "-" + data.data[i].endTime_x;
            			content += '</button></div>';
            		}
            		$("#showSourceNumber").append(content);
            	},
				dataType:"json",
				async : false
			});
            winAlert.add(mask50).fadeIn();
            return false;
        }
		function ackNumber(workTime){
			$("#orderDate").val($("#initDate").val() + workTime.split("-")[0]);
			$("#scheduleIdInput").val($("#scheduleId").val());
			var bh = $('body').height();
			var bw = $('body').width();
			$('#fullbg').css({
				height : bh,
				width : bw,
				display : "block"
			})
			$('#dialog').slideDown();
		}
	</script>
</body>
</html>
