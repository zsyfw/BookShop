<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/9/17
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <style type="text/css">
        * {
            margin: 0px;
        }

        body{
            background: #38acce;
            color:#FFF;
            width:100%;
            min-height:100vh;
            display: flex;
        }

        #content {
            margin: 150px auto;
            width: 100%;
            height: 500px;
            border: 1px transparent solid;
            background-color: #6fdeff;
            background-image: linear-gradient(243deg, #fdd24f 0%, #fd8888 100%);
            background-image: -webkit-linear-gradient(243deg, #fdd24f 0%, #fd8888 100%);
            background-image: -moz-linear-gradient(243deg, #fdd24f 0%, #fd8888 100%);
            background-image: -o-linear-gradient(243deg, #fdd24f 0%, #fd8888 100%);
        }

        #box {
            margin: 50px auto;
            width: 30%;
            height: 450px;
            background-color: #fff;
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
            border: 1px solid #ffd69e;
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
            border-radius: 10px;
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
        <form class="layui-form"   method="get"  action="${pageContext.request.contextPath}/register" onsubmit = "return addCheck()" >
            <div class="title">注册</div>
            <div class="input">
                <input type="text" name="name" id="username" value="" placeholder="注册用户名" />
                <br>
                <input type="text" name="sex"  placeholder="sex" />
                <br>
                <input type="password" name="pwd" id="word" placeholder="密码" />
                <br>
                <input type="password" name="pwd" id="nword" placeholder="确认密码" />
                <br>
                <input class="btn" type="submit" name="register" value="确认注册" />
                <a href="login.jsp"><input class="btn" type="button" value="登录"></a>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    function addCheck(){
        var name=document.getElementById("username").value;
        var word=document.getElementById("word").value;
        var nword=document.getElementById("nword").value;
        if(name==""){
            alert("用户名不能为空，请重新注册！");
            return false;
        }
        if(word==""){
            alert("密码不能为空，请重新注册！");
            return false;
        }
        if(word != nword){
            alert("两次输入密码不相同，请重新注册！");
            return false;
        }

    }
</script>
</body>
</html>
