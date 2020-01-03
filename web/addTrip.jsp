<%@page contentType="text/html" pageEncoding="gbk" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <title>�����ó�</title>
    <script>
        //����excel�ļ�
        $("#saveZipButton").on('click', function () {
            var formData = new FormData();
            var name = $("#articleImageFile").val();
            formData.append("file", $("#articleImageFile")[0].files[0]);
            formData.append("name", name);//����ط����Դ��ݶ������
            $.ajax({
                url: webRoot + "/deviceinfoup/export",
                type: 'POST',
                async: false,
                data: formData,
                // ����jQuery��Ҫȥ�����͵�����
                processData: false,
                // ����jQuery��Ҫȥ����Content-Type����ͷ
                contentType: false,
                beforeSend: function () {
                    console.log("���ڽ��У����Ժ�");
                },
                success: function (responseStr) {
                    if (responseStr == "01") {
                        alert("����ɹ�");
                    } else {
                        alert("����ʧ��");
                    }
                }
            });
        });
    </script>
    <script type="text/javascript">
        function checkForm(form) {
            <%--  Train Number --%>
            if (form.trainNum.value === "") {
                alert("����:�����복�κ�!");
                form.trainNum.focus();
                return false;
            }

            <%--  source--%>
            if (form.source.value === "") {
                alert("����:�����������!");
                form.source.focus();
                return false;
            }
            <%--   destination --%>
            if (form.destination.value === "") {
                alert("����:������Ŀ�ĵ�!");
                form.destination.focus();
                return false;
            }
            <%--   departureTime --%>
            if (form.departureTime.value === "") {
                alert("����:���������ʱ��!");
                form.departureTime.focus();
                return false;
            }
            <%--    arrivalTime --%>
            if (form.arrivalTime.value === "") {
                alert("����:�����뵽��ʱ��!");
                form.arrivalTime.focus();
                return false;
            }
            <%--   date --%>
            if (form.date.value === "") {
                alert("����:��������ʱ!");
                form.date.focus();
                return false;
            }
            <%--    price --%>
            if (form.price.value === "") {
                alert("����:������۸�!");
                form.price.focus();
                return false;
            }
            var z = document.forms["add_trip_form"]["price"].value;
            if (!z.match(/^\d+/)) {
                alert("Please only enter numeric characters only for price ! (Allowed input:0-9)");
                form.price.focus();
                return false;
            }

        }
    </script>
    <link rel="stylesheet" href="style/bootstrap.min.css"/>
    <link rel="stylesheet" href="style/style.css"/>
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function checkForm(form) {

            <%--  Train Number --%>

            var z = document.forms["Add_train_form"]["trainNumber"].value;
            if (!z.match(/^\d+/)) {
                alert("Please only enter numeric characters only for the trainNumber ! (Allowed input:0-9)");
                form.enginenumber.focus();
                return false;
            }
            <%--  Train Number --%>

            var z = document.forms["Add_train_form"]["numOfSeats"].value;
            if (!z.match(/^\d+/)) {
                alert("Please only enter numeric characters only for the numOfSeats ! (Allowed input:0-9)");
                form.enginenumber.focus();
                return false;
            }

        }
    </script>
    <link rel="stylesheet" href="style/bootstrap.min.css"/>
    <link rel="stylesheet" href="style/style.css"/>
    <link rel="stylesheet" href="style/bootstrap.min.css"/>
    <link rel="stylesheet" href="style/style.css"/>
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <link rel="stylesheet" href="./css/theme10.min.css">
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script src="js/jquery.min.js"></script>
    <link rel="stylesheet" href="./lib/layui/css/layui.css">
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
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
        <%--                    �Ҳ���⿪ʼ--%>
        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>��������
            </li>
        </ul>
        <%--                    �Ҳ�������--%>

        <%--                    �Ҳ����ݿ�ʼ--%>
        <div class="layui-tab-content">
            <div class="layui-card-body layui-table-body layui-table-main">
                <form name="add_trip_form"  method="post" action="addTrip"
                      class="layui-form layui-form-pane">

                    <div class="layui-form-item">
                        <label class="layui-form-label">���κ�</label>
                        <div class="layui-input-block">
                            <input class="layui-input" placeholder="�����복�κ�" type="text" name="tripNum" value=""
                                   required/>
                        </div>

                    </div>


                    <div class="layui-form-item">
                        <%--                        <span class="input-group-addon form-inline" id="basic-addon1"> ������ </span>--%>
                        <label class="layui-form-label">������</label>
                        <div class="layui-input-block">
                            <input class="layui-input" placeholder="�����������" type="text" name="source" value=""
                                   required/>
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <%--                        <span class="input-group-addon form-inline" id="basic-addon1"> Ŀ�ĵ� </span>--%>
                        <label class="layui-form-label">Ŀ�ĵ�</label>
                        <div class="layui-input-block">
                            <input class="layui-input" placeholder="������Ŀ�ĵ�" type="text" name="destination" value=""
                                   required/>
                        </div>

                    </div>


                    <div class="layui-form-item">
                        <%--                        <span class="input-group-addon form-inline" id="basic-addon1"> ����ʱ�� </span>--%>
                        <label class="layui-form-label">����ʱ��</label>
                        <div class="layui-input-block">
                            <input class="layui-input" placeholder="�����뷢��ʱ��" type="time" name="departureTime" value=""
                                   required/>
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">����ʱ��</label>
                        <div class="layui-input-block">
                            <input class="layui-input" placeholder="�����뵽��ʱ��" type="time" name="arrivalTime" value=""
                                   required/>
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">��ʱ</label>
                        <div class="layui-input-block">
                            <input class="layui-input" placeholder="��������ʱ(Сʱ)" type="text" name="totaltime" value=""
                                   required/>
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">����</label>
                        <div class="layui-input-block">
                            <input class="layui-input" type="date" name="date"   value=""
                                   required/>
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">��λ</label>
                        <div class="layui-input-block">
                            <input class="layui-input" placeholder="��������λ" type="text" name="seats" value="" required/>
                        </div>

                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">�۸�</label>
                        <div class="layui-input-block">
                            <input class="layui-input" placeholder="������۸�" type="text" name="price" value="" required/>
                        </div>
                    </div>

                    <button class="layui-btn">�ύ</button>
                    <%--                    <input type="submit" class="btn btn-success" value="�ύ"/>--%>


                </form>
                <br>
                <form action="import2" method="post" enctype="multipart/form-data" >
                    <div  >
                        <div   >
                            <label >ѡ���ļ�:</label>
                            <div >
                                <input type="file" name="excel" />
                            </div>

<%--                            <div class="layui-upload-drag" id="test10">--%>
<%--                                <i class="layui-icon">�v</i>--%>
<%--                                <p>����ϴ������ļ���ק���˴�</p>--%>
<%--                            </div>--%>
<%--                            <input class="layui-upload-file" type="file" accept="" name="file">--%>
                        </div><br>
                        <div >
                            <button  class="layui-btn"> <i class="layui-icon">&#xe67c;</i> ����</button>
                        </div>
                        <%--                    <input type="submit" class="btn btn-success" value="����"/>--%>
                    </div>
                </form>
            </div>

            <%--                    �Ҳ����ݽ���--%>
        </div>
    </div>
</div>

<div class="page-content-bg"></div>
<style id="theme_style"></style>
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

<%--<script>--%>
<%--    layui.use('laydate', function () {--%>
<%--        var laydate = layui.laydate;--%>

<%--        //ִ��һ��laydateʵ��--%>
<%--        laydate.render({--%>
<%--            elem: '#test2' //ָ��Ԫ��--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>

<script>
    //Demo
    layui.use('form', function () {
        var form = layui.form;
        form.render();
    });
</script>

</html>
