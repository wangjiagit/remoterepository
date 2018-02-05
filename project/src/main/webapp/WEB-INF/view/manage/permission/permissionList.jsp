<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui.admin/css/style.css" />
    <title>权限管理</title>
</head>
<body>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a href="javascript:;" onclick="admin_permission_add('添加权限','permission/gotoAddPermission?moduleId=${moduleId}')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加权限</a></span></div>
    <input type="hidden" id="moduleID" value="${moduleId}" class="input-text">
    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-hover table-sort table-responsive" id="example">
            <thead>
            <tr class="text-c">
                <th width="25"><input type="checkbox" name="" value=""></th>
                <th width="200">权限编码</th>
                <th width="200">权限名称</th>
                <th>描述</th>
                <th width="100">操作</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach var="permission" items="${perList}">
		            <tr class="text-c">
		                <td><input type="checkbox" value="${permission.id }" name="permissionId"></td>
		                <td>${permission.permissionCode}</td>
		                <td>${permission.permissionName}</td>
		                <td>${permission.permissionDescription}</td>
		                <td><a title="编辑" href="javascript:;" onclick="admin_permission_edit('角色编辑','permission/gotoEditPermission?id=${permission.id }','800','450')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> <a title="删除" href="javascript:;" onclick="admin_permission_del(${permission.id })" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
		            </tr>
               </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript">


    /*管理员-权限-添加*/
    function admin_permission_add(title,url,w,h){
    	   var index = layer.open({
               type: 2,
               content: url,
               area: ['660', '460'],
               title: title,
               offset: '50px',
           });
           layer(index);
    }
    
    /*管理员-权限-编辑*/
    function admin_permission_edit(title,url,w,h){
    	  var index = layer.open({
              type: 2,
              content: url,
              area: ['660', '460'],
              title: title,
              offset: '50px',
          });
          layer(index);
    }


    // 批量删除
    function datadel(){
        // 判断是否至少选择一项
        var checkedNum= $(" input[name='permissionId']:checked").length;
        if(checkedNum == 0) {
            layer.alert('必须选择一项');
            return;
        }
        var permissionIds=[];
        // 获取被选中的患者编号数组
        $("input[name='permissionId']:checked").each(function(index,obj){
            permissionIds.push(obj.value);
        });
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type: 'POST',
                url: 'permission/delPermission',
                data: {ids:permissionIds},
                dataType: 'text',
                traditional: true,//这里设置为true
                success: function(data){
                	 if(data.success){
                         layer.msg('删除成功!',{icon:1,time:3000});
                         // 刷新
                         setTimeout(function() {
                    	    location.reload() 
                         },1500);
                     }else{
                         layer.msg('删除失败!',{icon:6,time:3000});
                     }
                },
                error:function(data) {
                    console.log(data.msg);
                },
            });
        });
    }

    /*删除*/
    function admin_permission_del(id){
    	 var permissionIds=[];
         // 获取被选中的患者编号数组
         permissionIds.push(id);
         layer.confirm('确认要删除吗？',function(index){
             $.ajax({
                 type: 'POST',
                 url: 'permission/delPermission',
                 data: {ids:permissionIds},
                 dataType: 'text',
                 traditional: true,//这里设置为true
                 success: function(data){
                 	 if(data.success){
                          layer.msg('删除成功!',{icon:1,time:3000});
                          // 刷新
                          setTimeout(function() {
                     	    location.reload() 
                          },1500);
                      }else{
                          layer.msg('删除失败!',{icon:6,time:3000});
                          // 刷新
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
