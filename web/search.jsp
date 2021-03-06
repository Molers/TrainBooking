<%@page import="controll.AllTrips" %>
<%@page import="controll.site" %>
<%--<%@ page import="static controll.site.showpath" %>--%>
<%--<%@ page import="static controll.site.myshortpath" %>--%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="static controll.AllTrips.search" %>
<%@ page import="static controll.site.showshorttimetrip" %>
<%@ page import="static controll.site.showhuancheng" %>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="gbk" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk ">
    <title>搜索结果</title>
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

<div class="page-content">
    <%
        request.setCharacterEncoding("gbk");
        response.setCharacterEncoding("gbk");
        String source1 = request.getParameter("source");
        String des = request.getParameter("destination");
    %>
    <div class="layui-tab tab">
        <ul class="layui-tab-title">

            <li class="home">
                <i class="layui-icon">&#xe68e;</i><%out.print(source1 + "到" + des);%></li>
        </ul>
        <div class="layui-tab-content">
            <%
                request.setCharacterEncoding("gbk");
                response.setCharacterEncoding("gbk");
            %>
            <%

                ArrayList<ArrayList<AllTrips>> all = new ArrayList();
                Date date;
                date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));
                ArrayList<String> show=new ArrayList<>();


                if (request.getParameter("searchType").equals("shortpath")) {
                    if (request.getParameter("shorttype").equals("直达")) {
                        all = site.showDirect(site.allDirect(request.getParameter("source"), request.getParameter("destination")), date);
                        show.clear();
                    } else {
                        if(request.getParameter("shorttype").equals("换乘")) {
                          show= showhuancheng(site.Transfer(request.getParameter("source"), request.getParameter("destination")), date);
                            all = site.showDirect(site.Transfer(request.getParameter("source"), request.getParameter("destination")), date);
                        } else{
                            show.clear();
                            all=showshorttimetrip(request.getParameter("source"),request.getParameter("destination"),date);
                        }

                    }


                } else {

                     //all = search(request.getParameter("searchType"), request.getParameter("destination"));
                }
                if (all.size() == 0) {
            %>
            <script>
                alert("检索结果为空");
            </script>
            <%
            } else {
            %>
            <%--        <table class="layui-table">--%>
            <%--            <tr>--%>
            <%--                <th>火车车次</th>--%>
            <%--                <th>出发地</th>--%>
            <%--                <th>目的地</th>--%>
            <%--                <th>出发时间</th>--%>
            <%--                <th>到达时间</th>--%>
            <%--                <th>历时</th>--%>
            <%--                <th>剩余座位</th>--%>
            <%--                <th>价格</th>--%>
            <%--                <th>路程</th>--%>
            <%--                <th>预定</th>--%>
            <%--               --%>
            <%--            </tr>--%>
            <%--        </table>--%>
            <%--                测试--%>


            <%
                for (int j = 0; j < all.size(); j++) {
                    ArrayList<AllTrips> my = new ArrayList<>(all.get(j));
            %>
            <fieldset class="layui-elem-field layui-field-title">
                <legend><a name="attr">方案<%out.print(j + 1);%>
                    <%
                        if(request.getParameter("shorttype").equals("换乘")) {out.print("-换乘点为:"+show.get(j));}
                %></a></legend>
            </fieldset>

            <table class="layui-table">

                <tr>
                    <th>火车车次</th>
                    <th>出发地</th>
                    <th>目的地</th>
                    <th>出发时间</th>
                    <th>到达时间</th>
                    <th>日期</th>
                    <th>剩余座位</th>
                    <th>价格</th>
<%--                    <th>路程</th>--%>
                    <th>预定</th>
                    <th>详情</th>
                </tr>
                <%
                    for (int i = 0; i < my.size(); i++) {
                        String tripNum = my.get(i).getTripNum();
                %>
                <tr>
                    <td><%=my.get(i).getTripNum()%>
                    </td>
                    <td><%=my.get(i).getSrc()%>
                    </td>
                    <td><%=my.get(i).getDest()%>
                    </td>
                    <td><%=my.get(i).getDepTime()%>
                    </td>
                    <td><%=my.get(i).getArrTime()%>
                    </td>
                    <td><%=my.get(i).getDate()%>
                    </td>
                    <td><%=my.get(i).getSeats()%>
                    </td>
                    <td><%=my.get(i).getPrice()%>
                    </td>
<%--                    <td><%=my.get(i).getdistance()%>--%>
<%--                    </td>--%>
                    <td>
                        <form action="bookTrip.jsp" method="post">
                            <input style='display: none' type="text" name="tripNum"
                                   value='<%=my.get(i).getTripNum()%>'/>
                            <input style='display: none' type="text" name="price" value='<%=my.get(i).getPrice()%>'/>
                            <button class="layui-btn">预定</button>
                            <%--                               <input type="submit" value="预定">--%>
                        </form>
                    </td>
                    <td>
                        <form action="userdetailed.jsp" method="post">
                            <input style='display: none' type="text" id="tripNum" name="tripNum"
                                   value='<%=my.get(i).getTripNum() %>'/>
                            <%--                            <input type="submit" value="详情">--%>
                            <button class="layui-btn">详情</button>
                        </form>
                    </td>

                </tr>


                <%
                    }//ifor
                %>
            </table>
            <%
                    }//jfor
                }//else
            %>

            </table>

        </div>
    </div>
</div>
</body>
</html>
