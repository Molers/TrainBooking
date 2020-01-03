<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>login</title>
        <meta charset="gbk">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                        <li class="active"><a href="#">Admin Login</a></li>
                        <li><a href="register.jsp">Sign Up</a></li>
                        <li><a href="login.jsp">User</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <form action="login" method="post">
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> Username: </span>
                    <input class="form-control" placeholder="Enter Username" type="text" name="userName" value="" required/> <br>
                </div> <br>
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> Password: </span>
                    <input class="form-control" placeholder="Enter Password" type="password" name="password" value="" required/> <br>
                </div>
                
                <input style='display: none' type="text" name="type" value='admin' /> 

                <h1>
                <%
                    if (null != request.getAttribute("errorMessage")) {
                        out.println(request.getAttribute("errorMessage"));
                    }
                %>
                </h1>
                <input type="submit" class="btn btn-success" value="login" />
            </form>
        </div>
           
    </body>
</html>
