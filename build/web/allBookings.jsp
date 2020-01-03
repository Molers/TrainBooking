<%-- 
    Document   : allBookings
    Created on : Dec 27, 2016, 5:03:17 PM
    Author     : Ahmed
--%>

<%@page import="controll.userData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controll.Train"%>
<%@page import="controll.booking"%>
<%@page contentType="text/html" pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style/bootstrap.min.css" />
        <link rel="stylesheet" href="style/style.css" />
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
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
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">TRAINTOPIA</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        
                        <li><a href="allTrips.jsp">Trips</a></li>
                        <li class="active"><a href="allBookings.jsp">Bookings</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li> <a href="#"> Hi, ${sessionScope.user.name} </a></li>
                        <li > <a href="profile.jsp">Profile</a></li>
                        <li><a href="logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <%
            booking tr = new booking(); 
            ArrayList<booking> all = new ArrayList();
            userData u =(userData) session.getAttribute("user");
            all = tr.showBookigs(u.getID());
            if(all.size() == 0){
                %>
                <h1>No Bookings</h1>
            <%}
            else{
        %>                
        <table>
            <tr>
                <th>Trip Number</th>
                <th>Number of seats </th>
                <th>Charge </th>
                <th>Cancel</th>
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
                            <input type="submit" value="Cancel">
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
