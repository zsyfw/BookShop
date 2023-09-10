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
  <title>图书销售电商网站</title>
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
      background-color: #6fdeff;
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

    #box:hover {
      border: 2px #fff solid;
    }
    .title {
        line-height: 58px;
        margin-top: 30px;
        font-size: 36px;
        color: #37928a;
        height: 58px;
    }
    .btn1 {
      margin-top: 60px;
      border: none;
      color: #000;
      padding: 15px 40px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      border-radius: 15px;
      background-color: #ffdfa7;
    }
    .btn {
        margin-top: 20px;
        border: none;
        color: #000;
        padding: 15px 40px;
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
      <div class="title">登录</div>
        <a href="login.jsp"><input class="btn1" type="button" value="用户登录"></a><br>
        <a href="admin.jsp"><input class="btn" type="button" value="管理员登录"></a>
  </div>
</div>
</body>
</html>
