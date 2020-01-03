
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
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">火车购票系统</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"> <a href="addTrain.jsp">增加车次</a></li>
                        <li> <a href="trainsInfo.jsp">车次</a></li>
                        <li ><a href="addTrip.jsp">添加旅程</a></li>
                        <li><a href="tripsInfo.jsp">旅程</a></li>
                        
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li> <a href="#"> 你好, ${sessionScope.admin.name} </a></li>

                        <li><a href="logout">登出</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div>
            
            <div class="container">
                <form action ="updateTrain" method="post" >
                    
                    <div class="input-group">
                        <span class="input-group-addon form-inline" id="basic-addon1"> 座位数 </span>
                        <input class="form-control" placeholder="座位数" name="numOfSeats" type="text" >
                    </div><br>
                    <input style='display: none' type="text" name="trainNum" value='<%=request.getAttribute("trainNum") %>' />
                    <input type="submit" class="btn btn-success" value="提交"  name = "Update Train">
                </form>
            </div>
        </div>
    </body>
</html>
