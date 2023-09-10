<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/11/4
  Time: 22:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/src/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/src/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>

    <style type="text/css">
        body{
            background: #80e5ff;
            font-size: 1em;
            color:#FFF;
            width:100%;
            min-height:100vh;
            display: flex;
            justify-content:center;
            align-item:center;
            position: relative;
            position: absolute;
        }

        body::before{
            content:'';
            background:linear-gradient(#ffdb8a, #85ff85);
            width:100%;
            clip-path:circle(40% at left 15%);
        }
        body::after {
            content: '';
            background: linear-gradient(#ffe6a3, #ffa4a4);
            width: 100%;
            clip-path: circle(40% at right 75%);
        }
        input{
            width:400px;
            height:30px;
            font-size: 20px
        }
    </style>
    <meta charset="UTF-8">
    <title>新增图书</title>
</head>
<body>
<div>
<%--    <form method="post" action="${pageContext.request.contextPath}/books/addBook"  >--%>
        <div style="font-size: 30px; color: #4476A7">添加图书</div><br><br>
        <div  style="font-size: 20px">
            <span style="color: #4476A7">ID</span><input type="text"  id="book_id" value="" placeholder="id" />
            <br><br>
            <span style="color: #4476A7">书名</span><input type="text"  id="book_name" value="" placeholder="书名" />
            <br><br>
            <span style="color: #4476A7">作者</span><input type="text"  id="book_author" value="" placeholder="作者" />
            <br><br>
            <span style="color: #4476A7">详细</span><input type="text"  id="book_detail" value="" placeholder="详细" />
            <br><br>
            <span style="color: #4476A7">价格</span><input type="text"  id="book_price" value="" placeholder="价格" />
            <br><br>
            <span style="color: #4476A7">进货总量</span><input type="text"  id="book_num" value="" placeholder="总量" />
            <br><br><br>
            <input class="btn" type="button" onclick="subs()" value="确认添加" style="color: #4476A7;"/>
            <br><br><br>
            <a style="color: mediumpurple" href="adminweb.jsp"><h4>点此返回后台主页面</h4></a>

        </div>
<%--    </form>--%>
</div>
<script>
    var layer ;
    layui.use('layer', function(){
        layer = layui.layer;
    });
    function subs(){
        var ids=document.getElementById("book_id").value;
        var name=document.getElementById("book_name").value;
        var author=document.getElementById("book_author").value;
        var detail=document.getElementById("book_detail").value;
        var price=document.getElementById("book_price").value;
        var num=document.getElementById("book_num").value;
        if (ids!=""&&name!=""&&price!=""&&num!=""){
            sub()
        }else {
            layer.msg("<em style='color:red'>"+"输入信息不能为空！"+"</em>", {icon:5,time:1000},function(){
                setTimeout('window.location.reload()',300);
            });
        }
    }
</script>

<script type="text/javascript">
    function sub(){
        var ids=document.getElementById("book_id").value;
        var name=document.getElementById("book_name").value;
        var author=document.getElementById("book_author").value;
        var detail=document.getElementById("book_detail").value;
        var price=document.getElementById("book_price").value;
        var num=document.getElementById("book_num").value;
        layer.confirm("<em style='color:black'>"+'确定添加该书吗？'+"</em>", {
            btn: ['确定', '取消'] //按钮
        },function (){
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/books/addBook',
                dataType: 'text',
                data:{"book_id":ids,"book_name":name,"book_author":author,"book_detail":detail,"book_price":price,"book_num":num},
                success: function (res) {
                    if (res=="添加成功!!") {
                        layer.msg("<em style='color:black'>"+res+"</em>", {icon:1,time:1000},function(){
                            setTimeout('window.location.reload()',300);
                        });
                    } else {
                        layer.msg("<em style='color:black'>"+res+"</em>", {icon: 5});
                    }
                }
            })
        }, function () {
        });
    }
</script>

</body>
</html>