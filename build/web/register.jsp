

<%@page contentType="text/html" pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk">
        <title>Sign up</title>
        <script type="text/javascript" src="jquery-3.1.1.js"></script>
        <script type="text/javascript">
           $(document).ready(function(){
                $("#username").keyup(function (){
                    var uname = $("#username").val();
                    $("#username-Status").text("Searching");
                    if(uname !== ""){
                        $.get("validation", {userName:uname}, function(data){
                                $("#username-Status").text(data);
                        });
                    }
                    else
                        $("#username-Status").text("");
                });
                
            });
        </script>
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
                        
                        <li><a href="alogin.jsp">Login</a></li>
                        <li class="active"><a href="#">Sign Up</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <a class="navbar-brand" href="#">Admin</a>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <form  method="post" action="signup"> 
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> Name: </span>
                    <input class="form-control" type="text" placeholder="Enter Name" name="name" required> <br>
                </div><br>
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> Username: </span>
                    <input class="form-control" id="username" placeholder="Enter Username" type="text" name="userName" required> 
                </div> <span id="username-Status" ></span> <br>
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> Email: </span>
                    <input class="form-control" id="email" placeholder="Enter Email" type="text" name="email" required> 
                </div> <br>
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> Password: </span>
                    <input class="form-control" type="password" placeholder="Enter Password" name="password" required> <br>
                </div> <br>
                <input style='display: none' type="text" name="type" value='admin' />
               <input type="submit" class="btn btn-success" value="Sign up" />
            </form>
        </div>
    </body>
</html>
