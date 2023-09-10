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
            background: linear-gradient(#91cde3, #91cde3);
        }
        .layui-table{
            background: linear-gradient(#decece, #d29090);
        }
        a:hover {
            cursor: pointer;
            text-decoration: none;
        }

        img {
            vertical-align: middle;
        }
        .num-jian,
        .input-num,
        .num-jia {
            display: inline-block;
            width: 28px;
            height: 28px;
            line-height: 28px;
            text-align: center;
            font-size: 18px;
            color: #999;
            cursor: pointer;
            border: 1px solid #e6e6e6;
            background-color: #F0F0F0;
        }
        .btn-numbox .count .input-num {
            width: 58px;
            height: 26px;
            color: #333;
            border-left: 0;
            border-right: 0;
        }
    </style>
</head>
<h1 style="text-align: center"> 图书销售系统</h1>
<body>
<sql:setDataSource var="bs_books" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/bookshop"
                   user="root"  password="root"/>
<sql:query dataSource="${bs_books}" var="booklist">
    SELECT * from bs_books;
</sql:query>
<% String username=request.getParameter("username");%>
<form action="${pageContext.request.contextPath}/main.jsp">
    <h3 style="color: #4476A7">当前用户：<%=username%>
    <input type="submit" value="退出登录"></h3>
</form>
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
<form action="${pageContext.request.contextPath}/cart.jsp" method="post" style="font-size: medium">
    <input  type="hidden" type="text" name="username" value="<%=username %>"/>
    <button type="submit">查看购物车</button></form>
<table  class="layui-table" lay-skin="line" id="table1" >
    <thead>
    <th style="display: none"><input type="checkbox" id="setAll" onclick="setAll()">全选</th>
    <th>ID</th>
    <th>书名</th>
    <th>作者</th>
    <th>详细</th>
    <th>总量</th>
    <th>价格</th>
    <th>图片</th>
    <th>数量</th>
    <th>操作</th>
    </thead>
<tbody>
    <c:forEach items="${booklist.rows}" var="info" varStatus="loop">
        <tr id="${loop.count}">
            <td style="display: none"><input type="checkbox" name="book"></td>
            <td><input type="hidden" name="book_id" value="${info.book_id}">${info.book_id}</td>
            <td>${info.book_name}</td>
            <td>${info.book_author}</td>
            <td>${info.book_detail}</td>
            <td>${info.book_num}</td>
            <td>${info.book_price}</td>
            <!-- 显示图片-->
            <td><img src="${pageContext.request.contextPath}/Image/${info.book_pic}" width="100px" height="auto"></td>
            <td><form>
                <input id="num-jian" class="num-jian" value="-"/>
                <input type="text" class="input-num" id="input-num" value="1" name="num" />
                <input id="num-jia" class="num-jia" value="+"/>
            </form>
            </td>
            <td><button type="submit" onclick="addcart(${info.book_id},this)">添加到购物车</button></td>
        </tr>
    </c:forEach>

</tbody>
</table>
<%--搜索--%>
<script>
    function search(){
        setTimeout(function(){//因为是即时查询，需要用setTimeout进行延迟，让值写入到input内，再读取
            var myselect=document.getElementById("myselect");
            //获取选择的搜索类型
            var searchtype=myselect.options[myselect.selectedIndex].value;
            //获取input框内容
            var searchvalue=document.getElementsByName("searchvalue")[0].value;
            var storeId = document.getElementById('table1');//获取table的id标识
            var rowsLength = storeId.rows.length;//表格总共有多少行

            if(searchtype=="searchName"){
                var searchCol = 2;//要搜索的哪一列，这里是第一列，从0开始数起
            }else if (searchtype=="searchAuthor"){
                var searchCol = 3;
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
<%--购物车--%>
<script>
    //创建layer组件
    var layer ;
    layui.use('layer', function(){
        layer = layui.layer;
    });
    //添加到购物车

    function  addcart(book_id,_this) {
        layer.confirm('确定要添加到购物车吗？', {
            btn: ['确定', '取消'] //按钮
        }, function () {
                    var num1=document.getElementsByName("num");
                    var index=_this.parentNode.parentNode.id
                    var num_value=num1[index-1].value
                    console.log(_this.parentNode.parentNode.id)
                    $.ajax({
                        type: 'get',
                        url: '${pageContext.request.contextPath}/books/addCart',
                        dataType: 'text',
                        data:{"book_id":book_id,"num":num_value},
                        success: function (res) {
                            if (res=="成功添加到购物车!!") {
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
<%--  全选与全不选--%>
<script type="text/javascript">
    function setAll() {
        var setAll=document.getElementById("setAll")
        var book = document.getElementsByName("book");
        if (setAll.checked==true){
            for (var i = 0; i < book.length; i++) {
                book[i].checked = true;
            }
        }else {
            for (var i = 0; i < book.length; i++) {
                book[i].checked = false;
            }
        }
    }
</script>
<%--加减--%>
<script>
        $(".num-jia").click(function() {
    // $(this).prev() 就是当前元素的前一个元素，即 text_box
            $(this).prev().val(parseInt($(this).prev().val()) + 1);
        });
        $(".num-jian").click(function() {
    // $(this).next() 就是当前元素的下一个元素，即 text_box
            $(this).next().val(parseInt($(this).next().val()) - 1);
        });
</script>


</body>
</html>