﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"></c:set>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>确认订单</title>
    <link href="${ctx}/css/order.confirm.css" rel="stylesheet"/>
    <link href="${ctx}/css/header.css" rel="stylesheet"/>
    <link href="${ctx}/css/footer.css" rel="stylesheet"/>
    <link href="${ctx}/js/ligerUI/skins/ligerui-icons.css" rel="stylesheet"/>
    <link href="${ctx}/js/ligerUI/skins/Aqua/css/ligerui-dialog.css" rel="stylesheet"/>
    <script src="${ctx}/js/jquery-3.1.1.min.js"></script>
	<script src="${ctx}/js/index.js"></script>
	<script src="${ctx}/js/jquery-migrate-1.2.1.js"></script>
	<script src="${ctx}/js/ligerUI/js/core/base.js"></script>
	<script src="${ctx}/js/ligerUI/js/plugins/ligerDrag.js"></script> 
	<script src="${ctx}/js/ligerUI/js/plugins/ligerDialog.js"></script>
	<script src="${ctx}/js/ligerUI/js/plugins/ligerResizable.js"></script>
	<script src="${ctx}/js/bookstore.js"></script>
	<script src="${ctx}/js/jquery.cookie.js"></script>
</head>
<body>
<!-- 引入页面顶部文件 -->
<%@include file="../commons/top.jsp" %>
<div id="navlist">
    <ul>
        <li class="navlist_blue_left"></li>
        <li class="navlist_blue">确认订单信息</li>
        <li class="navlist_blue_arro"><canvas id="canvas_blue" width="20" height="38"></canvas></li>
        <li class="navlist_gray">支付订单<b></b></li>
        <li class="navlist_gray_arro"><canvas id="canvas_gray" width="20" height="38"></canvas></li>
        <li class="navlist_gray">支付完成<b></b></li>
        <li class="navlist_gray_right"></li>
    </ul>
</div>
<!--订单确认-->
<form action="" id="oitemForm">
	<%--隐藏域，地址id--%>
	<input type="hidden" name="rid">
	<div id="container" class="clear">
	    <!--收货地址-->
	    <div class="adress_choice">
	        <p>选择收货地址</p>
	        <c:forEach items="${taddresses}" var="taddress">
		        <div id="addresId1">
					<i class="user_choice">
					    <input type="radio" name="aid" value="${taddress.rid}">
		            </i>
		            <i class="address_name">
		              ${taddress.receiver}
		            </i>
		            <i class="user_address">
		                ${taddress.address} ${taddress.rphone}
		            </i>
					<i name="${taddress.rid}" style="width:80px;float: right;" class="address_name updAddress">修改
					</i>
					<i name="${taddress.rid}" style="width:80px;float: right;" class="address_name delAddress">删除
					</i>
		        </div>
	        </c:forEach>
	        <a id="add_address" href="javascript:return false;">
	            	添加地址 &gt;&gt;
	        </a>
	    </div>
	    <!-- 商品信息-->
	    <div class="product_confirm">
	        <p>确认商品信息</p>
	        <ul class="item_title">
	            <li class="p_info">商品信息</li>
	            <li class="p_price">单价(元)</li>
	            <li class="p_count">数量</li>
	            <li class="p_tPrice">金额</li>
	        </ul>
	        <c:forEach items="${orderconfirms}"  var="orderconfirm">
	        <ul class="item_detail">
	            <li class="p_info">
	                <input type="hidden" name=book value="${orderconfirm.isbn}">
	                <b><img src="${ctx}/img/goods/${orderconfirm.isbn}/detail1.jpg"/></b>
	                <b class="product_name lf">
	                   ${orderconfirm.title}
	                </b>
	                <br/>
	            <span class="product_color ">
	                  ${orderconfirm.press}
	            </span>
	            </li>
	            <li class="p_price">
	                <i>达内专属价</i>
	                <br/>
	                <input type="hidden" name="price" value="${orderconfirm.price}">
	                <span class="pro_price">￥<span class="ppp_price">${orderconfirm.price}</span></span>
	            </li>
	            <li class="p_count">
	            	<input type="hidden" name="count" value="${orderconfirm.count}">
	            	X<span>${orderconfirm.count}</span>
	            </li>
	            <li class="p_tPrice">￥<span></span></li>
	     </ul>
	        </c:forEach>
	    </div>
	    <!-- 结算条-->
	    <div id="count_bar">
	        <span class="go_cart"><a href="${ctx}/cart/showCart.action" >&lt;&lt;返回购物车</a></span>
	        <span class="count_bar_info">已选<b  id="count"> 0 </b>件商品&nbsp;&nbsp;合计(不含运费):<b class="zj"></b> <input type="hidden" name="payment" value="" id="payment"/>元</span>
	        <span class="go_pay">提交订单</span>
	    </div>
	</div>
