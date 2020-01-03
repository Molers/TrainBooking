<%@page import="controll.AllTrips" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="gbk" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <title>���·��</title>

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

        tr:hover {
            background-color: #f5f5f5
        }

        .input-group {
            width: 250px
        }


    </style>
    <link rel="stylesheet" href="style/bootstrap.min.css"/>
    <link rel="stylesheet" href="style/style.css"/>
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="style/bootstrap.min.css"/>
    <link rel="stylesheet" href="style/style.css"/>
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <link rel="stylesheet" href="./css/theme10.min.css">
    <link rel="stylesheet" href="./lib/layui/css/layui.css">
    <script src="./lib/layui/layui.js" charset="utf-8"></script>

    <script type="text/javascript" src="./js/xadmin.js"></script>
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
<div class="page-content">
    <div class="layui-tab tab">

        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>���β�ѯ
            </li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-container">

                <form action="search.jsp" method="post" class="layui-form">

                    <div class="layui-form layui-form-pane">
                        <br>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">����</label>
                                <div class="layui-input-inline">
                                    <input class="layui-input" id="test1" placeholder="��������" type="text" name="date"
                                           autocomplete="off"/>
                                </div>
                            </div>


                            <div class="layui-input-inline">
                                <label class="layui-form-label" >������</label>
                                <div class="layui-input-block">
                                    <input class="layui-input" placeholder="������" type="text" name="source" value=""
                                           required/>
                                </div>
                            </div>

                            <div class="layui-input-inline">
                                <label class="layui-form-label">Ŀ�ĵ�</label>
                                <div class="layui-input-block">
                                    <input class="layui-input" placeholder="Ŀ�ĵ�" type="text" name="destination"
                                           value=""
                                           required/>
                                </div>
                            </div>


                            <div class="layui-input-inline">
                                <select class="layui-select" name="shorttype">
                                    <option value="ֱ��">ֱ�﷽��</option>
                                    <option value="����">���˷���</option>
                                    <option value="���">���絽��</option>
                                </select>
                            </div>

                            <div class="layui-input-inline">
                                <button class="layui-btn"> ����<i class="layui-icon">&#xe615;</i></button>
                            </div>
                            <input style='display: none' type="text" name="searchType" value='shortpath'/>
                        </div>
                    </div>
                </form>
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
            <table class="layui-table">
                <tr>
                    <%--        <th>�ó̺�</th>--%>
                    <th>�𳵳���</th>
                    <th>������</th>
                    <th>Ŀ�ĵ�</th>
                    <th>����ʱ��</th>
                    <th>����ʱ��</th>
                    <th>����</th>
                    <th>ʣ����λ</th>
                    <th>�۸�</th>
<%--                    <th>����</th>--%>
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
                    <%--        <td> <%=all.get(i).getTrainNum()%> </td>--%>
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
<%--                    <td><%=all.get(i).getdistance()%>--%>
<%--                    </td>--%>

                    <td>
                        <form action="bookTrip.jsp" method="post">
                            <input style='display: none' type="text" name="tripNum"
                                   value='<%=all.get(i).getTripNum()%>'/>
                            <input style='display: none' type="text" name="price" value='<%=all.get(i).getPrice()%>'/>
                            <button class="layui-btn">����</button>
                            <%--                <input type="submit" value="����">--%>
                        </form>
                    </td>
                    <td>
                        <form action="userdetailed.jsp" method="post">
                            <input style='display: none' type="text" id="tripNum" name="tripNum"
                                   value='<%=all.get(i).getTripNum() %>'/>
                            <%--                            <input type="submit" value="����">--%>
                            <button class="layui-btn">����</button>
                        </form>
                    </td>

                </tr>
                <%
                        }
                    }
                %>

            </table>
        </div>
    </div>
</div>
</div>
</body>
<script>
    layui.use('laydate', function () {
        var laydate = layui.laydate;

        //ִ��һ��laydateʵ��
        laydate.render({
            elem: '#test1' //ָ��Ԫ��
        });
    });
</script>

<script>
    //Demo
    layui.use('form', function () {
        var form = layui.form;
        form.render();
    });
</script>

</html>

