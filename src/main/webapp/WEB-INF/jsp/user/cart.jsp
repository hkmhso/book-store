﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"></c:set>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>达内商城购物车</title>
    <link href="${ctx}/css/header.css" rel="stylesheet" />
    <link href="${ctx}/css/footer.css" rel="stylesheet" />
    <link href="${ctx}/css/cart.css" rel="stylesheet" />
    <link href="${ctx}/js/ligerUI/skins/ligerui-icons.css" rel="stylesheet"/>
    <link href="${ctx}/js/ligerUI/skins/Aqua/css/ligerui-dialog.css" rel="stylesheet"/>
    <link href="${ctx}/css/my.order.css" rel="stylesheet"/>
    <script src="${ctx}/js/jquery-3.1.1.min.js"></script>
	<script src="${ctx}/js/cart.js"></script>
	<script src="${ctx}/js/index.js"></script>
	<script src="${ctx}/js/ligerUI/js/core/base.js"></script>
	<script src="${ctx}/js/ligerUI/js/plugins/ligerDrag.js"></script> 
	<script src="${ctx}/js/ligerUI/js/plugins/ligerDialog.js"></script>
	<script src="${ctx}/js/ligerUI/js/plugins/ligerResizable.js"></script>
	<script src="${ctx}/js/bookstore.js"></script>
	<script src="${ctx}/js/jquery.page.js"></script>
	<script src="${ctx}/js/jquery.cookie.js"></script>
</head>
<body>
<!-- 引入页面顶部文件 -->
<%@include file="../commons/top.jsp" %>
<!-- nav主导航-->
<div class="modal" style="display:none">
    <div class="modal_dialog">
        <div class="modal_header">
            删除提醒
        </div>
        <div class="modal_information">
            <img src="${ctx}/img/model/model_img2.png" alt=""/>
            <span>确定删除您的这个宝贝吗？</span>
        </div>
        <div class="yes"><span>删除</span></div>
        <div class="no"><span>不删除</span></div>
    </div>
</div>
<div class="modalNo" style="display:none">
    <div class="modal_dialog">
        <div class="modal_header">
            删除提示
            <img src="${ctx}/img/model/model_img1.png" alt="" class="rt close"/>
        </div>
        <div class="modal_information">
            <img src="${ctx}/img/model/model_img2.png" alt=""/>
            <span>请选择商品</span>
        </div>
    </div>
</div>
<div class="big">
    <form  name="" action="" method="post" id="cartForm">
    <!-- 隐藏域，用户编号，删除时后台需要的数据-->
    <input type="hidden" name="uid" value="${sessionScope.tuser.phone}">
    <section id="section" >
        <div id="title">
            <b>购物车</b>
            <p>
                已选<span class="total color">0</span>件商品<span class="interval"></span>合计(不含运费):<span class="totalPrices color susum">0.00</span><span class="unit color">元</span>
            </p>
        </div>
        <div id="box" >
            <div id="content_box">
                <div class="imfor_top">
                    <div class="check_top">
                        <div class="all">
                            <span class="normal">
                                <img src="${ctx}/img/cart/product_normal.png" alt=""/>
                            </span>  <input type="hidden" name="" value="">全选
                        </div>
                    </div>
                    <div class="pudc_top">商品</div>
                    <div class="pices_top">单价(元)</div>
                    <div class="num_top">数量</div>
                    <div class="totle_top">金额</div>
                    <div class="del_top">操作</div>
                </div>
              <c:forEach items="${pageModel.list}" var="tcart">
                <div class="imfor">
                    <div class="check">
                        <div class="Each">
                            <span class="normal">
	                            <!-- 隐藏域，图书编号，删除时后台需要的数据-->
		    					<input type="hidden" name="" value="${tcart.isbn}">
                                <img src="${ctx}/img/cart/product_normal.png" alt=""/>
                            </span>
                            <input type="hidden" name="" value="">
                        </div>
                    </div>
                    <div class="pudc">
                        <div class="pudc_information" id="${sessionScope.tuser.phone}">
                            <input type="hidden" name="" value="${tcart.isbn}">
                            <!-- <div style="display:none;">${tcart.isbn}</div> -->
                            <img src="${ctx}/img/goods/${tcart.isbn}/detail1.jpg" class="lf"/>
                            <!-- <input type="hidden" name="" value=""> -->
                        <span class="des lf">
                         ${tcart.title}
                             <!-- <input type="hidden" name="" value=""> --> 
                        </span>
                            <p class="col lf"><span>作者：</span><span class="color_des">${tcart.author} <input type="hidden" name="" value=""></span></p>
                        </div>
                    </div>
                    <div class="pices">
                        <p class="pices_des"></p>
                        <p class="pices_information"><b>￥</b><span>${tcart.price}<input type="hidden" name="" value=""></span></p>
                    </div>
                    <div class="num"><span class="reduc">&nbsp;-&nbsp;</span><input name="count" type="text" value="${tcart.count}" ><span class="add">&nbsp;+&nbsp;</span></div>
                    <div class="totle">
                        <span>￥</span>
                        <span class="totle_information">${tcart.count*tcart.price}</span>
                    </div>
                    <div class="del">
                        <a href="javascript:return false;" class="del_d">删除</a>
                    </div>
                </div>
              </c:forEach>
            </div>
            <div class="foot">
                <div class="foot_check">
                    <div class="all" style="float:left">
                        <span class="normal">
                                <img src="${ctx}/img/cart/product_normal.png" alt=""/>
                            </span>  <input type="hidden" name="" value="">全选&nbsp;&nbsp;
                    </div>
                    <span class="batch_del_d">删除</span>
                </div>
                <div class="foot_cash" id="go-buy">去结算</div>
                <div class="foot_tol"><span>合计(不含运费):</span><span  class="foot_pices susumOne">0.00</span><span class='foot_des'>元</span></div>
                <div class="foot_selected">
                    已选<span class="totalOne color">0</span>件商品
                </div>
            </div>
        </div>
        <!--分页器-->
		<div style="width:1000px;position: absolute;bottom: 50px;left: 0px;" class="tcdPageCode"></div>
    </section>
    <div class="none" style="display: none">
      <p class="none_title">购物车</p>
      <div class="none_top"></div>
      <div class="none_content">
        <img src="${ctx}/img/30.png" alt="" class="lf"/>
        <p class="lf">您的购物车竟然还是空哒( ⊙ o ⊙ )</p>
        <span class="lf">赶快去下单吧！</span>
        <a href="${ctx}/" class="lf">去购物>></a>
      </div>
    </div>
    </form>
