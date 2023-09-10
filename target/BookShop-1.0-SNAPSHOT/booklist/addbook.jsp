<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2022/10/25
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>opooc</title>

</head>
<style>
    .bounce {
        width: 300px;
        height: 100px;
        background-color: pink;
        overflow: hidden;
    }

    @keyframes bounce {
        0% {
            transform: translate3d(0, -100px, 0);
        }
        100% {
            transform: translate3d(0, 0, 0);
        }
    }
</style>
<body>
<div class="bounce">
</div>
<script >
    let dom = document.querySelector('.bounce')
    let string = '从天而降效果'
    for (let i=0;i<string.length;i++){
        let node = document.createElement('span');
        node.innerText = string[i]
        node.style.animation = 'bounce 0.75s 1 forwards'
        node.style.display = 'inline-block'
        node.style.transform = 'translate3d(0, -100px, 0)'
        node.style.animationDelay = ( 0.5 + ((i+1) / string.length) ) + 's'
        dom.appendChild(node)
    }
</script>
</body>

</html>
