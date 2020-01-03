
<%@page import="controll.AllTrips"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk">
        <title>JSP Page</title>
        <script type="text/javascript" src="jquery-3.1.1.js"></script>
        <script type="text/javascript">
           $(document).ready(function(){
                $("#delete").click(function (){
//                    var tripNum = $("#tripNum").val();
//                    $.get("deleteTrip", {tripNum:tripNum});
//                    setTimeout(function(){
//                        location.reload(); 
//                    }, 500); 
                    alert($("#tripNum").val());
                });
            });
           
            
        </script>
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
                        <li> <a href="addTrain.jsp">Add Train</a></li>
                        <li> <a href="trainsInfo.jsp">Trains</a></li>
                        <li><a href="addTrip.jsp">Add Trip</a></li>
                        <li class="active"><a href="tripsInfo.jsp">Trips</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li> <a href="#"> Hi, ${sessionScope.admin.userName} </a></li>

                        <li><a href="logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <%
            if (null != request.getAttribute("message")) {
                boolean check =(boolean) request.getAttribute("message");
                if(check){
                    
                    out.print("Trip updated successfully");
                }
                else{
                    out.print("Please try again");
                }
            }
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
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        <%
            AllTrips tr = new AllTrips(); 
            ArrayList<AllTrips> all = new ArrayList();
            all = tr.showTrips();
            
            for(int i=0; i<all.size(); i++){
                String tripNum = all.get(i).getTripNum();
                %>
                <tr>
                    <td> <%=all.get(i).getTripNum() %> </td>
                    <td> <%=all.get(i).getTrainNum() %> </td>
                    <td> <%=all.get(i).getSrc() %> </td>
                    <td> <%=all.get(i).getDest() %> </td>
                    <td> <%=all.get(i).getDepTime() %> </td>
                    <td> <%=all.get(i).getArrTime() %> </td>
                    <td> <%=all.get(i).getDate() %> </td>
                    <td> <%=all.get(i).getSeats() %> </td>
                    <td> <%=all.get(i).getPrice() %> </td>
                    
                    <td>
                        <form action="editTrip" method="post">
                            <input style='display: none' type="text" id="tripNum" name="id" value='<%=all.get(i).getTripNum() %>' /> 
                            <input type="submit" value="Edit">
                        </form>
                    </td>
                    
                    <td>
                        <form action="deleteTrip" method="post">
                            <input style='display: none' type="text" id="tripNum" name="id" value='<%=all.get(i).getTripNum() %>' /> 
                            <input type="submit" value="Delete">
                        </form>
                    </td>
                    
                </tr>
            <%
            }
            
        %>
        
        </table>
    </body>
</html>
