<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"></c:set>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>达内学子商城-订单详情页</title>
    <link href="${ctx}/css/header.css" rel="stylesheet" />
    <link href="${ctx}/css/footer.css" rel="stylesheet" />
    <link href="${ctx}/css/order.info.css" rel="stylesheet" />
    <script src="${ctx}/js/jquery-3.1.1.min.js"></script>
    <script src="${ctx}/js/bookstore.js"></script>
	<script src="${ctx}/js/jquery.cookie.js"></script>
</head>
<body>
<!-- 引入页面顶部文件 -->
<%@include file="../commons/top.jsp" %>
<!-- nav主导航-->
<!--详细信息-->
<div id="container">
        <!-- 导航 -->
        <div class="container_nav">
            首页&gt;订单管理&gt;订单<span>${param.oid}</span>
        </div>
	        <div class="orderInfo_icon">
	            <p>订单<span class="order-num">${param.oid}</span>&nbsp;&nbsp;&nbsp;当前状态：<span class="state">${param.sta=='yesPay'?'待发货':'待付款'}</span></p>
	        </div>
	        <!-- 订单状态流程图-->
	        <div id="orderStatusChart">
	              <dl>
	                  <dt><img src="${ctx}/img/orderinfo/orderinfo_img1_2.png" alt=""/></dt>
	                  <dd>
	                      <p>提交订单</p>
	                      <span>2016.01.01 13:00</span>
	                  </dd>
	              </dl>
	              <dl>
	                <dt class="point"><img src="${ctx}/img/orderinfo/orderinfo_img6_2.png" alt=""/></dt>
	              </dl>
	
	              <dl>
	                  <dt><img src="${ctx}/img/orderinfo/orderinfo_img3_1.png" alt=""/></dt>
	                  <dd>
	                      <p style="display: none">配送中</p>
	                      <span style="display: none">2016.01.01 13:00</span>
	                  </dd>
	              </dl>
	              <dl>
	                <dt class="point"><img src="${ctx}/img/orderinfo/orderinfo_img6_1.png" alt=""/></dt>
	              </dl>
	
	              <dl>
	                  <dt><img src="${ctx}/img/orderinfo/orderinfo_img4_1.png" alt=""/></dt>
	                  <dd>
	                      <p style="display: none">已发货</p>
	                      <span style="display: none">2016.01.01 13:00</span>
	                  </dd>
	              </dl>
	              <dl>
	                <dt class="point"><img src="${ctx}/img/orderinfo/orderinfo_img6_1.png" alt=""/></dt>
	              </dl>
	
	            <dl>
	                  <dt><img src="${ctx}/img/orderinfo/orderinfo_img5_1.png" alt=""/></dt>
	                  <dd >
	                      <p style="display: none">确认收货</p>
	                      <span style="display: none">2016.01.01 13:00</span>
	                  </dd>
	              </dl>
	
	        </div>
        <div class="clear">

        <!-- 详细信息-->
            <h1>详细信息</h1>
            收货人：<span class="consignee">${torderAddress.receiver}</span>&nbsp;&nbsp;&nbsp;&nbsp;邮编：<span class="postcode">100000</span>&nbsp;&nbsp;&nbsp;&nbsp;联系电话：<span class="tel">${torderAddress.rphone}</span>
            <br/>
            <p>收货地址：<span>${torderAddress.address}</span></p>
        </div>

        <!-- 商品信息-->
        <div style="width: 1000px; margin:0px auto">
            <h1 class="commodity">商品信息</h1>
            <div class="product_confirm">
                <ul class="item_title">
                    <li class="p_info">商品信息</li>
                    <li class="p_price">单价(元)</li>
                    <li class="p_count">数量</li>
                    <li class="p_tPrice">实付款</li>
                </ul>
                <div>订单编号：<span>${param.oid}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;成交时间：<f:formatDate pattern="yyyy-MM-dd HH:mm:ss" 
            			value="${torder.handover}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系客服：<img src="${ctx}/img/orderinfo/kefuf.gif" alt=""/></div>
	                 	  <!-- 遍历一个订单下的所有的订单项信息，得到每一个订单项信息(只有一个商品)-->
		                  <c:forEach items="${torderInfo}" var="torderInfo2">
		                   	<ul class="item_detail">
			                    <li class="p_info">
			                        <b><img src="${ctx}/img/goods/${torderInfo2.isbn}/detail1.jpg" /></b>
			                        <p class="product_name lf" >
			                           ${torderInfo2.title}
			                        </p>
			                        <br/>
			                <span class="product_color ">
			                   ${torderInfo2.press}
			                </span>
			                    </li>
			                    <li class="p_price">
			                        <span class="pro_price">￥${torderInfo2.price}</span>
			                    </li>
			                    <li class="p_count">${torderInfo2.count}件</li>
			                    <li class="p_tPrice"> <f:formatNumber type="currency" 
	            				maxIntegerDigits="3" value="${torderInfo2.count*torderInfo2.price}" /></li>
            				 </ul>
		                 </c:forEach>
            </div>
        </div>

    </div>
<!-- 引入页面底部文件 -->
<%@include file="../commons/foot.jsp" %>
<script>
    //搜索下拉
    $('.seek').focus(function(){
        if($(this).hasClass('clickhover')){
            $(this).removeClass('clickhover');
            $(this).find('.seek_content').hide();
            $(this).find('img').attr('src','${ctx}/img/header/header_normal.png');
        }else{
            $(this).addClass('clickhover');
            $(this).find('.seek_content').show();
            $(this).find('img').attr('src','${ctx}/img/header/header_true.png');
        }
    });
    $('.seek_content>div').click(function(){
        $('.seek').removeClass('clickhover');
        var text=$(this).html();
        $('.seek span').html(text);
        $(this).parent().hide();
        $('.seek').find('img').attr('src','${ctx}/img/header/header_normal.png');
        $('.seek').blur();
    });
    $('.seek').blur(function(){
        $('.seek').removeClass('clickhover');
        $('.seek_content').hide();
        $('.seek').find('img').attr('src','${ctx}/img/header/header_normal.png');
        console.log(1);
    });
    //头部hover
    $(".care").hover(function(){
        $(this).attr('src',"${ctx}/img/header/care1.png");
    },function(){
        $(this).attr('src',"${ctx}/img/header/care.png");
    });
    $(".order").hover(function(){
        $(this).attr('src',"${ctx}/img/header/order1.png");
    },function(){
        $(this).attr('src',"${ctx}/img/header/order.png");
    });
    $(".shopcar").hover(function(){
        $(this).attr('src',"${ctx}/img/header/shop_car1.png");
    },function(){
        $(this).attr('src',"${ctx}/img/header/shop_car.png");
    });
</script>
</body>
</html>
