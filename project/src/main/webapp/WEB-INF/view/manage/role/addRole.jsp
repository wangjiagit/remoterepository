<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui.admin/css/style.css" />

</head>
<body>
<div class="page-container">
    <form action="" method="post" class="form form-horizontal" id="addRole" target="_parent">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">
                <span class="c-red">*</span>
                角色名称：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <input type="text" class="input-text" value="" placeholder="" name="roleName">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">
                <span class="c-red">*</span>
                角色编码：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <input type="text" class="input-text" value="" placeholder="" name="roleCode">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">
                <span class="c-red">*</span>
                角色描述：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <input type="text" class="input-text" value="" placeholder="" name="roleDescription">
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <button type="submit" class="btn btn-success radius" id="admin-role-save" name="admin-role-save">
                    <i class="icon-ok"></i>保存</button>
                <button type="reset" class="btn btn-secondary radius" id="admin-role-reset" name="admin-role-res">
                    <i class="icon-res"></i>重置</button>
            </div>
        </div>
    </form>
    <div class="row cl">&nbsp;</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<script type="text/javascript" src="<%=basePath%>resource/hui/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/jquery.validation/1.14.0/messages_zh.js"></script>



<script type="text/javascript">
    $(function() {
        //表单验证
        $("#addRole").validate({
            rules: {
                roleName: {
                    required: true,
                    minlength:1,
                    maxlength:8
                },
                roleCode: {
                    required: true,
                    minlength:1,
                    maxlength:20
            },
                roleDescription: {
                    required: true,
                    minlength:2,
                    maxlength:20
                }
            },
            onkeyup: false,
            focusCleanup: false,
            success: "valid",
            submitHandler: function (form) {
                $(form).ajaxSubmit({
                    type: 'post', // 提交方式 get/post
                    url: "role/addRole", // 需要提交的 url
                    success: function (result) {
                        if(result.success){
                            layer.confirm('保存成功,是否继续？', function () {
                                    // 刷新当前页面
                                    window.location.reload();
                                }, function () {
                                    // 取消关闭页面刷新父级页面（刷新父级的时候会自动关闭弹层）
                                    window.parent.location.reload();
                                }
                            );
                        }else{
                            layer.msg('保存失败!',{icon:1,time:3000});
                        }

                    }
                });
            }
        });
    });
</script>


</body>
</html>