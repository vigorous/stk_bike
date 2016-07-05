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
		
		<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
		<title>新建角色弹窗</title>
	</head>
	<body class="no-skin">
		<div class="dialog-content">
			<form action="" id="form">
				<div class="row row-margin-top">
					<div class="col-xs-12">
						<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 角色ID： </label>
						<div class="col-xs-6 no-padding-left">
							<input type="text" id="brandNo" name="" value="" />
						</div>
					</div>
				</div>
				
				<div class="row row-margin-top">
					<div class="col-xs-12">
						<label class="col-xs-5 no-padding-right dialog-text text-rt" for=""> 角色名称： </label>
						<div class="col-xs-6 no-padding-left">
							<input type="text" id="brandNo" name="" value="" />
						</div>
					</div>
				</div>
				
				<div class="row row-margin-top">
					<div class="col-xs-12">
						<div class="col-xs-offset-4 col-xs-3">
							<input class="btn btn-sm btn-success" id="" type="button" value="保存" />
						</div>
						<div class="col-xs-3">
							<input class="btn btn-sm btn-success" id="" type="button" value="退出" />
						</div>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>