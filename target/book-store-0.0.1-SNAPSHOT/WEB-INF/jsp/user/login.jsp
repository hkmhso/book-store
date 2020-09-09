<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"></c:set>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>达内商城学子登陆页面</title>
    <link href="${ctx}/css/header.css" rel="stylesheet"/>
    <link href="${ctx}/css/footer.css" rel="stylesheet"/>
    <link href="${ctx}/css/animate.css" rel="stylesheet"/>
    <link href="${ctx}/css/login.css" rel="stylesheet"/>
    <link href="${ctx}/js/ligerUI/skins/ligerui-icons.css" rel="stylesheet"/>
    <link href="${ctx}/js/ligerUI/skins/Aqua/css/ligerui-dialog.css" rel="stylesheet"/>
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
<!-- 页面顶部-->
<header id="top">
    <div class="top">
        <img src="${ctx}/img/header/logo.png" alt=""/>
        <span>欢迎登录</span>
    </div>
</header>
<div id="container">
    <div id="cover" class="rt">
        <form id="fm-login" name="form1" method="post" action="" >
            <div class="txt">
                <p>登录学子商城
                    <span>
                        <a href="${ctx}/user/regist.html">新用户注册</a>
                    </span>
                </p>
                <div class="text">
                    <input type="text" placeholder="请输入您的用户名" name="uname" id="uname" required>
                    <span></span>
                </div>

                <div class="text">
                    <input type="password" id="upwd" placeholder="请输入您的密码" name="upwd" required minlength="6" maxlength="15">
                    <span></span>
                </div>
                <div class="chose">

                </div>
                <input class="button_login" type="button" value="登录" id="bt-login" />
            </div>
        </form>
    </div>
</div>
<!--错误提示-->
<div id="showResult"></div>
<!-- 引入页面底部文件 -->
<%@include file="../commons/foot.jsp" %>
<script>
	$(function(){
	    $("#uname").blur(function(){
	        var data = $("#uname").val();
	        if (data == null || data.trim() == "") {
	            $.ligerDialog.error("<span style='color: red;'>用户名不能为空!!</span>");
	            return false;
	        }
	        $.ajax({
	            type:"POST",
	            url:"${ctx}/user/unameCheck.action",
	            data:"uname="+data,
	           /*  beforeSend:function(XMLHttpRequest)
	            {
	                $.ligerDialog.success("<span style='color: green;'>正在查询!!</span>");
	            }, */
	            success:function(msg)
	            {
	                if(msg ==="yes"){
	                	$.ligerDialog.success("<span style='color: green;'>用户名正确!!</span>");
	                }else if(msg === 'no'){
	                    /* $("#showResult").text("该用户不存在");
	                    $("#showResult").css("color","red"); */
	                	$.ligerDialog.error("<span style='color: red;'>该用户不存在!!</span>");
	                }
	            },
	            error:function()
	            {
	                //错误处理
	            	$.ligerDialog.error("<span style='color: red;'>系统异常!!</span>");
	            }
	        });
	    });
	    //点击登录监听事件
	    $('#bt-login').click(function(){
	        //读取用户的输入——表单序列化
	        var inputData = $('#fm-login').serialize();
	        //异步提交请求，进行验证
	        $.ajax({
	        	async: true,
	            type: 'POST',
	            url: '${ctx}/user/login.action',
	            data: inputData,
	            success: function(txt, msg, xhr){
	            	// alert("*"+txt+"*");
	                if(txt=='yes'){  //登录成功
	                    var loginName = $('[name="uname"]').val();
	                    $.ligerDialog.success("<span style='color: green;'>登录成功!!</span>");
                        var referer="${sessionScope.referer}";
                        console.log(referer);
                        console.log("login.jsp->>"+referer.search("/user/regist.html"));
	                    //登录成功后
	                    if(referer.search("/regist.html")!=-1||referer.search("/password-change.html")!=-1){
	                    	//[1]如果是原来的页面是注册页面，则直接跳到主页面即可
	                    	window.location.href = "${ctx}/";
	                    }else{
		                    //[2]否则，跳回到原来的页面
		                    window.location.href = referer;
	                    }
	                }else{ //登录失败
	                	$.ligerDialog.error("<span style='color: red;'>登录失败!!</span>");
	                }
	            }
	        });
	    });
	    //用户按下Enter键的监听事件
	    $(document).keydown(function(event){
	    	 if(event.keyCode == 13){
	    		//模拟用户点击登录按钮
				$("#bt-login").trigger("click");
			 }
	    })
	})
</script>
</body>
</html>
