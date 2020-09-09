<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"></c:set>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>达内商城学子详情页</title>
    <link href="${ctx}/css/header.css" rel="stylesheet" />
    <link href="${ctx}/css/pro.details.css" rel="stylesheet" />
    <link href="${ctx}/css/animate.css" rel="stylesheet" />
    <link href="${ctx}/css/footer.css" rel="stylesheet" />
    <link href="${ctx}/js/ligerUI/skins/ligerui-icons.css" rel="stylesheet"/>
    <link href="${ctx}/js/ligerUI/skins/Aqua/css/ligerui-dialog.css" rel="stylesheet"/>
    <script src="${ctx}/js/jquery-3.1.1.min.js"></script>
	<script src="${ctx}/js/index.js"></script>
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
<!-- nav主导航-->
<div>&nbsp;</div>
<!-- 内容-->
<!--细节导航-->
<div id="nav_detail">
    <h2>${tbook.title}</h2>
</div>
<!--产品预览-->
<div id="shop_detail">
    <!-- 左侧-->
    <div id="preview" class="lf">
        <div id="mediumDiv">
            <img id="mImg" src="${ctx}/img/goods/${tbook.isbn}/detail1big.jpg"/>
        </div>
        <div id="icon_all">
            <ul id="icon_list">
                <li class="i1"><img src="${ctx}/img/goods/${tbook.isbn}/detail1.jpg" /></li>
                <li class="i1"><img src="${ctx}/img/goods/9787115435101/detail2.jpg" onerror="this.style.display='none'" /></li>
                <li class="i1"><img src="${ctx}/img/goods/9787115435101/detail3.jpg" onerror="this.style.display='none'" /></li>
                <li class="i1"><img src="${ctx}/img/goods/9787115435101/detail4.jpg" onerror="this.style.display='none'" /></li>
                <li class="li"><img src="${ctx}/img/goods/9787115435101/detail5.jpg" onerror="this.style.display='none'" /></li>
            </ul>
        </div>
    </div>
    <!-- 右侧-->
    <div class="right_detail lf">
        <!-- 图书名称-->
        <h1>${tbook.title}</h1>
        <!-- 图书作者 -->
        <h3>${tbook.author}</h3>
        <!-- 价格部分-->
        <div class="price">
            <div id="pro_price"><b>价格：</b><span>${tbook.price}</span></div>
            <div class="promise">
                <b>服务承诺：</b>
                <span>*退货补运费</span>
                <span>*30天无忧退货</span>
                <span>*48小时快速退款</span>
                <span>*72小时发货</span>
            </div>
        </div>
        <!-- 参数部分 客服-->
        <p class="parameter">
            <b>客服：</b>
            <span class="connect">联系客服</span><img class="gif" src="${ctx}/img/product_detail/kefuf.gif">
        </p>
        <!-- 出版社 -->
        <p class="style" id="choose_color">
            <s class="color">出版社：</s>
            <span>${tbook.press}</span>
        </p>
        <!-- 出版日期 -->
        <p>
            <s>出版日期：</s>
            <span>${tbook.published}</span>
        </p>
        <!-- 未选择规格，颜色时状态-->
        <div class="message"></div>
        <!-- 数量-->
        <p class="accountChose">
            <s>数量：</s>
            <button class="numberMinus">-</button>
            <input type="text" value="1" class="number" id="buy-num">
            <button class="numberAdd">+</button>
        </p>
        <!-- 购买部分-->
        <div class="shops">
            <a href="#" class="buy lf" id="buy_now">立即购买</a>
            <a href="#" class="shop lf" id="add_cart"><img src="${ctx}/img/product_detail/product_detail_img7.png" alt=""/>加入购物车</a>
            <a href="#" class="collection lf" id="collect"><span>收藏</span></a><b><img id="collection" src='${ctx}/img/product_detail/product_detail_img62.png' alt=""/></b>
        </div>
    </div>
