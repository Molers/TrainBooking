<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="gbk"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk">
        <title>管理员登陆</title>
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
                    <a class="navbar-brand" href="#">火车购票系统</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">管理员登陆</a></li>
                        <li><a href="register.jsp">管理员注册</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <a class="navbar-brand" href="login.jsp">用户登录</a>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <form action="login" method="post">
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> 账号: </span>
                    <input class="form-control" placeholder="输入用户名" type="text" name="userName" value="" required/> <br>
                </div> <br>
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> 密码: </span>
                    <input class="form-control" placeholder="输入密码" type="password" name="password" value="" required/> <br>
                </div>
                
                <input style='display: none' type="text" name="type" value='admin' /> 

                <h1>
                <%
                    if (null != request.getAttribute("errorMessage")) {
                        out.println(request.getAttribute("errorMessage"));
                    }
                %>
                </h1>
                <input type="submit" class="btn btn-success" value="登录" />
            </form>
        </div>
           
    </body>
</html>
