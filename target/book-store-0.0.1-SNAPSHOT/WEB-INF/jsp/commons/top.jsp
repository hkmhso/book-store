<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 页面顶部-->
<header id="top">
	<div id="logo" class="lf">
	    <img src="${ctx}/img/header/logo.png" alt="logo"/>
	</div>
	<div id="top_input" class="lf">
	    <input id="input" type="text" value="${param.title}" placeholder="请输入您要搜索的内容"/>
	
	    <a href="javascript:return false" class="rt"><img id="search" src="${ctx}/img/header/search.png" alt="搜索"/></a>
	</div>
	<div class="rt">
	    <ul class="lf">
	        <li><a href="${ctx}/" >首页</a><b>|</b></li>
	        <li id="loginbar">您好！欢迎来到学子书城！<a href="${ctx}/chooseRole.html">[登录]</a>
	        &nbsp;<a href="${ctx}/user/regist.html">[免费注册]</a><b>|</b></li>
	        <li><a href="${ctx}/collect/showPageCollInfo.action" >收藏</a><b>|</b></li>
	        <li><a href="${ctx}/order/showPageOrdersInfo.action" >订单</a><b>|</b></li>
	        <li><a href="${ctx}/cart/showPageCartInfo.action" >购物车</a><b>|</b></li>
	        <li><a href="${ctx}/user/password-change.html">设置</a><b>|</b></li>
	       <%--  <li><a href="${ctx}/user/logout.action">退出</a><b>|</b></li> --%>
	        <li><a href="${ctx}/user/lookforward.html">帮助</a></li>
	    </ul>
	</div>
</header>
<script type="text/javascript">
	//搜索
	$("#search").click(function(){
		//获取搜索框的数据
		var title=$("input:text").val();
		if(title==null||title.trim()==''){
			//错误处理
        	$.ligerDialog.error("<span style='color: red;'>请输入关键字!!</span>");
			return;
		}
		window.location.href="${ctx}/book/showPage.action?title="+title;
	});
	//用户按下Enter键的监听事件
    $(document).keydown(function(event){
    	 if(event.keyCode == 13){
    		//模拟用户点击搜索按钮
			$("#search").trigger("click");
		 }
    })
</script>
</html>
 