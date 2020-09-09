﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"></c:set>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>达内商城学子注册页面</title>
    <link href="${ctx}/css/header.css" rel="stylesheet"/>
    <link href="${ctx}/css/footer.css" rel="stylesheet"/>
    <link href="${ctx}/css/animate.css" rel="stylesheet"/>
    <link href="${ctx}/css/login.css" rel="stylesheet" />
    <link href="${ctx}/js/ligerUI/skins/ligerui-icons.css" rel="stylesheet"/>
    <link href="${ctx}/js/ligerUI/skins/Aqua/css/ligerui-dialog.css" rel="stylesheet"/>
    <!--弹出的小广告-->
	<script src="${ctx}/js/jquery-3.1.1.min.js"></script>
	<script src="${ctx}/js/jquery-migrate-1.2.1.js"></script>
	<script src="${ctx}/js/ligerUI/js/core/base.js"></script>
	<script src="${ctx}/js/ligerUI/js/plugins/ligerDrag.js"></script> 
	<script src="${ctx}/js/ligerUI/js/plugins/ligerDialog.js"></script>
	<script src="${ctx}/js/ligerUI/js/plugins/ligerResizable.js"></script>
	<script src="${ctx}/js/bookstore.js"></script>
	<script src="${ctx}/js/jquery.cookie.js"></script>
</head>
<body>
<!--模态框-->
<div class="modal">
  <div class="modal_header">
    提示信息
  </div>
  <div class="modal_content">
    恭喜您已成功注册达内学子书城！
  </div>
</div>
<!-- 页面顶部-->
<header id="top">
  <div class="top">
    <img src="${ctx}/img/header/logo.png" alt=""/>
    <span>欢迎注册</span>
  </div>
</header>
<div class="parent">
  <div class="container">
    <div class="panel rt">
      <form id="fm-register" method="post" action="regist.action">
        <div class="txt">
          <p id="newuser">新用户注册
            <span>
              <a href="${ctx}/chooseRole.html" id="dlogin">直接登录</a>
            </span>
          </p>
        </div>
        <div class="form-group">
          <label for="uname">用户名：</label>
          <input autocomplete required minlength="6" maxlength="9" type="text" placeholder="请输入用户名" autofocus name="uname" id="uname"/>
          <span class="msg-default">用户名长度在6到9位之间</span>
        </div>
        <div class="form-group">
          <label for="upwd">登录密码：</label>
          <input required type="password" minlength="6" maxlength="12" placeholder="请输入密码" name="upwd" autofocus id="upwd"/>
          <span class="msg-default hidden">密码长度在6到12位之间</span>
        </div>
        <div class="form-group">
          <label for="email">邮箱：</label>
          <input autocomplete required type="email" placeholder="请输入邮箱地址" name="email" id="email"/>
          <span class="msg-default hidden">请输入合法的邮箱地址</span>
        </div>
        <div class="form-group">
          <label for="phone">手机号：</label>
          <input id="phone" name="phone" placeholder="请输入您的手机号" pattern="(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$" required type="text" />
          <span class="msg-default hidden">请输入合法的手机号</span>
        </div>
        <div class="form-group">
          <label></label>
          <input type="button" value="提交注册信息" id="bt-register"/>
        </div>
      </form>
    </div>
  </div>
</div>
<!-- 引入页面底部文件 -->
<%@include file="../commons/foot.jsp" %>
<script>
  //点击注册监听事件
  $('#bt-register').click(function(){
	  var lengths=0;
	    $('.form-group').each(function(){
	      if($(this).find('span').hasClass('msg-success')){
	        lengths++;
	      }
	    });
	    if(lengths==4){
	    	$('.modal').fadeIn();
	    	setTimeout(function(){
	    		//读取用户的输入——表单序列化
	    	    var inputData = $('#fm-register').serialize();
	    		/*发起异步请求，询问服务器用户名是否已经存在*/
	    	      $.ajax({
	    			  type:'post',
	    			  data:inputData,
	    			  url:'${ctx}/user/regist.action',
	    			  success:function(data){
	    		          // alert("*"+data+"*");
	    		          if(data=='yes'){
	    		        	//跳到登录页面
	    	                window.location.href = "${ctx}/chooseRole.html";
	    		          }else{
	    		        	  $.ligerDialog.error("<span style='color: red;'>注册失败!!</span>");
	    		          }
	    			  }
	    		  });
	    	},2000);
	    }
  })
  	//用户按下Enter键的监听事件
   	$(document).keydown(function(event){
	  if(event.which==13){
		  $('#bt-register').trigger("click");
	  }
  	})
