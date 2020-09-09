﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"></c:set>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>我的订单 - 达内学子商城</title>
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
      <form name="form1" id="fm-changep" method="post" action="">
            <div class="txt">
                <p>修改密码
                    <span>
                        <a href="${ctx}/">继续购物</a>
                    </span>
                </p>
                <input name="uname" id="uname" type="hidden" value="${sessionScope.tuser.uname}" />
                <div class="text">
                    <input type="password" placeholder="请输入当前密码" name="upwd" id="upwd" required>
                    <div id="accountCheck"></div>
                </div>
                <div class="text">
                    <input type="password" placeholder="请输入新密码" name="npwd" id="npwd" required minlength="6" maxlength="15">
                </div>
				<div class="text">
                    <input type="password" placeholder="请确认新密码" name="cpwd" id="cpwd" required minlength="6" maxlength="15">
                    <div id="pwdValidate"></div>
                </div>
                <div class="text">
	                <input class="button_login" type="button" value="提交" id="bt-changep" />
	                <div id="changeFail"></div>
                </div>
            </div>
        </form>
        </div>
        </div>
    </div>
</div>
<!-- 引入页面底部文件 -->
<%@include file="../commons/foot.jsp" %>
<script type="text/javascript">
	// 验证原密码是否正确
	$('#upwd').blur(function(){
		var uname = $("#uname").val();
		var upwd = $("#upwd").val();
		console.log(">>>"+uname);
	    if (upwd == null || upwd.trim()== "") {
	    	$.ligerDialog.error("<span style='color: red;'>原密码不能为空!!</span>");
	        return false;
	    }
	  	//读取用户的输入——表单序列化
	    var inputData = $('#fm-changep').serialize();
	    $.ajax({
	        type:"POST",
	        url:"${ctx}/user/upwdCheck.action",
	        data:inputData,
	        success:function(data){
	            if(data == "yes"){
	            	$.ligerDialog.success("<span style='color: green;'>原密码正确!!</span>");
	            }else if(data == "no"){
	            	$.ligerDialog.error("<span style='color: red;'>原密码错误!!</span>");
	            }
	        }
	    });
	});
	//验证新密码和确认密码是否一致
	$("#cpwd").blur(function(){
		var npwd = $("#npwd").val();
		var cpwd = $("#cpwd").val();
		if(npwd.trim()==cpwd.trim()){
			$.ligerDialog.success("<span style='color: green;'>新密码和确认密码一致!!</span>");
        }else{
        	$.ligerDialog.error("<span style='color: red;'>新密码和确认密码不一致!!</span>");
		}
	});
	//修改密码
	$('#bt-changep').click(function(){
		//PS:每点击一次修改密码，就获取一次TT_TOKEN，从而可以判断用户是否退出了
    	var _token = $.cookie("TT_TOKEN");
    	console.log("password-change.jsp->>每点击一次修改密码后的TT_TOKEN："+_token);
    	//用户还没登录，不能修改密码
    	if(!_token){
    		console.log("password-change.jsp->>用户还没登录，不能修改密码");
    		window.location.href="${ctx}/user/no_login_user.action";
    		return;
    	}
    	console.log("password-change.jsp->>用户登录了，可以修改密码了");
        //读取用户的输入——表单序列化
	    var inputData = $('#fm-changep').serialize();
        //异步提交请求
        $.ajax({
        	async: true,
            type: 'POST',
            url: '${ctx}/user/changePassword.action',
            data: inputData,
            success: function(data){
            	// alert("*"+txt+"*");
                if(data=='yes'){  //修改成功
                	alert("修改成功");
                	//跳到登录页面
                    window.location.href = "${ctx}/chooseRole.html";
                }else{ //修改失败
                	$.ligerDialog.error("<span style='color: red;'>修改失败!!</span>");
                }
            }
        });
    });
	//用户按下Enter键的监听事件
   	$(document).keydown(function(event){
	  if(event.which==13){
		  $('#bt-changep').trigger("click");
	  }
  	})
</script>
</body>
</html>