</div>
<!-- 引入页面底部文件 -->
<%@include file="../commons/foot.jsp" %>
<script>
//去结算
/* var str=[];
$('.foot_cash').click(function(){
  $('.Each>span').each(function(){
    if($(this).hasClass('true')){
      //var id=$(this).parent().parent().next().children('.pudc_information').attr('id');
	  var num=$(this).parent().parent().siblings('.num').children('input').val();
	  var book=$(this).parent().parent().siblings('.pudc').children().children(":input").val();
      str.push(book);
      str.push(num);
    }
  });
  console.log(str);
  if(str.length>0){
     var url = '${ctx}/oitem/order-confirm.action/'+str;
     window.location.href = url;
  }
}); */
//去结算：
$('.foot_cash').click(function(){
	/** 获取到用户选中的商品 */
	var boxs=$('.Each>span').filter($(".true"));
    if(boxs.length < 1){
	   $.ligerDialog.alert("<span style='color: red;'>请至少删除一个商品！！</span>");
	   return;
    }
	$("#cartForm").attr("action","${ctx}/order/orderConfirm.action");
	//提交表单即可,表单元素包括所选的商品编号和数量
	$("#cartForm").submit();
})
$(function(){
    // 显示空购物车页面
    if($(".imfor").length==0) {
        $('#section').hide();
        $('.none').show();
    }
    //小计和加减
    //加
    $(".add").each(function() {
      $(this).click(function() {
    	//PS:每点击一次增加数量，就获取一次TT_TOKEN，从而可以判断用户是否退出了
      	var _token = $.cookie("TT_TOKEN");
      	console.log("cart.jsp->>每点击一次增加数量后的TT_TOKEN："+_token);
      	//用户还没登录，不能增加数量
      	if(!_token){
      		console.log("cart.jsp->>用户还没登录，不能增加数量");
      		window.location.href="${ctx}/cart/no_login_cart.action";
      		return;
      	}
      	console.log("cart.jsp->>用户登录了，可以增加数量了");
    	//用户登录了，可以增加数量了
        var $multi = 0;
        var vall = $(this).prev().val();
        vall++;
        $(this).prev().val(vall);
        $multi = (parseInt(vall).toFixed(2) * parseInt($(this).parent().prev().children().eq(1).children().eq(1).text()));
        $(this).parent().next().children().eq(1).text(Math.round($multi).toFixed(2));
        amountadd();
        var book=$(this).parent().siblings('.pudc').children('.pudc_information').children(':input').val();
        var num=$(this).prev().val();
        $.ajax({
          type: "POST",
          url: "${ctx}/cart/changeItemNum.action",
          data: {count:num,book:book},
          success: function(data){
          }
        });
      })
    });
    //减
    $(".reduc").each(function() {
  		$(this).click(function() {
  			//PS:每点击一次减少数量，就获取一次TT_TOKEN，从而可以判断用户是否退出了
  	      	var _token = $.cookie("TT_TOKEN");
  	      	console.log("cart.jsp->>每点击一次减少数量后的TT_TOKEN："+_token);
  	      	//用户还没登录，不能减少数量
  	      	if(!_token){
  	      		console.log("cart.jsp->>用户还没登录，不能减少数量");
  	      		window.location.href="${ctx}/cart/no_login_cart.action";
  	      		return;
  	      	}
  	      	console.log("cart.jsp->>用户登录了，可以减少数量了");
  	    	//用户登录了，可以减少数量了
  			var $multi1 = 0;
  			var vall1 = $(this).next().val();
  			vall1--;
  			if(vall1 <= 0) {
  				vall1 = 1;
  			}
  			$(this).next().val(vall1);
  			$multi1 = parseInt(vall1) * parseInt($(this).parent().prev().children().eq(1).children().eq(1).text());
  			$(this).parent().next().children().eq(1).text(Math.round($multi1).toFixed(2));
  			amountadd();
  	        var book=$(this).parent().siblings('.pudc').children('.pudc_information').children(':input').val();
  			var num=$(this).next().val();
  			//更新商品数量
  			$.ajax({
  				type: "POST",
  				url: "${ctx}/cart/changeItemNum.action",
  				data: {count:num,book:book},
  				success: function(data){

  				}
  			});
  		})
	});
    // 删除当前行
    $('.del_d').click(function() {
    	//PS:每点击一次删除当前行，就获取一次TT_TOKEN，从而可以判断用户是否退出了
      	var _token = $.cookie("TT_TOKEN");
      	console.log("cart.jsp->>每点击删除当前行后的TT_TOKEN："+_token);
      	//用户还没登录，不能删除当前行
      	if(!_token){
      		console.log("cart.jsp->>用户还没登录，不能删除当前行");
      		window.location.href="${ctx}/cart/no_login_cart.action";
      		return;
      	}
      	console.log("cart.jsp->>用户登录了，可以删除当前行了");
    	//用户登录了，可以删除当前行了
        var book=$(this).parent().siblings('.pudc').children('.pudc_information').children(':input').val();
        //显示收藏购物车提示
        $('.modal').fadeIn();
        //不删除
        $('.no').click(function(){
          $('.modal').fadeOut();
        });
        //删除
        $('.yes').click(function(){
        	$.ajax({
  				type: "POST",
  				url: "${ctx}/cart/deleteCartItem.action",
  				data: {book:book},
  				success: function(data){
  					//不管删除是否成功，都刷新购物车信息
  					window.location.href="${ctx}/cart/showPageCartInfo.action";
  				}
  			});
        })
    });
    //批量删除
    $('.batch_del_d').click(function() {
    	//PS:每点击一次批量删除，就获取一次TT_TOKEN，从而可以判断用户是否退出了
      	var _token = $.cookie("TT_TOKEN");
      	console.log("cart.jsp->>每点击批量删除当前行后的TT_TOKEN："+_token);
      	//用户还没登录，不能批量删除当前行
      	if(!_token){
      		console.log("cart.jsp->>用户还没登录，不能批量删除当前行");
      		window.location.href="${ctx}/cart/no_login_cart.action";
      		return;
      	}
      	console.log("cart.jsp->>用户登录了，可以批量删除当前行了");
    	//用户登录了，可以批量删除当前行了
    	/** 获取到用户选中的商品 */
    	var boxs=$('.Each>span').filter($(".true"));
	    if(boxs.length < 1){
		   $.ligerDialog.alert("<span style='color: red;'>请至少删除一个商品！！</span>");
	    }else{
	 		//读取用户的输入——表单序列化
	        var inputData = $('#cartForm').serialize();
	 		console.log(inputData);
		    $.ajax({
 				type: "POST",
 				url: "${ctx}/cart/deleteCartItem.action",
 				data: inputData,
 				success: function(data){
 					if(data.status=="200"){
 						alert(data.msg);
 						//$.ligerDialog.alert("<span style='color: green;'>"+data.msg+"</span>");
 					}else{
 						alert(data.msg);
 						//$.ligerDialog.alert("<span style='color: red;'>"+data.msg+"</span>");
 					}
 					//不管删除是否成功，都刷新购物车信息
 					window.location.href="${ctx}/cart/showPageCartInfo.action";
 				},
	            error:function()
	            {
	                //错误处理
	                $.ligerDialog.error("<span style='color: red;'>系统异常！</span>");
	            }
	        });
	    }
    });
      //分页部分
	 $(".tcdPageCode").createPage({
		//总页数
	    pageCount: "${pageModel.pages}",
	    //当前页码
	    current: "${pageModel.pageNum}",
	    backFn:function(pageNum){
	        window.location.href='${ctx}/cart/showPageCartInfo.action?pageNum='+pageNum;
	    }
	}); 
});
</script>
</body>
</html>
