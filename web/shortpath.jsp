<%@page import="controll.AllTrips" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="gbk" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <title>最短路径</title>

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

        tr:hover {
            background-color: #f5f5f5
        }

        .input-group {
            width: 250px
        }


    </style>
    <link rel="stylesheet" href="style/bootstrap.min.css"/>
    <link rel="stylesheet" href="style/style.css"/>
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="style/bootstrap.min.css"/>
    <link rel="stylesheet" href="style/style.css"/>
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <link rel="stylesheet" href="./css/theme10.min.css">
    <link rel="stylesheet" href="./lib/layui/css/layui.css">
    <script src="./lib/layui/layui.js" charset="utf-8"></script>

    <script type="text/javascript" src="./js/xadmin.js"></script>
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
<div class="page-content">
    <div class="layui-tab tab">

        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>车次查询
            </li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-container">

                <form action="search.jsp" method="post" class="layui-form">

                    <div class="layui-form layui-form-pane">
                        <br>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">日期</label>
                                <div class="layui-input-inline">
                                    <input class="layui-input" id="test1" placeholder="输入日期" type="text" name="date"
                                           autocomplete="off"/>
                                </div>
                            </div>


                            <div class="layui-input-inline">
                                <label class="layui-form-label" >出发地</label>
                                <div class="layui-input-block">
                                    <input class="layui-input" placeholder="出发地" type="text" name="source" value=""
                                           required/>
                                </div>
                            </div>

                            <div class="layui-input-inline">
                                <label class="layui-form-label">目的地</label>
                                <div class="layui-input-block">
                                    <input class="layui-input" placeholder="目的地" type="text" name="destination"
                                           value=""
                                           required/>
                                </div>
                            </div>


                            <div class="layui-input-inline">
                                <select class="layui-select" name="shorttype">
                                    <option value="直达">直达方案</option>
                                    <option value="换乘">换乘方案</option>
                                    <option value="最快">最早到达</option>
                                </select>
                            </div>

                            <div class="layui-input-inline">
                                <button class="layui-btn"> 搜索<i class="layui-icon">&#xe615;</i></button>
                            </div>
                            <input style='display: none' type="text" name="searchType" value='shortpath'/>
                        </div>
                    </div>
                </form>
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
            <table class="layui-table">
                <tr>
                    <%--        <th>旅程号</th>--%>
                    <th>火车车次</th>
                    <th>出发地</th>
                    <th>目的地</th>
                    <th>出发时间</th>
                    <th>到达时间</th>
                    <th>日期</th>
                    <th>剩余座位</th>
                    <th>价格</th>
<%--                    <th>距离</th>--%>
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
                    <%--        <td> <%=all.get(i).getTrainNum()%> </td>--%>
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
<%--                    <td><%=all.get(i).getdistance()%>--%>
<%--                    </td>--%>

                    <td>
                        <form action="bookTrip.jsp" method="post">
                            <input style='display: none' type="text" name="tripNum"
                                   value='<%=all.get(i).getTripNum()%>'/>
                            <input style='display: none' type="text" name="price" value='<%=all.get(i).getPrice()%>'/>
                            <button class="layui-btn">购买</button>
                            <%--                <input type="submit" value="购买">--%>
                        </form>
                    </td>
                    <td>
                        <form action="userdetailed.jsp" method="post">
                            <input style='display: none' type="text" id="tripNum" name="tripNum"
                                   value='<%=all.get(i).getTripNum() %>'/>
                            <%--                            <input type="submit" value="详情">--%>
                            <button class="layui-btn">详情</button>
                        </form>
                    </td>

                </tr>
                <%
                        }
                    }
                %>

            </table>
        </div>
    </div>
</div>
</div>
</body>
<script>
    layui.use('laydate', function () {
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#test1' //指定元素
        });
    });
</script>

<script>
    //Demo
    layui.use('form', function () {
        var form = layui.form;
        form.render();
    });
</script>

</html>

