<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/11/1
  Time: 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>s表格前端搜索</title>
    <meta http-equiv="Content-Type" content="text/html;charset=GBK"/>
</head>
<body>
<h1>js表格前端搜索</h1>

<label> <input type="radio" name="sex" value="男" onclick="onSearch(this.value,2)"/>男 </label>
<label><input type="radio" name="sex" value="女" onclick="onSearch(this.value,2)"/>女 </label>

<table id="table1" border="1">
    <thead >
    <tr style="cursor: pointer;">
        <td class="listHeadCell">编号</td>
        <td class="listHeadCell">姓名</td>
        <td class="listHeadCell">性别</td>
    </tr>
    </thead>
    <tbody id="gridtbody">
    <tr>
        <td name="biaozhi">1</td>
        <td>名称1</td>
        <td>男</td>
    </tr>
    <tr>
        <td name="biaozhi">2</td>
        <td>名称2</td>
        <td>男</td>
    </tr>
    <tr>
        <td name="biaozhi">3</td>
        <td>名称3</td>
        <td>女</td>
    </tr>
    <tr>
        <td name="biaozhi">4</td>
        <td>名称4</td>
        <td>男</td>
    </tr>
    </tbody>
</table>
<br/>

<script type="text/javascript">
    /**
     * js 前台搜索
     * @param searchContent 搜索的内容
     * @col 要搜索的哪一列，这里是第一列，从0开始数起
     */
    function onSearch(searchContent,col){
        setTimeout(function(){//因为是即时查询，需要用setTimeout进行延迟，让值写入到input内，再读取
            var storeId = document.getElementById('table1');//获取table的id标识
            var rowsLength = storeId.rows.length;//表格总共有多少行

            var searchCol = col;//要搜索的哪一列，这里是第一列，从0开始数起

            for(var i=1;i<rowsLength;i++){//按表的行数进行循环，本例第一行是标题，所以i=1，从第二行开始筛选（从0数起）

                var searchText = storeId.rows[i].cells[searchCol].innerHTML;//取得table行，列的值
                //alert(searchText);
                if(searchText.match(searchContent) || searchText.toUpperCase().match(searchContent.toUpperCase())){//用match函数进行筛选，如果input的值，即变量 key的值为空，返回的是ture，
                    storeId.rows[i].style.display='';//显示行操作，
                }else{
                    storeId.rows[i].style.display='none';//隐藏行操作
                }
            }
        },20);//20为延时时间
    }
</script>
</body>
</html>
