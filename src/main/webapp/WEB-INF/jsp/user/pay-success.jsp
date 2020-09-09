<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"></c:set>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>达内学子商城——支付页面</title>
    <link href="${ctx}/css/header.css" rel="stylesheet" />
    <link href="${ctx}/css/footer.css" rel="stylesheet" />
    <link href="${ctx}/css/payment.css" rel="stylesheet"/>
    <script src="${ctx}/js/jquery-3.1.1.min.js"></script>
	<script src="${ctx}/js/index.js"></script>
	<script src="${ctx}/js/bookstore.js"></script>
	<script src="${ctx}/js/jquery.cookie.js"></script>
</head>
<body>
<!-- 引入页面顶部文件 -->
<%@include file="../commons/top.jsp" %>
<div id="navlist">
    <ul>
        <li class="navlist_gray_left"></li>
        <li class="navlist_gray">确认订单信息</li>
        <li class="navlist_gray_arrow"></li>
        <li class="navlist_gray">支付订单<b></b></li>
        <li class="navlist_gray_arrow"></li>
        <li class="navlist_blue">支付完成<b></b></li>
        <li class="navlist_blue_right"></li>
    </ul>
</div>
<div id="container">
    <div>
        <h1><i>支付结果</i><span class="rt">支付订单：${param.oid}&nbsp;
            支付金额：<b>${param.payment}元</b></span></h1>
    </div>
    <div class="rightsidebar_box rt">
        <div class="pay_result">
            <img src="${ctx}/img/pay/pay_succ.png" alt=""/>
            <p>支付成功</p>
            <span><a href="${ctx}/order/showSimpleOrderInfo.action?oid=${param.oid}&aid=${param.aid}&sta=${param.sta}">查看订单状态？ </a><b><a href="${ctx}/order/showSimpleOrderInfo.action?oid=${param.oid}&aid=${param.aid}&sta=${param.sta}">查看订单&gt;&gt;</a></b></span>
            <br/>
            达内学子商城不会以系统异常、订单升级为由，要求你点击任何链接进行退款操作！
        </div>
    </div>
</div>
<!-- 引入页面底部文件 -->
<%@include file="../commons/foot.jsp" %>
</body>
</html>
