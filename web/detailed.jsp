
<%@page import="controll.AllTrips"%>
<%@page import="controll.detailed"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controll.site"%>
<%@page contentType="text/html" pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <title>旅程信息</title>
    <link rel="stylesheet" href="style/bootstrap.min.css" />
    <link rel="stylesheet" href="style/style.css" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <link rel="stylesheet" href="./css/theme10.min.css">
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>

    <script type="text/javascript" src="jquery-3.1.1.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#delete").click(function (){

                alert($("#tripNum").val());
            });
        });


    </script>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
            margin: 0 auto;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tr:hover{background-color:#f5f5f5}
    </style>
    <link rel="stylesheet" href="style/bootstrap.min.css" />
    <link rel="stylesheet" href="style/style.css" />
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="style/bootstrap.min.css" />
    <link rel="stylesheet" href="style/style.css" />
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <link rel="stylesheet" href="./css/theme10.min.css">
    <script type="text/javascript" src="jquery-3.1.1.js"></script>
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
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
<%--                <dd>--%>
<%--                    <a onclick="xadmin.open('切换帐号','http://www.baidu.com')">切换帐号</a></dd>--%>
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
                <a href="addTrip.jsp">
                    <i class="iconfont left-nav-li" lay-tips="会员管理">&#xe6b8;</i>
                    <cite>新增车次</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
            </li>

            <li>
                <a href="tripsInfo.jsp">
                    <i class="iconfont left-nav-li" lay-tips="会员管理">&#xe6b8;</i>
                    <cite>车次信息</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
            </li>

            <li>
                <a href="addStation.jsp">
                    <i class="iconfont left-nav-li" lay-tips="订单管理">&#xe723;</i>
                    <cite>新增站点</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
            </li>
        </ul>
    </div>
</div>
<!-- 左侧菜单结束 -->
<div class="page-content">
    <div class="layui-tab tab" >
        <%
    if (null != request.getAttribute("message")) {
        boolean check =(boolean) request.getAttribute("message");
        if(check){

            out.print("提交成功");
        }
        else{
            out.print("重新提交");
        }
    }
%>
        <%
    String tripNum1 = request.getParameter("id");
%>

        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>车次<%out.print(tripNum1);%>经过的站点信息:</li>
        </ul>
<%--        <h2> 车次<%out.print(tripNum1);%>经过的站点信息:</h2>--%>

        <div class="layui-tab-content">
            <div class="layui-container">
                <table class="layui-table">
    <tr>
        <th>站序</th>
        <th>站名</th>
        <th>到时</th>
        <th>发时</th>
        <th>时长</th>
        <th>编辑</th>
    </tr>
    <%

        ArrayList<site> all = new ArrayList();
        all = site.showonetrip(request.getParameter("id"));

        for(int i=0; i<all.size(); i++){
            String tripNum = all.get(i).trip;
    %>
    <tr>
        <td> <%=all.get(i).StationOrder %> </td>
        <td> <%=all.get(i).location %> </td>
        <td> <%=all.get(i).arrivTime %> </td>
        <td> <%=all.get(i).depTime %> </td>
        <td> <%=all.get(i).date %> </td>
        <td>
            <form action="updateStation.jsp" method="post">
                <input style='display: none' type="text"  name="tripNum" value='<%=all.get(i).trip %>' />
                <input style='display: none' type="text"  name="location" value='<%=all.get(i).location %>' />
                <input style='display: none' type="text"  name="StationOrder" value='<%=all.get(i).StationOrder %>' />
                <button class="layui-btn">编辑</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>

</table> <br>
                <form  method="post" action="sitepull">
                    <input style='display: none' type="text" name="trip" value='<%=request.getParameter("id")%>' />
                    <button class="layui-btn">导出</button>
<%--                    <input type="submit" class="btn btn-success" value="导出" />--%>
</form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
