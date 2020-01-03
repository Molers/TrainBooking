<%@page import="java.util.ArrayList"%>
<%@page import="controll.AllTrips"%>
<%@page contentType="text/html" pageEncoding="gbk"%>
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

        tr:hover{background-color:#f5f5f5}
    </style>
    <link rel="stylesheet" href="style/bootstrap.min.css" />
    <link rel="stylesheet" href="style/style.css" />
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">火车购票系统</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="allTrips.jsp">旅程</a></li>
                <li><a href="allBookings.jsp">购票</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">

                <li>  你好, ${sessionScope.user.name} </a></li>
                <li> <a href="profile.jsp">用户信息</a> </li>
                <li><a href="logout">登出</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <form action="search.jsp" method="post">
        <div class="input-group">
            <span class="input-group-addon form-inline" id="basic-addon1"> 出发地: </span>
            <input class="form-control" placeholder="输入出发地" type="text" name="source" value="" required/> <br>
        </div> <br>
        <div class="input-group">
            <span class="input-group-addon form-inline" id="basic-addon1"> 目的地 </span>
            <input class="form-control" placeholder="输入目的地" type="text" name="destination" value="" required/> <br>
        </div><br>


        <input style='display: none' type="text" name="searchType" value='shortpath' />
        <select name="shorttype" style="height: 30px">
            <option value="shorttime">最少时间</option>
            <option value="shortpath">最短路径</option>
        </select><br><br>

        <input type="submit" class="btn btn-success" value="搜索" />
    </form>
</div><br>
<%
    AllTrips tr = new AllTrips();
    ArrayList<AllTrips> all = new ArrayList();
    all = tr.showTrips();
    if (all.size() == 0) {
%>
<h1>旅程不存在</h1>
<%} else {
%>
<table class="layui-table">
    <tr>
        <th>旅程号</th>
        <th>火车车次</th>
        <th>出发地</th>
        <th>目的地</th>
        <th>出发时间</th>
        <th>到达时间</th>
        <th>历时</th>
        <th>剩余座位</th>
        <th>价格</th>
        <th>距离</th>
        <th>预定</th>

    </tr>
    <%
        for (int i = 0; i < all.size(); i++) {
            String tripNum = all.get(i).getTripNum();
    %>
    <tr>
        <td> <%=all.get(i).getTripNum()%> </td>
        <td> <%=all.get(i).getTrainNum()%> </td>
        <td> <%=all.get(i).getSrc()%> </td>
        <td> <%=all.get(i).getDest()%> </td>
        <td> <%=all.get(i).getDepTime()%> </td>
        <td> <%=all.get(i).getArrTime()%> </td>
        <td> <%=all.get(i).getDate()%> </td>
        <td> <%=all.get(i).getSeats()%> </td>
        <td> <%=all.get(i).getPrice()%> </td>
        <td> <%=all.get(i).getdistance()%> </td>

        <td>
            <form action="bookTrip.jsp" method="post">
                <input style='display: none' type="text" name="tripNum" value='<%=all.get(i).getTripNum()%>' />
                <input style='display: none' type="text" name="price" value='<%=all.get(i).getPrice()%>' />
                <input type="submit" value="购买">
            </form>
        </td>

    </tr>
    <%
            }
        }
    %>

</table>
</body>
</html>

