
<%@page import="controll.userData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controll.Train"%>
<%@page import="controll.booking"%>
<%@page contentType="text/html" pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=gbk">
        <title>所有订单</title>
        <link rel="stylesheet" href="style/bootstrap.min.css" />
        <link rel="stylesheet" href="style/style.css" />
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <link rel="stylesheet" href="style/bootstrap.min.css" />
        <link rel="stylesheet" href="style/style.css" />
        <link rel="stylesheet" href="./css/font.css">
        <link rel="stylesheet" href="./css/xadmin.css">
        <link rel="stylesheet" href="./css/theme10.min.css">
        <script src="./lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="./js/xadmin.js"></script>

        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            tr:hover{background-color:#f5f5f5}
        </style>

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

    <!-- 右侧主体开始 -->
    <div class="page-content">

        <div class="layui-tab tab" >
            <%--        侧边栏标题--%>
                <ul class="layui-tab-title">
                    <li class="home">
                        <i class="layui-icon">&#xe68e;</i>车票购买</li>
                </ul>
            <%--        侧边栏标题--%>
                <div class="layui-tab-content">
                    <div class="layui-container" >
                    <%--侧边栏内容表格开--%>
                <%
                    booking tr = new booking();
                    ArrayList<booking> all = new ArrayList();
                    userData u =(userData) session.getAttribute("user");
                    System.out.println("yanggang..........."+u.getID());
                    all = tr.showBookigs(u.getuserName());

                    if(all.size() == 0){
                %>
                        <script>
                            alert("暂无订单");
                        </script>
                <%}
                else{
                %>
                <table class="layui-table">
                    <tr>
                        <th>车次</th>
                        <th>余座 </th>
                        <th>价格 </th>
                        <th>退订</th>
                        <th>详情</th>
                    </tr>
                    <%
                        for(int i=0; i<all.size(); i++){
                    %>
                    <tr>
                        <td> <%=all.get(i).getTripId() %> </td>
                        <td> <%=all.get(i).getSeats() %> </td>
                        <td> <%=all.get(i).getCharge() %> </td>
                        <td>
                            <form action="cancelBooking" method="post">
                                <input style='display: none' type="text" name="bookID" value='<%=all.get(i).getBookID() %>' />
<%--                                <input type="submit" value="退订">--%>
                                <button class="layui-btn layui-btn-danger" >退订</button>
                                <input style='display: none' type="text" name="tripID" value='<%=all.get(i).getTripId() %>' />
                                <input style='display: none' type="text" name="seats" value='<%=all.get(i).getSeats() %>' />
                            </form>

                        <td>
                            <form action="userdetailed.jsp" method="post">
                                <input style='display: none' type="text" id="tripNum" name="tripNum" value='<%=all.get(i).getTripId() %>' />
                                <%--                            <input type="submit" value="详情">--%>
                                <button class="layui-btn">详情</button>
                            </form>
                        </td>

                        </td>

                    </tr>
                    <%
                            }
                        }
                    %>

                </table>
                <%--侧边栏内容表格结束--%>
                    </div>
                </div>
        </div>
            <%--左侧侧栏结束--%>
    </div>


    </body>
    <%
        if (null != request.getAttribute("message")) {

    %>
    <script>
        alert("<%=(String) request.getAttribute("message")%>");
    </script>
    <%
        }
    %>
</html>
