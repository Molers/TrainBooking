<%-- 
    Document   : updateTrain
    Created on : Dec 27, 2016, 2:29:22 PM
    Author     : Ahmed
--%>

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
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">TRAINTOPIA</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"> <a href="addTrain.jsp">Add Train</a></li>
                        <li> <a href="trainsInfo.jsp">Trains</a></li>
                        <li ><a href="addTrip.jsp">Add Trip</a></li>
                        <li><a href="tripsInfo.jsp">Trips</a></li>
                        
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li> <a href="#"> Hi, ${sessionScope.admin.userName} </a></li>

                        <li><a href="logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div>
            
            <div class="container">
                <form action ="updateTrain" method="post" >
                    
                    <div class="input-group">
                        <span class="input-group-addon form-inline" id="basic-addon1"> Number of seats </span>
                        <input class="form-control" placeholder="New number of seats" name="numOfSeats" type="text" > 
                    </div><br>
                    <input style='display: none' type="text" name="trainNum" value='<%=request.getAttribute("trainNum") %>' />
                    <input type="submit" class="btn btn-success" value="Update Train"  name = "Update Train">
                </form>
            </div>
        </div>
    </body>
</html>
