

<%@page contentType="text/html" pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk">
        <title>��������</title>
        <script type="text/javascript">
            function checkForm(form) {

            <%--  Train Number --%>

                var z = document.forms["Add_train_form"]["trainNumber"].value;
                if (!z.match(/^\d+/))
                {
                    alert("Please only enter numeric characters only for the trainNumber ! (Allowed input:0-9)");
                    form.enginenumber.focus();
                    return false;
                }
            <%--  Train Number --%>

                var z = document.forms["Add_train_form"]["numOfSeats"].value;
                if (!z.match(/^\d+/))
                {
                    alert("Please only enter numeric characters only for the numOfSeats ! (Allowed input:0-9)");
                    form.enginenumber.focus();
                    return false;
                }

            }
        </script>
        <link rel="stylesheet" href="style/bootstrap.min.css" />
        <link rel="stylesheet" href="style/style.css" />
        <link rel="stylesheet" href="style/bootstrap.min.css" />
        <link rel="stylesheet" href="style/style.css" />
        <link rel="stylesheet" href="./css/font.css">
        <link rel="stylesheet" href="./css/xadmin.css">
        <link rel="stylesheet" href="./css/theme10.min.css">
        <script src="./lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="./js/xadmin.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <!-- ������ʼ -->
        <div class="container">
        <div class="logo">
            <a href="./index.html">�𳵹�Ʊϵͳ</a></div>
        <div class="left_open">
            <a><i title="չ�������" class="iconfont">&#xe699;</i></a>
        </div>

        <ul class="layui-nav right" lay-filter="">
            <li class="layui-nav-item">
                <a href="javascript:;"> ${sessionScope.user.name}</a>
                <dl class="layui-nav-child">
                    <!-- �����˵� -->
                    <dd>
                        <a  href="newprofile.jsp">������Ϣ</a></dd>
<%--                    <dd>--%>
<%--                        <a onclick="xadmin.open('�л��ʺ�','http://www.baidu.com')">�л��ʺ�</a></dd>--%>
                    <dd>
                        <a href="logout">�˳�</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item to-index">
                <a href="newlogin.jsp">ǰ̨��ҳ</a></li>
        </ul>
    </div>
        <!-- �������� -->

        <!-- ���˵���ʼ -->
        <div class="left-nav">
            <div id="side-nav">
                <ul id="nav">
                    <li>
                        <a href="addTrip.jsp">
                            <i class="iconfont left-nav-li" lay-tips="��Ա����">&#xe6b8;</i>
                            <cite>��������</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                    </li>

                    <li>
                        <a href="tripsInfo.jsp">
                            <i class="iconfont left-nav-li" lay-tips="��Ա����">&#xe6b8;</i>
                            <cite>������Ϣ</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                    </li>

                    <li>
                        <a href="addStation.jsp">
                            <i class="iconfont left-nav-li" lay-tips="��������">&#xe723;</i>
                            <cite>����վ��</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- ���˵����� -->

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
                        <li>  ${sessionScope.admin.userName} </a></li>

                        <li><a href="logout">�ǳ�</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div>

            <h1>
            <%
                if (null != request.getAttribute("errorMessage")) {
                    out.println(request.getAttribute("errorMessage"));
                }
            %>
            </h1>
            <h2>${message}</h2>
            <div class="container">
                <form action ="addTrain" name = "Add_train_form" onsubmit="return checkForm(this);" method="post" >
                    
                    <div class="input-group">
                        <span class="input-group-addon form-inline" id="basic-addon1"> �𳵳��� </span>
                        <input class="form-control" name="trainNumber" type="text" > 
                    </div><br>
                    
                    <div class="input-group">
                        <span class="input-group-addon form-inline" id="basic-addon1">��λ </span>
                        <input class="form-control" name="numOfSeats" type="text" > 
                    </div><br>

                    <input type="submit" class="btn btn-success" value="�ύ"  name = "ADD Train">
                </form>
            </div>
        </div>
    </body>
</html>
