
<%@page contentType="text/html" pageEncoding="gbk"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<%--    复制这里--%>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <title>用户信息</title>


    <link rel="stylesheet" href="style/bootstrap.min.css" />
    <link rel="stylesheet" href="style/style.css" />
    <link rel="stylesheet" href="./lib/layui/css/layui.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <link rel="stylesheet" href="./css/theme10.min.css">
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>


    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
<%--    Head复制结束--%>
</head>

<body class="index">
<!-- 顶部开始 -->
<div class="container">
    <div class="logo">
        <a href="./index.html">火车购票系统</a></div>
    <div class="left_open">
        <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
    </div>

    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;"> ${sessionScope.user.name}</a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                    <a  href="newprofile.jsp">个人信息</a></dd>
                <dd>
                    <a href="newlogin.jsp">退出</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index">
            <a href="newlogin.jsp">前台首页</a></li>
    </ul>
</div>
<!-- 顶部结束 -->

<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="newallTrips.jsp">
                    <i class="iconfont left-nav-li" lay-tips="会员管理">&#xe6b8;</i>
                    <cite>旅程查询</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
            </li>
            <li>
                <a href="allBookings.jsp">
                    <i class="iconfont left-nav-li" lay-tips="订单管理">&#xe723;</i>
                    <cite>订票</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
            </li>
        </ul>
    </div>
</div>
<!-- 左侧菜单结束 -->

<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
<%--        侧边栏标题--%>
        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>个人信息</li>
        </ul>

        <div class="layui-tab-content">

            <div class="layui-card-body layui-table-body layui-table-main">
                <br>
                <table class="layui-table layui-form">
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                    <th>姓名</th>--%>
<%--                    <th>用户名</th>--%>
<%--                    <th>电子邮箱</th>--%>
<%--                    </thead>--%>


<%--                    <tbody>--%>
<%--                    <tr>--%>
<%--                        <td>1</td>--%>
<%--                        <td>小明</td>--%>
<%--                        <td>男</td>--%>
<%--                    </tbody>--%>
                        <tbody>
                        <tr>
                            <td><b>姓名:</b></td>
                            <td>${sessionScope.user.name}</td>
                        </tr>
                        <tr>
                            <td><b>用户名:</b></td>
                            <td>${sessionScope.user.userName}</td>
                        </tr>
                        <tr>
                            <td><b>电子邮箱:</b></td>
                            <td>${sessionScope.user.email}</td>
                        </tr>
                        </tbody>

                </table>
            </div>
<%--            <div class="layui-container" style="width:1600px">--%>
                <form action="updateUser.jsp" class="layui-form">
                    <input type="submit" class="layui-btn "  style="margin-left:1550px;margin-right: 200px;" value="修改" />
                </form>
<%--            </div>--%>




        </div>
    </div>
</div>
<div class="page-content-bg"></div>
<style id="theme_style"></style>
<!-- 右侧主体结束 -->

<%--<nav class="navbar navbar-inverse">--%>
<%--    <div class="container-fluid">--%>
<%--        <div class="navbar-header">--%>
<%--            <a class="navbar-brand" href="#">火车购票系统</a>--%>
<%--        </div>--%>
<%--        <div class="collapse navbar-collapse" id="myNavbar">--%>
<%--            <ul class="nav navbar-nav">--%>

<%--                <li><a href="allTrips.jsp">旅程查询</a></li>--%>
<%--                <li><a href="allBookings.jsp">订票</a></li>--%>
<%--            </ul>--%>
<%--            <ul class="nav navbar-nav navbar-right">--%>
<%--                <li> <a href="#">  ${sessionScope.user.name} </a></li>--%>
<%--                <li class="active"> <a href="#">用户信息</a></li>--%>
<%--                <li><a href="logout">登出</a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</nav>--%>

<%--<div class="container">--%>
<%--    <div class="row">--%>
<%--        <div class="col col-md-12">--%>
<%--            <h3>--%>
<%--                用户信息:--%>
<%--            </h3>--%>
<%--            <div class="container">--%>
<%--                <table class="table">--%>
<%--                    <tbody>--%>
<%--                    <tr>--%>
<%--                        <td><b>姓名:</b></td>--%>
<%--                        <td>111</td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td><b>用户名:</b></td>--%>
<%--                        <td>11111</td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td><b>电子邮箱:</b></td>--%>
<%--                        <td>2222</td>--%>
<%--                    </tr>--%>
<%--                    </tbody>--%>
<%--                </table>--%>
<%--                <form action="updateUser.jsp">--%>
<%--                    <input type="submit" class="btn btn-primary" value="修改" />--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

</body>
</html>
