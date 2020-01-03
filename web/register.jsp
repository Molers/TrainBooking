
<%@page contentType="text/html" pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk">
        <title>����Աע��</title>
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
                        
                        <li><a href="alogin.jsp">��¼</a></li>
                        <li class="active"><a href="#">ע��</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <a class="navbar-brand" href="#">����Աע��</a>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <form  method="post" action="signup"> 
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> ����: </span>
                    <input class="form-control" type="text" placeholder="��������" name="name" required> <br>
                </div><br>
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> �˺�: </span>
                    <input class="form-control" id="username" placeholder="�����û���" type="text" name="userName" required>
                </div> <span id="username-Status" ></span> <br>
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> ����: </span>
                    <input class="form-control" id="email" placeholder="��������" type="text" name="email" required>
                </div> <br>
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> ����: </span>
                    <input class="form-control" type="password" placeholder="��������" name="password" required> <br>
                </div> <br>
                <div class="input-group">
                    <span class="input-group-addon form-inline" id="basic-addon1"> �ڲ���: </span>
                    <input class="form-control" placeholder="������" type="text" name="Checkcode" required>
                </div> <br>
                <input style='display: none' type="text" name="type" value='admin' />
                <h1>
                    <%
                        if (null != request.getAttribute("CheckcodeMessage")) {
                            out.println(request.getAttribute("CheckcodeMessage"));
                        }
                    %>
                </h1>
               <input type="submit" class="btn btn-success" value="ע��" />
            </form>
        </div>
    </body>
</html>
