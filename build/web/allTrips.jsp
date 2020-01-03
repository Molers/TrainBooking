<%-- 
    Document   : allTrips
    Created on : Dec 27, 2016, 3:17:52 PM
    Author     : Ahmed
--%>

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
        <div class="container">
            <form action="search.jsp" method="post">
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> Source: </span>
                    <input class="form-control" placeholder="Enter source" type="text" name="source" value="" required/> <br>
                </div> <br>
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> Destination </span>
                    <input class="form-control" placeholder="Enter destination" type="text" name="destination" value="" required/> <br>
                </div>
                

                <input style='display: none' type="text" name="type" value='user' /> 

                <input type="submit" class="btn btn-success" value="search" />
            </form>
        </div><br>
        <%
            AllTrips tr = new AllTrips();
            ArrayList<AllTrips> all = new ArrayList();
            all = tr.showTrips();
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
                <th>Book</th>
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

                <td>
                    <form action="bookTrip.jsp" method="post">
                        <input style='display: none' type="text" name="tripNum" value='<%=all.get(i).getTripNum()%>' /> 
                        <input style='display: none' type="text" name="price" value='<%=all.get(i).getPrice()%>' /> 
                        <input type="submit" value="Book">
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
