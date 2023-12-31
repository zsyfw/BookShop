<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/10/30
  Time: 19:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商品展示列表</title>
    <!--引入bootstrap相关文件-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui.css" rel="external nofollow" rel="external nofollow" >
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/layui.js"></script>
</head>
<script type="text/javascript">
    var url ="/BookShop_war_exploded/Servlet";
    var pageNo=1;//当前页面设置为1
    var pageSize=5;//每页显示6条商品信息
    var totalPage;//一共有多少页数据
    var products;//商品的数据信息

    //页面加载时,向服务器发送请求,接收全部的商品数据
    $(function () {
        skipPage(1);
    });

    function skipPage(page) {
        //===========分页时的post请求===================================
        pageNo=page;
        //=====向服务器发送post请求
        $.post(
            url,//给服务器传送数据的地址
            {"pageNo": pageNo, "pageSize": pageSize},//给浏览器传递当前页面数和每页显示的条数
            function (data) {
                //解析服务器端传过来的全部pagebean数据,格式为json类型
                var pagebean = eval(data);
                //同步数据
                pageNo=pagebean.pageNo;
                pageSize=pagebean.pageSize;
                totalPage=pagebean.totalPage;
                products=pagebean.products;

                //显示表格中的数据===============================================
                //$("#tab").empty();
                $("#tab tr:not(:first)").empty();

                for (var i = 0; i < products.length; i++) {
                    //遍历每一行的数据
                    var protd =$("<tr><td>"+products[i].id+"</td><td>"+products[i].name+"          </td><td>"+products[i].count+"</td><td>"+products[i].price+"</td></tr>");
                    // 并添加到表格中,添加数据到表格中
                    $("#tab").append(protd);
                }

                //显示分页条的数据========================================================

                //清空分页条
                $(".pagination").empty();

                //先不考虑功能,先能显示出来
                //显示上一页,判断是否可用
                var preLi;
                if(pageNo===1){
                    //如果当前页是第一页,上一页功能就不可用.
                    preLi=$('<li class="disabled"><a href="javascript:void(0)" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" >上一页</a>             </li>');
                }else{
                    //如果当前页不是第一页,就添加点击事件,切换到上一页,把页码减一.
                    preLi=$('<li><a href="javascript:void(0)" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" onclick="skipPage('+(pageNo-           1)+')">上一页</a></li>');
                }
                //通过类选择器,添加进去
                $(".pagination").append(preLi);

                //遍历显示页码
                for (var i = 1; i <= totalPage; i++) {
                    var li;
                    if(i===pageNo){
                        //=========是当前页,就高亮显示
                        li=$('<li class="active"><a href="javascript:void(0)" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" >'+i+'</a>               </li>');
                        //通过类选择器,添加到ul中
                        $(".pagination").append(li);
                    }else{
                        //========不是当前页,不高亮显示.添加点击事件,参数传递为当前页码
                        li=$('<li><a href="javascript:void(0)" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow"                          onclick="skipPage('+i+')">'+i+'</a></li>');
                        //通过类选择器,添加到ul中
                        $(".pagination").append(li);
                    }
                }
                //显示下一页,判断是否可用
                var nextLi;
                if(pageNo===totalPage){
                    //如果当前页是最后一页,上一页功能就不可用.
                    nextLi=$('<li class="disabled"><a href="javascript:void(0)" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" >下一页</a>         </li>');
                }else {
                    //如果当前页不是最后一页,就添加点击事件,切换到上一页,把页码减一.
                    nextLi=$('<li><a href="javascript:void(0)" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" onclick="skipPage('+           (pageNo+1)+')">下一页</a></li>');
                }
                //通过类选择器,添加进去
                $(".pagination").append(nextLi);

            },"json")
    }
</script>

<body>
<h3 align="center">促销商品展示</h3>
<div class="container">
    <!--商品的表格占一行-->
    <div class="row">
        <div class="col-md-12">
            <!--table-hover表示当鼠标移入这一行表格的时候,颜色变化
              table-bordered表示给表格加边框
            -->
            <table class="table table-hover table-bordered" id="tab">
                <tr>
                    <th>编号</th>
                    <th>商品名称</th>
                    <th>商品数量</th>
                    <th>商品单价</th>
                </tr>
            </table>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 col-md-offset-4" >
            <nav>
                <ul class="pagination">
                    <!--此处代码由js动态生成
                     -->
                </ul>
            </nav>
        </div>
    </div>

</div>
</body>
</html>