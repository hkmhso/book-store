﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"></c:set>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>400页面</title>
    <link href="${ctx}/css/header.css" rel="stylesheet"/>
    <link href="${ctx}/css/footer.css" rel="stylesheet"/>
    <link href="${ctx}/css/404.css" rel="stylesheet"/>
    <script src="${ctx}/js/jquery-3.1.1.min.js"></script>
	<script src="${ctx}/js/index.js"></script>
</head>
<body>
<!-- 引入页面顶部文件 -->
<%@include file="../commons/top.jsp" %>
<!-- nav主导航-->
<!--400-->
<div id="container">
    <div class="rightsidebar_box rt" >
        <div class="sys_err">
            <img src="${ctx}/img/404/404_img1.png" alt=""/>
            <p>
                <img src="${ctx}/img/404/404_img2.png" alt=""/>服务器不理解请求语法！！！！
            </p>
            <span>快去看看别的吧！<b><a href="${ctx}/">回首页&gt;&gt;</a></b></span>
            <br/>
        </div>
    </div>
</div>
<!--为你推荐-->
<div id="recommended">
    <p>为你推荐<span>大家都在看</span></p>
    <div id="demo" style="width:1000px;overflow:hidden;"><!-- 外面的大框 -->
        <div id="indemo" style="float: left;width: 200%;"><!-- 宽度特别大 -->
            <div id="demo1" style="float:left"><!-- 第一个宽度显示 -->
                <div class="detail_1 lf">
                   <div class="detail_img1">
                       <a href="${ctx}/book/detail.action/9787302435167"><img src="${ctx}/img/recommend/recommend_img1.jpg" border="0"></a>
                   </div>
                   <p>大数据架构师指南</p>
               </div>
               <div class="detail_1 lf">
                   <div class="detail_img1">
                       <a href="${ctx}/book/detail.action/9787115335500"><img src="${ctx}/img/recommend/recommend_img2.jpg" border="0"></a>
                   </div>
                   <p>深入浅出Node.js</p>
               </div>
               <div class="detail_1 lf">
                   <div class="detail_img1">
                       <a href="${ctx}/book/detail.action/9787111213826"><img src="${ctx}/img/recommend/recommend_img3.jpg" border="0"></a>
                   </div>
                   <p>Java编程思想</p>
               </div>
               <div class="detail_1 lf">
                   <div class="detail_img1">
                       <a href="${ctx}/book/detail.action/9787111545682"><img src="${ctx}/img/recommend/recommend_img4.jpg" border="0"></a>
                   </div>
                   <p>Linux运维最佳实践</p>
               </div>
               <!--</div>-->
            </div>
            <div id="demo2" style="float:left">
            </div>
        </div>
        <!-- 宽度超大 -->
    </div>
    <!-- 外面大框 -->
</div>
<!-- 引入页面底部文件 -->
<%@include file="../commons/foot.jsp" %>
<!--图片轮播悬停进入详情页效果-->
<script>
    var speed = 20;
    var tab = document.getElementById("demo");
    var tab1 = document.getElementById("demo1");
    var tab2 = document.getElementById("demo2");
    tab2.innerHTML = tab1.innerHTML;
    function Marquee() {
        if (tab2.offsetWidth - tab.scrollLeft <= 0)
            tab.scrollLeft -= tab1.offsetWidth
        else {
            tab.scrollLeft++;
        }
    }
    var MyMar = setInterval(Marquee, speed);
    tab.onmouseover = function () {
        clearInterval(MyMar)
    };
    tab.onmouseout = function () {
        MyMar = setInterval(Marquee, speed)
    };
</script>
</body>
</html>
