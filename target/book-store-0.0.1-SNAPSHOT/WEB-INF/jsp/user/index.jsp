<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"></c:set>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>达内学子书城首页</title>
    <link href="${ctx}/css/item.food.css" rel="stylesheet" />
    <link href="${ctx}/css/header.css" rel="stylesheet" />
    <link href="${ctx}/css/footer.css" rel="stylesheet" />
    <link href="${ctx}/css/slide.css" rel="stylesheet" />
    <link href="${ctx}/css/my.order.css" rel="stylesheet"/>
    <link href="${ctx}/js/ligerUI/skins/ligerui-icons.css" rel="stylesheet"/>
    <link href="${ctx}/js/ligerUI/skins/Aqua/css/ligerui-dialog.css" rel="stylesheet"/>
    <script src="${ctx}/js/jquery-3.1.1.min.js"></script>
	<script src="${ctx}/js/jquery-migrate-1.2.1.js"></script>
	<script src="${ctx}/js/ligerUI/js/core/base.js"></script>
	<script src="${ctx}/js/ligerUI/js/plugins/ligerDrag.js"></script> 
	<script src="${ctx}/js/ligerUI/js/plugins/ligerDialog.js"></script>
	<script src="${ctx}/js/ligerUI/js/plugins/ligerResizable.js"></script>
	<script src="${ctx}/js/index.js"></script>
	<script src="${ctx}/js/slide.js"></script>
	<script src="${ctx}/js/jquery.page.js"></script>
	<script src="${ctx}/js/bookstore.js"></script>
	<script src="${ctx}/js/jquery.cookie.js"></script>
</head>
<body>
<!-- 引入页面顶部文件 -->
<%@include file="../commons/top.jsp" %>
<!-- nav主导航-->
<div>&nbsp;</div>
<!-- banner部分-->
<div class="ck-slide">
    <ul class="ck-slide-wrapper">
        <li>
            <a href="detail.html"><img src="${ctx}/img/banner/banner1.png" alt=""></a>
        </li>
        <li style="display:none">
            <a href="detail.html"><img src="${ctx}/img/banner/banner2.png" alt=""></a>
        </li>
        <li style="display:none">
            <a href="detail.html"><img src="${ctx}/img/banner/banner3.png" alt=""></a>
        </li>
        <li style="display:none">
            <a href="detail.html"><img src="${ctx}/img/banner/banner4.png" alt=""></a>
        </li>
        <li style="display:none">
            <a href="detail.html"><img src="${ctx}/img/banner/banner5.png" alt=""></a>
        </li>
    </ul>
    <a href="javascript:;" class="ctrl-slide ck-prev">上一张</a> <a href="javascript:;" class="ctrl-slide ck-next">下一张</a>
    <div class="ck-slidebox">
        <div class="slideWrap">
            <ul class="dot-wrap">
                <li class="current"><em>1</em></li>
                <li><em>2</em></li>
                <li><em>3</em></li>
                <li><em>4</em></li>
                <li><em>5</em></li>
            </ul>
        </div>
    </div>
</div>
<!-- 特推部分-->

<!--商品展示部分-->
<div class="store">
    <div class="store_top">
        <img src="${ctx}/img/banner/icon.png" alt=""/>
        热搜排行
    </div>

	<div class="store_content">
		<c:forEach items="${pageModel.list}" var="book">
			<c:choose>
				<c:when test="${book.status=='1'}">
			        <div>
			            <a href="${ctx}/book/detail.action/${book.isbn}"><img src="${ctx}/img/goods/${book.isbn}/index.jpg" alt=""/></a>
			            <p class="one">${book.title}</p>
			            <p class="two">
			                <span>
			                    价格：<span>￥${book.price}</span>
			                </span>
			            </p>
			            <p class="three">
			                <span>
			                出版社：<span>${book.press}</span>
			                </span>
			            </p>
			        </div>
			    </c:when>
		    </c:choose>
        </c:forEach>
   	</div>
   	<!--分页器-->
	<div style="width:1000px;" class="tcdPageCode"></div>
</div>
<!-- 引入页面底部文件 -->
<%@include file="../commons/foot.jsp" %>
<script>
    $('.ck-slide').ckSlide({
        autoPlay: true,//默认为不自动播放，需要时请以此设置
        dir: 'x',//默认效果淡隐淡出，x为水平移动，y 为垂直滚动
        interval:3000//默认间隔3000毫秒
    });
     //分页部分
	 $(".tcdPageCode").createPage({
		//总页数
	    pageCount: "${pageModel.pages}",
	    //当前页码
	    current: "${pageModel.pageNum}",
	    backFn:function(pageNum){
	        window.location.href='${ctx}/book/showPage.action?pageNum='+pageNum;
	    }
	}); 
</script>
</body>
</html>
