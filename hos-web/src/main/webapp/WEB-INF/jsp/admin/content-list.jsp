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
		width: 80px;
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
				<h3 class="box-title">内容列表</h3>
			</div>

			<div class="box-body">
				<!-- 数据表格 -->
				<div class="table-box">
					<!--工具栏-->
					<div class="pull-left">
						<div class="form-group form-inline">
							<div class="btn-group">
								<button type="button" class="btn btn-default" title="新建"
									onclick='location.href="${pageContext.request.contextPath }/admin/content-edit.html?categoryId=${categoryId }"'>
									<i class="fa fa-file-o"></i> 添加
								</button>
								<button type="button" class="btn btn-default" title="删除"
									onclick='deleteContent()'>
									<i class="fa fa-trash-o"></i> 删除
								</button>
								<button type="button" class="btn btn-default" title="刷新"
									onclick="window.location.href='${pageContext.request.contextPath}/content/getContentList.html?categoryId=${categoryId }'">
									<i class="fa fa-refresh"></i> 刷新
								</button>
							</div>
						</div>
					</div>
					<div class="box-tools pull-right">
						<div class="has-feedback">
							<form id="contentForm" action="${pageContext.request.contextPath}/content/getContentList.html"
								method="post">
								
								<input type="hidden" id="categoryIdInput" name="categoryId" value="${categoryId }">
								<input type="hidden" id="currentPageInput" name="currentPage"
									value="${pageBean.currentPage }" /> 
								<input type="hidden" id="pageSizeInput" name="pageSize"
									value="${pageBean.pageSize }" /> 
							</form>
						</div>
					</div>
					<!--工具栏/-->

					<!--数据列表-->
					<table id="dataList"
						class="table table-bordered table-striped table-hover dataTable">
						<thead>
							<tr>
								<th style="padding-right: 0px;"><input id="selall"
									type="checkbox" class="icheckbox_square-blue"></th>
								<th>标题</th>
								<th>副标题</th>
								<th>标题描述</th>
								<th>内容描述</th>
								<th>链接</th>
								<th>图片</th>
								<th>创建日期</th>
								<th>修改日期</th>
								<th>置顶</th>
								<th class="text-center">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pageBean.list }" var="content">
								<tr>
									<td><input name="ids" type="checkbox"
										value="${content.id}"></td>
									<td>
										<div title="${content.title}" class="wrap">
											${content.title}
										</div>
									</td>
									<td>
										<div title="${content.subTitle }" class="wrap">
											${content.subTitle }
										</div>
									</td>
									<td>
										<div title="${content.titleDesc }" class="wrap">
											${content.titleDesc }
										</div>
									</td>
									<td >
										<div class="wrap" id="content1">
											<div title="${content.content}">
												${content.content }
											</div>
										</div>
									</td>
									<td>
										<div title="${content.url }" class="wrap">${content.url }</div>
									</td>
									<td>
										<div title="${content.pic }" class="wrap">${content.pic }</div>
									</td>
									<td>
										<div title="${content.created_x }" style="width: 80px;" class="wrap">${content.created_x }</div>
									</td>
									<td>
										<div title="${content.updated_x }" style="width: 80px;" class="wrap">${content.updated_x }</div>
									</td>
									<td>
										${content.sortOrder_x }
									</td>
									<td class="text-center">
										<button type="button" class="btn bg-olive btn-xs"
											onclick='location.href="${pageContext.request.contextPath }/content/toEdit.html?id=${content.id}"'>编辑</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!--数据列表/-->
				</div>
				<!-- 数据表格 /-->
			</div>
			<!-- /.box-body -->

			<!-- .box-footer-->
			<div class="box-footer">
				<div class="pull-left">
					<div class="form-group form-inline">
						总共${pageBean.totalPage } 页，共${pageBean.totalCount} 条数据。 每页 <select
							class="form-control"
							onchange="changePageSize($('#pageSizeSelect option:selected').val())"
							id="pageSizeSelect">
							<option value="10"
								<c:if test="${pageBean.pageSize == 10 }">selected</c:if>>10</option>
							<option value="15"
								<c:if test="${pageBean.pageSize == 15 }">selected</c:if>>15</option>
						</select> 条
					</div>
				</div>

				<div class="box-tools pull-right">
					<ul class="pagination">
						<c:if test="${pageBean.currentPage == 1 }">
							<li class="disabled"><a href="javascript:void(0);"
								aria-label="Previous">首页</a></li>
							<li class="disabled"><a href="javascript:void(0);">上一页</a></li>
						</c:if>
						<c:if test="${pageBean.currentPage != 1}">
							<li><a href="javascript:void(0);"
								onclick="changeCurrentPage(1)" aria-label="Previous">首页</a></li>
							<li><a href="javascript:void(0);"
								onclick="changeCurrentPage(${pageBean.currentPage - 1})">上一页</a></li>
						</c:if>
						<c:forEach begin="1" end="${pageBean.totalPage }" var="i">
							<c:if test="${pageBean.currentPage == i }">
								<li class="active"><a href="javascript:void(0);">${i }</a></li>
							</c:if>
							<c:if test="${pageBean.currentPage != i }">
								<li><a href="javascript:void(0);"
									onclick="changeCurrentPage(${i })">${i }</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${pageBean.totalPage == pageBean.currentPage }">
							<li class="disabled"><a href="javascript:void(0);">下一页</a></li>
							<li class="disabled"><a href="javascript:void(0);"
								aria-label="Next">尾页</a></li>
						</c:if>
						<c:if test="${pageBean.totalPage != pageBean.currentPage }">
							<li><a href="javascript:void(0);"
								onclick="changeCurrentPage(${pageBean.currentPage + 1})">下一页</a></li>
							<li><a href="javascript:void(0);" aria-label="Next"
								onclick="changeCurrentPage(${pageBean.totalPage})">尾页</a></li>
						</c:if>
					</ul>
				</div>
			</div>
			<!-- /.box-footer-->
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
// 				$("#content1 p:not(:first)").css("display", "none");
			});
			// 列表按钮 
			$("#dataList td input[type='checkbox']").iCheck({
				checkboxClass : 'icheckbox_square-blue',
				increaseArea : '20%'
			});
			// 全选操作 
			$("#selall").click(function() {
				var clicks = $(this).is(':checked');
				if (!clicks) {
					$("#dataList td input[type='checkbox']").iCheck("uncheck");
				} else {
					$("#dataList td input[type='checkbox']").iCheck("check");
				}
				$(this).data("clicks", !clicks);
			});
			
			function changePageSize(pageSize){
				$("#pageSizeInput").val(pageSize);
				$("#contentForm").submit();
			}
			
			function changeCurrentPage(currentPage){
				$("#currentPageInput").val(currentPage);
				$("#contentForm").submit();
			}
			
			function deleteContent(){
				var cks = document.getElementsByName("ids");
				var ids = [];
				for(var i = 0; i < cks.length; i++){
					if(cks[i].checked){
						ids.push(cks[i].value);
					}
				}
				if(ids.length <= 0){
					alert("至少选择一项");
					return ;
				}
				var str = ids.join(",");
				
				var isDelete = confirm("你确认要删除吗？");
				if(!isDelete){
					return ;
				}
				
				$.post("${pageContent.request.contextPath}/content/deleteContent.action",
					{"ids":str},
					function(data){
						if(data.status == 200){
							alert("删除成功");
							window.location.reload();
						}
					},
					"json"
				)
			}
		</script>
</body>

</html>
