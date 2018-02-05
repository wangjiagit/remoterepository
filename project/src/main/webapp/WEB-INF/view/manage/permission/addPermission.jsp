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
    <title>添加权限</title>
</head>
<body>
  <form action="" method="post" class="form form-horizontal" id="form-admin-add" >
        <input type="hidden" class="input-text" autocomplete="off" id="moduleid" value="${permission.moduleid}" name="moduleid">
        <input type="hidden" class="input-text" autocomplete="off" value="${permission.id}" name="id">
        <table class="table" id="updateDoctorInfo" style="width:80%;">
            <tr class="text-c">
                <td><span class="c-red">*</span>权限编码：</td>
                <td>
                   <input type="text" class="input-text" value="${permission.permissionCode}" placeholder="" id="permissionCode" name="permissionCode">
                </td>
            </tr>
            <tr class="text-c">
                <td><span class="c-red">*</span>权限名称：</td>
                <td>
                     <input type="text" class="input-text" autocomplete="off" value="${permission.permissionName}" placeholder="" id="permissionName" name="permissionName">
                </td>
            </tr>
            <tr class="text-c">
                <td>权限描述：</td>
                <td>
                   <textarea name="permissionDescription" cols="" rows="" class="textarea"  placeholder="" dragonfly="true">${permission.permissionDescription}</textarea>
                   <p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
                </td>
            </tr>
            <tr class="text-c">
                <td colspan="2">
                   <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
                </td>
            </tr>
        </table>
    </form>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">

    $(function() {
        var moduleIds = $("#permissionModuleId").val();
        //表单验证Ω
        $("#form-admin-add").validate({
            rules: {
            	permissionCode: {
                    required: true,
                    minlength:1,
                    maxlength:30
                },
                permissionName: {
                    required: true,
                    minlength:2,
                    maxlength:30
                }

            },
            onkeyup: false,
            focusCleanup: false,
            success: "valid",
            submitHandler: function (form) {
                $(form).ajaxSubmit({
                    type: 'post', // 提交方式 get/post
                    url: "permission/addPermission", // 需要提交的 url
                    success: function (result) {
                        if(result.success){
                            layer.msg('保存成功!',{icon:1,time:3000});
                            window.parent.location.reload()
                        }else{
                            layer.msg('保存失败!',{icon:1,time:3000});
                        }

                    }
                });
            }
        });
    });
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
