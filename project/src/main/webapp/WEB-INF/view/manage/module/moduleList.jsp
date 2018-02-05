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
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui.admin/css/style.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <style type="text/css">
        div#rMenu {position:absolute; visibility:hidden; top:0; background-color: #555;text-align: left;padding: 1px;width: 99px}
        div#rMenu ul li{
            margin: 1px 0;
            padding: 0 5px;
            cursor: pointer;
            list-style: none outside none;
            background-color: #fff;
            font-size:8px;
        }
        #addNode{
            background-position: -110px -48px;
        }
       #removeNode{
            background-position: -110px -64px;
        }
    </style>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统维护 <span class="c-gray en">&gt;</span> 模块管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<table class="table">
    <tr>
        <td width="200" class="va-t">
            <ul id="moduleTree" class="ztree"></ul>
        </td>
        <td class="va-t"><iframe ID="testIframe" Name="testIframe" FRAMEBORDER=0 SCROLLING=AUTO width=100%  height=390px SRC=""></iframe></td>
    </tr>
</table>
<div id="rMenu">
    <ul id="updateNoe">
        <li id="addParent">
            <span  id="addNode" ></span>
            增加节点
        </li>
        <li id="remove">
            <span id="removeNode"></span>
            删除节点
        </li>
    </ul>
</div>
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
            showIcon: showIconForTree,
            fontCss: setFontCss
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
            beforeRemove: beforeRemove,
            beforeClick:beforeClick,
            onRightClick: OnRightClick,
            beforeDrag: beforeDrag,
            beforeDrop: beforeDrop
        }
    };

    var log, className = "dark";
    var rMenu;
    function OnRightClick(event, treeId, treeNode) {
        var zTree = $.fn.zTree.getZTreeObj("moduleTree")
        if (!treeNode && event.target.tagName.toLowerCase() != "button" && $(event.target).parents("a").length == 0) {
            zTree.cancelSelectedNode();
            showRMenu("root", event.clientX, event.clientY);
        } else if (treeNode && !treeNode.noR) {
            zTree.selectNode(treeNode);
            showRMenu("node", event.clientX, event.clientY);
        }
    }
    
    function showRMenu(type, x, y) {
        $("#rMenu ul").show();
        if (type=="root") {
            $("#addParent").hide();
            $("#remove").hide();
        } else {
            $("#addParent").show();
            $("#remove").show();
        }
        rMenu.css({"top":y+"px", "left":x+"px", "visibility":"visible"});

        $("body").bind("mousedown", onBodyMouseDown);
    }
    
    function hideRMenu() {
        if (rMenu) rMenu.css({"visibility": "hidden"});
        $("body").unbind("mousedown", onBodyMouseDown);
    }
    
    function onBodyMouseDown(event){
        if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length>0)) {
            rMenu.css({"visibility" : "hidden"});
        }
    }
    
    function setFontCss(treeId, treeNode) {
        return treeNode.level == 0 ? {"font-size":"20px"} : {};
    };
    
    function beforeDrag(treeId, treeNodes) {
        for (var i=0,l=treeNodes.length; i<l; i++) {
            if (treeNodes[i].drag === false) {
                return false;
            }
        }
        return true;
    }
    
    function beforeDrop(treeId, treeNodes, targetNode, moveType) {
        var id = treeNodes[0].id;
        var pId = targetNode.id;
        if(confirm("确认移动节点吗？")){
            $.ajax({
                url:'module/moveModule',
                data:{id:id,pId:pId},
                type:'post',
                dataType:'json',
                success:function(result){
                	if(result.success){
               		    demoIframe.attr("src","module/getModuleById?id="+id);
                        return targetNode ? targetNode.drop !== false : true;
                	}else{
                		 layer.msg('操作失败!',{icon:6,time:3000});
                	}
                }
            })
        }else{
            return false;
        }
    }
    
    // 删除节点
    function beforeRemove(treeId, treeNode) {
        className = (className === "dark" ? "":"dark");
        showLog("[ "+getTime()+" beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
        if(confirm("确认删除 节点 -- " + treeNode.name + " 吗？")){
            $.ajax({
                url:'module/deleteModule',
                data:{id:treeNode.id},
                type:'post',
                dataType: 'json',
                success: function(result){
                	 if(result.success){
                         layer.msg('删除成功!',{icon:1,time:3000});
                         // 刷新
                         setTimeout(function() {
                    	    location.reload() 
                         },1500);
                     }else{
                         layer.msg('删除失败!',{icon:6,time:3000});
                     }
                },
            })
        }else{
            return false;
        }
    }
    
    // 通过模块id查询模块详细信息
    function beforeClick(treeId,treeNode) {
        demoIframe.attr("src","module/getModuleById?id="+treeNode.id);
    }
    
    function showLog(str) {
        if (!log) log = $("#log");
        log.append("<li class='"+className+"'>"+str+"</li>");
        if(log.children("li").length > 8) {
            log.get(0).removeChild(log.children("li")[0]);
        }
    }
    
    function getTime() {
        var now= new Date(),
            h=now.getHours(),
            m=now.getMinutes(),
            s=now.getSeconds(),
            ms=now.getMilliseconds();
        return (h+":"+m+":"+s+ " " +ms);
    }

    var newCount = 1;
    function add(e) {
        hideRMenu();
        var zTree = $.fn.zTree.getZTreeObj("moduleTree"),
            isParent = e.data.isParent,
            nodes = zTree.getSelectedNodes(),
            treeNode = nodes[0];

         if (treeNode) {
        
         } else {
            alert("请选择根节点");
         }
        demoIframe.attr("src","module/gotoAddModule?id="+treeNode.id);
    };
    
    function remove(e) {
        hideRMenu();
        var zTree = $.fn.zTree.getZTreeObj("moduleTree"),
            nodes = zTree.getSelectedNodes(),
            treeNode = nodes[0];
        if (nodes.length == 0) {
            alert("请先选择一个节点");
            return;
        }
        if (treeNode.level == 0 ) {
        	alert("根节点不能删除");
            return;
        }
        zTree.removeNode(treeNode, true);
    };

    function showIconForTree(treeId, treeNode) {
        return !treeNode.isParent;
    };

    $(document).ready(function(){
        show();
    });

    function loadReady() {
        var bodyH = demoIframe.contents().find("body").get(0).scrollHeight,
            htmlH = demoIframe.contents().find("html").get(0).scrollHeight,
            maxH = Math.max(bodyH, htmlH), minH = Math.min(bodyH, htmlH),
            h = demoIframe.height() >= maxH ? minH:maxH ;
        if (h < 530) h = 530;
        demoIframe.height(h);
    };

    // 回显模块
    function show() {
        $.ajax({
            url:'module/getAllModule',
            type:'post',
            dataType:'json',
            success:function(result){
                $.fn.zTree.init($("#moduleTree"), setting, result.data.zNodes);
                demoIframe = $("#testIframe");
                demoIframe.bind("load", loadReady);
                $("#addParent").bind("click", {isParent:true}, add);
                $("#remove").bind("click", remove);
                rMenu = $("#rMenu");
            },
            error: function (data) {
                console.log(data);
            },
        })
    };
    
</script>
</body>
</html>