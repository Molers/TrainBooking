
<%@page import="java.util.ArrayList"%>
<%@page import="controll.AllTrips"%>
<%@ page language="java" contentType="text/html; charset=gbk"
         pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk">
        <meta http-equiv="Content-Type" content="text/html; charset=gbk">
        <title>新增车次</title>
        <script type="text/javascript">
            function checkForm(form) {

                <%--  Train Number --%>

                var z = document.forms["Add_train_form"]["trainNumber"].value;
                if (!z.match(/^\d+/))
                {
                    alert("Please only enter numeric characters only for the trainNumber ! (Allowed input:0-9)");
                    form.enginenumber.focus();
                    return false;
                }
                <%--  Train Number --%>

                var z = document.forms["Add_train_form"]["numOfSeats"].value;
                if (!z.match(/^\d+/))
                {
                    alert("Please only enter numeric characters only for the numOfSeats ! (Allowed input:0-9)");
                    form.enginenumber.focus();
                    return false;
                }

            }
        </script>
        <link rel="stylesheet" href="style/bootstrap.min.css" />
        <link rel="stylesheet" href="style/style.css" />
        <link rel="stylesheet" href="style/bootstrap.min.css" />
        <link rel="stylesheet" href="style/style.css" />
        <link rel="stylesheet" href="./css/font.css">
        <link rel="stylesheet" href="./css/xadmin.css">
        <link rel="stylesheet" href="./css/theme10.min.css">
        <script src="./lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="./js/xadmin.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <title>所有车次</title>

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

            .yang{
                height: 32px;
            }
            .right{
                margin-right: 10px;
            }
            .dis{
                display: inline;
            }
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

                        <li> 你好, ${sessionScope.user.name} </a></li>
                        <li> <a href="profile.jsp">用户信息</a> </li>
                        <li><a href="logout">登出</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">

            <div class="input-group" >
                <form action="search.jsp" method="post" class="dis">
                    <select name="searchType" class="yang">
                        <option value="Destination">目的地</option>
                        <option value="Source">出发地</option>
                        <option value="TrainNumber">火车车次</option>
                        <option value="TripNumber">旅程号</option>
                    </select>&nbsp;
                    <input class="yang right" placeholder="输入 " type="text" name="destination" value="" required/>
                    <input type="submit" class="btn btn-success" value="搜索" />&emsp;&emsp;
                </form>
                <form action="shortpath.jsp" method="post" class="dis">
                    <input type="submit" class="btn btn-success" value="更多  " />
                </form>
            </div>
            <br><br>




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
        <table class="layui-table layui-form">
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
            <h1>
                <%
                    if (null != request.getAttribute("bookMessage")) {
                        out.println(request.getAttribute("bookMessage"));
                    }
                %>
            </h1>

        </table>



    </body>
</html>
