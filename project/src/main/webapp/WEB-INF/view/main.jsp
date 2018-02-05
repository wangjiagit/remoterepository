<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>欢迎使用</title>

    <!--[if lt IE 9]>
    <script type="text/javascript" src="<%=basePath%>resource/hui/lib/html5shiv.js"></script>
    <script type="text/javascript" src="<%=basePath%>resource/hui/lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/lib/Hui-iconfont/1.0.8/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui.admin/skin/fontmedium/fontsize.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui.admin/skin/green/skin.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/hui/static/h-ui.admin/css/style.css.css"/>
    <!--[if IE 6]>
    <script type="text/javascript" src="hui/lib/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->

</head>
<body class="big-page">
<header class="navbar-wrapper Hui-aside ">

    <div class="navbar navbar-fixed-top">
        <div class="container-fluid cl"><span id="titleLogo" class="logo navbar-logo f-l mr-10 hidden-xs" style="font-family: 仿宋;font-weight: bold;font-size: 24px;">移动管理平台</span>
            <!--主页上导航-->
            <nav class="nav navbar-nav" id="upmenu">
                <ul class="cl">
                   <li class="dropDown dropDown_hover"> 
                       <a href="javascript:;" class="dropDown_A"><i class="Hui-iconfont menu_dropdown-arrow"> &#xe60d;</i>医生管理</a>
                       <ul class="menu_dropdown dropDown-menu menu radius box-shadow " >
                           <li>
                              <a style="font-weight: inherit;" data-href="#" data-title="医生列表" href="javascript:void(0)">医生列表</a>
                           </li>
                           <li>
                              <a style="font-weight: inherit;" data-href="#" data-title="待审核医生" href="javascript:void(0)">待审核医生</a>
                           </li>
                       </ul>
                   </li>
                   <li class="dropDown dropDown_hover">
                       <a href="javascript:;" class="dropDown_A"><i class="Hui-iconfont menu_dropdown-arrow"> &#xe611;</i>患者管理</a>
                       <ul class="menu_dropdown dropDown-menu menu radius box-shadow " >
                           <li>
                              <a style="font-weight: inherit;" data-href="#" data-title="患者列表" href="javascript:void(0)">患者列表</a>
                           </li>
                           <li>
                              <a style="font-weight: inherit;" data-href="#" data-title="今日预约" href="javascript:void(0)">今日预约</a>
                           </li>
                           <li>
                              <a style="font-weight: inherit;" data-href="#" data-title="预约列表" href="javascript:void(0)">预约列表</a>
                           </li>
                           <li>
                              <a style="font-weight: inherit;" data-href="#" data-title="待审核患者" href="javascript:void(0)">待审核患者</a>
                           </li>
                           <li>
                              <a style="font-weight: inherit;" data-href="#" data-title="近期就诊列表" href="javascript:void(0)">近期就诊列表</a>
                           </li>
                       </ul>
                   </li>
                   <li class="dropDown dropDown_hover"> 
                       <a href="javascript:;" class="dropDown_A"><i class="Hui-iconfont menu_dropdown-arrow"> &#xe62e;</i>系统维护</a>
                       <ul class="menu_dropdown dropDown-menu menu radius box-shadow " >
                           <li>
                              <a style="font-weight: inherit;" data-href="#" data-title="系统通知" href="javascript:void(0)">系统通知</a>
                           </li>
                           <li>
                              <a style="font-weight: inherit;" data-href="#" data-title="健康教育" href="javascript:void(0)">健康教育</a>
                           </li>
                           <li>
                              <a style="font-weight: inherit;" data-href="#" data-title="科室简介" href="javascript:void(0)">科室简介</a>
                           </li>
                           <li>
                              <a style="font-weight: inherit;" data-href="#" data-title="数据字典" href="javascript:void(0)">数据字典</a>
                           </li>
                           <li>
                              <a style="font-weight: inherit;" data-href="#" data-title="组织管理" href="javascript:void(0)">组织管理</a>
                           </li>
                           <li>
                              <a style="font-weight: inherit;" data-href="#" data-title="体检参数" href="javascript:void(0)">体检参数</a>
                           </li>
                           <li>
                              <a style="font-weight: inherit;" data-href="#" data-title="标签管理" href="javascript:void(0)">标签管理</a>
                           </li>
                       </ul>
                   </li>
                   <li class="dropDown dropDown_hover"> 
                       <a href="javascript:;" class="dropDown_A"><i class="Hui-iconfont menu_dropdown-arrow"> &#xe63c;</i>安全管理</a>
                       <ul class="menu_dropdown dropDown-menu menu radius box-shadow " >
                           <li>
                              <a style="font-weight: inherit;" data-href="role/selectRoleList" data-title="角色管理" href="javascript:void(0)">角色管理</a>
                           </li>
                           <li>
                              <a style="font-weight: inherit;" data-href="module/getMenu" data-title="模块管理" href="javascript:void(0)">模块管理</a>
                           </li>
                           <li>
                              <a style="font-weight: inherit;" data-href="permission/goPermission" data-title="权限管理" href="javascript:void(0)">权限管理</a>
                           </li>
                       </ul>
                   </li>
                </ul>
            </nav>
            <!--主页功能菜单-->
            <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
                <ul class="cl">
                    <li><input id="serverTime" type="text" style="padding-top:18px;border:0px;background:rgba(0, 0, 0, 0);color: whitesmoke;width: 240px; " value=""  /></li>
                    <li><span style="color:gainsboro">用户:&nbsp;</span> </li>
                    <li class="dropDown dropDown_hover">
                        <span class="dropDown_A">王医生<i class="Hui-iconfont">&#xe6d5;</i></span>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;"  onClick="password_update('管理员列表','','1000','600')">管理员</a></li>
                            <li><a href="javascript:;"  onClick="password_update('修改个人信息','','1000','600')">个人信息</a></li>
                            <li><a href="javascript:;" onClick="password_update('修 改 密 码','','600','400')">修改密码</a></li>
                            <li><a href="javascript:;"  onClick="logoff()">注销</a></li>
                        </ul>
                    </li>
                    <li style="padding-left: 28px">&nbsp;</li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<aside class="Hui-aside">
    <div class="menu_dropdown ">
         <ul>
           <li><a data-href="#" data-title="今日预约" href="javascript:void(0)">今日预约</a></li>
           <li><a data-href="#" data-title="待审核患者" href="javascript:void(0)">待审核患者</a></li>
           <li><a data-href="#" data-title="近期就诊列表" href="javascript:void(0)">近期就诊列表</a></li>
         </ul>
    </div>
