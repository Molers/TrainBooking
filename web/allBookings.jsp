
<%@page import="controll.userData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controll.Train"%>
<%@page import="controll.booking"%>
<%@page contentType="text/html" pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=gbk">
        <title>���ж���</title>
        <link rel="stylesheet" href="style/bootstrap.min.css" />
        <link rel="stylesheet" href="style/style.css" />
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <link rel="stylesheet" href="style/bootstrap.min.css" />
        <link rel="stylesheet" href="style/style.css" />
        <link rel="stylesheet" href="./css/font.css">
        <link rel="stylesheet" href="./css/xadmin.css">
        <link rel="stylesheet" href="./css/theme10.min.css">
        <script src="./lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="./js/xadmin.js"></script>

        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            tr:hover{background-color:#f5f5f5}
        </style>

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
                        <a href="newlogin.jsp">�˳�</a></dd>
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

    <!-- �Ҳ����忪ʼ -->
    <div class="page-content">

        <div class="layui-tab tab" >
            <%--        ���������--%>
                <ul class="layui-tab-title">
                    <li class="home">
                        <i class="layui-icon">&#xe68e;</i>��Ʊ����</li>
                </ul>
            <%--        ���������--%>
                <div class="layui-tab-content">
                    <div class="layui-container" >
                    <%--��������ݱ��--%>
                <%
                    booking tr = new booking();
                    ArrayList<booking> all = new ArrayList();
                    userData u =(userData) session.getAttribute("user");
                    System.out.println("yanggang..........."+u.getID());
                    all = tr.showBookigs(u.getuserName());

                    if(all.size() == 0){
                %>
                        <script>
                            alert("���޶���");
                        </script>
                <%}
                else{
                %>
                <table class="layui-table">
                    <tr>
                        <th>����</th>
                        <th>���� </th>
                        <th>�۸� </th>
                        <th>�˶�</th>
                        <th>����</th>
                    </tr>
                    <%
                        for(int i=0; i<all.size(); i++){
                    %>
                    <tr>
                        <td> <%=all.get(i).getTripId() %> </td>
                        <td> <%=all.get(i).getSeats() %> </td>
                        <td> <%=all.get(i).getCharge() %> </td>
                        <td>
                            <form action="cancelBooking" method="post">
                                <input style='display: none' type="text" name="bookID" value='<%=all.get(i).getBookID() %>' />
<%--                                <input type="submit" value="�˶�">--%>
                                <button class="layui-btn layui-btn-danger" >�˶�</button>
                                <input style='display: none' type="text" name="tripID" value='<%=all.get(i).getTripId() %>' />
                                <input style='display: none' type="text" name="seats" value='<%=all.get(i).getSeats() %>' />
                            </form>

                        <td>
                            <form action="userdetailed.jsp" method="post">
                                <input style='display: none' type="text" id="tripNum" name="tripNum" value='<%=all.get(i).getTripId() %>' />
                                <%--                            <input type="submit" value="����">--%>
                                <button class="layui-btn">����</button>
                            </form>
                        </td>

                        </td>

                    </tr>
                    <%
                            }
                        }
                    %>

                </table>
                <%--��������ݱ�����--%>
                    </div>
                </div>
        </div>
            <%--����������--%>
    </div>


    </body>
    <%
        if (null != request.getAttribute("message")) {

    %>
    <script>
        alert("<%=(String) request.getAttribute("message")%>");
    </script>
    <%
        }
    %>
</html>
