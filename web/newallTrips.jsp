<%@ page import="controll.AllTrips" %>
<%@ page import="java.util.ArrayList" %>

<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <title>�û���Ϣ</title>

    <link rel="stylesheet" href="style/bootstrap.min.css"/>
    <link rel="stylesheet" href="style/style.css"/>
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <link rel="stylesheet" href="./css/theme10.min.css">
    <link rel="stylesheet" href="./lib/layui/css/layui.css">
    <script src="./lib/layui/layui.js" charset="GBK"></script>

    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script src="js/jquery.min.js"></script>

    <script src="js/bootstrap.min.js"></script>
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
                    <a href="newprofile.jsp">������Ϣ</a></dd>
                <%--                <dd>--%>
                <%--                    <a onclick="xadmin.open('�л��ʺ�','http://www.baidu.com')">�л��ʺ�</a></dd>--%>
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
    <div class="layui-tab tab">
        <%--        ���������--%>
        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>������Ϣ
            </li>
        </ul>
        <%--        ���������--%>

        <%--        ���������--%>
        <div class="layui-tab-content">

            <div class="layui-card-body ">
                <%--                                        ��ѯ��ʽ��ѡ��--%>
                <div class="layui-container">

                    <div class="layui-input-block">

                        <div class="layui-container">
                            <br>
                            <form action="SimpleSearch.jsp" method="post" class="layui-form">


                                <div class="layui-input-inline">
                                    <select class="layui-select" name="searchType" lay-verify="">
                                        <option value="Ŀ�ĵ�">Ŀ�ĵ�</option>
                                        <option value="������">������</option>
                                        <option value="����">�𳵳���</option>
                                        <%--                                                        <option value="TripNumber">�ó̺�</option>--%>

                                    </select>
                                </div>

                                <div class="layui-input-inline">
                                    <input  placeholder="���� " class="layui-input" type="text" name="destination" value=""
                                           required/>
                                </div>

                                <%--                                                    <input type="submit" class="btn btn-success" value="����" />&emsp;--%>

                                <div class="layui-input-inline">
                                    <button class="layui-btn">���� <i class="layui-icon">&#xe615;</i></button>
                                </div>

                            </form>
                            <br>
                            <div class="layui-form-item">
                                <div class="layui-input-inline">
                                    <form action="shortpath.jsp" method="post">

                                        <%--                                                    <input type="submit" class="btn btn-success" value="����  " />--%>
                                        <button class="layui-btn">����<i class="layui-icon">&#xe65f;</i></button>

                                    </form>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
                <br>
                <%

                    AllTrips tr = new AllTrips();
                    ArrayList<AllTrips> all = new ArrayList();
                    all = tr.showTrips();
                    if (all.size() == 0) {
                %>
                <h1>�ó̲�����</h1>
                <%
                } else {
                %>

                <table class="layui-table ">
                    <tr>
                        <%--                            <th>�ó̺�</th>--%>
                        <th>�𳵳���</th>
                        <th>������</th>
                        <th>Ŀ�ĵ�</th>
                        <th>����ʱ��</th>
                        <th>����ʱ��</th>
                        <th>����</th>
                        <th>ʣ����λ</th>
                        <th>�۸�</th>
<%--                        <th>����</th>--%>
                        <th>Ԥ��</th>
                        <th>����</th>
                    </tr>

                    <%
                        for (int i = 0; i < all.size(); i++) {
                            String tripNum = all.get(i).getTripNum();
                    %>

                    <tr>
                        <td><%=all.get(i).getTripNum()%>
                        </td>
                        <%--                            <td> <%=all.get(i).getTrainNum()%> </td>--%>
                        <td><%=all.get(i).getSrc()%>
                        </td>
                        <td><%=all.get(i).getDest()%>
                        </td>
                        <td><%=all.get(i).getDepTime()%>
                        </td>
                        <td><%=all.get(i).getArrTime()%>
                        </td>
                        <td><%=all.get(i).getDate()%>
                        </td>
                        <td><%=all.get(i).getSeats()%>
                        </td>

                        <td><%=all.get(i).getPrice()%>
                        </td>
<%--                        <td><%=all.get(i).getdistance()%>--%>
<%--                        </td>--%>


                        <td>
                            <form action="bookTrip.jsp" method="post">
                                <input style='display: none' type="text" name="tripNum"
                                       value='<%=all.get(i).getTripNum()%>'/>
                                <input style='display: none' type="text" name="price"
                                       value='<%=all.get(i).getPrice()%>'/>
                                <%--                                    <input type="submit" value="����">--%>
                                <button class="layui-btn">����</button>
                            </form>
                        </td>

                        <td>
                            <form action="userdetailed.jsp" method="post">
                                <input style='display: none' type="text" name="tripNum"
                                       value='<%=all.get(i).getTripNum()%>'/>
                                <input style='display: none' type="text" name="price"
                                       value='<%=all.get(i).getPrice()%>'/>
                                <%--                                    <input type="submit" value="����">--%>
                                <button class="layui-btn">����</button>
                            </form>
                        </td>

                    </tr>
                    <%
                            }
                        }
                    %>
                    <h1>
                        <%
                            if (null != request.getAttribute("bookMessage")) {
                                out.println(request.getAttribute("bookMessage"));
                            }
                        %>
                    </h1>
                </table>


            </div>
        </div>
    </div>
    <div class="page-content-bg"></div>
    <style id="theme_style"></style>
    <!-- �Ҳ�������� -->
</div>
<script>
    //һ��ֱ��д��һ��js�ļ���
    layui.use(['layer', 'form', 'select'], function () {
        var layer = layui.layer
            , form = layui.form
            , select = layui.select;

        render(select);
        render(input);

    });
</script>
</body>

</html>
