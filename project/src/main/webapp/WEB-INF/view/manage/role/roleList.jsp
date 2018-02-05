<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui.admin/css/style.css" />
    <title>角色管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 管理员管理 <span class="c-gray en">&gt;</span> 角色管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray"> <span class="l"> <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius" href="javascript:;" onclick="admin_role_add('添加角色','role/goAddRole','400','300')"><i class="Hui-iconfont">&#xe600;</i> 添加角色</a> </span> <span class="r">共有数据：<strong>${num}</strong> 条</span> </div>
    <table class="table table-border table-bordered table-hover table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="6">角色管理</th>
        </tr>
        <tr class="text-c">
            <th width="25"><input type="checkbox" class="checkall"></th>
            <th width="40">序号</th>
            <th width="200">角色名称</th>
            <th width="200">角色编码</th>
            <th width="300">描述</th>
            <th width="70">操作</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach items="${roleList}" var="role"  varStatus="a">
                <tr class="text-c">
                    <td><input type="checkbox" class="checkchild" value="${role.id}" name="ids"></td>
                    <td>${a.index+1}</td>
                    <td>${role.roleName}</td>
                    <td>${role.roleCode}</td>
                    <td>${role.roleDescription}</td>
                    <td class="f-14 td-manage">
                        <a style="text-decoration:none" class="ml-5"
                           onClick="admin_role_edit('角色编辑','role/goUpdateRole?id=${role.id}','1')" href="javascript:;" title="编辑">
                            <i class="Hui-iconfont">&#xe6df;</i>
                        </a>&nbsp;&nbsp;
                         <a style="text-decoration:none" class="ml-5"
                          onClick="admin_role_del(${role.id})" href="javascript:;" title="删除">
                            <i class="Hui-iconfont">&#xe6e2;</i>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
    /*管理员-角色-添加*/
    function admin_role_add(title,url,w,h){
        layer_show(title,url,w,h);
    }
    /*管理员-角色-编辑*/
    function admin_role_edit(title,url,id,w,h){
        var index = layer.open({
            type: 2,
            title: title,
            content:url,
        });
        layer.full(index);
    };
    
    /*管理员-角色-删除*/
    function admin_role_del(id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type:'POST',
                url: 'role/delRoles',
                dataType: 'text',
                data: {ids: id},
                success: function(data){
                        layer.msg('删除成功!',{icon:1,time:3000});
                        // 刷新
                        window.location.reload();
                },
                error:function(data) {
                    layer.msg('删除异常!',{icon:5,time:1000});
                },
            });
        });
    }

    function datadel(){
        // 判断是否至少选择一项
        var checkedNum= $(" input[name='ids']:checked").length;
        if(checkedNum == 0) {
            layer.alert('必须选择一项');
            return;
        }
        var ids=[];
        // 获取被选中的患者编号数组
        $("input[name='ids']:checked").each(function(index,obj){
        	ids.push(obj.value);
        });
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type: 'POST',
                url: 'role/delRoles',
                data: {ids:ids},
                dataType: 'text',
                traditional: true,//这里设置为true
                success: function(data){
                	  if(data.success){
                          layer.msg('删除成功!',{icon:1,time:3000});
                          // 刷新页面
                          window.location.reload();

                      }else{
                          layer.msg('删除失败!',{icon:5,time:3000});
                          // 刷新页面
                          window.location.reload();
                      }
                },
                error:function(data) {
                    console.log(data.msg);
                },
            });
        });
    }


</script>
</body>
</html>