</script>
<script>
  /*1.对用户名进行验证*/
  $('#uname').blur(function(){
    if(this.validity.valueMissing){
      this.nextElementSibling.innerHTML = '用户名不能为空';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('用户名不能为空');
    }else if(this.validity.tooShort){
      this.nextElementSibling.innerHTML = '用户名不能少于6位';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('用户名不能少于6位');
    }else {
      this.nextElementSibling.innerHTML = '用户名格式正确';
      this.nextElementSibling.className = 'msg-success';
      this.setCustomValidity('');
      var data = $("#uname").val();
      if(!data){   //用户没有输入任何内容
        return;
      }
      /*发起异步请求，询问服务器用户名是否已经存在*/
      $.ajax({
		  type:'post',
		  data:'uname='+data,
		  url:'${ctx}/user/unameCheck.action',
		  success:function(data){
	          // alert("*"+data+"*");
	          if(data=='yes'){
	        	  $.ligerDialog.error("<span style='color: red;'>该用户名已被占用!!</span>");
	          }
		  }
	  });
    }
  });
  $('#uname').focus(function(){
    this.nextElementSibling.innerHTML = '用户名长度在6到9位之间';
    this.nextElementSibling.className = 'msg-default';
  });
  /*2.对密码进行验证*/
  $('#upwd').blur(function(){
    if(this.validity.valueMissing){
      this.nextElementSibling.innerHTML = '密码不能为空';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('密码不能为空');
    }else if(this.validity.tooShort){
      this.nextElementSibling.innerHTML = '密码长度在尽量别少于6位';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('密码长度在尽量别少于6位');
    }else {
      this.nextElementSibling.innerHTML = '密码格式正确';
      this.nextElementSibling.className = 'msg-success';
      this.setCustomValidity('密码格式正确');
    }
  });
  $('#upwd').focus(function(){
    this.nextElementSibling.innerHTML = '密码长度在6到12位之间';
    this.nextElementSibling.className = 'msg-default';
  });
  /*3.对邮箱地址进行验证*/
  $('#email').blur(function(){
    if(this.validity.valueMissing){
      this.nextElementSibling.innerHTML = '邮箱不能为空';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('邮箱不能为空');
    }else if(this.validity.typeMismatch){
      this.nextElementSibling.innerHTML = '邮箱格式不正确';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('邮箱格式不正确');
    }else {
      this.nextElementSibling.innerHTML = '邮箱格式正确';
      this.nextElementSibling.className = 'msg-success';
      this.setCustomValidity('');
      var data = $("#email").val();
      if(!data){   //用户没有输入任何内容
        return;
      }
      /*发起异步请求，询问服务器邮箱是否已经存在*/
      $.ajax({
		  type:'post',
		  data:'email='+data,
		  url:'${ctx}/user/emailCheck.action',
		  success:function(data){
	          console.log('开始处理响应数据');
	          // alert("*"+data+"*");
	          if(data=='yes'){
	        	  $.ligerDialog.error("<span style='color: red;'>该邮箱已被占用!!</span>");
	          }
		  }
	  });
    }
  });
  $('#email').focus(function(){
    this.nextElementSibling.innerHTML = '请输入合法的邮箱地址';
    this.nextElementSibling.className = 'msg-default';
  });
  /*4.对手机号进行验证*/
  $('#phone').blur(function(){
    if(this.validity.valueMissing){
      this.nextElementSibling.innerHTML = '手机号不能为空';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('手机号不能为空');
    }else if(this.validity.patternMismatch){
      this.nextElementSibling.innerHTML = '手机号格式不正确';
      this.nextElementSibling.className = 'msg-error';
      this.setCustomValidity('手机号格式不正确');
    }else {
      this.nextElementSibling.innerHTML = '手机号格式正确';
      this.nextElementSibling.className = 'msg-success';
      this.setCustomValidity('');
      var data = $("#phone").val();
      if(!data){   //用户没有输入任何内容
        return;
      }
      /*发起异步请求，询问服务器手机号是否已经存在*/
      $.ajax({
		  type:'post',
		  data:'phone='+data,
		  url:'${ctx}/user/phoneCheck.action',
		  success:function(data){
	          // alert("*"+data+"*");
	          if(data=='yes'){
	        	  $.ligerDialog.error("<span style='color: red;'>该号码已被占用!!</span>"); 
	          }
		  }
	  });
    }
  });
  $('#phone').focus(function(){
    this.nextElementSibling.innerHTML = '请输入合法的手机号';
    this.nextElementSibling.className = 'msg-default';
  });
</script>
</body>
</html>