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
    <title>模块维护</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui.admin/css/style.css" />
    <script type="text/javascript">
        function submit() {
            $("#form-user-add").submit();
            //parent.location.reload();
           // parent.location.reload();
        }
    </script>
</head>
<body>
<div class="page-container">
    <form action="module/addModule" method="post" class="form form-horizontal" id="form-user-add" target="_parent">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 模块编码：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <input type="text" class="input-text" value="${module.moduleCode}" placeholder="" name="moduleCode">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>模块名称：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <input type="text" class="input-text" value="${module.moduleName}" placeholder="" name="moduleName">
            </div>
        </div>
       <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">
                <span class="c-red">*</span> 模块路径：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <input type="text" class="input-text" value="${module.moduleUri}" placeholder="" name="moduleUri">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">
                <span class="c-red">*</span>显示顺序：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <input type="text" class="input-text" value="${module.orderby}" placeholder="" name="orderby" 
                 onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">备注：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <textarea name="moduleDescription" cols="" rows="" class="textarea" placeholder="说点什么...最少输入10个字符" onKeyUp="$.Huitextarealength(this,100)">${module.moduleDescription}</textarea>
                <p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
            </div>
        </div>
        <input type="hidden" name="moduleBaseid" value="${module.moduleBaseid}"/>
        <input type="hidden" name="id" value="${module.id}"/>
    </form>
    <div class="row cl">
        <div class="col-9 col-offset-2">
            <input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;" onclick="submit()">
        </div>
    </div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<script type="text/javascript" src="<%=basePath%>resource/hui/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/jquery.validation/1.14.0/messages_zh.js"></script>
</body>
</html>
