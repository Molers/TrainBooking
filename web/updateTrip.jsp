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
                    <a href="newprofile.jsp">个人信息</a></dd>

                <dd>
                    <a href=newlogin.jsp">退出</a></dd>
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
                    <i class="iconfont left-nav-li">&#xe723;</i>
                    <cite>新增站点</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
            </li>
        </ul>
    </div>
</div>
<!-- 左侧菜单结束 -->
<div class="page-content">

    <div class="layui-tab tab">
        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>编辑<%=request.getAttribute("tripNum") %>车次信息
            </li>
        </ul>
        <div class="layui-tab-content">
            <%--                <div class="layui-card-body layui-table-body layui-table-main">--%>

                <div class="layui-card-body layui-table-body layui-table-main">
                <form method="post" action="updateTrip" class="layui-form layui-form-pane">
<%--                    <div class="input-group">--%>
<%--                        <span class="input-group-addon form-inline"> 出发时间 </span>--%>
<%--                        <input class="form-control" placeholder="" type="time" name="depTime" value=""--%>
<%--                               required/> <br>--%>
<%--                    </div>--%>

                    <div class="layui-form-item">
                        <label class="layui-form-label">出发时间</label>
                        <div class="layui-input-block">
                            <input class="layui-input" placeholder="请输入出发时间" type="time" name="depTime" value=""
                                   required/>
                        </div>

                    </div>


<%--                    <div class="input-group">--%>
<%--                        <span class="input-group-addon form-inline" id="basic-addon1"> 到达时间 </span>--%>
<%--                        <input class="form-control" placeholder="" type="time" name="arrTime" value=""--%>
<%--                               required/> <br>--%>
<%--                    </div>--%>
<%--                    <br>--%>
    <div class="layui-form-item">
        <label class="layui-form-label">到达时间</label>
        <div class="layui-input-block">
            <input class="layui-input" placeholder="请输入到达时间" type="time" name="arrTime" value=""
                   required/>
        </div>

    </div>


<%--                    <div class="input-group">--%>
<%--                        <span class="input-group-addon form-inline" id="basic-addon1"> 历时 </span>--%>
<%--                        <input class="form-control" placeholder="历时(小时)" type="text" name="totaltime"--%>
<%--                               onkeyup="value=value.replace(/[^\d.]/g,'') "--%>
<%--                               onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))"--%>
<%--                               value="" required/> <br>--%>
<%--                    </div>--%>
<%--                    <br>--%>
    <div class="layui-form-item">
        <label class="layui-form-label">历时</label>
        <div class="layui-input-block">
            <input class="layui-input" placeholder="历时(小时)" type="text" name="totaltime" value=""
                   required/>
        </div>

    </div>

<%--                    <div class="layui-form-item">--%>
<%--                        <label class="layui-form-label">座位</label>--%>
<%--                        &lt;%&ndash;                        <span class="layui-input-inline">座位</span>&ndash;%&gt;--%>
<%--                        <div class="layui-input-block">--%>
<%--                            <input type="text" name="seats" placeholder="请输入座位" class="layui-input">--%>
<%--                        </div>--%>
<%--                    </div>--%>
    <div class="layui-form-item">
        <label class="layui-form-label">座位</label>
        <div class="layui-input-block">
            <input class="layui-input" placeholder="请输入座位数" type="text" name="seats" value=""
                   required/>
        </div>

    </div>


<%--                    <div class="input-group">--%>
<%--                        <span class="input-group-addon form-inline" id="basic-addon1"> 价格 </span>--%>
<%--                        <input class="form-control" placeholder="价格" type="text" name="price" value="" required/> <br>--%>
<%--                    </div>--%>
<%--                    <br>--%>
    <div class="layui-form-item">
        <label class="layui-form-label">价格</label>
        <div class="layui-input-block">
            <input class="layui-input" placeholder="请输入价格" type="text" name="price" value=""
                   required/>
        </div>

    </div>

<%--                    <div class="layui-form-item">--%>
<%--                        <label class="layui-form-label">日期</label>--%>
<%--                        <div class="layui-input-block">--%>
<%--                            <input type="date" name="date" class="layui-input" value="" required/>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="input-group">--%>
<%--                        <span class="input-group-addon form-inline" id="basic-addon1">  日期</span>--%>
<%--                        <input class="form-control" placeholder="" type="date" name="date" value="" required/> <br>--%>
<%--                    </div>--%>
    <div class="layui-form-item">
        <label class="layui-form-label">日期</label>
        <div class="layui-input-block">
            <input class="layui-input" placeholder="请输入日期" type="date" name="date" value=""
                   required/>
        </div><br>

    </div>

                    <input style='display: none' type="text" id="tripNum" name="id"
                           value='<%=request.getAttribute("tripNum") %>'/>

                    <%--                <input type="submit" class="btn btn-success" value="提交" />--%>
                    <button class="layui-btn" style="float:left">提交</button>
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
