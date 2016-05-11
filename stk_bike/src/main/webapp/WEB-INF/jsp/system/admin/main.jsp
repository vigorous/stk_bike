<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
	<!-- 头部CSS样式和JS引用 -->
    <base href="<%=basePath%>">
    
    <%@ include file="top.jsp" %>
</head>
<body>
	<!-- 页面顶部¨ -->
 	<%@ include file="head.jsp"%>
 	
 	<!-- 左侧菜单栏 -->
 	<%@ include file="left.jsp"%>
 	
 	<!-- 右侧主体部分 -->
 	<%-- <%@ include file="right.jsp"%> --%>
 	<div class="rt-main">
 		<!-- <iframe name="iframe1" src="static/right.jsp" id="iframepage" allowtransparency="true" frameborder="0" scrolling="no" style="margin:0 auto;width:100%;height:100%;">
				
		</iframe> -->
		<iframe name="mainFrame" id="mainFrame" frameborder="0" src="loginController/tab.do" style="margin:0 auto;width:100%;height:100%;"></iframe>
 	</div>
 	<!-- 底部部分 -->
 	<div class="footer" style="position:fixed;width:100%;height:30px;bottom:0;">这是版权信息等等。。。</div>
 	
 	<!-- 引入属于此页面的JS -->
	<script type="text/javascript" src="static/js/common_js/autoHeight.js"></script>
</body>
</html>