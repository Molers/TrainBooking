<%-- 
    Document   : bookTrip
    Created on : Dec 27, 2016, 3:30:58 PM
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
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">TRAINTOPIA</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="tripsInfo.jsp">Trips</a></li>
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
            <form  method="post" action="bookTrip"> 
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> Number of seats </span>
                    <input class="form-control" type="text" placeholder="Number of seats" name="seats" required> <br>
                </div><br>
                <input style='display: none' type="text" name="price" value='<%=request.getParameter("price")%>' />
                <input style='display: none' type="text" name="tripNum" value='<%=request.getParameter("tripNum")%>' />
               <input type="submit" class="btn btn-success" value="Book" />
            </form>
        </div>                
                        
    </body>
</html>
