<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>科室管理</title>
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
.ztree li span.button.add {
	margin-left: 2px;
	margin-right: -1px;
	background-position: -144px 0;
	vertical-align: top;
	*vertical-align: middle
}
</style>
<SCRIPT type="text/javascript">
	var setting = {
		view : {
			addHoverDom : addHoverDom,
			removeHoverDom : removeHoverDom,
			selectedMulti : false
		},
		edit : {
			enable : true,
			editNameSelectAll : true,
		},
		data : {
			simpleData : {
				enable : true
			}
		},
		callback : {
			beforeDrag : beforeDrag,
			beforeEditName : beforeEditName,
			beforeRemove : beforeRemove,
			beforeRename : beforeRename,
			onRemove : onRemove,
			onRename : onRename,
			onClick : selectDeparment
			
		}
	};

	function beforeDrag(treeId, treeNodes) {
		return false;
	}
	
	function selectDeparment(event, treeId, treeNode) {
		if(treeNode.parent){
			return ;
		}
		var iframe1 = window.parent.document.getElementById("mainiframe1");
		$(iframe1).css("display","block");
		$(iframe1).attr("src","${pageContext.request.contextPath}/department/getDepartmentToView.html?id="+treeNode.id);
	};
	
	function beforeEditName(treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		zTree.selectNode(treeNode);
		return true;
	}
	function onRename(e, treeId, treeNode) {
		
	}
	function beforeRemove(treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		zTree.selectNode(treeNode);
		var flag = false;
		if (confirm("确认删除 节点 -- " + treeNode.name + " 吗？")) {
			$.ajax({
				   type: "POST",
				   url: "${pageContext.request.contextPath}/department/deleteNodeById.action",
				   data: {
						"id" : treeNode.id
					},
				   success: function(data) {
						if (data.status == 200){
							alert("删除成功");
							flag = true;
						} else {
							alert(data.msg);
						}
					},
					dataType:"json",
					async : false
				});
		}
		return flag;
	}
	function onRemove(e, treeId, treeNode) {
	}
	function beforeRename(treeId, treeNode, newName) {
		if (newName.length == 0) {
			alert("节点名称不能为空.");
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			setTimeout(function() {
				zTree.editName(treeNode)
			}, 10);
			return false;
		} else {
			$.post(
				"${pageContext.request.contextPath}/department/editNode.action",
				{
					"id" : treeNode.id,
					"name" : newName
				}, function(data) {
					
				}, "json");
			return true;
		}
	}
	function onRename(e, treeId, treeNode) {

	}
	var newCount = 1;
	function addHoverDom(treeId, treeNode) {
		var sObj = $("#" + treeNode.tId + "_span");
		if (treeNode.editNameFlag || $("#addBtn_" + treeNode.id).length > 0)
			return;
		var addStr = "<span class='button add' id='addBtn_" + treeNode.id
				+ "' title='add node' onfocus='this.blur();'></span>";
		sObj.after(addStr);
		var btn = $("#addBtn_" + treeNode.id);
		if (btn)
			btn.bind("click", function() {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				var data = {
					"pId" : treeNode.id,
					"name" : "new node" + (newCount++)
				};
				var newNode;
				$.post(
					"${pageContext.request.contextPath}/department/addNode.action",
					data,
					function(data) {
						newNode = zTree.addNodes(treeNode,
										{
											id : data.data.id,
											pId : data.data.pid,
											name : data.data.name
										});
						zTree.editName(newNode[0]);
					}, "json");
				return false;
			});
	};
	function removeHoverDom(treeId, treeNode) {
		$("#addBtn_" + treeNode.id).unbind().remove();
	};

	$(document).ready(function() {
		$.post(
			"${pageContext.request.contextPath}/department/nodeList.action",
			{}, function(data) {
				$.fn.zTree.init($("#treeDemo"),
						setting, data);
			}, "json");
		});
</SCRIPT>
</head>

<body class="hold-transition skin-purple sidebar-mini">
<!-- 	<section class="content-header"> -->
<!-- 		<h1> -->
<!-- 			科室管理 <small>科室分类</small> -->
<!-- 		</h1> -->
<!-- 		<ol class="breadcrumb"> -->
<!-- 			<li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li> -->
<!-- 			<li><a href="#">科室管理</a></li> -->
<!-- 			<li class="active">科室分类</li> -->
<!-- 		</ol> -->
<!-- 	</section> -->
	<!-- 内容头部 /-->

	<!-- 正文区域 -->
	<section class="content">

		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">分类管理</h3>
			</div>

			<div class="zTreeDemoBackground left">
				<ul id="treeDemo" class="ztree"></ul>
			</div>
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
// 			$(window.parent.document.getElementById("mainiframe")).css("display","none");
// 			$(window.parent.document.getElementById("mainiframe1")).css("display","none");
// 			$(window.parent.document.getElementById("mainiframe2")).css("display","block");
			
			$(window.parent.document.getElementById("mainiframe")).css("display","block");
			$(window.parent.document.getElementById("mainiframe1")).css("display","block");
			$(window.parent.document.getElementById("mainiframe1")).css("visibility","hidden");
			$(window.parent.document.getElementById("mainiframe2")).css("display","none");
		});
	</script>
</body>

</html>
