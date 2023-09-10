<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2022/10/25
  Time: 18:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%--    //http://localhost:8080/BookShops_war_exploded/web.jsp--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/src/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/src/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>

    <title>书单</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style type="text/css">
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
            background-color: #a7ffb0;
        }
        #content {
            margin: 150px auto;
            width: 100%;
            height: 600px;
            border: 1px transparent solid;
            background-color: #a8e7ff;
            background-image: linear-gradient(243deg, #cfdece 0%, #9ad290 100%);
            background-image: -webkit-linear-gradient(243deg, #cfdece 0%, #9ad290 100%);
            background-image: -moz-linear-gradient(243deg, #cfdece 0%, #9ad290 100%);
        }
        body{
            background: linear-gradient(#cfdece, #9ad290);
        }
        .layui-table{
            background: linear-gradient(#cfdece, #9ad290);
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
            text-align: center;

        }

        .input{
            margin-top: 20px;
        }

        #caption {
            width: 100%;
            height: 550px;
            border: 1px transparent solid;
            background-image: linear-gradient(243deg, #cfdece 0%, #9ad290 100%);
            background-image: -webkit-linear-gradient(243deg, #cfdece 0%, #9ad290 100%);
            background-image: -moz-linear-gradient(243deg, #cfdece 0%, #9ad290 100%);
        }
    </style>

</head>
<body>
<a style="font-size: 48px; display: block; text-align: center">薛定谔的书单</a>
<select id="selectId" style="font-size: medium">
    <option name="typeId" value="1">文学类</option>
    <option name="typeId" value="2">言情类</option>
    <option name="typeId" value="3">科幻类</option>
</select>
<button type="button" onclick="search()" style="font-size: medium">搜索</button>
<button type="button" onclick="allBook()" style="font-size: medium">显示所有</button>
<table  class="layui-table" lay-skin="line" id="table1">
    <thead>
    <th>ID</th>
    <th>类别</th>
    <th>书名</th>
    <th>作者</th>
    <th>详细</th>
    <th>评分</th>
    <th>状态</th>
    </thead>

    <tbody>
        <tr>
            <td>1</td>
            <td>文学类</td>
            <td>傲慢与偏见</td>
            <td>奥斯汀</td>
            <td>简 奥斯丁的代表作《傲慢与偏见》，不仅是英国文苑的奇葩，也是世界文库的珍品，被英国著名小说家和戏剧家毛姆列为世界十大小说经典名著之一。 名家全译本 华中师范大学教授、博导，英美文学研究专家、著名翻译家罗良功权威译作，文学经典完美呈现。 名著典藏版 国际大师插图（国际插画家CharlesE.Brock原版插图），融合文学性和艺术性的插图作品，图文并茂、版式疏朗、用纸考究、装帧精美，打造世界名著典藏版本。 中央级出版社 全国百佳出版社、中央级专业翻译出版社权威打造。 本套世界文学名著，选用名家的全译本，并配有精美的国际大师插图，在内容和形式上，将营造极佳的阅读体验。这在国内的名著出版工作中，是非常难得的。 国际翻译界 北极光 杰出文学翻译奖得主</td>
            <td>9.4</td>
            <td>已阅</td>
        </tr>

            <td>2</td>
            <td>文学类</td>
            <td>苦儿流浪记</td>
            <td>（法）埃克多·马洛 著</td>
            <td>这部小说问世后，曾被译成英、德、俄、日等多种文字，而且一直到一百多年后的今天，它依然在法国被重印出版，并多次被搬上银幕。 名家全译本 浙江大学外国语学院教授、著名翻译家唐珍译作，文学经典完美呈现。 名著典藏版 国际大师插图，*能融合文学性和艺术性的插图作品，图文并茂、版式疏朗、用纸考究、装帧精美，打造世界名著完美典藏版本。 中央级出版社 全国百佳出版社、中央级专业翻译出版社打造。 本套世界文学名著，选用名家的全译本，并配有精美的国际大师插图，在内容和形式上，将营造极佳的阅读体验。这在国内的名著出版工作中，是非常难得的的 国际翻译界 北极光 杰出文学翻译奖得主 许渊冲</td>
            <td>9.3</td>
            <td>已阅</td>
        </tr>
        <tr>
            <td>3</td>
            <td>文学类</td>
            <td>呼啸山庄</td>
            <td>（英）勃朗特 著</td>
            <td>外国经典文学书目，一部震撼人心的 神秘莫测的怪书 。 名家全译本 浙江大学教授、浙江省作协外国文学委员会主任、著名翻译家宋兆霖权威译作，文学经典完美呈现。 名著典藏版 国际大师插图（国际插画家BarnettFreedman原版插图），融合文学性和艺术性的插图作品，图文并茂、版式疏朗、用纸考究、装帧精美，打造世界名著典藏版本。 中央级出版社 全国百佳出版社、中央级专业翻译出版社权威打造。 本套世界文学名著，选用名家的全译本，并配有精美的国际大师插图，在内容和形式上，将营造极佳的阅读体验。这在国内的名著出版工作中，是非常难得的。</td>
            <td>9.4</td>
            <td>下次一定</td>
        </tr>
        <tr>
            <td>4</td>
            <td>文学类</td>
            <td>岛上书店</td>
            <td>(美)加·泽文 著</td>
            <td>◆《岛上书店》是一本现象级全球畅销书。 ◆每个人的生命中，都有无比艰难的那一年，将人生变得美好而辽阔。 ◆《岛上书店》写的是书店老板的一生，但真正讲述的，是全人类的阅读、生活和爱。 ◆《岛上书店》是一本关于全世界所有书的书，写给全世界所有真正爱书的人。 ◆席卷《出版人周刊》《纽约时报》《华盛顿邮报》《图书馆日报》各大榜单！ ◆一年之内，畅销美国、英国、德国、法国、荷兰、西班牙、意大利、丹麦、芬兰、挪威、瑞典、冰岛、波兰、加拿大、土耳其、以色列、巴西、日本、韩国等30国！ ◆没有谁是一座孤岛，每本书都是一个世界。《岛上书店》讲述了一段《查令十字街84号》之后不曾再有的书缘情缘。 ◆一个失去了一切的人，如何重新找到牵挂，书，爱情，宴会和欢笑，以及一切美好生活。</td>
            <td>9.2</td>
            <td>下次一定</td>
        </tr>
        <tr>
            <td>5</td>
            <td>言情类</td>
            <td>半城风月</td>
            <td>十四郎</td>
            <td>小说讲述了烛阴氏公主玄乙与华胥氏神君扶苍的爱恨纠葛。千万年不化，烛阴白雪。至死不渝，纯钧为证！这是轻松甜宠型的一本古言仙侠小说，女主玄乙是烛阴氏小公主，聪慧调皮爱捣蛋，男主扶苍是华胥氏神君，高冷清贵又腹黑。两人一开始是冤家，相互嫌弃但是又不可克制地爱上了对方！男主超级深情，女主无论如何落魄，男主角也始终对她不离不弃，即使与全天下为敌，也要护她周全。小说设定新颖，人物塑造饱满，情节文笔俱佳，男女主相处时候的很多细节都爆戳萌点，书荒的小伙伴一定不要错过哦！</td>
            <td>8.4</td>
            <td>下次一定</td>
        </tr>
        <tr>
            <td>6</td>
            <td>科幻类</td>
            <td>当睡者醒来时</td>
            <td>赫伯特·乔治·威尔斯</td>
            <td>异星球上的主人公在冬眠了200年后醒来，发现未来世界的大都市比过去的时代更为糟糕。他在小说前言中写道：“这篇故事所描述的大都市正是资本主义胜利的恶梦。”造成人类社会的未来变得更加邪恶、堕落的制度原因替代了技术因素，“人祸”成了科幻小说的主题</td>
            <td>9.0</td>
            <td>下次一定</td>
        </tr>
    </tbody>
</table>
<div>
    <p align=center>
            <span style="font-size: 40pt; filter: shadow(color=black); width: 71.27%; color: #72c761; line-height: 150%; font-family: 华文彩云; height: 60px">
            <b>别下次一定了，现在就看吧啊啊啊啊啊啊！</b>
            </span>
    </p>

</div>

<%--添加新书模块--%>
<div id="caption">
        <a style="font-size: 48px; display: block; text-align: center">看点新书</a>
    <div style="position: relative; left: 14%">
        <div class="input">
            <input type="text" id="id" placeholder="序号">
            <input type="text" id="type" placeholder="类别">
            <br>
            <input type="text" id="author" placeholder="作者">
            <input type="text" id="name" placeholder="书名">
            <br>
            <input type="text" id="detail" placeholder="内容">
            <input type="text" id="score" placeholder="评分">
            <br>
            <input type="text" id="status" placeholder="状态">
            <input class="btn" type="button" value="添加" id="btn_add">
        </div>
    </div>
</div>
<div>
    <p style="text-align: center">
        <marquee scrollamount=2 width=100 height=100 scrolldely="10" align="center">
            <b>
        <span style="font-weight: normal; font-size: 60pt; line-height: normal; font-style: normal; font-variant: normal font-family: 华文彩云; color: #b2f6a6; ">
            <b>多  多  </b>
        </span>
            </b>
        </marquee>
        <marquee scrollamount=2 width=100 height=100 scrolldely="10" align="center">
            <b>
        <span style="font-weight: normal; font-size: 60pt; line-height: normal; font-style: normal; font-variant: normal font-family: 华文彩云; color: #b2f6a6; ">
            <b>读  读  </b>
        </span>
            </b>
        </marquee>
        <marquee scrollamount=2 width=100 height=100 scrolldely="10" align="center">
            <b>
        <span style="font-weight: normal; font-size: 60pt; line-height: normal; font-style: normal; font-variant: normal font-family: 华文彩云; color: #b2f6a6; ">
            <b>书  书  </b>
        </span>
            </b>
        </marquee>
        <marquee scrollamount=2 width=100 height=100 scrolldely="10" align="center">
            <b>
        <span style="font-weight: normal; font-size: 60pt; line-height: normal; font-style: normal; font-variant: normal font-family: 华文彩云; color: #b2f6a6; ">
            <b>吧  吧  </b>
        </span>
            </b>
        </marquee>
    </p
</div>
>



<script>
    //搜索框
    function search(){
        //获取选择的搜索类型
        var storeId = document.getElementById('table1');//获取table的id标识
        var rowsLength = storeId.rows.length;//表格总共有多少行

        var index=document.getElementById("selectId").selectedIndex;//获取当前选择项的索引.

        document.getElementById("selectId").options[index].text;//获取当前选择项的文本.

        document.getElementById("selectId").options[index].innerHTML;//获取当前选择项的文本.

        var obj=document.getElementById("selectId");
        for(i=0;i<obj.length;i++) {//下拉框的长度就是它的选项数.

            if(obj[i].selected==true) {

                var text=obj[i].text;//获取当前选择项的文本.
            }
        }

        for(var i=1;i<rowsLength;i++){//按表的行数进行循环，本例第一行是标题，所以i=1，从第二行开始筛选（从0数起）

            var searchText = storeId.rows[i].cells[1].innerHTML;//取得table行，列的值

            // alert(searchText);
            if(text==searchText){//用match函数进行筛选，如果input的值，即变量 key的值为空，返回的是ture，
                storeId.rows[i].style.display='';//显示行操作
            }else{
                storeId.rows[i].style.display='none';//隐藏行操作
            }
        }
    }
</script>
<script>
    var storeId = document.getElementById('table1');//获取table的id标识
    function allBook(){
        var rowsLength = storeId.rows.length;//表格总共有多少行
        for(var i=1;i<rowsLength;i++) {
            storeId.rows[i].style.display = '';
        }
    }//显示全部行
</script>
<script>
    /* 1.添加数据
            1.给添加按钮绑定单机事件
            2.获取文本框的内容
            3.创建tr td ,设置td的文本文本框的内容
            4.创建tr
            5.将td添加到tr中
            6.获取table,将tr添加到table中

     */
    //获取按钮
    document.getElementById("btn_add").onclick = function () {
        //获取文本框的内容
        var id = document.getElementById("id").value;
        var type = document.getElementById("type").value;
        var name = document.getElementById("name").value;
        var author = document.getElementById("author").value;
        var detail = document.getElementById("detail").value;
        var score = document.getElementById("score").value;
        var status = document.getElementById("status").value;

        var selectId = document.getElementById("selectId");

        var typeId = document.getElementsByName("typeId").length;
        var j = 0;
        for (var i = 0; i<typeId; i++){
            var typeid = document.getElementsByName("typeId")[i].value;
            if (type!=typeid){
                j++;
                if (j++==typeId){
                    var op_typeid = document.createElement("option");
                    op_typeid.value=""+i+1+"";
                    op_typeid.text = type;
                    selectId.add(op_typeid);
                }
            }
        }

        //创建td 赋值td的标签体
        //id 的td
        var td_id = document.createElement("td");
        var text_id = document.createTextNode(id);
        td_id.appendChild(text_id);

        //name 的td
        var td_name = document.createElement("td");
        var text_name = document.createTextNode(name);
        td_name.appendChild(text_name);

        var td_author = document.createElement("td");
        var text_author = document.createTextNode(author);
        td_author.appendChild(text_author);

        var td_type = document.createElement("td");
        var text_type = document.createTextNode(type);
        td_type.appendChild(text_type);

        var td_detail = document.createElement("td");
        var text_detail = document.createTextNode(detail);
        td_detail.appendChild(text_detail);

        var td_score = document.createElement("td");
        var text_score = document.createTextNode(score);
        td_score.appendChild(text_score);

        var td_status = document.createElement("td");
        var text_status = document.createTextNode(status);
        td_status.appendChild(text_status);



        //创建tr
        var tr = document.createElement("tr");
        //添加td到tr中
        tr.appendChild(td_id);
        tr.appendChild(td_name);
        tr.appendChild(td_author);
        tr.appendChild(td_type);
        tr.appendChild(td_detail);
        tr.appendChild(td_score);
        tr.appendChild(td_status);

        //获取table
        var table = document.getElementsByTagName("table")[0];
        table.appendChild(tr);

    }

</script>

</body>
</html>
