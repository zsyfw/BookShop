<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/10/26
  Time: 8:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <style type="text/css">
        * {
            margin: 0px;
        }

        body{
            background: #91cde3;
            font-size: 1.8em;
            color:#FFF;
            width:100%;
            min-height:100vh;
            display: flex;
        }


        #content {
            margin: 150px auto;
            width: 100%;
            height: 460px;
            border: 1px transparent solid;
            background-color: #a8e7ff;
            background-image: linear-gradient(243deg, #decece 0%, #d29090 100%);
            background-image: -webkit-linear-gradient(243deg, #decece 0%, #d29090 100%);
            background-image: -moz-linear-gradient(243deg, #decece 0%, #d29090 100%);
        }

        #box {
            margin: 50px auto;
            width: 30%;
            height: 360px;
            background-color: #fdfdfd;
            text-align: center;
            border-radius: 15px;
            border: 2px #fff solid;
            box-shadow: 10px 10px 5px #000000;
        }

        .title {
            line-height: 58px;
            margin-top: 20px;
            font-size: 36px;
            color: #37928a;
            height: 58px;
        }

        #box:hover {
            border: 2px #fff solid;
        }

        .input {
            margin-top: 20px;
        }

        input {
            margin-top: 5px;
            outline-style: none;
            border: 1px solid #b31b1b;
            border-radius: 3px;
            padding: 13px 14px;
            width: 70%;
            font-size: 14px;
            font-weight: 700;
            font-family: "Microsoft soft";
        }

        .btn {
            margin-top: 20px;
            border: none;
            color: #000;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 15px;
            background-color: #ffdfa7;
        }
        button:hover{
            background-color: #B721FF;
            color: #fff;
        }
    </style>
</head>
<body>
<div id="content">
    <div id="box">
        <form class="layui-form"   method="get"  action="${pageContext.request.contextPath}/admin" >
            <div class="title">管理员登录</div>
            <div class="input">
                <input type="text" name="username" placeholder="用户名" />
                <br>
                <input type="password" name="userpwd" placeholder="密码" />
                <br>
                <input class="btn" type="submit" name="adminlogin" value="登录" >
                <a href="main.jsp"><input class="btn" type="button" value="用户/管理员登录"></a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
