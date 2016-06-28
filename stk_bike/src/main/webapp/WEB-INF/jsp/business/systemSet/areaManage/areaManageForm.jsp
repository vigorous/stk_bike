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
		<style type="text/css">
			.margin-bottom-10{margin-bottom: 10px;}
			.padding-top-1{padding-top: 1%;}
			.width-160{width: 160px;}
			.padding-bottom-0{padding-bottom: 0px!important;}
		</style>
		<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
	</head>
	<body class="no-skin">
		<div class="page-content padding-bottom-0">
			<form action="areaManage/areaManageForm">
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span>区域编号</span>
					</div>
					<div class="col-xs-7">
						<input type="text" class="width-160" value="" />
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span>区域名称</span>
					</div>
					<div class="col-xs-7">
						<input type="text" class="width-160" value="" />
					</div>
				</div>
				<div class="row">
					<div class="col-xs-5 text-right">
					</div>
					<div class="col-xs-7 text-left">
						<div class="btn-group">
							<input type="button" class="btn btn-mini btn-success" value="保存" />
							<input type="button" class="btn btn-mini btn-success" value="取消" id="cancel" />
						</div>
					</div>
				</div>
			</form>
		</div>
		<script type="text/javascript" src="static/js/private_js/business/systemSet/areaManage/areaManageForm.js"></script>
	</body>
</html>