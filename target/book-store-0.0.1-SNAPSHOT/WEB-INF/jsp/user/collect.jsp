﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"></c:set>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>达内商城收藏夹</title>
    <link href="${ctx}/css/header.css" rel="stylesheet" />
    <link href="${ctx}/css/my.collect.css" rel="stylesheet" />
    <link href="${ctx}/css/footer.css" rel="stylesheet" />
    <link href="${ctx}/js/ligerUI/skins/ligerui-icons.css" rel="stylesheet"/>
    <link href="${ctx}/js/ligerUI/skins/Aqua/css/ligerui-dialog.css" rel="stylesheet"/>
    <link href="${ctx}/css/my.order.css" rel="stylesheet"/>
    <script src="${ctx}/js/jquery-3.1.1.min.js"></script>
    <script src="${ctx}/js/jquery-migrate-1.2.1.js"></script>
	<script src="${ctx}/js/ligerUI/js/core/base.js"></script>
	<script src="${ctx}/js/ligerUI/js/plugins/ligerDrag.js"></script> 
	<script src="${ctx}/js/ligerUI/js/plugins/ligerDialog.js"></script>
	<script src="${ctx}/js/ligerUI/js/plugins/ligerResizable.js"></script>
	<script src="${ctx}/js/collect.js"></script>
	<script src="${ctx}/js/jquery.page.js"></script>
	<script src="${ctx}/js/bookstore.js"></script>
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

<div class="modalAdd" style="display:none">
    <div class="modal_dialog">
        <div class="modal_header">
            添加提示
            <img src="${ctx}/img/model/model_img1.png" alt="" class="rt close"/>
        </div>
        <div class="modal_information">
            <img src="${ctx}/img/model/model_img2.png" alt=""/>
            <span>请选择商品</span>

        </div>

    </div>
</div>

<div class="big">
    <form  name="" action="" method="post" >
        <section id="section" >
            <div id="title">
                <b>收藏商品</b>
            </div>
            <div id="box" >

		        <div id="content_box" >
		        <c:forEach items="${pageModel.list}" var="tcoll">
                    <div class="lf" id="d1">
                        <div class="img">
                            <a href="${ctx}/book/detail.action/${tcoll.isbn}">
                            	<img src="${ctx}/img/goods/${tcoll.isbn}/collect.jpg" alt=""/>
                            </a>
                        </div>
                        <div class="describe">
                            <p>${tcoll.title}</p>
                            <span class="price"><b>￥</b><span class="priceContent">${tcoll.price}</span></span>
                            <span class="addCart" style="margin-right:40px;"><a href="${ctx}/book/detail.action/${tcoll.isbn}">查看</a></span>
                            <span class="addCart" style="margin-right:2px;"><a class="delCollect" href="javascript:void(0)">删除<input type="hidden" value="${tcoll.isbn}"></a></span>
                        </div>
                    </div>
                </c:forEach>
			    </div>
			    <!--分页器-->
				<div style="width:1000px;" class="tcdPageCode"></div>
             </div>
        </section>
    </form>
    <div class="none" style="display: none">
        <div class="none_content">
            <img src="${ctx}/img/model/model_img3.png" alt="" class="lf"/>
            <p class="lf">您的收藏夹竟然还是空哒( ⊙ o ⊙ )</p>
            <span class="lf">赶快去收藏商品吧！</span>
            <a href="${ctx}/" class="lf">去购物>></a>
        </div>

    </div>
</div>
<!-- 引入页面底部文件 -->
<%@include file="../commons/foot.jsp" %>
<script>
    //如果收藏夹为空，则显示提示收藏夹为空
    console.log("collect.html->>收藏夹商品数量:"+${pageModel.list.size()});
    if(${pageModel.list.size()}==0){
        $("div.none").show();
        //分页隐藏掉
        $("div.tcdPageCode").hide();
    }
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
    })
    $('.seek_content>div').click(function(){
        $('.seek').removeClass('clickhover');
        var text=$(this).html();
        $('.seek span').html(text);
        $(this).parent().hide();
        $('.seek').find('img').attr('src','${ctx}/img/header/header_normal.png');
        $('.seek').blur();

    })

    $('.seek').blur(function(){

        $('.seek').removeClass('clickhover');
        $('.seek_content').hide();

        $('.seek').find('img').attr('src','${ctx}/img/header/header_normal.png');
        console.log(1);
    })
    //取消收藏
    $(".delCollect").click(function(){
    	//PS:每点击一次收藏操作，就获取一次TT_TOKEN，从而可以判断用户是否退出了
    	_token = $.cookie("TT_TOKEN");
    	console.log("collect.jsp->>每点击一次取消收藏操作后的TT_TOKEN："+_token);
    	//用户还没登录，不能取消收藏该图书
    	if(!_token){
    		console.log("collect.jsp->>用户还没登录，不能取消收藏图书");
    		window.location.href="${ctx}/collect/no_login_collect.action";
    		return;
    	}
        //用户登录了，可以取消收藏该书了
        var url="${ctx}/collect/cancelCollect.action/"+$(this).children(":hidden").val();
        //显示取消收藏提示
        $("div.modal").fadeIn();
        //取消收藏
        $("div.yes").on("click",function () {
            console.log("collect.html->>取消收藏");
            console.log("collect.html->>用户登录了，可以取消收藏图书了");
            $.ajax({
                type: "post",
                url: url,
                success: function (data) {
                    if(data=="yes"){
                        //alert("删除收藏成功");
                    }else{
                        //alert("删除收藏失败");
                    }
                    //不管删除删除是否成功，都跳到显示所有删除信息的控制器，从而实现刷新数据
                    window.location.href="${ctx}/collect/showPageCollInfo.action";
                },
                error: function (data) {
                    $.ligerDialog.error("<span style='color: red;'>系统异常!!</span>");
                }
            })
        })
        //不取消收藏
        $("div.no").on("click",function () {
            console.log("collect.html->>不取消收藏");
            $("div.modal").fadeOut();
        })
        return false;
    })
     //分页部分
	 $(".tcdPageCode").createPage({
		//总页数
	    pageCount: "${pageModel.pages}",
	    //当前页码
	    current: "${pageModel.pageNum}",
	    backFn:function(pageNum){
	        window.location.href='${ctx}/collect/showPageCollInfo.action?pageNum='+pageNum;
	    }
	}); 
</script>
</body>
</html>