</aside>
<div class="dislpayArrow hidden-xs "><a class="pngfix open" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
    <div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
        <div class="Hui-tabNav-wp">
            <ul id="min_title_list" class="acrossTab cl">
                <li class="active">
                    <span title="首页" data-href="welcome.html">首页</span>
                    <em></em></li>
            </ul>
        </div>
        <div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
    </div>
    <div id="iframe_box" class="Hui-article">
        <div class="show_iframe">
            <div style="display:none" class="loading"></div>
            <iframe scrolling="yes" frameborder="0" src="manage/welcome"></iframe>
        </div>
    </div>
</section>
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
<script type="text/javascript" src="hui/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript">
    function getTime(){
        //获取系统日期
        var now =new Date();
        //月
        var month=now.getMonth()+1;
        //星期
        var week =now.getDay();
        var s ="";
        switch(week){
            case 0: s = "星期日";break;
            case 1: s = "星期一";break;
            case 2: s = "星期二";break;
            case 3: s = "星期三";break;
            case 4: s = "星期四";break;
            case 5: s = "星期五";break;
            case 6: s = "星期六";break;
        }
        //日
        var day=now.getDate();
        //小时
        var hour=now.getHours();
        //分钟
        var minute=now.getMinutes();
        //秒
        var second=now.getSeconds();

        if(day<10){
            day="0"+day;
        }
        if(hour<10){
            hour="0"+hour;
        }
        if(minute<10){
            minute="0"+minute;
        }
        if(second<10){
            second="0"+second;
        }
        return month+"月"+day+"日 "+"  "+hour+":"+minute+":"+second+"  "+s;
    }
    $(document).ready(function onLoad(){

        var timeStr = getTime();
        $("#serverTime").attr("value",timeStr);
        setTimeout(onLoad,1000);
    })

    // 消息提示
/*     $(document).ready(function showMsg(){
        if(msg.style.visibility == "visible"){
            msg.style.visibility = "hidden";
        }else{
            msg.style.visibility = "visible";
        }
        setTimeout(showMsg,500);
    }) */

   
    /*个人信息*/
    function myselfinfo(){
        layer.open({
            type: 1,
            area: ['300px','200px'],
            fix: false, //不固定
            maxmin: true,
            shade:0.4,
            title: '查看信息',
            content: '<div>管理员信息</div>'
        });
    }

    // 修改密码
    function password_update(title,url,w,h){
        layer_show(title,url,w,h);
    }
    function logoff() {
        layer.confirm('确认要注销登录吗？',function() {
            $.ajax({
                type: 'POST',
                url: "manage/logoff",
                dataType: 'json',
                success: function (result) {
                    if(result.success){
                    	 window.location.href="manage/goLogin";
                    }

                },
                error: function (data) {
                    console.log(data);
                },
            });
        });
    }
 

    function chat(){
       var index=layer.open({
            type: 2,
            area: ['800px','600px'],
            title: "医患沟通信息列表",
            content: "patient/chat.do",

        });
        layer.full(index);

    }
</script>

</body>
</html>