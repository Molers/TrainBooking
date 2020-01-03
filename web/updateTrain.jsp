
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
                    <a class="navbar-brand" href="#">�𳵹�Ʊϵͳ</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"> <a href="addTrain.jsp">���ӳ���</a></li>
                        <li> <a href="trainsInfo.jsp">����</a></li>
                        <li ><a href="addTrip.jsp">����ó�</a></li>
                        <li><a href="tripsInfo.jsp">�ó�</a></li>
                        
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li> <a href="#"> ���, ${sessionScope.admin.name} </a></li>

                        <li><a href="logout">�ǳ�</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div>
            
            <div class="container">
                <form action ="updateTrain" method="post" >
                    
                    <div class="input-group">
                        <span class="input-group-addon form-inline" id="basic-addon1"> ��λ�� </span>
                        <input class="form-control" placeholder="��λ��" name="numOfSeats" type="text" >
                    </div><br>
                    <input style='display: none' type="text" name="trainNum" value='<%=request.getAttribute("trainNum") %>' />
                    <input type="submit" class="btn btn-success" value="�ύ"  name = "Update Train">
                </form>
            </div>
        </div>
    </body>
</html>
