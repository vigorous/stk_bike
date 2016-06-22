<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head lang="en">
		<base href="<%=basePath%>">
		<link rel="stylesheet" href="static/assets/css/bootstrap-datepicker3.css" />
		<link rel="stylesheet" href="static/assets/css/chosen.css" />
		<style type="text/css">
			.margin-bottom-10{margin-bottom: 10px;}
			.padding-top-1{padding-top: 1%;}
			.width-160{width: 160px;}
		</style>
		<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
	</head>
	<body class="no-skin">
		<div class="page-content">
			<form action="">
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span>公告标题</span>
					</div>
					<div class="col-xs-7">
						<input type="text" class="width-160" value="" />
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span>公告内容</span>
					</div>
					<div class="col-xs-7">
						<textarea class="width-160"></textarea>
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span>发布人</span>
					</div>
					<div class="col-xs-7">
						<input type="text" class="width-160" value="" />
					</div>
				</div>
			</form>
		</div>
		<script type="text/javascript" src="static/assets/js/chosen.jquery.js"></script>
		<script type="text/javascript">
			$('.chosen-select').chosen({width:"160px"});
		</script>
	</body>
</html>