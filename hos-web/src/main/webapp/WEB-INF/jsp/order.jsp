<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>预约详情</title>
    <link rel="stylesheet" href="../../portal/css/bootstrap.min.css"
          type="text/css"/>
    <script src="../../portal/js/jquery.min.js" type="text/javascript"></script>
    <script src="../../portal/js/bootstrap.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css"
          href="../../portal/css/indexStyle.css"/>
    <link rel="stylesheet" type="text/css" href="../../portal/css/global_x.css">
    <link rel="stylesheet" type="text/css" href="../../portal/css/lyc_x.css">
    <link rel="stylesheet" type="text/css" href="../../portal/css/slick.css">
    <link rel="stylesheet" type="text/css" href="../../portal/css/page.css">
    <link rel="stylesheet" href="../../portal/css/footer.css"
          type="text/css"/>
    <script type="text/javascript">
    </script>
    <style type="text/css">
        body {
            margin-top: 20px;
            margin: 0 auto;
        }

        .middle {
            vertical-align: middle !important;
        }

        .nav > li.on1 > ul {
            display: block;
        }
    </style>
    <script type="text/javascript">

        $(function () {
            $(".nav li").hover(function () {
                $(this).addClass("on1");
            }, function () {
                $(this).removeClass("on1");
            });
        });

        // 取消预约
        function cancelOrder(orderId, flag) {
        	if(flag != 1){
				var is_cancel = confirm("您确定要取消预约吗？");
				if (!is_cancel) {
					return;
				}
			}
            $.post("${pageContext.request.contextPath}/order/cancelOrder.action",
                {"orderId": orderId},
                function (data) {
                    if (data.status == 200) {
                    	if (flag == 1){
                    		alert("删除成功");
						} else {
                        	alert("取消成功");
						}
                        window.location.reload();
                    }
                },
                "json"
            );
        };

        // 删除历史预约记录
        function deleteOrder(orderId) {
            var is_cancel = confirm("您确定要删除吗？");
            if (!is_cancel) {
                return;
            }
            $.post("${pageContext.request.contextPath}/order/deleteOrder.action",
                {"orderId": orderId},
                function (data) {
                    if (data.status == 200) {
                        alert("删除成功");
                        window.location.reload();
                    }
                },
                "json"
            );
        };
    </script>
