<%--
  Created by IntelliJ IDEA.
  User: Angel
  Date: 2019/12/27
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>开始使用layui</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <link rel="stylesheet" href="style/bootstrap.min.css"/>
    <link rel="stylesheet" href="./lib/layui/css/layui.css">
    <link rel="stylesheet" href="style/style.css"/>
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <link rel="stylesheet" href="./css/theme10.min.css">
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>


    <script src="js/jquery.min.js"></script>


</head>
<body>
<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">选择框</label>
        <div class="layui-input-block">
            <select name="city" lay-verify="required">
                <option value=""></option>
                <option value="0">北京</option>
                <option value="1">上海</option>
                <option value="2">广州</option>
                <option value="3">深圳</option>
                <option value="4">杭州</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">输入框</label>
        <div class="layui-input-block">
            <input type="text" name="title" required lay-verify="required" placeholder="请输入标题" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline"> <!-- 注意：这一层元素并不是必须的 -->
            <input type="text" class="layui-input" id="test1">
        </div>
    </div>

</form>
<input type="text" class="layui-input" id="test2">

<!-- 你的HTML代码 -->

<script src="./laydate/laydate.js" charset="utf-8"></script>
<script>
    laydate.render({
        elem: '#test1', //指定元素
        elem: '#test2' //指定元素
    });
</script>
<script>
    //一般直接写在一个js文件中
    layui.use(['layer', 'form', 'select'], function () {
        var layer = layui.layer
            , form = layui.form
            , select = layui.select;

        render(select);

    });
</script>
</body>
</html>
