

<%@page import="java.util.ArrayList"%>
<%@page import="controll.AllTrips"%>
<%@page contentType="text/html" pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk">
        <title>JSP Page</title>
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
                    <a class="navbar-brand" href="#">TRAINTOPIA</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="allTrips.jsp">Trips</a></li>
                        <li><a href="allBookings.jsp">Bookings</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">

                        <li> <a href="#"> Hi, ${sessionScope.user.name} </a></li>
                        <li> <a href="profile.jsp">Profile</a> </li>
                        <li><a href="logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
                        
        <%
            AllTrips tr = new AllTrips();
            ArrayList<AllTrips> all = new ArrayList();
            all = tr.search(request.getParameter("source"), request.getParameter("destination"));
            if (all.size() == 0) {
        %>
        <h1>No Trips Availabe</h1>
        <%} else {
        %>
        <table>
            <tr>
                <th>Trip Number</th>
                <th>Train Number</th>
                <th>Source</th>
                <th>Destination</th>
                <th>Departure Time</th>
                <th>Arrival Time</th>
                <th>Date</th>
                <th>Reserved Seats</th>
                <th>Price</th>
               
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


            </tr>
            <%
                    }
                }
            %>

        </table>                
                        
                        
    </body>
</html>