</div>
<!--为你推荐-->
<div id="recommended">
    <p>为你推荐<span>大家都在看</span></p>
    <div id="demo" style="width:1000px;overflow:hidden;">
        <div id="indemo" style="float: left;width: 200%;">
            <div id="demo1" style="float:left"><!-- 第一个宽度显示 -->
                 <div class="detail_1 lf">
                    <div class="detail_img1">
                        <a href="${ctx}/book/detail.action/9787302435167"><img src="${ctx}/img/recommend/recommend_img1.jpg" border="0"></a>
                    </div>
                    <p>大数据架构师指南</p>
                </div>
                <div class="detail_1 lf">
                    <div class="detail_img1">
                        <a href="${ctx}/book/detail.action/9787115335500"><img src="${ctx}/img/recommend/recommend_img2.jpg" border="0"></a>
                    </div>
                    <p>深入浅出Node.js</p>
                </div>
                <div class="detail_1 lf">
                    <div class="detail_img1">
                        <a href="${ctx}/book/detail.action/9787111213826"><img src="${ctx}/img/recommend/recommend_img3.jpg" border="0"></a>
                    </div>
                    <p>Java编程思想</p>
                </div>
                <div class="detail_1 lf">
                    <div class="detail_img1">
                        <a href="${ctx}/book/detail.action/9787111545682"><img src="${ctx}/img/recommend/recommend_img4.jpg" border="0"></a>
                    </div>
                    <p>Linux运维最佳实践</p>
                </div>
                <!--</div>-->
            </div>
            <div id="demo2" style="float:left">
            </div>
        </div>
        <!-- 宽度超大 -->
    </div>
    <!-- 外面大框 -->
</div>
<!--商品详情-->
<div id="iteminfo">
    <div id="tab">
        <div class="tab lf">
            <div class="cat">
                <span class="active"><a href="">商品详情</a></span>
                <span><a href="${ctx}/page/lookforward.html">商品评价</a></span>
            </div>
        </div>
        <div class="cart rt">
            <img src="${ctx}/img/product_detail/product_detail_img9.png" alt=""/>
        </div>
    </div>
    <div class="left lf">
        <div class="all">
            <!--<p><img src="img_x/pin_logo.png" alt=""/></p>-->
            <div id="parm">
                <div id="specification_parameter">
                    <p>
                        规格参数
                        <img src="${ctx}/img/product_detail/product_detail_icon_1.png" alt="" class="ys5"/>
                    </p>
                    <!--<img src="img_x/canshu.png" alt="" class="ys5"/>-->
                </div>
                <ul>
                    <li><a href="#">图书编号：${tbook.isbn}</a></li>
                    <li>
                    	<a href="#">图书名称：



					            	${tbook.title}


						</a>
					</li>
                    <li>
                    	<a href="#">作者：


					            	${tbook.author}



		            	</a>
		            </li>
                    <li><a href="#">价格：${tbook.price}</a></li>
                    <li><a href="#">出版社：${tbook.press}</a></li>
                    <li><a href="#">版次：${tbook.edition}</a></li>
                    <li><a href="#">出版日期：${tbook.published}</a></li>
                    <li><a href="#">页数：${tbook.pages}</a></li>
                    <li>
                    	<a href="#">字数：${tbook.words}

                    	</a>
                    </li>
                    <li><a href="#">包装：${tbook.packaging}</a></li>
                    <li><a href="#">开本：${tbook.format}</a></li>
                    <li><a href="#">用纸：${tbook.form}</a></li>
                </ul>
            </div>
            <div id="product_introduction">
                <p>
                    商品介绍
                    <img src="${ctx}/img/product_detail/product_detail_icon_4.png" alt="" class="ys5"/>
                </p>
                <img src="${ctx}/img/goods/9787115435101/intro.jpg" alt=""/>
            </div>
            <div id="sale_protection">
                <p>
                    售后保障
                    <img src="${ctx}/img/product_detail/product_detail_icon_3.png" alt="" class="ys5"/>
                </p>

                <div class="sale_content">
                    <p class="paper" id="sale_protect">
                        <img src="${ctx}/img/product_detail/product_detail_img16.png" alt=""/>
                        正品保障
                    </p>

                    <p class="content">
                        达内学子商城向您保证所售商品均为正品行货，达内自营商品开具机打发票或电子发票。
                    </p>

                    <p class="paper">
                        <img src="${ctx}/img/product_detail/product_detail_img16.png" alt=""/>
                        全国联保
                    </p>

                    <p class="content">
                        凭质保证书及达内商城发票，可享受全国联保服务，与您亲临商场选购的商品享受相同的质量保证。达内商城还为您提供具有竞争力的商品价格和运费政策，请您放心购买！
                        注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="right rt">
        <div class="aside_nav">
            <p><i><img src="${ctx}/img/product_detail/product_detail_icon_g_1.png" alt=""/></i><a href="#specification_parameter">规格参数</a></p>
            <p><i><img src="${ctx}/img/product_detail/product_detail_icon_t_1.png" alt=""/></i><a href="#product_introduction">商品介绍</a></p>
            <p><i><img src="${ctx}/img/product_detail/product_detail_icon_d_1.png" alt=""/></i><a href="#sale_protection">售后保障</a></p>
            <p><i><img src="${ctx}/img/product_detail/product_detail_icon_up_1.png" alt=""/></i><a href="#">回到顶部</a></p>
        </div>
    </div>
