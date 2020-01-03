<%@page contentType="text/html" pageEncoding="gbk" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <title>JSP Page</title>

    <style>
        /*label{*/
        /*    float: left;*/
        /*    width: 120px;*/
        /*    font-weight: bold;*/
        /*}*/
    </style>
    <link rel="stylesheet" href="style/bootstrap.min.css"/>
    <link rel="stylesheet" href="style/style.css"/>
    <script src="js/jquery.min.js"></script>
    <link rel="stylesheet" href="style/bootstrap.min.css"/>

    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <link rel="stylesheet" href="./css/theme10.min.css">
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script src="./lib/layui/layui.js" charset="utf-8"></script>

    <link rel="stylesheet" href="style/style.css"/>
    <script src="js/jquery.min.js"></script>

</head>
<body>

<!-- 顶部开始 -->
<div class="container">
    <div class="logo">
        <a href="./index.html">火车购票系统</a></div>
    <div class="left_open">
        <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
    </div>

    <ul class="layui-nav right">
        <li class="layui-nav-item">
            <a href="javascript:;"> ${sessionScope.user.name}</a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                    <a href="newprofile.jsp">个人信息</a></dd>

                <dd>
                    <a href=newlogin.jsp">退出</a></dd>
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
                <a href="addTrip.jsp">
                    <i class="iconfont left-nav-li">&#xe6b8;</i>
                    <cite>新增车次</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
            </li>

            <li>
                <a href="tripsInfo.jsp">
                    <i class="iconfont left-nav-li">&#xe6b8;</i>
                    <cite>车次信息</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
            </li>

            <li>
                <a href="addStation.jsp">
                    <i class="iconfont left-nav-li">&#xe723;</i>
                    <cite>新增站点</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
            </li>
        </ul>
    </div>
</div>
<!-- 左侧菜单结束 -->
<div class="page-content">
    <%
    request.setCharacterEncoding("gbk");
    response.setCharacterEncoding("gbk");
    %>
    <div class="layui-tab tab">
        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>编辑<%out.print(request.getParameter("tripNum")); %> 到
                <%out.print(request.getParameter("location")); %>的信息
            </li>
        </ul>
        <div class="layui-tab-content">
            <%--                <div class="layui-card-body layui-table-body layui-table-main">--%>


            <div class="layui-container">
                <br>
                <form method="post" action="updatesite" class="layui-form layui-form-pane">


                    <div class="layui-form-item">
                        <label class="layui-form-label">到达时间</label>
                        <div class="layui-input-block">
                        <input  class="layui-input"placeholder="" type="time" name="arrivTime" value=""
                               required/>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">出发时间</label>
                        <div class="layui-input-block">
                        <input  class="layui-input"placeholder="" type="time" name="depTime" value=""
                               required/>
                        </div>
                    </div>



                    <div class="layui-form-item">
                        <label class="layui-form-label">历时</label>
                        <div class="layui-input-block">
                        <input  class="layui-input"placeholder="历时(小时)" type="text" name="date"
                               value="" required/>
                        </div>
                    </div>
                    <br>


                    <br>


                    <input style='display: none' type="text"  name="tripNum"
                           value='<%=request.getParameter("tripNum") %>'/>
                    <input style='display: none' type="text"  name="StationOrder"
                           value='<%=request.getParameter("StationOrder") %>'/>

                    <button class="layui-btn" >提交</button>
                </form>


            </div>
        </div>
    </div>

</div>

<div class="page-content-bg"></div>
<style id="theme_style"></style>

</body>
</html>
