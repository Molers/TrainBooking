
<%@page contentType="text/html" pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style/bootstrap.min.css" />
        <link rel="stylesheet" href="style/style.css" />
        <link rel="stylesheet" href="style/bootstrap.min.css" />
        <link rel="stylesheet" href="style/style.css" />
        <link rel="stylesheet" href="./css/font.css">
        <link rel="stylesheet" href="./css/xadmin.css">
        <link rel="stylesheet" href="./css/theme10.min.css">
        <link rel="stylesheet" href="./lib/layui/css/layui.css">
        <script src="./lib/layui/layui.js" charset="utf-8"></script>

        <script type="text/javascript" src="./js/xadmin.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    </head>
    <body>
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
<%--                    <dd>--%>
<%--                        <a onclick="xadmin.open('切换帐号','http://www.baidu.com')">切换帐号</a></dd>--%>
                    <dd>
                        <a href="logout">退出</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item to-index">
                <a href="newlogin.jsp">前台首页</a></li>
        </ul>
    </div>
    <!-- 顶部结束 -->

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
    <div class="page-content">

        <div class="layui-tab tab" >
            <ul class="layui-tab-title">
                <li class="home">
                    <i class="layui-icon">&#xe68e;</i>车票购买</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-container">
            <form  method="post" action="bookTrip" class="layui-form layui-form-pane">
                <div class="layui-form-item">
                    <label class="layui-form-label">数量</label>
<%--                    <span class="input-group-addon form-inline" id="basic-addon1"> 数量 </span>--%>
                    <div class="layui-input-block">
                    <input class="layui-input" type="text" placeholder="数量" name="seats" required> <br>
                    </div>
                    </div>
                <input style='display: none' type="text" name="price" value='<%=request.getParameter("price")%>' />
                <input style='display: none' type="text" name="tripNum" value='<%=request.getParameter("tripNum")%>' />
<%--               <input type="submit" class="btn btn-success" value="提交" />--%>
                <button class="layui-btn">提交</button>
            </form>
        </div>                
            </div>
            </div></div>
    </body>
</html>
