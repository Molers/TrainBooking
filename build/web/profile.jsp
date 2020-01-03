

<%@page contentType="text/html" pageEncoding="gbk"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk">
        <title>Profile</title>
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
                        
                        <li><a href="allTrips.jsp">Trips</a></li>
                        <li><a href="allBookings.jsp">Bookings</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li> <a href="#"> Hi, ${sessionScope.user.name} </a></li>
                        <li class="active"> <a href="#">Profile</a></li>
                        <li><a href="logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="row">
                <div class="col col-md-12">
                    <h3>
                        User Data:
                    </h3>
                    <div class="container">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td><b>Name:</b></td>
                                    <td>${sessionScope.user.name}</td>
                                </tr>
                                <tr>
                                    <td><b>Username:</b></td>
                                    <td>${sessionScope.user.userName}</td>
                                </tr>
                                <tr>
                                    <td><b>Email:</b></td>
                                    <td>${sessionScope.user.email}</td>
                                </tr>
                            </tbody>
                        </table>
                        <form action="updateUser.jsp">
                            <input type="submit" class="btn btn-primary" value="update" />
                        </form>
                    </div>
                </div>
            </div>
        
        
        
    </body>
</html>
