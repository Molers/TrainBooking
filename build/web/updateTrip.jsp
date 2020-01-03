<%-- 
    Document   : updateTrip
    Created on : Dec 26, 2016, 8:25:17 PM
    Author     : Ahmed
--%>

<%@page contentType="text/html" pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk">
        <title>JSP Page</title>
        <style>
            label{
                float: left;
                width: 120px;
                font-weight: bold;
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
        <div class="container">
            <form method="post" action="updateTrip"> 
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> Departure Time </span>
                    <input class="form-control" placeholder="New Departure Time" type="time" name="depTime" value="" required/> <br>
                </div><br>
                
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> Arrival Time </span>
                    <input class="form-control" placeholder="New Arrival Time" type="time" name="arrTime" value="" required/> <br>
                </div><br>
                
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> Date </span>
                    <input class="form-control" placeholder="Date" type="date" name="date" value="" required/> <br>
                </div><br>
                
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> Price </span>
                    <input class="form-control" placeholder="Price" type="text" name="price" value="" required/> <br>
                </div><br>
            
                <input style='display: none' type="text" id="tripNum" name="id" value='<%=request.getAttribute("tripNum") %>' />
                
                <input type="submit" class="btn btn-success" value="Update" />
        </form>
        </div>
        
    </body>
</html>
