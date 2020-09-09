<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"></c:set>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>我的订单 - 达内学子商城</title>
    <link href="${ctx}/css/my.order.css" rel="stylesheet"/>
    <link href="${ctx}/css/header.css" rel="stylesheet"/>
    <link href="${ctx}/css/footer.css" rel="stylesheet"/>
	<link href="${ctx}/js/ligerUI/skins/ligerui-icons.css" rel="stylesheet"/>
	<link href="${ctx}/js/ligerUI/skins/Aqua/css/ligerui-dialog.css" rel="stylesheet"/>
    <script src="${ctx}/js/jquery-3.1.1.min.js"></script>
	<script src="${ctx}/js/index.js"></script>
	<script src="${ctx}/js/jquery.page.js"></script>
	<script src="${ctx}/js/ligerUI/js/core/base.js"></script>
	<script src="${ctx}/js/ligerUI/js/plugins/ligerDrag.js"></script>
	<script src="${ctx}/js/ligerUI/js/plugins/ligerDialog.js"></script>
	<script src="${ctx}/js/ligerUI/js/plugins/ligerResizable.js"></script>
	<script src="${ctx}/js/order.js"></script>
	<script src="${ctx}/js/bookstore.js"></script>
	<script src="${ctx}/js/jquery.cookie.js"></script>
</head>
<body>
<!-- 引入页面顶部文件 -->
<%@include file="../commons/top.jsp" %>
<!-- 主导航-->

<!-- 我的订单导航栏-->
<div id="nav_order">
    <ul>
        <li></li>
    </ul>
</div>
    <!--我的订单内容区域 #container-->
    <div id="container" class="clearfix">
        <!-- 左边栏-->
        <div id="leftsidebar_box" class="lf">
            <div class="line"></div>
            <dl class="my_order">
                <dt onClick="changeImage()">我的订单
                    <img src="${ctx}/img/myOrder/myOrder2.png">
                </dt>

            </dl>

         </div>
        <!-- 右边栏-->
        <div class="rightsidebar_box rt">
            <!-- 商品信息标题-->
            <table id="order_list_title"  cellpadding="0" cellspacing="0" >
                <tr>
                    <th width="345">商品</th>
                    <th width="82">单价（元）</th>
                    <th width="50">数量</th>
                    <th width="82">售后</th>
                    <th width="100">实付款（元）</th>
                    <th width="90">交易状态</th>
                    <th width="92">操作</th>
                </tr>
            </table>
            <!-- 订单列表项 -->
             <%int begin=0;%>
            <!-- 遍历所有的订单编号 ，得到每一个订单编号-->
            <c:forEach items="${torders}" var="torder">
	            <div id="orderItem">
	              <p class="orderItem_title">
	                 <span id="order_id">
	                     &nbsp;&nbsp;订单编号:<a href="#">${torder.oid}</a>
	                 </span>
	                  &nbsp;&nbsp;成交时间：<f:formatDate pattern="yyyy-MM-dd HH:mm:ss" 
            			value="${torder.handover}"/>
           			<span id="del_order" style="float:right;">
           				<button class="del_order" value="${torder.oid}">删除订单</button>
                 	</span>
	              </p>
	            </div>
	            <!-- 遍历所有的订单信息，得到每一个订单信息（可能有一个或多个商品）-->
	            <c:forEach items="${pageModel.list}" var="tordersInfo1" begin="<%=begin%>" end="<%=begin%>">
	               <!-- 遍历一个订单下的所有的订单项信息，得到每一个订单项信息(只有一个商品)-->
	               <c:forEach items="${tordersInfo1}" var="torderInfo2">
		              <div id="orderItem_detail">
		                  <ul>
		                      <li class="product">
		                          <b><a href="#"><img src="${ctx}/img/goods/${torderInfo2.isbn}/detail1.jpg" /></a></b>
		                          <b class="product_name lf" >
		                              <a href="">${torderInfo2.title}</a>
		                              <br/>
		                          </b>
		                          <b class="product_color ">
		                              ${torderInfo2.press}
		                          </b>
		                      </li>
		                      <li class="unit_price">
		                          <br/>
		                          ${torderInfo2.price}
		                      </li>
		                      <li class="count">
		                          ${torderInfo2.count}件
		                      </li>
		                      <li class="sale_support">
		                          退款/退货
		                          <br/>
		                          我要维权
		                      </li>
		                      <li class="payments_received">
		                      <f:formatNumber type="currency" 
            					maxFractionDigits="3" value="${torderInfo2.price*torderInfo2.count}" />
		                      </li>
		                      <li class="trading_status">
		                          <img src="${ctx}/img/myOrder/car.png" alt=""/>${torder.sta}
		                          <br/>
								  <%--没付款，则提示去付款--%>
								  <c:if test="${torder.sta=='待付款'}">
									  <a href="${ctx}/order/payment.html?oid=${torder.oid}&aid=${torder.aid}&payment=${torderInfo2.price}">去付款</a>
								  </c:if>
								  <%--已经付款了，待发货状态--%>
								  <c:if test="${torder.sta=='待发货'}">
									  <a class="cuifahuo" href="javascript:void(0);">催发货</a>
								  </c:if>
								  <br/>
		                          <a href="${ctx}/oitem/showSimpleOitemInfo.action?oid=${torder.oid}&product=${torderInfo2.isbn}&sta=${torder.sta}">订单详情</a>
								  <br/>
		                      </li>
		                      <li class="operate">
		                          <a href="confirm-receipt.action">确认收货</a>
		                      </li>
		                  </ul>
		              </div>
		            </c:forEach>
	            </c:forEach>
				<!--遍历下一个订单信息-->
	            <%begin++;%>
            </c:forEach>
			 <!--分页器-->
			<div style="width:800px;position: absolute;bottom: -50px;left: 0px;" class="tcdPageCode"></div>
        </div>
    </div>
