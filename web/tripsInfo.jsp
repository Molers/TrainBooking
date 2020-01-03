<%@page import="controll.AllTrips" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="gbk" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <title>�ó���Ϣ</title>
    <script type="text/javascript" src="jquery-3.1.1.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#delete").click(function () {

                alert($("#tripNum").val());
            });
        });


    </script>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
            margin: 0 auto;
        }

        th, td {
            padding: 8px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f5f5f5
        }


    </style>
    <link rel="stylesheet" href="style/bootstrap.min.css"/>
    <link rel="stylesheet" href="style/style.css"/>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <link rel="stylesheet" href="./css/theme10.min.css">
    <link rel="stylesheet" href="./css/theme10.min.css">
    <link rel="stylesheet" href="./lib/layui/css/layui.css">

    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>

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
                    <a href="newadminprofile.jsp">������Ϣ</a></dd>
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


<div class="page-content">
    <div class="layui-tab tab">
        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>������Ϣ
            </li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-card">
                <div class="layui-card-body">
                    <table class="layui-table">
                        <tr>
                            <%--                <th>�ó̺�</th>--%>
                            <th>�𳵳���</th>
                            <th>������</th>
                            <th>Ŀ�ĵ�</th>
                            <th>����ʱ��</th>
                            <th>����ʱ��</th>
                            <th>����</th>
                            <th>��λ</th>
                            <th>�۸�</th>
<%--                            <th>����</th>--%>
                            <th>�༭</th>
                            <th>ɾ��</th>
                            <th>����</th>

                        </tr>
                        <%
                            AllTrips tr = new AllTrips();
                            ArrayList<AllTrips> all = new ArrayList();
                            all = tr.showTrips();

                            for (int i = 0; i < all.size(); i++) {
                                String tripNum = all.get(i).getTripNum();
                        %>
                        <tr>
                            <td><%=all.get(i).getTripNum() %>
                            </td>
                            <%--                    <td> <%=all.get(i).getTrainNum() %> </td>--%>
                            <td><%=all.get(i).getSrc() %>
                            </td>
                            <td><%=all.get(i).getDest() %>
                            </td>
                            <td><%=all.get(i).getDepTime() %>
                            </td>
                            <td><%=all.get(i).getArrTime() %>
                            </td>
                            <td><%=all.get(i).getDate() %>
                            </td>

                            <td><%=all.get(i).getSeats() %>
                            </td>
                            <td><%=all.get(i).getPrice() %>
                            </td>
<%--                            <td><%=all.get(i).getdistance()%>--%>
<%--                            </td>--%>


                            <td>
                                <form action="editTrip" method="post">
                                    <input style='display: none' type="text" id="tripNum" name="id"
                                           value='<%=all.get(i).getTripNum() %>'/>
                                    <%--                            <input type="submit" value="�༭">--%>
                                    <button class="layui-btn"> �༭<i class="layui-icon">&#xe642;</i></button>
                                </form>
                            </td>

                            <td>
                                <form action="deleteTrip" method="post">
                                    <input style='display: none' type="text" id="tripNum" name="id"
                                           value='<%=all.get(i).getTripNum() %>'/>
                                    <%--                            <input type="submit" value="ɾ��">--%>
                                    <button class="layui-btn layui-btn-danger">ɾ�� <i class="layui-icon">&#xe640;</i></button>
                                </form>
                            </td>

                            <td>
                                <form action="detailed.jsp" method="post">
                                    <input style='display: none' type="text" id="tripNum" name="id"
                                           value='<%=all.get(i).getTripNum() %>'/>
                                    <%--                            <input type="submit" value="����">--%>
                                    <button class="layui-btn layui-btn-normal">����<i class="layui-icon">&#xe65f;</i></button>
                                </form>
                            </td>

                        </tr>
                        <%
                            }

                        %>

                    </table>
                    <br>
                    <form method="post" action="pull" class="layui-form">
                        <button  class="layui-btn layui-btn-fluid"> ����������Ϣ��EXCEL���<i  class="layui-icon">&#xe601;</i></button>
<%--                        <input type="submit" class="btn btn-success" value="����"/>--%>
                    </form>
                </div>
            </div>

        </div>
    </div>
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
