<%@page contentType="text/html" pageEncoding="gbk" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <title>新增旅程</title>
    <script>
        //导入excel文件
        $("#saveZipButton").on('click', function () {
            var formData = new FormData();
            var name = $("#articleImageFile").val();
            formData.append("file", $("#articleImageFile")[0].files[0]);
            formData.append("name", name);//这个地方可以传递多个参数
            $.ajax({
                url: webRoot + "/deviceinfoup/export",
                type: 'POST',
                async: false,
                data: formData,
                // 告诉jQuery不要去处理发送的数据
                processData: false,
                // 告诉jQuery不要去设置Content-Type请求头
                contentType: false,
                beforeSend: function () {
                    console.log("正在进行，请稍候");
                },
                success: function (responseStr) {
                    if (responseStr == "01") {
                        alert("导入成功");
                    } else {
                        alert("导入失败");
                    }
                }
            });
        });
    </script>
    <script type="text/javascript">
        function checkForm(form) {
            <%--  Train Number --%>
            if (form.trainNum.value === "") {
                alert("错误:请输入车次号!");
                form.trainNum.focus();
                return false;
            }

            <%--  source--%>
            if (form.source.value === "") {
                alert("错误:请输入出发地!");
                form.source.focus();
                return false;
            }
            <%--   destination --%>
            if (form.destination.value === "") {
                alert("错误:请输入目的地!");
                form.destination.focus();
                return false;
            }
            <%--   departureTime --%>
            if (form.departureTime.value === "") {
                alert("错误:请输入出发时间!");
                form.departureTime.focus();
                return false;
            }
            <%--    arrivalTime --%>
            if (form.arrivalTime.value === "") {
                alert("错误:请输入到达时间!");
                form.arrivalTime.focus();
                return false;
            }
            <%--   date --%>
            if (form.date.value === "") {
                alert("错误:请输入历时!");
                form.date.focus();
                return false;
            }
            <%--    price --%>
            if (form.price.value === "") {
                alert("错误:请输入价格!");
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
<!-- 顶部开始 -->
<div class="container">
    <div class="logo">
        <a href="./index.html">火车购票系统</a></div>
    <div class="left_open">
        <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
    </div>

    <ul class="layui-nav right">
        <li class="layui-nav-item">
            <a href="javascript:;"> ${sessionScope.user.name}</a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                    <a href="newadminprofile.jsp">个人信息</a></dd>
                <dd>
                    <a href="newlogin.jsp">退出</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index">
            <a href="newlogin.jsp">前台首页</a></li>
    </ul>
</div>
<!-- 顶部结束 -->

<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="addTrip.jsp">
                    <i class="iconfont left-nav-li">&#xe6b8;</i>
                    <cite>新增车次</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
            </li>

            <li>
                <a href="tripsInfo.jsp">
                    <i class="iconfont left-nav-li">&#xe6b8;</i>
                    <cite>车次信息</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
            </li>

            <li>
                <a href="addStation.jsp">
                    <i class="iconfont left-nav-li" lay-tips="订单管理">&#xe723;</i>
                    <cite>新增站点</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
            </li>
        </ul>
    </div>
</div>
<!-- 左侧菜单结束 -->
<div class="page-content">
    <div class="layui-tab tab">
        <%--                    右侧标题开始--%>
        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>新增车次
            </li>
        </ul>
        <%--                    右侧标题结束--%>

        <%--                    右侧内容开始--%>
        <div class="layui-tab-content">
            <div class="layui-card-body layui-table-body layui-table-main">
                <form name="add_trip_form"  method="post" action="addTrip"
                      class="layui-form layui-form-pane">

                    <div class="layui-form-item">
                        <label class="layui-form-label">车次号</label>
                        <div class="layui-input-block">
                            <input class="layui-input" placeholder="请输入车次号" type="text" name="tripNum" value=""
                                   required/>
                        </div>

                    </div>


                    <div class="layui-form-item">
                        <%--                        <span class="input-group-addon form-inline" id="basic-addon1"> 出发地 </span>--%>
                        <label class="layui-form-label">出发地</label>
                        <div class="layui-input-block">
                            <input class="layui-input" placeholder="请输入出发地" type="text" name="source" value=""
                                   required/>
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <%--                        <span class="input-group-addon form-inline" id="basic-addon1"> 目的地 </span>--%>
                        <label class="layui-form-label">目的地</label>
                        <div class="layui-input-block">
                            <input class="layui-input" placeholder="请输入目的地" type="text" name="destination" value=""
                                   required/>
                        </div>

                    </div>


                    <div class="layui-form-item">
                        <%--                        <span class="input-group-addon form-inline" id="basic-addon1"> 发车时间 </span>--%>
                        <label class="layui-form-label">出发时间</label>
                        <div class="layui-input-block">
                            <input class="layui-input" placeholder="请输入发车时间" type="time" name="departureTime" value=""
                                   required/>
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">到达时间</label>
                        <div class="layui-input-block">
                            <input class="layui-input" placeholder="请输入到达时间" type="time" name="arrivalTime" value=""
                                   required/>
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">历时</label>
                        <div class="layui-input-block">
                            <input class="layui-input" placeholder="请输入历时(小时)" type="text" name="totaltime" value=""
                                   required/>
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">日期</label>
                        <div class="layui-input-block">
                            <input class="layui-input" type="date" name="date"   value=""
                                   required/>
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">座位</label>
                        <div class="layui-input-block">
                            <input class="layui-input" placeholder="请输入座位" type="text" name="seats" value="" required/>
                        </div>

                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">价格</label>
                        <div class="layui-input-block">
                            <input class="layui-input" placeholder="请输入价格" type="text" name="price" value="" required/>
                        </div>
                    </div>

                    <button class="layui-btn">提交</button>
                    <%--                    <input type="submit" class="btn btn-success" value="提交"/>--%>


                </form>
                <br>
                <form action="import2" method="post" enctype="multipart/form-data" >
                    <div  >
                        <div   >
                            <label >选择文件:</label>
                            <div >
                                <input type="file" name="excel" />
                            </div>

<%--                            <div class="layui-upload-drag" id="test10">--%>
<%--                                <i class="layui-icon"></i>--%>
<%--                                <p>点击上传，或将文件拖拽到此处</p>--%>
<%--                            </div>--%>
<%--                            <input class="layui-upload-file" type="file" accept="" name="file">--%>
                        </div><br>
                        <div >
                            <button  class="layui-btn"> <i class="layui-icon">&#xe67c;</i> 导入</button>
                        </div>
                        <%--                    <input type="submit" class="btn btn-success" value="导入"/>--%>
                    </div>
                </form>
            </div>

            <%--                    右侧内容结束--%>
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

<%--        //执行一个laydate实例--%>
<%--        laydate.render({--%>
<%--            elem: '#test2' //指定元素--%>
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
