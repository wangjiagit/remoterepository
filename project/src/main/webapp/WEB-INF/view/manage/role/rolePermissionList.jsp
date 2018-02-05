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
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" onclick="addRoleAndPermission()" class="btn btn-success radius"><i class="Hui-iconfont">保存</i> </a>
         </span>
    </div>
    <div class="mt-20">
        <input type="hidden" value="${moduleId}" id="moduleId" />
	    <input type="hidden" value="${roleId}" id="roleId" />
	    <input type="hidden" value="${pidList}" id=pidList />
        <table class="table table-border table-bordered table-bg table-hover table-sort table-responsive" id="roleExample">
            <thead>
	            <tr class="text-c">
	                <th width="25"><input type="checkbox" name="" value="" onclick="allChangIds(this)"></th>
	                <th width="200">权限编码</th>
	                <th width="200">权限名称</th>
	                <th>描述</th>
	            </tr>
            </thead>
            <tbody>
	            <c:forEach var="permission" items="${permissionList}">
		            <tr class="text-c">
		                <td><input type="checkbox" value="${permission.id }"  name="id" onclick="changIds(this,this.value)"
		               		 <c:forEach var="pid" items="${pidList}">
		               		 	<c:if test="${permission.id == pid}">
								 checked="checked"
								</c:if>
		               		 </c:forEach> >
		                </td>
		                <td>${permission.permissionCode }</td>
		                <td>${permission.permissionName }</td>
		                <td>${permission.permissionDescription }</td>
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

    // 定义数组 存储 当前所有id集合（保存不变作为删除依据）
    var startIds = [] ;
    // 定义数组 存储 当前id集合并存储相应的变化（统计变化）
    var changeIds = [] ;

    // 为收藏的所有id数组赋值；为统计ID勾选变化数组赋值
    $(function() {
        // 定义变量接收集合
         var pIds = ${pidList};
        for(var i= 0;i< pIds.length; i++){
            startIds.push(pIds[i]);
            changeIds.push(pIds[i]);
        }
    });
    
    // 更改是否选中的ID
    function changIds(obj,value) {
        var nowId = value;
        if ($(obj).prop("checked")) {
            changeIds.push(nowId);
        } else {
            for(var i=0; i< changeIds.length;i++){
                if(changeIds[i] == nowId ){
                    changeIds.splice(i,1);
                }
            }
        }
    }
    
    // 保存按钮相关操作
    function addRoleAndPermission(){
        if(startIds.length == 0 && changeIds.length == 0){
            layer.msg('没有数据操作!',{icon:5,time:2000});
            return;
        }
        if(startIds.length > 0 && changeIds.length == startIds.length){
            startIds.sort(); //排序
            changeIds.sort(); //排序
            var result = "ok"
            for(var i = 0;i<startIds.length;i++){
               if(startIds[i] != changeIds[i]){
                   result = "no";
               }
           }
           if(result == "ok"){
               layer.msg('没有数据操作!',{icon:5,time:2000});
               return;
           }else{
               update_allot();
           }
        }else{
            update_allot();
        }
    }

    // 点击为角色分配权限
    function update_allot(){
        var roleId = $("#roleId").val();
        layer.confirm('确认保存操作?',function(index){
            $.ajax({
                type: 'POST',
                url: 'permission/addRoleAndPermission.do',
                data: {addIds:changeIds,
                	   delIds:startIds,
                	   roleId:roleId},
                dataType: 'text',
                traditional: true,//这里设置为true
                success: function(data){
                    layer.msg('已添加!',{icon:1,time:3000});
                    setTimeout(function() {
                    	location.reload() 
                    },1500);
                },
                error:function(data) {
                    console.log(data.msg);
                },
            });
        });
    }

  
    function allChangIds(obj) {
        //当全部勾选
        if ($(obj).prop("checked")) {
            debugger;
            //循环全部勾选的
            $(".table-sort tbody input[name='permissionId']").each(function(index,obj){
                //得到Id值
                var perId =obj.value;
                var isHave = "no";
                //循环遍历add容器
                //判断add容器是否为空
                if(addPermissionId.length == 0){
                    addPermissionId.push(perId);
                }
                else{
                    for(var i = 0;i<addPermissionId.length;i++){
                        //判断添加里面有没有
                        if(addPermissionId[i] !=perId){
                            isHave = "no"
                        }
                    }
                    if (isHave == "no"){
                        addPermissionId.push(perId);
                    }
                }
                for(var i = 0;i<delPermissionId.length;i++){
                    if(delPermissionId[i] !=perId){
                        isHave = "no"
                    }
                    if (isHave == "no"){
                        delPermissionId.splice(i, 1);
                    }
                }

            });
        }
        //全部取消复选框
        else {
            $(".table-sort tbody input[name='permissionId']").each(function(index,obj) {
                //遍历add容器把共同的元素移除
                //得到Id值
                var perId =obj.value;
                var isHave = "no";
                for (var i = 0; i < addPermissionId.length; i++) {
                    if (addPermissionId[i] == perId) {
                        addPermissionId.splice(i, 1);
                    }
                }
                //把del容器中不相同的元素添加进去
                if (delPermissionId.length == 0) {
                    delPermissionId.push(perId);
                }
                else {
                    for (var i = 0; i < delPermissionId.length; i++) {
                        if (delPermissionId[i] != perId) {
                            isHave = "no"

                        }
                    }
                    if (isHave = "no") {
                        delPermissionId.push(perId)
                    }
                }
            })
        }
    }

</script>
</body>
</html>
