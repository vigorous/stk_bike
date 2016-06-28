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
	<input type="hidden" value="<%=basePath%>" id="ctxPath"/>
		<div class="page-content">
			<form action="" id="form">
			<div class="row margin-bottom-10" style="margin-top: 40px;">
				<div class="col-xs-5 text-right padding-top-1" >
						<span>品牌编号：</span>
					</div>
					<div class="col-xs-7">
						<input type="text" id="brandNo" name="BRAND_NO" class="width-160" value="" />
					</div>
			</div>
			<div class="row margin-bottom-10" style="margin-top: 40px;">
					<div class="col-xs-5 text-right padding-top-1">
						<span>品牌名称：</span>
					</div>
					<div class="col-xs-7">
						<input type="text" id="brandName" name="BRAND_NAME" class="width-160" value="" />
					</div>
				</div>
				<div class="clearfix form-actions" style="margin-top: 40px;">
						<div class="col-xs-offset-4 col-xs-3"><input onclick="save()" class="btn btn-info" id="add" type="button" value="保存" /></div>
						<div class="col-xs-3"><input class="btn" id="quit" type="button" value="退出" /></div>
					</div>
			</form>
		</div>
		 <script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript" src="static/assets/js/chosen.jquery.js"></script>
		<script type="text/javascript" src="static/js/private_js/business/bikefunctionmanage/brandManagerForm.js"></script>
		<script type="text/javascript">
			$('.chosen-select').chosen({width:"100px"});
		</script>
	</body>
</html>