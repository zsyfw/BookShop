<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/10/29
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%--    //http://localhost:8080/BookShops_war_exploded/web.jsp--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/src/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/src/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>

    <title>图书销售系统</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style type="text/css">
        .btn1 {
            background-color: deepskyblue; /* Green */
            border: none;
            color: white;
            padding: 16px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            -webkit-transition-duration: 0.4s; /* Safari */
            transition-duration: 0.4s;
            cursor: pointer;
        }
        body{
            background: linear-gradient(#eae0e0, #4fe3fd);
        }
        .layui-table{
            background: linear-gradient(#decece, #d29090);
        }
    </style>

</head>
<h1 style="text-align: center"> 图书销售系统</h1>
<body>
<sql:setDataSource var="bs_books" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/bookshop"
                   user="root"  password="root"/>
<sql:query dataSource="${bs_books}" var="booklist">
    SELECT * from bs_books;
</sql:query>

<h3 style="color: #4476A7">当前管理员账户:<%=request.getParameter("username") %></h3><br><br>
<div> <a href="addweb.jsp"><h2 style="color: #f8b86b">★★★点击添加新书★★★</h2></a> </div><br><br>
<div> <a href="main.jsp"><h2 style="color: #f879af">★★★返回登陆界面★★★</h2></a> </div><br><br>
<br><br>

<!--搜索框-->
<div>
    <select id="myselect" style="font-size: medium">
        <option value="searchName">书名</option>
        <option value="searchAuthor">作者</option>
    </select>
    <input type="text" name="searchvalue" value="" style="font-size: medium"/>
    <button type="button" onclick="search()" style="font-size: medium">搜索</button>
</div>
<br>

<h1 style="text-align: center">所有书本列表</h1>
<table  class="layui-table" lay-skin="line" id="table1">
<thead>
    <th>ID</th>
    <th>书名</th>
    <th>作者</th>
    <th>详细</th>
    <th>价格</th>
    <th>总量</th>
    <th>销售量</th>
    <th>书本图片</th>
    <th>上传图片</th>
    <th>修改</th>
    <th>删除</th>
    </thead>
    <tbody>
 <c:forEach items="${booklist.rows}" var="info" varStatus="loop">
    <tr>
        <td>${info.book_id}</td>
        <td>${info.book_name}</td>
        <td>${info.book_author}</td>
        <td>${info.book_detail}</td>
        <td>${info.book_price}</td>
        <td>${info.book_num}</td>
        <td>${info.book_sail}</td>
        <!-- 显示图片-->
        <td><img src="${pageContext.request.contextPath}/Image/${info.book_pic}" width="100px" height="auto"></td>
        <!-- 上传图片按钮-->
        <td>
            <form action="${pageContext.request.contextPath}/books/addImage" enctype="multipart/form-data" method="post">
                <input type="hidden"  name="bid" value="${info.book_id}"/>
                <input class="form-control" type="file" name="book_pic">
                <input type="submit" class="btn" value="提交图片" name="ti">
            </form>
        </td>
        <!--修改按钮-->
        <td>
            <form action="${pageContext.request.contextPath}/modifyweb.jsp" method="post">
            <input  type="hidden" type="text" name="book_id" value="${info.book_id}"/>
            <input class="btn1" type="submit"  value="修改" /></form>
            </form>
        </td>
        <!-- 删除按钮-->
        <td><button class='btn1' type="button" onClick="del(${info.book_id})" >删除</button></td>
    </tr>
    </c:forEach>
    </tbody>
</table>
<%--删除--%>
<script>
    //创建layer组件
    var layer ;
    layui.use('layer', function(){
        layer = layui.layer;
    });

    //删除图书的方法
    function  del(bookid) {
        layer.confirm('确定要删除此图书吗？', {
            btn: ['确定', '取消'] //按钮
        }, function () {
            $.ajax({
                type: 'get',
                url: '${pageContext.request.contextPath}/books/deleteBook',
                // dataType: 'json',
                dataType: 'text',
                data:{"book_id":bookid},
                success: function (res) {
                    if (res=="删除成功!!") {
                        layer.msg(res, {icon:1,time:1000},function(){
                            setTimeout('window.location.reload()',300);
                        });
                    } else {
                        layer.msg(res, {icon: 5});
                    }
                }
            })
        }, function () {
        });
    }
</script>

<%--查询显示--%>
<script>
    function search(){
        setTimeout(function(){//因为是即时查询，需要用setTimeout进行延迟，让值写入到input内，再读取
            var myselect=document.getElementById("myselect");
            //获取选择的搜索类型
            var searchtype=myselect.options[myselect.selectedIndex].value;
            //获取input框内容
            var searchvalue=document.getElementsByName("searchvalue")[0].value;
            var storeId = document.getElementById('table1');//获取table的id标识
            // var storeId1 = document.getElementById('datas');//获取table的id标识
            var rowsLength = storeId.rows.length;//表格总共有多少行

            if(searchtype=="searchName"){
                var searchCol = 1;//要搜索的哪一列，这里是第一列，从0开始数起
            }else if (searchtype=="searchAuthor"){
                var searchCol = 2;
            }

            for(var i=1;i<rowsLength;i++){//按表的行数进行循环，本例第一行是标题，所以i=1，从第二行开始筛选（从0数起）

                var searchText = storeId.rows[i].cells[searchCol].innerHTML;//取得table行，列的值
                // alert(searchText);
                if(searchText.match(searchvalue) || searchText.toUpperCase().match(searchvalue.toUpperCase())){//用match函数进行筛选，如果input的值，即变量 key的值为空，返回的是ture，
                    storeId.rows[i].style.display='';//显示行操作
                }else{
                    storeId.rows[i].style.display='none';//隐藏行操作
                }
            }
        },20);//20为延时时间
    }
</script>



</body>
</html>