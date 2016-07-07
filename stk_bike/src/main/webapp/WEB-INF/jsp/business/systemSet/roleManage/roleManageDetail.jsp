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
		<link rel="stylesheet" href="plugins/zTree/css/zTreeStyle/zTreeStyle.css" />
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
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>角色ID</span>
				</div>
				<div class="col-xs-7">
					<span>${roleVO.ROLE_ID}</span>
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>角色名称</span>
				</div>
				<div class="col-xs-7">
					<span>${roleVO.ROLE_NAME}</span>
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>角色权限</span>
				</div>
				<div class="col-xs-7">
					<div id="menuTree" class="ztree"></div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="plugins/zTree/js/jquery.ztree.core.min.js"></script>
		<script type="text/javascript" src="plugins/zTree/js/jquery.ztree.excheck.min.js"></script>
	</body>
</html>