<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
			String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=basePath%>resource/plugin/ztree/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript"
	src="<%=basePath%>resource/plugin/ztree/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>resource/plugin/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript"
	src="<%=basePath%>resource/plugin/ztree/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript"
	src="<%=basePath%>resource/plugin/ztree/js/jquery.ztree.exedit.js"></script>
<script type="text/javascript"
	src="<%=basePath%>resource/hui/lib/layer/2.4/layer.js"></script>
<style>
body {
	background-color: white;
	margin: 0;
	padding: 0;
	text-align: center;
}

div, p, table, th, td {
	list-style: none;
	margin: 0;
	padding: 0;
	color: #333;
	font-size: 12px;
	font-family: dotum, Verdana, Arial, Helvetica, AppleGothic, sans-serif;
}

#testIframe {
	margin-left: 10px;
}
</style>
</head>
<body>
	<input type="hidden" id="passroleId" value="${roleId}">
	<div class="content_wrap">
		<TABLE border=0 height=600px align=left>
			<TR>
				<TD width=260px align=left valign=top
					style="BORDER-RIGHT: #999999 1px dashed">
					<button id="addRole" type="button">保存</button> <!--<button id="addLeaf" type="button">添加权限</button>-->
					<ul id="roleModuleTree" class="ztree"
						style="width: 260px; overflow: auto;"></ul>
				</TD>
				<TD width=770px align=left valign=top><IFRAME ID="testIframe"
						Name="testIframe" FRAMEBORDER=0 SCROLLING=AUTO width=100%
						height=600px SRC=""></IFRAME></TD>
			</TR>
		</TABLE>
	</div>
	<script type="text/javascript">
		var demoIframe;
		var zNodes;
		var setting = {
			view : {
				selectedMulti : false,
				showIcon : showIconForTree
			},
			edit : {
				enable : true,
				showRemoveBtn : false,
				showRenameBtn : false
			},
			data : {
				keep : {
					parent : true,
					leaf : true
				},
				simpleData : {
					enable : true
				}
			},
			check : {
				enable : true
			},
			callback : {
				beforeClick : beforeClick,
				beforeDrop : beforeDrop

			}
		};

		function beforeDrop(treeId, treeNodes, targetNode, moveType) {
			return false;
		}

		function beforeClick(treeId, treeNode) {
			if (treeNode.children) {
				demoIframe.attr("src", "");
			} else {
				id = $("#passroleId").val();
				demoIframe.attr("src",
						"permission/getRoleAndPermissionByModuleId?id="
								+ treeNode.id + "&roleId=" + id);
			}
		}

		var newCount = 1;
		function add(e) {
			id = $("#passroleId").val();
			var zTree = $.fn.zTree.getZTreeObj("roleModuleTree"), nodes = zTree
					.getCheckedNodes(true), v = "";
			for (var i = 0; i < nodes.length; i++) {
				v += nodes[i].id + ",";
			}
			demoIframe.attr("src", "permission/addRoleAllPermission?id=" + v
					+ "&roleId=" + id);
			$.ajax({
				url : 'permission/addRoleAllPermission',
				data : {
					id : v,
					roleId : id,
				},
				type : 'post',
				dataType : 'text',
				success : function(result) {
					location.href = location.href;
				},
				error : function(data) {
					console.log(data.msg);
				},
			})
		};

		function showIconForTree(treeId, treeNode) {
			return !treeNode.isParent;
		};

		$(document).ready(function() {
			show();
		});

		function loadReady() {
			var bodyH = demoIframe.contents().find("body").get(0).scrollHeight, htmlH = demoIframe
					.contents().find("html").get(0).scrollHeight, maxH = Math
					.max(bodyH, htmlH), minH = Math.min(bodyH, htmlH), h = demoIframe
					.height() >= maxH ? minH : maxH;
			if (h < 530)
				h = 530;
			demoIframe.height(h);
		};

		function show() {
			id = $("#passroleId").val();
			$.ajax({
				url : 'module/getRoleModule',
				data : {
					id : id
				},
				type : 'post',
				dataType : 'json',
				success : function(result) {
					$.fn.zTree.init($("#roleModuleTree"), setting,
							result.data.zNodes);
					demoIframe = $("#testIframe");
					demoIframe.bind("load", loadReady);
					$("#addRole").bind("click", {
						isParent : true
					}, add);
				},
				error : function(data) {
					console.log(data);
				},
			})
		};
	</script>
</body>
</html>