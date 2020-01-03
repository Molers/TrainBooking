
<%@page contentType="text/html" pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk">
        <title>管理员注册</title>
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
                        
                        <li><a href="alogin.jsp">登录</a></li>
                        <li class="active"><a href="#">注册</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <a class="navbar-brand" href="#">管理员注册</a>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <form  method="post" action="signup"> 
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> 姓名: </span>
                    <input class="form-control" type="text" placeholder="输入姓名" name="name" required> <br>
                </div><br>
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> 账号: </span>
                    <input class="form-control" id="username" placeholder="输入用户名" type="text" name="userName" required>
                </div> <span id="username-Status" ></span> <br>
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> 邮箱: </span>
                    <input class="form-control" id="email" placeholder="输入邮箱" type="text" name="email" required>
                </div> <br>
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> 密码: </span>
                    <input class="form-control" type="password" placeholder="输入密码" name="password" required> <br>
                </div> <br>
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> 内部码: </span>
                    <input class="form-control" placeholder="邀请码" type="text" name="Checkcode" required>
                </div> <br>
                <input style='display: none' type="text" name="type" value='admin' />
                <h1>
                    <%
                        if (null != request.getAttribute("CheckcodeMessage")) {
                            out.println(request.getAttribute("CheckcodeMessage"));
                        }
                    %>
                </h1>
               <input type="submit" class="btn btn-success" value="注册" />
            </form>
        </div>
    </body>
</html>
