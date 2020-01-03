
<%@page contentType="text/html" pageEncoding="gbk"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk">
        <title>用户信息</title>
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
                        
                        <li><a href="allTrips.jsp">旅程查询</a></li>
                        <li><a href="allBookings.jsp">订票</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li> <a href="#">  ${sessionScope.user.name} </a></li>
                        <li class="active"> <a href="#">用户信息</a></li>
                        <li><a href="logout">登出</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="row">
                <div class="col col-md-12">
                    <h3>
                        用户信息:
                    </h3>
                    <div class="container">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td><b>姓名:</b></td>
                                    <td>${sessionScope.user.name}</td>
                                </tr>
                                <tr>
                                    <td><b>用户名:</b></td>
                                    <td>${sessionScope.user.userName}</td>
                                </tr>
                                <tr>
                                    <td><b>电子邮箱:</b></td>
                                    <td>${sessionScope.user.email}</td>
                                </tr>
                            </tbody>
                        </table>
                        <form action="updateUser.jsp">
                            <input type="submit" class="btn btn-primary" value="修改" />
                        </form>
                    </div>
                </div>
            </div>
        
        
        
    </body>
</html>