<!-- 引入页面底部文件 -->
<%@include file="../commons/foot.jsp" %>
<script type="text/javascript">
	//删除订单
	$(":button.del_order").click(function(){
		//PS:每点击一次删除订单车，就获取一次TT_TOKEN，从而可以判断用户是否退出了
    	var _token = $.cookie("TT_TOKEN");
    	console.log("order.jsp->>每点击一次删除订单后的TT_TOKEN："+_token);
    	//用户还没登录，不能删除订单
    	if(!_token){
    		console.log("order.jsp->>用户还没登录，不能删除订单");
    		window.location.href="${ctx}/cart/no_login_order.action";
    		return;
    	}
    	console.log("order.jsp->>用户登录了，可以删除订单了");
		var oid=$(this).val();
		console.log(oid);
		//根据用户编号和订单号删除
		$.ajax({
			type: "POST",
			url: "${ctx}/order/delOrder.action",
			data: "oid="+oid,
			success: function(data){
				if(data.status=="200"){
					alert(data.msg);
					//$.ligerDialog.alert("<span style='color: green;'>"+data.msg+"</span>");
				}else{
					alert(data.msg);
					//$.ligerDialog.alert("<span style='color: red;'>"+data.msg+"</span>");
				}
				//不管删除是否成功，都刷新订单信息
				window.location.href="${ctx}/order/showPageOrdersInfo.action";
			},
            error:function()
            {
                //错误处理
                $.ligerDialog.error("<span style='color: red;'>系统异常！</span>");
            } 
	    });
	})
	//催发货
	$(".cuifahuo").click(function () {
		$.ligerDialog.alert("<span style='color: green;'>已催商家发货</span>");
	})
	 //分页部分
	 $(".tcdPageCode").createPage({
		//总页数
		pageCount: "${pageModel.pages}",
		//当前页码
		current: "${pageModel.pageNum}",
		backFn:function(pageNum){
			window.location.href='${ctx}/order/showPageOrdersInfo.action?pageNum='+pageNum;
		}
	 });
</script>
</body>
</html>
