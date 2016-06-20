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
		<style type="text/css">
			.margin-bottom-5{margin-bottom: 5px;}
			.width-120{width: 120px!important;}
			.margin-left-30{margin-left: 30px;}
			.table tr td{border-top: 0px;}
		</style>
		<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
	</head>
	<body class="no-skin">
		<div class="page-content">
			<div class="row">
				<div class="col-xs-12">
					<table class="table">
						<tr>
							<td class="text-right">区域ID：</td>
							<td><input type="text" /></td>
						</tr>
						<tr>
							<td class="text-right">区域名称：</td>
							<td><input type="text" /></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>