<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎登录</title>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link href="<%=basePath%>resource/hui/static/h-ui/css/H-ui.min.css" rel="stylesheet" />
	<link href="<%=basePath%>resource/hui/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet"  />
	<link href="<%=basePath%>resource/hui/static/h-ui.admin/css/style.css" rel="stylesheet" />
	<link href="<%=basePath%>resource/hui/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" />

	<style>
		#loginform {
			opacity: 0.6;
		}
		:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
			color: #707070;
		}

		::-moz-placeholder { /* Mozilla Firefox 19+ */
			color: #707070;
		}

		input:-ms-input-placeholder,
		textarea:-ms-input-placeholder {
			color: #707070;
		}

		input::-webkit-input-placeholder,
		textarea::-webkit-input-placeholder {
			color:#707070;
		}


	</style>
</head>

<body>
 <div class="page-container" style="padding-top:12px;width:98%;padding-left:1%;">
	<div class="panel panel-default" style="border-radius: 8px;">
		<div id="tab_demo" class="HuiTab">
			<div class="tabBar clearfix"><span class="notic">报警通知</span>   <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
				<i class="Hui-iconfont">&#xe68f;</i></a></div>
			<div class="mt-20"  >
				<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive" id="wecome" >
					<thead>
					<tr class="text-c">
						<th width="5%">序号</th>
						<th width="20%">姓名</th>
						<th width="40%">通知内容</th>
						<th width="15%">日期</th>
						<th width="20%">操作</th>
					</tr>
					</thead>
					<tbody>
					<tr class="text-c">
						<td>1</td>
						<td>张三</td>
						<td>连续三天高压大于180</td>
						<td>2017-10-17</td>
						<td>查看</td>
					</tr>
					<tr class="text-c">
						<td>2</td>
						<td>柳斌</td>
						<td>连续三天低压大于110</td>
						<td>2017-11-17</td>
						<td>查看</td>
					</tr>
					<tr class="text-c">
						<td>3</td>
						<td>李云</td>
						<td>连续三天总饮水量>总超滤+总尿量</td>
						<td>2017-12-1</td>
						<td>查看</td>
					</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<div class="contextMenu" id="Huiadminmenu">
    <ul>
        <li id="closethis">关闭当前</li>
        <li id="closeall">关闭全部</li>
    </ul>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/hui/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="<%=basePath%>resource/hui/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript">

</script>

</body>
</html>