<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application"></c:set>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link href="${ctx}/css/header.css" rel="stylesheet"/>
    <link href="${ctx}/css/footer.css" rel="stylesheet"/>
    <link href="${ctx}/css/animate.css" rel="stylesheet"/>
    <script src="${ctx}/js/jquery-3.1.1.min.js"></script>
	<script src="${ctx}/js/index.js"></script>
	<script src="${ctx}/js/bookstore.js"></script>
	<script src="${ctx}/js/jquery.cookie.js"></script>
    <style>
        #forward{
            width: 1000px;
            height: 500px;
            margin:0px auto;
            padding-top: 30px;
            text-align: center;
            vertical-align: middle;
            /*background: #f00;*/
        }
        #forward img{
            position: relative;
            top: 193px;
        }
        #forward p {
            font-size: 20px;
            position: relative;
            top: 220px;
            font-weight: inherit;
            opacity: 0.3;
        }
    </style>
</head>
<body>
<!-- 引入页面顶部文件 -->
<%@include file="../commons/top.jsp" %>
<!-- nav主导航-->

<!--敬请期待页面-->
<div id="forward">
    <img src="${ctx}/img/lookforward/lookforward_img1.png" alt="" class="animated bounce"/>
    <p class="animated slideInDown">服务暂未上线 敬请期待!!</p>
</div>
<!-- 引入页面底部文件 -->
<%@include file="../commons/foot.jsp" %>
</body>
</html>
