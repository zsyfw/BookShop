<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/11/2
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test2</title>
</head>
<body>
<div>
    <form action="/BookShop_war_exploded/BooksServlet" method="get">
        <h2>注册</h2>
        <input type="text" name="searchtype" placeholder="用户名">
        <br>
        <input type="text" name="searchvalue" placeholder="密码">
        <br>
        <button type="submit">注册</button>
    </form>

</div>
<%--<td><input type="button"  value="-" class="jian" />--%>
<%--    <input type="text" value="0" class="num">--%>
<%--    <input type="button"  value="+" class="add" /></td>--%>
<input class="min" name="" type="button" value="-" />
<input class="text_box" name="goodnum" type="text" value="0" style="width:25px;" />
<input class="add" name="" type="button" value="+" /></td>
<script>
//     $(".add").click(function() {
// // $(this).prev() 就是当前元素的前一个元素，即 text_box
//         $(this).prev().val(parseInt($(this).prev().val()) + 1);
//         setTotal();
//     });
//     $(".min").click(function() {
// // $(this).next() 就是当前元素的下一个元素，即 text_box
//         $(this).next().val(parseInt($(this).next().val()) - 1);
//         setTotal();
//     });
    var jian=$(".jian");
    var num=$(".num");
    var add=$(".add");
    jian.onclick=function() {
        if (num<=0) {
            num.value=0
        }else {
            num.val(parseInt(num.val())-1)
        }
    }
    add.click=function(){
        num.val(parseInt(num.val()) + 1)
    }
</script>
<script type="text/javascript">

    // function jian(this_) {
    //     var text=(this_.parentNode.innerText)
    //     if(text>0){
    //         text=text-1
    //
    //         // this_.parentNode.innerHTML="<input type=\"button\"  value=\"-\" onclick=\"jian(this)\"/> "+text+" <input type=\"button\"  value=\"+\" onclick=\"jia(this)\"/>"
    //     }
    //     else
    //     {
    //         // this_.parentNode.innerHTML="<input type=\"button\"  value=\"-\" onclick=\"jian(this)\"/> 0 <input type=\"button\"  value=\"+\" onclick=\"jia(this)\"/>"
    //     }
    //     sum()
    // }
    //
    // function jia(this_) {
    //     var text=(this_.parentNode.innerText)
    //     text=Number(text)
    //     if(text>=0){
    //         text=text+1
    //         // this_.parentNode.innerHTML="<input type=\"button\"  value=\"-\" onclick=\"jian(this)\"/> "+text+" <input type=\"button\"  value=\"+\" onclick=\"jia(this)\"/>"
    //     }
    //     else{
    //         // this_.parentNode.innerHTML="<input type=\"button\"  value=\"-\" onclick=\"jian(this)\"/> 0 <input type=\"button\"  value=\"+\" onclick=\"jia(this)\"/>"
    //     }
    //     sum()
    // }

</script>
<script type="text/javascript">


    function sum() {
        var chk=document.getElementsByName("check")//获取所有复选框
        var chkpn
        var i,cost,shul

        var sum1=0

        for(i=0;i<chk.length;i++){
            if(chk[i].checked)                                           //如果复选框的值为true
            {
                chkpn=chk[i].parentNode                      //获取该复选框的父节点
                cost=Number(chkpn.parentNode.childNodes[7].innerText)
                //再获取复选框父节点的父节点的子节点的下标为7的元素的文本并转化为数字
                shul=Number(chkpn.parentNode.childNodes[11].innerText)
                //再获取复选框父节点的父节点的子节点的下标为11的元素的文本并转化为数字
                sum1=sum1+(cost*shul)
            }

        }
        document.getElementById("heji").innerHTML=sum1

    }
</script>
</body>
</html>
