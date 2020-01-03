<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="gbk"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk">
        <title>����Ա��½</title>
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
                    <a class="navbar-brand" href="#">�𳵹�Ʊϵͳ</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">����Ա��½</a></li>
                        <li><a href="register.jsp">����Աע��</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <a class="navbar-brand" href="login.jsp">�û���¼</a>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <form action="login" method="post">
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> �˺�: </span>
                    <input class="form-control" placeholder="�����û���" type="text" name="userName" value="" required/> <br>
                </div> <br>
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> ����: </span>
                    <input class="form-control" placeholder="��������" type="password" name="password" value="" required/> <br>
                </div>
                
                <input style='display: none' type="text" name="type" value='admin' /> 

                <h1>
                <%
                    if (null != request.getAttribute("errorMessage")) {
                        out.println(request.getAttribute("errorMessage"));
                    }
                %>
                </h1>
                <input type="submit" class="btn btn-success" value="��¼" />
            </form>
        </div>
           
    </body>
</html>
