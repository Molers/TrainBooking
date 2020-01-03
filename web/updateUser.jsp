

<%@page contentType="text/html" pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk">
        <title>�޸��û���Ϣ</title>
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
                    <a class="navbar-brand" href="#">�𳵹�Ʊϵͳ</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="profile.jsp">�û���Ϣ</a></li>
                        <li><a href="tripsInfo.jsp">�ó�</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                                                <li> <a href="#"> ���, ${sessionScope.user.name} </a></li>

                        <li><a href="logout">�ǳ�</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <form action="update" method="post" class="form-inline">
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> �û���: </span>
                    <input class="form-control" placeholder="���û���" type="text" name="userName" value="" required/> <br>
                </div> <span id="username-Status" ></span> <br><br>
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> ����: </span>
                    <input class="form-control" placeholder="������" type="password" name="password" value="" required/> <br>
                </div><br><br>
                <input type="submit" class="btn btn-success" value="�ύ" />
            </form>    
        </div>            
    </body>
</html>
