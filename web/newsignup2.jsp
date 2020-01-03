<%--
  Created by IntelliJ IDEA.
  User: Angel
  Date: 2019/12/30
  Time: 20:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <title>Allied Login Form a Flat Responsive Widget Template :: w3layouts </title>
    <!-- Meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Allied Login Form Responsive Widget, Audio and Video players, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design"
    />
    <script>
        addEventListener("load", function () { setTimeout(hideURLbar, 0); }, false); function hideURLbar() { window.scrollTo(0, 1); }
    </script>
    <!-- Meta tags -->
    <!-- font-awesome icons -->
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <!-- //font-awesome icons -->
    <!--stylesheets-->
    <link href="css/style.css" rel='stylesheet' type='text/css' media="all">
    <!--//style sheet end here-->
    <link href="//fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <style>
        body{
            background-image: url(image/23.jpg) ;
            background-repeat: no-repeat;
            /*no-repeat 0px 0px*/
            background-size: 100% 100%;
            background-attachment: fixed;
        }
    </style>
</head>
<body>
<h1 class="error">火车购票系统注册界面</h1>
<!-- 分为两块的CSS -->
<div class="w3layouts-two-grids">

    <div class="mid-class">
        <div class="txt-left-side">
            <h2> 注册 </h2>
            <br>
<%--            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget</p>--%>
            <form action="signup" method="post">
                <!-- 登录框 -->
                <div class="form-left-to-w3l">
                    <span class="fa fa-user" aria-hidden="true"></span>
                    <input type="text" style="color:white;border:none;background-color:transparent; width:300px; height:35px;" name="name" placeholder="输入姓名" required="">

                    <div class="clear"></div>
                </div>
                <br>

                <div class="form-left-to-w3l">
                    <span class="fa fa-user" aria-hidden="true"></span>
                    <input type="text" style="color:white;border:none;background-color:transparent; width:300px; height:35px;" name="userName" placeholder="输入用户名" required="">

                    <div class="clear"></div>
                </div>
                <br>

                <div class="form-left-to-w3l">
                    <span class="fa fa-envelope" aria-hidden="true"></span>
                    <input type="email" style="width:300px; height:35px;" name="email" placeholder="输入邮箱" required="">

                    <div class="clear"></div>
                </div>
                <br>

                <div class="form-left-to-w3l ">
                    <span class="fa fa-lock" aria-hidden="true"></span>
                    <input type="password" style="width:300px; height:35px;" name="password" placeholder="输入密码" required="">
                    <div class="clear"></div>
                </div>
                <br>
                <!-- 登录按钮 -->
                <h1>
                    <%
                        if (null != request.getAttribute("message")) {
                            out.flush();
                            out.println("<script>");
                            out.println("alert('此用户名已存在，请重新输入！');");
                            out.println("history.back();");
                            out.println("</script>");
                        }
                    %>
                </h1>

                <div class="btnn">
<%--                    <input style='display: none' type="text" name="type" value='user' />--%>
                    <button type="submit" style="height: 40px">注册 </button>
                </div>

            </form>
            <div class="w3layouts_more-buttn">

                    <h3>已有账号?
                        <a href="newlogin.jsp">登录
                        </a>
                    </h3>

            </div>

        </div>

        <div class="img-right-side">
            <h3>欢迎来到</h3>
            <h3>   火车购票系统注册页面 </h3>
            <img src="image/2.jpg" class="img-fluid" alt="">
        </div>

    </div>
</div>

<!-- 页脚 -->
<footer class="copyrigh-wthree">
    <p>
        © 2019 火车购票系统登录界面. 版权所属 | Design by
        <a href="" target="_blank">杨港</a>
    </p>
</footer>

</body>
</html>
