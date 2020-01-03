
<%@page contentType="text/html" pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gbk">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style/bootstrap.min.css" />
        <link rel="stylesheet" href="style/style.css" />
        <link rel="stylesheet" href="style/bootstrap.min.css" />
        <link rel="stylesheet" href="style/style.css" />
        <link rel="stylesheet" href="./css/font.css">
        <link rel="stylesheet" href="./css/xadmin.css">
        <link rel="stylesheet" href="./css/theme10.min.css">
        <link rel="stylesheet" href="./lib/layui/css/layui.css">
        <script src="./lib/layui/layui.js" charset="utf-8"></script>

        <script type="text/javascript" src="./js/xadmin.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
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
                    <a href="newallTrips.jsp">
                        <i class="iconfont left-nav-li" lay-tips="��Ա����">&#xe6b8;</i>
                        <cite>�ó̲�ѯ</cite>
                        <i class="iconfont nav_right">&#xe697;</i></a>
                </li>
                <li>
                    <a href="allBookings.jsp">
                        <i class="iconfont left-nav-li" lay-tips="��������">&#xe723;</i>
                        <cite>��Ʊ</cite>
                        <i class="iconfont nav_right">&#xe697;</i></a>
                </li>
            </ul>
        </div>
    </div>
    <!-- ���˵����� -->
    <div class="page-content">

        <div class="layui-tab tab" >
            <ul class="layui-tab-title">
                <li class="home">
                    <i class="layui-icon">&#xe68e;</i>��Ʊ����</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-container">
            <form  method="post" action="bookTrip" class="layui-form layui-form-pane">
                <div class="layui-form-item">
                    <label class="layui-form-label">����</label>
<%--                    <span class="input-group-addon form-inline" id="basic-addon1"> ���� </span>--%>
                    <div class="layui-input-block">
                    <input class="layui-input" type="text" placeholder="����" name="seats" required> <br>
                    </div>
                    </div>
                <input style='display: none' type="text" name="price" value='<%=request.getParameter("price")%>' />
                <input style='display: none' type="text" name="tripNum" value='<%=request.getParameter("tripNum")%>' />
<%--               <input type="submit" class="btn btn-success" value="�ύ" />--%>
                <button class="layui-btn">�ύ</button>
            </form>
        </div>                
            </div>
            </div></div>
    </body>
</html>
