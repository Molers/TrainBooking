<%@ page import="controll.site" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Angel
  Date: 2020/1/1
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>这里是用户信息界面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">

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
                    <a href="newlogin.jsp">退出</a></dd>
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
            String tripNum1 = request.getParameter("tripNum");
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

                    </tr>
                    <%

                        ArrayList<site> all = new ArrayList();
                        all = site.showonetrip(request.getParameter("tripNum"));

                        for(int i=0; i<all.size(); i++){
                            String tripNum = all.get(i).trip;
                    %>
                    <tr>
                        <td> <%=all.get(i).StationOrder %> </td>
                        <td> <%=all.get(i).location %> </td>
                        <td> <%=all.get(i).arrivTime %> </td>
                        <td> <%=all.get(i).depTime %> </td>
                        <td> <%=all.get(i).date %> </td>

                    </tr>
                    <%
                        }
                    %>

                </table> <br>
<%--                <form  method="post" action="pull">--%>

<%--                    <input type="submit" class="btn btn-success" value="导出" />--%>
<%--                </form>--%>
            </div>
        </div>
    </div>
</div>

</body>
</html>
