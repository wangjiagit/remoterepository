<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>权限管理</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui.admin/css/style.css" />
    <link rel="stylesheet" href="<%=basePath%>resource/hui/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统维护 <span class="c-gray en">&gt;</span> 权限管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<table class="table">
    <tr>
        <td width="200" class="va-t">
            <ul id="permissionTree" class="ztree"></ul>
        </td>
        <td class="va-t"><iframe ID="testIframe" Name="testIframe" FRAMEBORDER=0 SCROLLING=AUTO width=100%  height=840px SRC=""></iframe></td>
    </tr>
</table>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<SCRIPT type="text/javascript">
    var demoIframe;
    var zNodes;
    var setting = {
        view: {
            selectedMulti: false,
            showIcon: showIconForTree
        },
        edit: {
            enable: true,
            showRemoveBtn: false,
            showRenameBtn: false
        },
        data: {
            keep: {
                parent:true,
                leaf:true
            },
            simpleData: {
                enable: true
            }
        },
        callback: {
            beforeClick:beforeClick,
            beforeDrop:beforeDrop
        }
    };
    function beforeDrop(treeId, treeNodes, targetNode, moveType) {
        return false;
    }

    var log, className = "dark";

	function beforeClick(treeId, treeNode) {
		if (treeNode.children) {
			demoIframe.attr("src", "");
		} else {
			demoIframe.attr("src", "permission/getPermissionByModuleId?id="
					+ treeNode.id);
		}

	}
	
	function showLog(str) {
		if (!log)
			log = $("#log");
		log.append("<li class='"+className+"'>" + str + "</li>");
		if (log.children("li").length > 8) {
			log.get(0).removeChild(log.children("li")[0]);
		}
	}
	function getTime() {
		var now = new Date(), h = now.getHours(), m = now.getMinutes(), s = now
				.getSeconds(), ms = now.getMilliseconds();
		return (h + ":" + m + ":" + s + " " + ms);
	}

	var newCount = 1;

	function showIconForTree(treeId, treeNode) {
		return !treeNode.isParent;
	};

	$(document).ready(function() {
		show();
	});

	function loadReady() {
		var bodyH = demoIframe.contents().find("body").get(0).scrollHeight, htmlH = demoIframe
				.contents().find("html").get(0).scrollHeight, maxH = Math.max(
				bodyH, htmlH), minH = Math.min(bodyH, htmlH), h = demoIframe
				.height() >= maxH ? minH : maxH;
		if (h < 530)
			h = 530;
		demoIframe.height(h);
	};

	function show() {
		$.ajax({
			url : 'module/getAllModule',
			type : 'post',
			dataType : 'json',
			success : function(result) {
				$.fn.zTree.init($("#permissionTree"), setting,
						result.data.zNodes);
				demoIframe = $("#testIframe");
				demoIframe.bind("load", loadReady);
			}
		})
	};
</SCRIPT>
</body>
</html>