</head>
<body style="background-color: white;">
<!-- 引入header.jsp -->
<jsp:include page="header1.jsp"></jsp:include>
<div class="container">
		<c:if test="${!isHistory}">
		    <div class="row">
		        <div style="margin: 0 auto; margin-top: 20px; width: 950px;">
		             <strong style="font-size: large; color: #000000;">预约详情</strong>
		           	 <c:if test="${empty pageBean.list}">
		              	<span style="color: red;">暂无预约信息</span>
		        	 </c:if>
		            <table class="table table-bordered" style="margin-top: 10px;">
		                <thead>
		                <tr style="background-color: lightgrey;">
		                    <th>医生姓名</th>
		                    <th>联系方式</th>
		                    <th>预约时间</th>
		                    <th>预约状态</th>
		                    <th>医师留言</th>
		                    <th>操作</th>
		                </tr>
		                </thead>
		                <tbody>
		                <c:forEach items="${pageBean.list}" var="order" varStatus="vs">
		                    <c:if test="${vs.count % 2 == 1}">
		                        <tr class="active">
		                            <td class="middle" width="10%">
		                                <input type="hidden" name="id" value="${order.id}">
		                                <span>${order.doctorRealname }</span></td>
		                            <td class="middle" width="20%"><span>${order.doctorTel }</span></td>
		                            <td class="middle" width="20%"><span>${order.orderDate_x }</span></td>
		                            <td class="middle" width="10%"><span>${order.state_x }</span></td>
		                            <td class="middle" width="20%"><span>${order.doctorMessage }</span></td>
		                            <td class="middle" width="10%">
		                                <c:if test="${order.state != 2}">
		                                	<c:if test="${order.cancelOrder }">
			                                    <button class="btn btn-link" onclick="cancelOrder(${order.id})"
			                                            style="text-decoration: none;">取消预约
			                                    </button>
			                                </c:if>
		                                	<c:if test="${!order.cancelOrder }">
			                                    <button class="btn btn-link" disabled="disabled"
			                                            style="text-decoration: none;">不可取消
			                                    </button>
			                                </c:if>
		                                </c:if>
		                                <c:if test="${order.state == 2}">
		                                    <button class="btn btn-link" onclick="cancelOrder(${order.id}, 1)"
		                                            style="text-decoration: none;">删除
		                                    </button>
		                                </c:if>
		                            </td>
		                        </tr>
		                    </c:if>
		                    <c:if test="${vs.count % 2 == 0}">
		                        <tr>
		                            <td class="middle" width="10%">
		                                <input type="hidden" name="id" value="${order.id}">
		                                <span>${order.doctorRealname }</span></td>
		                            <td class="middle" width="20%"><span>${order.doctorTel }</span></td>
		                            <td class="middle" width="20%"><span>${order.orderDate_x }</span></td>
		                            <td class="middle" width="10%"><span>${order.state_x }</span></td>
		                            <td class="middle" width="20%"><span>${order.doctorMessage }</span></td>
		                            <td class="middle" width="10%">
		                                <c:if test="${order.state != 2}">
		                                    <c:if test="${order.cancelOrder }">
			                                    <button class="btn btn-link" onclick="cancelOrder(${order.id})"
			                                            style="text-decoration: none;">取消预约
			                                    </button>
			                                </c:if>
		                                	<c:if test="${!order.cancelOrder }">
			                                    <button class="btn btn-link" disabled="disabled"
			                                            style="text-decoration: none;">不可取消
			                                    </button>
			                                </c:if>
		                                </c:if>
		                                <c:if test="${order.state == 2}">
		                                    <button class="btn btn-link" onclick="cancelOrder(${order.id}, 1)" style="text-decoration: none;">删除
		                                    </button>
		                                </c:if>
		                            </td>
		                        </tr>
		                    </c:if>
		                    </c:forEach>
		                </tbody>
		            </table>
		        </div>
		    </div>
	    </c:if>
	    <c:if test="${isHistory}">
		    <div style="margin: 0 auto; margin-top: 10px; width: 950px;">
		        <strong style="font-size: large; color: #000000;">历史记录</strong>
		        <c:if test="${empty pageBean.list }">
		            <span style="color: red;">暂无历史信息</span>
		        </c:if>
		        <table class="table table-bordered" style="margin-top: 10px;">
		            <thead>
		            <tr style="background-color: lightgrey;">
		                <th>医生姓名</th>
		                <th>联系方式</th>
		                <th>预约时间</th>
		                <th>预约状态</th>
		                <th>医师留言</th>
		                <th>就诊状态</th>
		                <th>操作</th>
		            </tr>
		            </thead>
		            <tbody>
		            <c:forEach items="${pageBean.list}" var="historyOrder" varStatus="vs">
		                <c:if test="${vs.count % 2 == 1}">
		                    <tr class="active">
		                        <td class="middle" width="10%">
		                            <input type="hidden" name="id" value="${order.id}">
		                            <span>${historyOrder.doctorRealname }</span></td>
		                        <td class="middle" width="20%"><span>${historyOrder.doctorTel }</span></td>
		                        <td class="middle" width="20%"><span>${historyOrder.orderDate_x }</span></td>
		                        <td class="middle" width="10%"><span>${historyOrder.state_x }</span></td>
		                        <td class="middle" width="20%"><span>${historyOrder.doctorMessage }</span></td>
		                        <td class="middle" width="10%"><span>${historyOrder.visitState_x }</span></td>
		                        <td class="middle" width="10%">
		                            <button class="btn btn-link" onclick="deleteOrder(${historyOrder.id})"
		                                    style="text-decoration: none;">删除
		                            </button>
		                        </td>
		                    </tr>
		                </c:if>
		                <c:if test="${vs.count % 2 == 0}">
		                    <tr>
		                        <td class="middle" width="10%">
		                            <input type="hidden" name="id" value="${historyOrder.id}">
		                            <span>${historyOrder.doctorRealname }</span></td>
		                        <td class="middle" width="20%"><span>${historyOrder.doctorTel }</span></td>
		                        <td class="middle" width="20%"><span>${historyOrder.orderDate_x }</span></td>
		                        <td class="middle" width="10%"><span>${historyOrder.state_x }</span></td>
		                        <td class="middle" width="20%"><span>${historyOrder.doctorMessage }</span></td>
		                        <td class="middle" width="10%"><span>${historyOrder.visitState_x }</span></td>
		                        <td class="middle" width="10%">
		                            <button class="btn btn-link" onclick="deleteOrder(${historyOrder.id})"
		                                    style="text-decoration: none;">删除
		                            </button>
		                        </td>
		                    </tr>
		                </c:if>
		            </c:forEach>
		            </tbody>
		        </table>
		    </div>
	    </c:if>
	    <form id="myForm" action="${pageContext.request.contextPath }/order/orderDetail.html" method="post">
	    	<input type="hidden" id="currentPageInput" name="currentPage" value="${pageBean.currentPage }">
	    	<input type="hidden" name="is_history" value="${isHistory }">
	    </form>
	    <script type="text/javascript">
		    function changeCurrentPage(currentPage){
		    	$("#currentPageInput").val(currentPage);
		    	$("#myForm").submit();
		    }
	    </script>
     <div class="page">
        <c:if test="${pageBean.currentPage == 1}">
            <a class="prev disactived" href="javascript:void(0);"></a>
        </c:if>
        <c:if test="${pageBean.currentPage != 1}">
            <a class="prev" href="javascript:void(0);" onclick="changeCurrentPage(${pageBean.currentPage - 1})"></a>
        </c:if>
        <c:forEach begin="1" end="${pageBean.totalPage}" var="i">
            <c:if test="${pageBean.currentPage == i}">
                <a class="now" href="javascript:void(0);">${i}</a>
            </c:if>
            <c:if test="${pageBean.currentPage != i}">
                <a href="javascript:void(0);" onclick="changeCurrentPage(${i})">${i}</a>
            </c:if>
        </c:forEach>
        <c:if test="${pageBean.currentPage == pageBean.totalPage}">
            <a class="next disactived" href="javascript:void(0);"></a>
        </c:if>
        <c:if test="${pageBean.currentPage != pageBean.totalPage}">
            <a class="next" href="javascript:void(0);" onclick="changeCurrentPage(${pageBean.currentPage + 1})"></a>
        </c:if>
        <!-- <span class="go">
            <input type="text" id="currentPage">
            <input value="GO" type="submit" data-max="2" onclick="jumpCurrentPage($('#currentPage').val())">
        </span> -->
        <!-- <script type="text/javascript">
            function jumpCurrentPage(currentPage) {
                window.location.href = '${pageContext.request.contextPath}/doctor/doctorTeam.html?currentPage=' + currentPage + '&depId=${depId}';
            }
        </script> -->
    </div>
</div>

<!-- 引入footer.jsp -->
<%--  	<jsp:include page="footer.jsp"></jsp:include> --%>
<div class="foot" style="position: absolute; bottom: 0px;">
	<div class="footer">
		<span>友情链接：<a href="http://www.baidu.com" target="_blank"
			style="">百度</a>
			<a href="http://www.jd.com" target="_blank"
			   style="">京东</a>
			<a href="http://www.taobao.com" target="_blank"
			   style="">淘宝</a>
			<br>地址：河北省廊坊市<br/>
			电话：0310-8888888 | 传真：021-88888888 <br>
			Copyright &copy; <a href="${pageContext.request.contextPath }/index.html">xxx医院</a> All Rights Reserved.
		</span>
	</div>
</div>
</body>

</html>
