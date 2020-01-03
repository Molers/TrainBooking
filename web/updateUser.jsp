

<%@page contentType="text/html" pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk">
        <title>修改用户信息</title>
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
                    <a class="navbar-brand" href="#">火车购票系统</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="profile.jsp">用户信息</a></li>
                        <li><a href="tripsInfo.jsp">旅程</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                                                <li> <a href="#"> 你好, ${sessionScope.user.name} </a></li>

                        <li><a href="logout">登出</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <form action="update" method="post" class="form-inline">
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> 用户名: </span>
                    <input class="form-control" placeholder="新用户名" type="text" name="userName" value="" required/> <br>
                </div> <span id="username-Status" ></span> <br><br>
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> 密码: </span>
                    <input class="form-control" placeholder="新密码" type="password" name="password" value="" required/> <br>
                </div><br><br>
                <input type="submit" class="btn btn-success" value="提交" />
            </form>    
        </div>            
    </body>
</html>
