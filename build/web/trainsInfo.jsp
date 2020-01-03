

<%@page import="java.util.ArrayList"%>
<%@page import="controll.Train"%>
<%@page import="controll.AllTrips"%>
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
                        <li> <a href="addTrain.jsp">Add Train</a></li>
                        <li class="active"> <a href="trainsInfo.jsp">Trains</a></li>
                        <li><a href="addTrip.jsp">Add Trip</a></li>
                        <li><a href="tripsInfo.jsp">Trips</a></li>
                        
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li> <a href="#"> Hi, ${sessionScope.admin.userName} </a></li>

                        <li><a href="logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <table>
            <tr>
                <th>Train Number</th>
                <th>Number of seats </th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        <%
            Train tr = new Train(); 
            ArrayList<Train> all = new ArrayList();
            all = tr.showTrains();
            
            for(int i=0; i<all.size(); i++){
                %>
                <tr>
                    <td> <%=all.get(i).getTrainNum() %> </td>
                    <td> <%=all.get(i).getSeats() %> </td>
                    <td>
                        <form action="editTrain" method="post">
                            <input style='display: none' type="text" id="trainNum" name="trainNum" value='<%=all.get(i).getTrainNum() %>' /> 
                            <input type="submit" value="Edit">
                        </form>
                    </td>
                    
                    <td>
                        <form action="deleteTrain" method="post">
                            <input style='display: none' type="text" id="trainNum" name="trainNum" value='<%=all.get(i).getTrainNum() %>' /> 
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