</form>
<!-- 引入页面底部文件 -->
<%@include file="../commons/foot.jsp" %>
<script>
    var str=[];
    var html=0;
    var total=0;
    var input_zj;
    $(function(){
        $(".item_detail").each(function() {
        	//每个图书的信息
            html+=1;
        	//图书编号
        	var product=$(this).children('.p_info').children(':input').val();
            //图书单价
            var p=parseFloat($(this).children('.p_price').children('.pro_price').children('.ppp_price').html());
            //图书数量
            var sl=parseFloat($(this).children('.p_count').children('span').html());
            var xj=parseFloat(p*sl).toFixed(2);
            $(this).children('.p_tPrice').children('span').html(xj);
            total+=xj-0;
            str.push(product);
            str.push(p);
            str.push(sl);
        })
        //总价
        $("#count").html(html)-0;
        $('.zj').html(total.toFixed(2))-0;
        input_zj=parseFloat($('.zj').html()).toFixed(2);
        $('#payment').val(input_zj);
	    var address=$("#addresId1").eq(0).children(".user_choice").children("input[type='hidden']").val();
	    $("#addresId1").eq(0).children(".user_choice").children("input[type='radio']").attr("checked",true);
	    //获取地址信息
	    $(":radio").click(function(){
	    	console.log($(this).val());
	    })
	    //提交订单
	    $(".go_pay").click(function () {
	    	//PS:每点击一次提交订单，就获取一次TT_TOKEN，从而可以判断用户是否退出了
	    	var _token = $.cookie("TT_TOKEN");
	    	console.log("order-confirm.jsp->>每点击一次提交订单后的TT_TOKEN："+_token);
	    	//用户还没登录，不能提交订单
	    	if(!_token){
	    		console.log("order-confirm.jsp->>用户还没登录，不能提交订单");
	    		window.location.href="${ctx}/cart/no_login_order.action";
	    		return;
	    	}
	    	console.log("order-confirm.jsp->>用户登录了，可以添加提交订单了");
	    	//读取用户的输入——表单序列化
	        var inputData = $('#oitemForm').serialize();
	        //异步提交请求，进行验证
			//PS：需要获取上一个页面，判断用户是浏览详情时直接下单还是到购物车中下单，然后再进行相对应的操作
	        $.ajax({
	        	async: true,
	            type: 'POST',
	            url: '${ctx}/order/addOrder.action?referer=${referer}',
	            data: inputData,
	            success: function(data){
	            	// alert("*"+txt+"*");
	                if(data.status=='200'){  //提交订单成功
	                	//跳到支付页面
	            		window.location.href="${ctx}/order/payment.html?oid="+data.data.oid+"&payment="+data.data.payment+"&aid="+data.data.aid;
	                }else{ //提交订单失败
	                	$.ligerDialog.error("<span style='color: red;'>"+data.msg+"!!</span>");
	                }
	            }
	        });
	    });
		//添加地址
		$("#add_address").click(function(){
			$("#oitemForm").attr("action","/address/address-add.html");
			//提交表单即可,表单元素包含了要确认订单的图书编号和图书数量
			$('#oitemForm').submit();
		})
		//删除地址
		$("i.delAddress").click(function () {
			var rid=$(this).attr("name");
			console.log("order-confirm.html->>"+rid);
			//异步提交请求，进行验证
			$.ajax({
				async: true,
				type: 'POST',
				url: '/address/delAddress.action',
				data: {rid:rid},
				success: function(data){
					// alert("*"+txt+"*");
					if(data=='yes'){
						alert("删除成功!!");
						//删除成功，跳到确认订单页面
						$("#oitemForm").attr("action","/order/orderConfirm.action");
						//提交表单即可,表单元素包含了要确认订单的图书编号和图书数量
						$('#oitemForm').submit();
					}else{
						$.ligerDialog.error("<span style='color: red;'>删除失败!!</span>");
					}
				}
			});
		})
		//更新地址信息
		$("i.updAddress").click(function () {
			//获取当前修改的地址id
			$("input:hidden[name='rid']").val($(this).attr("name"));
			console.log("order-confirm.html->>"+$("input:hidden[name='rid']").val());
			$("#oitemForm").attr("action","/address/address-edit.html");
			//提交表单即可,表单元素包含了要确认订单的图书编号和图书数量
			$('#oitemForm').submit();
		});
	    var canvas=document.getElementById("canvas_gray");
	    var cxt=canvas.getContext("2d");
	    var gray = cxt.createLinearGradient (10, 0, 10, 38);
	    gray.addColorStop(0, '#f5f4f5');
	    gray.addColorStop(1, '#e6e6e5');
	    cxt.beginPath();
	    cxt.fillStyle = gray;
	    cxt.moveTo(20,19);
	    cxt.lineTo(0,38);
	    cxt.lineTo(0,0);
	    cxt.fill();
	    cxt.closePath();
	
	    canvas=document.getElementById("canvas_blue");
	    cxt=canvas.getContext("2d");
	    var blue = cxt.createLinearGradient (10, 0, 10, 38);
	    blue.addColorStop(0, '#27b0f6');
	    blue.addColorStop(1, '#0aa1ed');
	    cxt.beginPath();
	    cxt.fillStyle = blue;
	    cxt.moveTo(20,19);
	    cxt.lineTo(0,38);
	    cxt.lineTo(0,0);
	    cxt.fill();
	    cxt.closePath();
    });
</script>
</body>
</html>
