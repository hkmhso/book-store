﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"></c:set>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>我的订单 - 达内学子书城</title>
    <link href="${ctx}/css/my.order.css" rel="stylesheet" />
    <link href="${ctx}/css/header.css" rel="stylesheet" />
    <link href="${ctx}/css/footer.css" rel="stylesheet" />
    <link href="${ctx}/css/set.css" rel="stylesheet" />
    <link href="${ctx}/js/ligerUI/skins/ligerui-icons.css" rel="stylesheet"/>
    <link href="${ctx}/js/ligerUI/skins/Aqua/css/ligerui-dialog.css" rel="stylesheet"/>
    <script src="${ctx}/js/jquery-3.1.1.min.js"></script>
	<script src="${ctx}/js/index.js"></script>
	<script src="${ctx}/js/jquery.page.js"></script>
	<script src="${ctx}/js/order.js"></script>
	<script src="${ctx}/js/jquery-migrate-1.2.1.js"></script>
	<script src="${ctx}/js/ligerUI/js/core/base.js"></script>
	<script src="${ctx}/js/ligerUI/js/plugins/ligerDrag.js"></script> 
	<script src="${ctx}/js/ligerUI/js/plugins/ligerDialog.js"></script>
	<script src="${ctx}/js/ligerUI/js/plugins/ligerResizable.js"></script>
	<script src="${ctx}/js/bookstore.js"></script>
	<script src="${ctx}/js/jquery.cookie.js"></script>
</head>
<body>
<div id="header">
   <!-- 引入页面顶部文件 -->
	<%@include file="../commons/top.jsp" %>
    <!-- 主导航-->
    <nav id="nav1">
        <!-- 我的订单导航栏-->
        <div id="nav_order" class="lf">
            <ul>
                <li></li>
            </ul>
        </div>
    </nav>
</div>
<!--我的订单内容区域 #container-->
<div id="container" class="clearfix">
    <!-- 左边栏-->
    <div id="leftsidebar_box" class="lf">
        <div class="line"></div>
        <dl class="my_order">
            <dt onClick="changeImage()">帐号管理<img src="${ctx}/img/myOrder/myOrder1.png"></dt>
            <dd class="first_dd"><a href="${ctx}/user/password-change.html">修改密码</a></dd>
            <dd><a href="${ctx}/address/address-add.html">添加地址</a></dd>
        </dl>
    </div>
    <!-- 右边栏-->
    <div class="rightsidebar_box rt" >
        <div class="order_empty">
         <div id="cover" class="rt">
      <form id="fm-edit" method="post" name="form1">
            <!--下单图书编号-->
      		<c:forEach items="${paramValues.book}" var="book">
      			<input type="hidden" name="book" value="${book}">
      		</c:forEach>
            <!--下单的图书数量-->
      		<c:forEach items="${paramValues.count}" var="count">
      			<input type="hidden" name="count" value="${count}">
      		</c:forEach>
            <div class="txt">
                <p>修改地址
                    <span>
                        <a href="${ctx}/">继续购物</a>
                    </span>
                </p>
                <%--隐藏域，地址id--%>
                <input value="${selByRid.rid}" type="hidden" name="rid">
                <div class="text">
                    <input value="${selByRid.receiver}" type="text" placeholder="收件人" name="receiver" id="receiver" required>
                    <span></span>
                </div>
                <div class="text">
                    <input value="${selByRid.address}" type="text" placeholder="地址" id="address" name="address" required minlength="6" maxlength="25">
                    <span></span>
                </div>
				<div class="text">
                    <input value="${selByRid.rphone}" type="text" placeholder="联系电话" id="rphone" name="rphone" required minlength="11" maxlength="11">
                    <span></span>
                </div>
                <input class="button_login" type="button" value="修改" id="bt-edit" />
            </div>
        </form>
        </div>
        </div>
    </div>
</div>

<!-- 引入页面底部文件 -->
<%@include file="../commons/foot.jsp" %>
<script type="text/javascript">
$(function () {
    //修改地址
    $('#bt-edit').click(function(){
        var referer="${header.Referer}";
        console.log("address-edit.html->>"+referer);
        //PS:每点击一次修改地址，就获取一次TT_TOKEN，从而可以判断用户是否退出了
        var _token = $.cookie("TT_TOKEN");
        console.log("address-edit.jsp->>每点击一次修改地址后的TT_TOKEN："+_token);
        //用户还没登录，不能修改地址
        if(!_token){
            console.log("address-edit.jsp->>用户还没登录，不能修改地址");
            window.location.href="${ctx}/address/no_login_address.action";
            return;
        }
        console.log("address-edit.jsp->>用户登录了，可以修改地址了");
        //读取用户的输入——表单序列化
        var inputData = $('#fm-edit').serialize();
          console.log(">>>"+inputData);
        //异步提交请求
        $.ajax({
            async: true,
            type: 'POST',
            url: '${ctx}/address/updAddress.action',
            data: inputData,
            success: function(txt, msg, xhr){
                // alert("*"+txt+"*");
                if(txt=='yes'){//修改成功
                    alert("修改地址成功");
                    if(referer.search("/order-confirm.html")!==-1){
                        //修改成功，则跳到确认订单页面
                        $("#fm-edit").attr("action","/order/orderConfirm.action");
                        //提交表单即可,表单元素包含了要确认订单的图书编号和图书数量
                        $('#fm-edit').submit();
                    }
                }else{ //修改失败
                    $.ligerDialog.error("<span style='color: red;'>修改地址失败!!</span>");
                }
            }
        });
    });
    //用户按下Enter键的监听事件
    $(document).keydown(function(event){
      if(event.which==13){
          $('#bt-edit').trigger("click");
      }
    })
});
</script>
</body>
</html>
