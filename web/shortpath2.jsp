<%@page import="java.util.ArrayList"%>
<%@page import="controll.AllTrips"%>
<%@page contentType="text/html" pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <title>���·��</title>

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
            <a class="navbar-brand" href="#">�𳵹�Ʊϵͳ</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="allTrips.jsp">�ó�</a></li>
                <li><a href="allBookings.jsp">��Ʊ</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">

                <li>  ���, ${sessionScope.user.name} </a></li>
                <li> <a href="profile.jsp">�û���Ϣ</a> </li>
                <li><a href="logout">�ǳ�</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <form action="search.jsp" method="post">
        <div class="input-group">
            <span class="input-group-addon form-inline" id="basic-addon1"> ������: </span>
            <input class="form-control" placeholder="���������" type="text" name="source" value="" required/> <br>
        </div> <br>
        <div class="input-group">
            <span class="input-group-addon form-inline" id="basic-addon1"> Ŀ�ĵ� </span>
            <input class="form-control" placeholder="����Ŀ�ĵ�" type="text" name="destination" value="" required/> <br>
        </div><br>


        <input style='display: none' type="text" name="searchType" value='shortpath' />
        <select name="shorttype" style="height: 30px">
            <option value="shorttime">����ʱ��</option>
            <option value="shortpath">���·��</option>
        </select><br><br>

        <input type="submit" class="btn btn-success" value="����" />
    </form>
</div><br>
<%
    AllTrips tr = new AllTrips();
    ArrayList<AllTrips> all = new ArrayList();
    all = tr.showTrips();
    if (all.size() == 0) {
%>
<h1>�ó̲�����</h1>
<%} else {
%>
<table class="layui-table">
    <tr>
        <th>�ó̺�</th>
        <th>�𳵳���</th>
        <th>������</th>
        <th>Ŀ�ĵ�</th>
        <th>����ʱ��</th>
        <th>����ʱ��</th>
        <th>��ʱ</th>
        <th>ʣ����λ</th>
        <th>�۸�</th>
        <th>����</th>
        <th>Ԥ��</th>

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
                <input type="submit" value="����">
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

