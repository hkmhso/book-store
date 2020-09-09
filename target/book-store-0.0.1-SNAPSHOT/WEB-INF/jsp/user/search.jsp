<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"></c:set>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>达内学子书城</title>
    <link href="${ctx}/css/item.food.css" rel="stylesheet" />
    <link href="${ctx}/css/header.css" rel="stylesheet" />
    <link href="${ctx}/css/footer.css" rel="stylesheet" />
    <link href="${ctx}/css/slide.css" rel="stylesheet" />
    <link href="${ctx}/css/my.order.css" rel="stylesheet"/>
    <script src="${ctx}/js/jquery-3.1.1.min.js"></script>
	<script src="${ctx}/js/index.js"></script>
	<script src="${ctx}/js/slide.js"></script>
	<script src="${ctx}/js/bookstore.js"></script>
	<script src="${ctx}/js/jquery.page.js"></script>
	<script src="${ctx}/js/jquery.cookie.js"></script>
</head>
<body>
<!-- 引入页面顶部文件 -->
<%@include file="../commons/top.jsp" %>
<!-- nav主导航-->
<div>&nbsp;</div>
<!--搜索结果-->
<div class="store">
    <div class="store_top">
        <img src="${ctx}/img/banner/icon.png" alt=""/>
        搜索结果
    </div>
	<div class="store_content">
		<c:forEach items="${pageModel.list}" var="tbook">
	        <div>
	            <a href="${ctx}/book/detail.action/${tbook.isbn}"><img src="${ctx}/img/goods/${tbook.isbn}/index.jpg" alt=""/></a>
	            <p class="one">${tbook.title}</p>
	            <p class="two">
	                <span>
	                    价格：<span>${tbook.price}</span>
	                </span>
	            </p>
	            <p class="three">
	                <span>
	                出版社：<span>${tbook.press}</span>
	                </span>
	            </p>
	        </div>
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
        interval:3000//默认间隔2000毫秒
    });
    //分页部分
	 $(".tcdPageCode").createPage({
		//总页数
	    pageCount: "${pageModel.pages}",
	    //当前页码
	    current: "${pageModel.pageNum}",
	    backFn:function(pageNum){
	        window.location.href='${ctx}/book/showPage.action?pageNum='+pageNum+"&title=${param.title}";
	    }
	}); 
</script>
</body>
</html>
