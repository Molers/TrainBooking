<%@page contentType="text/html" pageEncoding="gbk" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <title>JSP Page</title>

    <style>
        /*label{*/
        /*    float: left;*/
        /*    width: 120px;*/
        /*    font-weight: bold;*/
        /*}*/
    </style>
    <link rel="stylesheet" href="style/bootstrap.min.css"/>
    <link rel="stylesheet" href="style/style.css"/>
    <script src="js/jquery.min.js"></script>
    <link rel="stylesheet" href="style/bootstrap.min.css"/>

    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <link rel="stylesheet" href="./css/theme10.min.css">
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script src="./lib/layui/layui.js" charset="utf-8"></script>

    <link rel="stylesheet" href="style/style.css"/>
    <script src="js/jquery.min.js"></script>

</head>
<body>

<!-- ������ʼ -->
<div class="container">
    <div class="logo">
        <a href="./index.html">�𳵹�Ʊϵͳ</a></div>
    <div class="left_open">
        <a><i title="չ�������" class="iconfont">&#xe699;</i></a>
    </div>

    <ul class="layui-nav right">
        <li class="layui-nav-item">
            <a href="javascript:;"> ${sessionScope.user.name}</a>
            <dl class="layui-nav-child">
                <!-- �����˵� -->
                <dd>
                    <a href="newprofile.jsp">������Ϣ</a></dd>

                <dd>
                    <a href=newlogin.jsp">�˳�</a></dd>
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
                    <i class="iconfont left-nav-li">&#xe6b8;</i>
                    <cite>��������</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
            </li>

            <li>
                <a href="tripsInfo.jsp">
                    <i class="iconfont left-nav-li">&#xe6b8;</i>
                    <cite>������Ϣ</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
            </li>

            <li>
                <a href="addStation.jsp">
                    <i class="iconfont left-nav-li">&#xe723;</i>
                    <cite>����վ��</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
            </li>
        </ul>
    </div>
</div>
<!-- ���˵����� -->
<div class="page-content">

    <div class="layui-tab tab">
        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>�༭<%=request.getAttribute("tripNum") %>������Ϣ
            </li>
        </ul>
        <div class="layui-tab-content">
            <%--                <div class="layui-card-body layui-table-body layui-table-main">--%>

                <div class="layui-card-body layui-table-body layui-table-main">
                <form method="post" action="updateTrip" class="layui-form layui-form-pane">
<%--                    <div class="input-group">--%>
<%--                        <span class="input-group-addon form-inline"> ����ʱ�� </span>--%>
<%--                        <input class="form-control" placeholder="" type="time" name="depTime" value=""--%>
<%--                               required/> <br>--%>
<%--                    </div>--%>

                    <div class="layui-form-item">
                        <label class="layui-form-label">����ʱ��</label>
                        <div class="layui-input-block">
                            <input class="layui-input" placeholder="���������ʱ��" type="time" name="depTime" value=""
                                   required/>
                        </div>

                    </div>


<%--                    <div class="input-group">--%>
<%--                        <span class="input-group-addon form-inline" id="basic-addon1"> ����ʱ�� </span>--%>
<%--                        <input class="form-control" placeholder="" type="time" name="arrTime" value=""--%>
<%--                               required/> <br>--%>
<%--                    </div>--%>
<%--                    <br>--%>
    <div class="layui-form-item">
        <label class="layui-form-label">����ʱ��</label>
        <div class="layui-input-block">
            <input class="layui-input" placeholder="�����뵽��ʱ��" type="time" name="arrTime" value=""
                   required/>
        </div>

    </div>


<%--                    <div class="input-group">--%>
<%--                        <span class="input-group-addon form-inline" id="basic-addon1"> ��ʱ </span>--%>
<%--                        <input class="form-control" placeholder="��ʱ(Сʱ)" type="text" name="totaltime"--%>
<%--                               onkeyup="value=value.replace(/[^\d.]/g,'') "--%>
<%--                               onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"--%>
<%--                               value="" required/> <br>--%>
<%--                    </div>--%>
<%--                    <br>--%>
    <div class="layui-form-item">
        <label class="layui-form-label">��ʱ</label>
        <div class="layui-input-block">
            <input class="layui-input" placeholder="��ʱ(Сʱ)" type="text" name="totaltime" value=""
                   required/>
        </div>

    </div>

<%--                    <div class="layui-form-item">--%>
<%--                        <label class="layui-form-label">��λ</label>--%>
<%--                        &lt;%&ndash;                        <span class="layui-input-inline">��λ</span>&ndash;%&gt;--%>
<%--                        <div class="layui-input-block">--%>
<%--                            <input type="text" name="seats" placeholder="��������λ" class="layui-input">--%>
<%--                        </div>--%>
<%--                    </div>--%>
    <div class="layui-form-item">
        <label class="layui-form-label">��λ</label>
        <div class="layui-input-block">
            <input class="layui-input" placeholder="��������λ��" type="text" name="seats" value=""
                   required/>
        </div>

    </div>


<%--                    <div class="input-group">--%>
<%--                        <span class="input-group-addon form-inline" id="basic-addon1"> �۸� </span>--%>
<%--                        <input class="form-control" placeholder="�۸�" type="text" name="price" value="" required/> <br>--%>
<%--                    </div>--%>
<%--                    <br>--%>
    <div class="layui-form-item">
        <label class="layui-form-label">�۸�</label>
        <div class="layui-input-block">
            <input class="layui-input" placeholder="������۸�" type="text" name="price" value=""
                   required/>
        </div>

    </div>

<%--                    <div class="layui-form-item">--%>
<%--                        <label class="layui-form-label">����</label>--%>
<%--                        <div class="layui-input-block">--%>
<%--                            <input type="date" name="date" class="layui-input" value="" required/>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="input-group">--%>
<%--                        <span class="input-group-addon form-inline" id="basic-addon1">  ����</span>--%>
<%--                        <input class="form-control" placeholder="" type="date" name="date" value="" required/> <br>--%>
<%--                    </div>--%>
    <div class="layui-form-item">
        <label class="layui-form-label">����</label>
        <div class="layui-input-block">
            <input class="layui-input" placeholder="����������" type="date" name="date" value=""
                   required/>
        </div><br>

    </div>

                    <input style='display: none' type="text" id="tripNum" name="id"
                           value='<%=request.getAttribute("tripNum") %>'/>

                    <%--                <input type="submit" class="btn btn-success" value="�ύ" />--%>
                    <button class="layui-btn" style="float:left">�ύ</button>
                </form>
            </div>
            <%--                </div>--%>
        </div>
    </div>

</div>

<div class="page-content-bg"></div>
<style id="theme_style"></style>

</body>
</html>