</div>
<!-- 引入页面底部文件 -->
<%@include file="../commons/foot.jsp" %>
<!--图片轮播悬停进入详情页效果-->
<script>
$(function(){
	//PS:先判断用户是否登录了，登录了才能查看该图书的收藏状态
	var _token = $.cookie("TT_TOKEN");
	console.log("detail.jsp->>TT_TOKEN"+_token);
	//用户还没登录
	if(!_token){
		console.log("detail.jsp->>用户还没登录，不能回显收藏状态");
		$("#collection").attr("src","${ctx}/img/product_detail/product_detail_img6.png");
	}
	//用户登录了,再根据收藏状态回显
	else{
		var iscoll="${iscoll}";
		console.log("detail.jsp->>用户登录了，可以回显收藏状态了");
		//该图书已收藏
		if(iscoll=="true"){
			$("#collection").attr("src","${ctx}/img/product_detail/product_detail_img62.png");
		}
		//图书还没收藏
		else{
			$("#collection").attr("src","${ctx}/img/product_detail/product_detail_img6.png");
		}
	}
    var speed = 20;
    var tab = document.getElementById("demo");
    var tab1 = document.getElementById("demo1");
    var tab2 = document.getElementById("demo2");
    tab2.innerHTML = tab1.innerHTML;
    function Marquee() {
        if (tab2.offsetWidth - tab.scrollLeft <= 0)
            tab.scrollLeft -= tab1.offsetWidth
        else {
            tab.scrollLeft++;
        }
    }
    var MyMar = setInterval(Marquee, speed);
    tab.onmouseover = function () {
        clearInterval(MyMar)
    };
    tab.onmouseout = function () {
        MyMar = setInterval(Marquee, speed)
    };

    $(function () {
        var nav = $("#tab"); //得到导航对象
        var aside = $(".aside_nav");//右侧导航
        var win = $(window); //得到窗口对象
        var sc = $(document);//得到document文档对象。
        win.scroll(function () {
            if (sc.scrollTop() >= 1000) {
                nav.addClass("fixed_tab");
                aside.addClass("fixed_aside");
            }
            else {
                nav.removeClass("fixed_tab");
                aside.removeClass("fixed_aside");
            }
        })

        win.scroll(function () {
            if (sc.scrollTop() >= 60 && sc.scrollTop() < 1000){
                $("#top").addClass("fixed_nav");
            }
            else {
                $("#top").removeClass("fixed_nav");
            }
        })
        //介绍区域右侧导航
        $("#iteminfo .right p").click(function () {
            //$(this).addClass("clic").siblings().removeClass("clic");
            $(this).css("background-color", "#0AA1ED").siblings().css("background-color", "#e8e8e8");
            $(this).find("a").css("color", "#fff").parent().siblings().find("a").css("color", "#828282")
        })
        /**选择商品进行添加 悬停效果**/
        $(".avenge").mouseover(function () {
            $(this).css({"border": "1px solid #0AA1ED", "color": "#0AA1ED"});
        }).mouseout(function () {
            $(this).css({"border": "1px solid #666", "color": "#666"})
        })

        /**添加到收藏**/
        //PS:先判断用户是否登录了，登录了才能收藏或取消收藏该书
        $("#collect").click(function (){
        	//PS:每点击一次收藏操作，就获取一次TT_TOKEN，从而可以判断用户是否退出了
        	_token = $.cookie("TT_TOKEN");
        	console.log("detail.jsp->>每点击一次收藏操作后的TT_TOKEN："+_token);
        	//用户还没登录，不能收藏或取消收藏该图书
        	if(!_token){
        		console.log("detail.jsp->>用户还没登录，不能收藏或取消收藏图书");
        		window.location.href="${ctx}/collect/no_login_collect.action";
        		return;
        	}
        	console.log("detail.jsp->>用户登录了，可以收藏或取消删除图书了");
        	//用户登录了，可以收藏或取消收藏该书了
           	$.ajax({
                type: "post",
                url: '${ctx}/collect/addCollect.action',
                data:{book:'${tbook.isbn}'},//params,
                success: function (data) {
                    if (data == 'noCollAndSuccColl') {
                    	$.ligerDialog.success("<span style='color: green;'>收藏成功!!</span>");
                    	$("#collection").attr("src","${ctx}/img/product_detail/product_detail_img62.png");
                    	//window.location.href = "${ctx}/page/detail.html?isbn=9787115435101";
                    } 
                    else if(data == 'noCollButFailColl'){
                    	$.ligerDialog.error("<span style='color: red;'>收藏失败!!</span>");
                    	$("#collection").attr("src","${ctx}/img/product_detail/product_detail_img6.png");
                    }else {
                    	$.ligerDialog.confirm("<span style='color: green;'>确定取消收藏吗？</span>",function(r){
                    	console.log(r);
                   		if(r){
                           	//取消收藏
                           	$.ajax({
   				                type: "post",
   				                url: '${ctx}/collect/cancelCollect.action/${tbook.isbn}',
   				                success: function (data) {
   				                	if(data=="yes"){
   				                		$("#collection").attr("src","${ctx}/img/product_detail/product_detail_img6.png");
   				                	}else{
   				                		$("#collection").attr("src","${ctx}/img/product_detail/product_detail_img62.png");
   				                	}
   	                     		}, 
   				                error: function (data) {
   				                	$.ligerDialog.error("<span style='color: red;'>系统异常!!</span>");
   				                }
                           	});
                         }
                    	});
                	}
                },
                error: function (data) {
                	$.ligerDialog.error("<span style='color: red;'>系统异常!!</span>");
                }
            });
        });
        /**数量添加**/
        var n = $("#buy-num").val() * 1;
        $(".numberMinus").click(function () {
            if (n >= 1) {
                $("#buy-num").val(n -= 1);
            }
        })
        $(".numberAdd").click(function () {
            $("#buy-num").val(n += 1);
        })

        /**ajax提交**/
        //数量选择
        $(".accountChose").click(function () {
            var buyAccount = $("#buy-num").val();
            console.log(buyAccount);
        })

        /*立即购买*/
        $("#buy_now").click(function (e) {
            var num = $("#buy-num").val();
            _token = $.cookie("TT_TOKEN");
            //用户还没登录，不能立即购买
            if(!_token){
                console.log("detail.jsp->>用户还没登录，不能立即购买");
                window.location.href="${ctx}/order/no_login_order.action";
                return;
            }
            // 后台需要的参数
            var url = "${ctx}/order/orderConfirm.action?book=${tbook.isbn}&count="+num;
            window.location.href = url;
        })
    });

    //加入购物车操作
    var buyAccount;
    var book="${tbook.isbn}";
    //PS:先判断用户是否登录了，登录了添加购物车
    $("#add_cart").click(function (e) {
    	//PS:每点击一次添加购物车，就获取一次TT_TOKEN，从而可以判断用户是否退出了
    	_token = $.cookie("TT_TOKEN");
    	console.log("detail.jsp->>每点击一次添加购物车后的TT_TOKEN："+_token);
    	//用户还没登录，不能添加购物车
    	if(!_token){
    		console.log("detail.jsp->>用户还没登录，不能添加购物车");
    		window.location.href="${ctx}/cart/no_login_cart.action";
    		return;
    	}
    	console.log("detail.jsp->>用户登录了，可以添加购物车了");
    	//用户登录了，可以添加购物车了
        //数量取值
        buyAccount = $("#buy-num").val();
        console.log(buyAccount);
        var params = {
        	count: buyAccount,
        	book:book
        };
        $.ajax({
            type: "post",
            url: "${ctx}/cart/addToCart.action",
            data: params,
            success: function (data) {
                if (data == 'yes') {
                	$.ligerDialog.success("<span style='color: green;'>添加购物车成功!</span>");
                } else {
                	$.ligerDialog.error("<span style='color: red;'>添加购物车失败!</span>");
                }
            },
            error: function (data) {
            	$.ligerDialog.error("<span style='color: red;'>系统异常!</span>");
            }
        });
       /* var url = "${ctx}/page/cart.html";
        window.location.href = url;*/
    });

    // 图片效果
    $("#mImg").hover(function (){
        $(this).addClass("animated pulse");
    }, function (){
        $(this).removeClass("animated pulse");
    });

    $('#icon_list>li').click(function(){
        $(this).children('img').css('border','1px solid #CECFCE');
        var address=$(this).children().attr('src');
        console.log(address);
        var newaddress=address.slice(0,-4);
        var bigaddress=newaddress+'big.jpg';
        $('#mImg').attr('src',bigaddress);
        $(this).siblings().children('img').css('border','');
    })
})
</script>
</body>
</html>
