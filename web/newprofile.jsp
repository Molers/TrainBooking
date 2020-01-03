
<%@page contentType="text/html" pageEncoding="gbk"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<%--    ��������--%>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <title>�û���Ϣ</title>


    <link rel="stylesheet" href="style/bootstrap.min.css" />
    <link rel="stylesheet" href="style/style.css" />
    <link rel="stylesheet" href="./lib/layui/css/layui.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <link rel="stylesheet" href="./css/theme10.min.css">
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>


    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
<%--    Head���ƽ���--%>
</head>

<body class="index">
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
                <dd>
                    <a href="newlogin.jsp">�˳�</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index">
            <a href="newlogin.jsp">ǰ̨��ҳ</a></li>
    </ul>
</div>
<!-- �������� -->

<!-- �в���ʼ -->
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

<!-- �Ҳ����忪ʼ -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
<%--        ���������--%>
        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>������Ϣ</li>
        </ul>

        <div class="layui-tab-content">

            <div class="layui-card-body layui-table-body layui-table-main">
                <br>
                <table class="layui-table layui-form">
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                    <th>����</th>--%>
<%--                    <th>�û���</th>--%>
<%--                    <th>��������</th>--%>
<%--                    </thead>--%>


<%--                    <tbody>--%>
<%--                    <tr>--%>
<%--                        <td>1</td>--%>
<%--                        <td>С��</td>--%>
<%--                        <td>��</td>--%>
<%--                    </tbody>--%>
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
            </div>
<%--            <div class="layui-container" style="width:1600px">--%>
                <form action="updateUser.jsp" class="layui-form">
                    <input type="submit" class="layui-btn "  style="margin-left:1550px;margin-right: 200px;" value="�޸�" />
                </form>
<%--            </div>--%>




        </div>
    </div>
</div>
<div class="page-content-bg"></div>
<style id="theme_style"></style>
<!-- �Ҳ�������� -->

<%--<nav class="navbar navbar-inverse">--%>
<%--    <div class="container-fluid">--%>
<%--        <div class="navbar-header">--%>
<%--            <a class="navbar-brand" href="#">�𳵹�Ʊϵͳ</a>--%>
<%--        </div>--%>
<%--        <div class="collapse navbar-collapse" id="myNavbar">--%>
<%--            <ul class="nav navbar-nav">--%>

<%--                <li><a href="allTrips.jsp">�ó̲�ѯ</a></li>--%>
<%--                <li><a href="allBookings.jsp">��Ʊ</a></li>--%>
<%--            </ul>--%>
<%--            <ul class="nav navbar-nav navbar-right">--%>
<%--                <li> <a href="#">  ${sessionScope.user.name} </a></li>--%>
<%--                <li class="active"> <a href="#">�û���Ϣ</a></li>--%>
<%--                <li><a href="logout">�ǳ�</a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</nav>--%>

<%--<div class="container">--%>
<%--    <div class="row">--%>
<%--        <div class="col col-md-12">--%>
<%--            <h3>--%>
<%--                �û���Ϣ:--%>
<%--            </h3>--%>
<%--            <div class="container">--%>
<%--                <table class="table">--%>
<%--                    <tbody>--%>
<%--                    <tr>--%>
<%--                        <td><b>����:</b></td>--%>
<%--                        <td>111</td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td><b>�û���:</b></td>--%>
<%--                        <td>11111</td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td><b>��������:</b></td>--%>
<%--                        <td>2222</td>--%>
<%--                    </tr>--%>
<%--                    </tbody>--%>
<%--                </table>--%>
<%--                <form action="updateUser.jsp">--%>
<%--                    <input type="submit" class="btn btn-primary" value="�޸�" />--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

</body>
</html>
