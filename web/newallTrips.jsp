<%@ page import="controll.AllTrips" %>
<%@ page import="java.util.ArrayList" %>

<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <title>用户信息</title>

    <link rel="stylesheet" href="style/bootstrap.min.css"/>
    <link rel="stylesheet" href="style/style.css"/>
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <link rel="stylesheet" href="./css/theme10.min.css">
    <link rel="stylesheet" href="./lib/layui/css/layui.css">
    <script src="./lib/layui/layui.js" charset="GBK"></script>

    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script src="js/jquery.min.js"></script>

    <script src="js/bootstrap.min.js"></script>
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
                    <a href="newprofile.jsp">个人信息</a></dd>
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

<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab">
        <%--        侧边栏标题--%>
        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>车次信息
            </li>
        </ul>
        <%--        侧边栏标题--%>

        <%--        侧边栏内容--%>
        <div class="layui-tab-content">

            <div class="layui-card-body ">
                <%--                                        查询方式的选择--%>
                <div class="layui-container">

                    <div class="layui-input-block">

                        <div class="layui-container">
                            <br>
                            <form action="SimpleSearch.jsp" method="post" class="layui-form">


                                <div class="layui-input-inline">
                                    <select class="layui-select" name="searchType" lay-verify="">
                                        <option value="目的地">目的地</option>
                                        <option value="出发地">出发地</option>
                                        <option value="车次">火车车次</option>
                                        <%--                                                        <option value="TripNumber">旅程号</option>--%>

                                    </select>
                                </div>

                                <div class="layui-input-inline">
                                    <input  placeholder="输入 " class="layui-input" type="text" name="destination" value=""
                                           required/>
                                </div>

                                <%--                                                    <input type="submit" class="btn btn-success" value="搜索" />&emsp;--%>

                                <div class="layui-input-inline">
                                    <button class="layui-btn">搜索 <i class="layui-icon">&#xe615;</i></button>
                                </div>

                            </form>
                            <br>
                            <div class="layui-form-item">
                                <div class="layui-input-inline">
                                    <form action="shortpath.jsp" method="post">

                                        <%--                                                    <input type="submit" class="btn btn-success" value="更多  " />--%>
                                        <button class="layui-btn">更多<i class="layui-icon">&#xe65f;</i></button>

                                    </form>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
                <br>
                <%

                    AllTrips tr = new AllTrips();
                    ArrayList<AllTrips> all = new ArrayList();
                    all = tr.showTrips();
                    if (all.size() == 0) {
                %>
                <h1>旅程不存在</h1>
                <%
                } else {
                %>

                <table class="layui-table ">
                    <tr>
                        <%--                            <th>旅程号</th>--%>
                        <th>火车车次</th>
                        <th>出发地</th>
                        <th>目的地</th>
                        <th>出发时间</th>
                        <th>到达时间</th>
                        <th>日期</th>
                        <th>剩余座位</th>
                        <th>价格</th>
<%--                        <th>距离</th>--%>
                        <th>预定</th>
                        <th>详情</th>
                    </tr>

                    <%
                        for (int i = 0; i < all.size(); i++) {
                            String tripNum = all.get(i).getTripNum();
                    %>

                    <tr>
                        <td><%=all.get(i).getTripNum()%>
                        </td>
                        <%--                            <td> <%=all.get(i).getTrainNum()%> </td>--%>
                        <td><%=all.get(i).getSrc()%>
                        </td>
                        <td><%=all.get(i).getDest()%>
                        </td>
                        <td><%=all.get(i).getDepTime()%>
                        </td>
                        <td><%=all.get(i).getArrTime()%>
                        </td>
                        <td><%=all.get(i).getDate()%>
                        </td>
                        <td><%=all.get(i).getSeats()%>
                        </td>

                        <td><%=all.get(i).getPrice()%>
                        </td>
<%--                        <td><%=all.get(i).getdistance()%>--%>
<%--                        </td>--%>


                        <td>
                            <form action="bookTrip.jsp" method="post">
                                <input style='display: none' type="text" name="tripNum"
                                       value='<%=all.get(i).getTripNum()%>'/>
                                <input style='display: none' type="text" name="price"
                                       value='<%=all.get(i).getPrice()%>'/>
                                <%--                                    <input type="submit" value="购买">--%>
                                <button class="layui-btn">购买</button>
                            </form>
                        </td>

                        <td>
                            <form action="userdetailed.jsp" method="post">
                                <input style='display: none' type="text" name="tripNum"
                                       value='<%=all.get(i).getTripNum()%>'/>
                                <input style='display: none' type="text" name="price"
                                       value='<%=all.get(i).getPrice()%>'/>
                                <%--                                    <input type="submit" value="购买">--%>
                                <button class="layui-btn">详情</button>
                            </form>
                        </td>

                    </tr>
                    <%
                            }
                        }
                    %>
                    <h1>
                        <%
                            if (null != request.getAttribute("bookMessage")) {
                                out.println(request.getAttribute("bookMessage"));
                            }
                        %>
                    </h1>
                </table>


            </div>
        </div>
    </div>
    <div class="page-content-bg"></div>
    <style id="theme_style"></style>
    <!-- 右侧主体结束 -->
</div>
<script>
    //一般直接写在一个js文件中
    layui.use(['layer', 'form', 'select'], function () {
        var layer = layui.layer
            , form = layui.form
            , select = layui.select;

        render(select);
        render(input);

    });
</script>
</body>

</html>
