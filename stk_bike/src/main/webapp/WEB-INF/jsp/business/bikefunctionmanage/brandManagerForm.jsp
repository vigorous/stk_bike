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
	
	<link rel="stylesheet" href="static/css/private_css/bikeMsg.css" />
	
	<%@ include file="../../system/admin/top.jsp"%>
</head>
<body class="no-skin">
	<input type="hidden" value="<%=basePath%>" id="ctxPath"/>
		<div class="dialog-content">
			<form action="" id="form">
				<div class="row row-margin-top">
					<div class="col-xs-12">
						<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 品牌编号： </label>
						<div class="col-xs-6 no-padding-left">
							<input type="text" id="brandNo" name="BRAND_NO" value="${vo.BRAND_NO }" />
						</div>
					</div>
				</div>
				
				<div class="row row-margin-top">
					<div class="col-xs-12">
						<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 品牌名称： </label>
						<div class="col-xs-6 no-padding-left">
							<input type="text" id="brandName" name="BRAND_NAME" value="${vo.BRAND_NAME }" />
						</div>
					</div>
				</div>
				
				<div class="row row-margin-top">
					<div class="col-xs-12">
						<div class="col-xs-offset-4 col-xs-3">
							<input onclick="save('${vo.BRAND_ID }')" class="btn btn-sm btn-success" id="add" type="button" value="保存" />
						</div>
						<div class="col-xs-3">
							<input class="btn btn-sm btn-success" id="quit" type="button" value="退出" />
						</div>
					</div>
				</div>
			</form>
		</div>
		<script type="text/javascript" src="static/js/private_js/admin/head.js"></script>
		 <script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript" src="static/js/private_js/business/bikefunctionmanage/brandManagerForm.js"></script>
	</body>
</html>