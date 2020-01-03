
<%@page contentType="text/html" pageEncoding="gbk"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk">
        <title>�û���Ϣ</title>
        <link rel="stylesheet" href="style/bootstrap.min.css" />
        <link rel="stylesheet" href="style/style.css" />
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">�𳵹�Ʊϵͳ</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        
                        <li><a href="allTrips.jsp">�ó̲�ѯ</a></li>
                        <li><a href="allBookings.jsp">��Ʊ</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li> <a href="#">  ${sessionScope.user.name} </a></li>
                        <li class="active"> <a href="#">�û���Ϣ</a></li>
                        <li><a href="logout">�ǳ�</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="row">
                <div class="col col-md-12">
                    <h3>
                        �û���Ϣ:
                    </h3>
                    <div class="container">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td><b>����:</b></td>
                                    <td>${sessionScope.user.name}</td>
                                </tr>
                                <tr>
                                    <td><b>�û���:</b></td>
                                    <td>${sessionScope.user.userName}</td>
                                </tr>
                                <tr>
                                    <td><b>��������:</b></td>
                                    <td>${sessionScope.user.email}</td>
                                </tr>
                            </tbody>
                        </table>
                        <form action="updateUser.jsp">
                            <input type="submit" class="btn btn-primary" value="�޸�" />
                        </form>
                    </div>
                </div>
            </div>
        
        
        
    </body>
</html>
